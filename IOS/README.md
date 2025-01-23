# Details of Tasks

## Task 1

## Scenario:

    - Create a console-based RPG Adventure Game in Swift. The player controls a character who must explore a dungeon, fight enemies, collect treasures, and upgrade their stats. The game will include interactive features that incorporate all the requested Swift concepts. The game must include:

    - Character Creation:
        - Use a struct for the player character.
        - Include properties like name, health, attack, defense, and inventory (collection type).

    - Enemy Encounters:
        - Use an enum for different enemy types (e.g., Goblin, Dragon).
        - Each enemy type has unique properties like health and damage.

    - Battle Mechanics:
        - Use functions and control flow for combat.
        - Implement attack logic using operators.

    - Treasure System:
        - Generate random treasures (e.g., weapons, potions) using closures.
        - At a time only one Item was added in inventory
        - Store them in the inventory.

    - Level Progression:
        - Use methods to allow the character to level up and increase stats.
        - Incorporate computed properties to display the current stats.

    - Classes and Structures:
        - Use a class for the game engine and a struct for items.  

    - Enumeration and Closures:
        - Use enums to manage item types and closures to simulate random events.

## Requirements:

    - Use all the topics: Basic Operations, Strings and Characters, Collection Types, Control Flow, Functions, Closures, Enumerations, Structures and Classes, Properties, and Methods.
    - The game must be entirely console-based with clear instructions and feedback.

## Features Used in the Code:

    - Basic Operations: Math calculations for health, attack, and defense.
    - Strings and Characters: Custom messages with string interpolation.
    - Collection Types: Inventory stored in an array.
    - Control Flow: if, switch, and loops for decision-making.
    - Functions: Modular actions like battle and findTreasure.
    - Closures: Random treasure generation.
    - Enumerations: Enemy and item types.
    - Structures and Classes: Character, Item, and RPGGame.
    - Properties: Stored and computed properties in Character.
    - Methods: Player actions and game logic are encapsulated in methods.

## How It Works:

    - Players enter their names.
    - The game randomly generates encounters (battles or treasures).
    - Players interact using the console (choose actions during battles, use items, etc.).
    - The game concludes after 3 events menace total battles,  treasures can be any time , displaying the player’s final stats.



