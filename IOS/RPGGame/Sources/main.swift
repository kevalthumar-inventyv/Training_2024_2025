//
//  main.swift
//  RPG_Adventure_Game
//
//  Created by Keval Thumar on 21/01/25.
//

//MARK: learning
/**
 Feature    Definition    Example Use Case
 extension    Add functionality to existing types.    Add computed properties or conform to protocols.
 mutating    Modify properties in value types.    Increment counters or toggle enum cases.
 get/set    Define computed properties for logic.    Calculate and update properties dynamically.
 */
// !!!

// ???:

// FIXME: to do output

// TODO: display user

// MARK: - Character
struct Character {
    var name: String
    var health: Int {
        // set thay ee pela check kari leva
        didSet {
            if health > 200 {
                health = 200
            }
            if health < 0 {
                health = 0
            }
        }
        // set thay gay pachi check karva willSet
    }
    var attack: Int
    var defense: Int
    var inventory: [String: (attack: Int, defense: Int, quantity: Int)] = [:]
    var level: Int = 1
    var experience: Int = 0

    // Computed property to display stats
    var stats: String {
        return """
            Name: \(name)
            Level: \(level)
            Health: \(health)
            Attack: \(attack)
            Defense: \(defense)
            Inventory: \(inventory.keys.joined(separator: ", "))
            """
    }

    mutating func levelUp() {
        guard experience >= level * 100 else { return }
        level += 1
        attack += 10
        defense += 5
        experience = 0
        print("\(name) leveled up to Level \(level)! Stats upgraded!")
    }

    mutating func addToInventory(item: (String, (attack: Int, defense: Int, quantity: Int))) {
        let (itemName, stats) = item
        if let existingItem = inventory[itemName] {
            // Item already exists, increase its quantity
            inventory[itemName] = (
                attack: existingItem.attack + stats.attack,
                defense: existingItem.defense + stats.defense,
                quantity: existingItem.quantity + 1
            )
            print(
                "\(itemName) updated in inventory. New quantity: \(inventory[itemName]!.quantity)."
            )
        } else {
            // Add new item with quantity 1
            inventory[itemName] = (
                attack: stats.attack, defense: stats.defense, quantity: stats.quantity
            )
            print("\(itemName) added to inventory with stats: \(stats).")
        }
    }

    mutating func applyDamage(damage: Int) {
        let effectiveDamage = max(0, damage - defense)
        health -= effectiveDamage
        if health <= 0 {
            health = 0
            print("\(name) is defeated! Game Over!")
        } else {
            print(
                "\(name) took \(effectiveDamage) damage. Remaining health: \(health)."
            )
        }
    }

    func isAlive() -> Bool {
        return health > 0
    }

    mutating func useItem(item: String) {
        if var inventoryItem = inventory[item], inventoryItem.quantity > 0 {
            // Decrease quantity of the item
            inventoryItem.quantity -= 1
            // Apply the item stats (e.g., increase defense, attack, etc.)
            attack += inventoryItem.attack
            defense += inventoryItem.defense
            inventory[item] = inventoryItem
            print(
                "\(item) used. New stats - Attack: \(attack), Defense: \(defense)."
            )

            // If the quantity reaches 0, remove the item from inventory
            if inventoryItem.quantity <= 1 {
                inventory.removeValue(forKey: item)
                print("\(item) is now out of stock and removed from inventory.")
            }
        } else {
            print("Item \(item) is not available or has no quantity left.")
        }
    }
}

// MARK: - Enemy
enum Enemy {
    case Goblin(health: Int, damage: Int)
    case Dragon(health: Int, damage: Int)

    var name: String {
        switch self {
        case .Goblin: return "Goblin"
        case .Dragon: return "Dragon"
        }
    }

    var health: Int {
        switch self {
        case .Goblin(let health, _): return health
        case .Dragon(let health, _): return health
        }
    }

    var damage: Int {
        switch self {
        case .Goblin(_, let damage): return damage
        case .Dragon(_, let damage): return damage
        }
    }

