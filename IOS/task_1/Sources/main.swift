import Foundation

// Create a basic even-odd checking program

func checkOddEven(number: Int) -> String {
    return "\(number) is \(number % 2 == 0 ? "even" : "odd")."
}

//print(checkOddEven(number: 6))
// Write the Fizz-Buzz program up to 101. (look below for example)

func outputOfString(number: Int) -> String {
    var ans = ""
    if number % 3 == 0 {
        ans += "Fizz"
    }
    if number % 5 == 0 {
        ans += "bizz"
    }
    // if number % 7 == 0 {
    //     ans += "cizz"
    // }
    // if number % 9 == 0 {
    //     ans += "kizz"
    // }
    if ans != "" {
        return ans
    } else {
        return "\(number)"
    }
}
print("Enter the number:", terminator: "")
if let number = readLine() , Int(number) != nil {
    print(outputOfString(number: Int(number)!))
}
else {
    print("Invalid input")
}

//printPattenForMultipleOf3And5()

// Create a menu driven calculator program

var option = "sub"
func menuDrivenCalculator(first: Float, second: Float) -> String {
    switch true {
    case option == "add":
        return "Addition of \(first) and \(second) is \(first+second)"
    case option == "mul":
        return "Multiplication of \(first) and \(second) is \(first*second)"
    case option == "sub":
        return "Subtraction of \(first) and \(second) is \(first-second)"
    case option == "div":
        return "Division of \(first) and \(second) is \(first/second)"
    default:
        return "Enter valid Operation:"
    }
}

//print(menuDrivenCalculator(first: 5, second: 6))

// 4. Create a program to check if a number is palindrome

func checkPalindrome(number: Int) -> String {
    var tempNumber = number
    var reversedNumber: Int = 0

    while tempNumber != 0 {
        let lastDigit = tempNumber % 10
        reversedNumber = reversedNumber * 10 + lastDigit
        tempNumber /= 10

    }
    return number == reversedNumber ? "\(number) is palindrome" : "\(number) is not palindrome"
}

//print(checkPalindrome(number: 787873))

// 5. Create a program to check if a number is ArmstrongArmstrong

func checkArmstrongNumber(number: Int) -> String {
    var tempNumber = number
    var finalSum = 0
    let lengthOfNumber = String(number).count

    while tempNumber != 0 {
        let digit = tempNumber % 10
        finalSum += Int(pow(Double(digit), Double(lengthOfNumber)))
        tempNumber /= 10
    }

    return finalSum == number
        ? "\(number) is an Armstrong number." : "\(number) is not an Armstrong number."

}

//print(checkArmstrongNumber(number: 153))

//6. Create a program that finds the sum of all the digits in a number,

func sumOfDigits(number: Int) -> String {
    var tempNumber = number
    var finalSum = 0

    while tempNumber != 0 {
        finalSum += tempNumber % 10
        tempNumber /= 10
    }

    return "\(finalSum) is the sum of digits of \(number)."
}

//print(sumOfDigits(number: 153))

// 7. Create a program to check if a number is prime

func isPrimeNumber(number: Int) -> Bool {
    if number <= 1 {

        return false
    }

    for i in 2..<Int(sqrt(Double(number))) {

        if number % i == 0 {
            return false
        }
    }
    return true
}

//print(isPrimeNumber(number: 562) == false ? "562 is not a prime number." : "562 is a prime number.")

// 8. Create a program to print out all the prime numbers between 400 and 6000

func primeNumbers(start: Int, end: Int) -> [Int] {
    var arr: [Int] = []

    for i in 400...6000 {
        isPrimeNumber(number: i) == true ? arr.append(i) : nil
    }
    return arr
}

//print(primeNumbers(start: 400, end: 6000).description)

//9. Create a program to find the factorial of a number

func factorial(number: Int) -> Int {
    return number == 1 || number <= 0 ? 1 : number * factorial(number: number - 1)
}

//print(factorial(number: 5))

// 10. Create a program to find the maximum number inside a tuple (assume a random tuple with 20 entries)

var tupleOfNumber = (
    1, 98, 56, 32, 9874, 321, 98, 3987, 1, 6549, 32, 196, 84, 54, 984, 9684, 321, 987, 984, 16, 982,
    164, 984, 5184, 231
)

let mirror = Mirror(reflecting: tupleOfNumber)
let tupleSize = mirror.children.count
print("Tuple size: \(tupleSize)")

var max = Int.min

for child in mirror.children {
    //   print(type(of: child.value))
    if let value = child.value as? Int {
        if value > max {
            max = value
        }
    }
}

print("Maximum value in tuple: \(max)")

var s = "😊"
print(s.count)

// print(findMaxNumberInTuple(tupleOfNumber))

// Arrays
var array1 = ["apple", "banana", "cherry"]
var array2 = array1

if array1 == array2 {
    print("Arrays are equal")
} else {
    print("Arrays are not equal")
}

var shoppingList: [String] = ["catfish", "mango", "tulips"]
var mutableShoppingList = shoppingList
mutableShoppingList[1] = "mango"
print(shoppingList)
print(mutableShoppingList)
print(shoppingList == mutableShoppingList)

func greet(person: String?, email: String?) {
    guard let person, let email else {
        print("No name provided.")
        return
    }

    print(person)
    print(email)

}

greet(person: "Alice", email: "thumatkeval@12")  // Output: Hello, Alice!
greet(person: nil, email: "thumatkeval@12")  // Output: No name provided.
greet(person: "Alice", email: nil)

let number = 3

//switch number {
//case 3:
//    print("Three")
//    fallthrough
//case 4:
//    print("Four")
//    fallthrough
//case 5:
//    print("Four")
//    fallthrough
//case 6:
//    print("Four")
//    fallthrough
//case 7:
//    print("Four")
//    fallthrough
//default:
//    print("Other number")
//}
// Output:
// Three
// Four

var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome now equals "hello!"

welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there!"

welcome.remove(at: welcome.index(after: welcome.startIndex))

welcome.removeSubrange(
    welcome.index(welcome.endIndex, offsetBy: -8)..<welcome.index(welcome.endIndex, offsetBy: 0))
/*
ReturnType of :- welcome.index(welcome.endIndex, offsetBy:-8)..<welcome.index(welcome.endIndex, offsetBy: 0) is Range<String.Index> in this Range menace 1...8 and the String.Index is for String.index() this will give this type of return type
 */

var dogString = "dogg‼@#$%^&*()🐶"
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")

// Passing and returning functions
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print(increment(7))

// MARK: - Closures

var numbers = [1, 2, 6, 5]

// Functions are special case closures ({})

// Closure example.
// `->` separates the arguments and return type
// `in` separates the closure header from the closure body
var ans = numbers.map {
    (number: Int) -> Int in
    let result = 3 * number
    return result
}
print(ans)

let digits = [1, 4, 10, 15]
digits.forEach { print($0) }

let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)

enum Suit {
    case spades, hearts, diamonds, clubs
    var icon: Character {
        switch self {
        case .spades:
            return "♤"
        case .hearts:
            return "♡"
        case .diamonds:
            return "♢"
        case .clubs:
            return "♧"
        }
    }
}

// Enum values allow short hand syntax, no need to type the enum type
// when the variable is explicitly declared
var suitValue: Suit = .hearts

// Conforming to the CaseIterable protocol automatically synthesizes the allCases property,
//   which contains all the values. It works on enums without associated values or @available attributes.
enum Rank: CaseIterable {
    case ace
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    var icon: String {
        switch self {
        case .ace:
            return "A"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .ten:
            return "10"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        }
    }
}

for suit in [Suit.clubs, .diamonds, .hearts, .spades] {
    for rank in Rank.allCases {
        print("\(rank.icon)\(suit.icon)")
    }
}