    mutating func applyDamage(
        user: inout Character, item: String, inventryManageUser: inout Character
    ) {
        var health = self.health
        let baseAttack = user.attack

        if let weapon = user.inventory[item] {
            health -= (baseAttack + weapon.attack)
            user.health += weapon.defense
            user.useItem(item: item)
            inventryManageUser.inventory.removeValue(forKey: item)  // This reduces quantity or removes the item
            print(
                "\(item) used. Enemy's health is now \(health)."
            )
        } else {
            health -= baseAttack
            print(
                "Base attack of \(baseAttack) applied. Enemy's health is now \(health)."
            )
        }

        if health <= 0 {
            print("Enemy \(name) is defeated!")
        } else {
            print("Enemy \(name) survived with \(health) health.")
        }

        switch self {
        case .Goblin(_, let damage):
            self = .Goblin(health: max(0, health), damage: damage)
        case .Dragon(_, let damage):
            self = .Dragon(health: max(0, health), damage: damage)
        }
    }

    func isAlive() -> Bool {
        return health > 0
    }
}

// MARK: - Treasure Generator
let generateSingleTreasure:
    () -> (String, (attack: Int, defense: Int, quantity: Int)) = {
        let treasurePool = [
            "Sword for attack": (attack: 15, defense: 0, quantity: 1),
            "Sword for defense": (attack: 0, defense: 15, quantity: 1),
            "Shield": (attack: 0, defense: 20, quantity: 1),
            "Potion": (attack: 0, defense: 30, quantity: 1),
            "Helmet for attack": (attack: 5, defense: 0, quantity: 1),
            "Helmet for defense": (attack: 0, defense: 5, quantity: 1),
            "Amulet": (attack: 10, defense: 0, quantity: 1),
        ]
        return treasurePool.randomElement()!
    }

// MARK: - RPG Game Engine
class RPGGame {
    private var player: Character
    private var enemy: Enemy?
    var userWin = 0

    init(playerName: String) {
        self.player = Character(
            name: playerName, health: 150, attack: 20, defense: 10)
    }

    func start() {
        print("Welcome, \(player.name), to the RPG Adventure Game!")
        var roundNumber = 1
        var treasureNumber = 1
        while roundNumber <= 3 {
            let randomEvent = Int.random(in: 1...2)
            if randomEvent == 1 {
                print("\n--- Event \(roundNumber) ---")
                startBattle()
                roundNumber += 1
                treasureNumber = 1
            } else {
                print(
                    "\n--- Find Treasure \(treasureNumber) for Event \(roundNumber) ---"
                )
                findTreasure()
                treasureNumber += 1
            }
            if !player.isAlive() { break }
        }
        endGame()
    }

    private func startBattle() {
        var tempPlayer: Character = player
        enemy = getEnemy()
        guard var enemy = enemy else { return }
        print(
            "Encountered a \(enemy.name) with \(enemy.health) health and \(enemy.damage) damage!"
        )
        print("Player Stats:\n\(tempPlayer.stats)")

        while enemy.isAlive() && tempPlayer.isAlive() {
            var userInput: String = ""
            print(
                "Your inventory: \(tempPlayer.inventory.keys.joined(separator: ", "))"
            )
            if tempPlayer.inventory.count == 0 {
                print("You have no items in your inventory.")
            } else {
                print(
                    "Pick an item to use or press Enter to attack without an item:",
                    terminator: "")
                userInput = readLine() ?? ""
            }
            enemy.applyDamage(
                user: &tempPlayer, item: userInput, inventryManageUser: &player)
            if enemy.isAlive() {
                tempPlayer.applyDamage(damage: enemy.damage)
            }
        }

        if tempPlayer.isAlive() {
            tempPlayer.experience += 50
            userWin += 1
            tempPlayer.levelUp()
        }
    }

    private func findTreasure() {
        let treasure = generateSingleTreasure()
        print("Found a treasure: \(treasure.0) with stats \(treasure.1).")

        player.addToInventory(item: treasure)
    }

    private func getEnemy() -> Enemy {
        let randomEnemy = Int.random(in: 1...2)
        return randomEnemy == 1
            ? .Goblin(health: 100, damage: 40)
            : .Dragon(health: 200, damage: 50)
    }

    private func endGame() {
        print("\n--- Game Over ---")
        print("Final Stats:\n\(player.stats)")
        print(
            player.isAlive()
                ? "You survived the adventure!" : "You were defeated!")
    }
}

// MARK: - Game Start
print("Enter your character's name:", terminator: "")
if let name = readLine(), !name.isEmpty {
    let game = RPGGame(playerName: name)
    game.start()
    print(
        """
                User wins :- \(game.userWin)
                Enemy wins:- \(3-game.userWin)
                \(game.userWin > 3-game.userWin ? "User" : "Enemy") is win the Game.
        """)
} else {
    print("Invalid name. Restart the game.")
}
