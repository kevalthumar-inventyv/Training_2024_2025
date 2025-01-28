//
//  main.swift
//  task_3
//
//  Created by Keval Thumar on 27/01/25.
//

import Foundation

/*
 Write a program to print the multiplication table for a given number.
 Write a program to calculate the sum of numbers from 1 to 100 using a loop.
 Write a program to find the first number greater than 50 in a list.
 Write a program to check if a given number is even or odd.
 Write a program to categorize a person's age into groups (child, teenager, adult).
 Write a program to assign a grade based on a student's score.
 Write a program to print numbers from 1 to 20 but skip multiples of 3.
 Write a program using labeled loops to exit an outer loop when a condition is met.
 Write a program to print the first 10 numbers in the Fibonacci sequence.
 Write a program to print all prime numbers between 1 and 50.
 Write a function to validate user input using guard.
 Write a program to calculate the factorial of a given number using a loop.
 */
//MARK: Write a program to print the multiplication table for a given number.
print("Enter Number:-", separator: "")
if let number = readLine() {
    print("Multiplication table for \(number)")
    for i in 1...10 {
        print("\(number) * \(i) = \(Int(number)! * i)")
    }
}

// MARK: Write a program to calculate the sum of numbers from 1 to 100 using a loop.
var sum = 0
for i in 1...100 {
    sum += i
}
print("Sum of numbers from 1 to 100 is \(sum)")

//MARK: Write a program to find the first number greater than 50 in a list.
var arrayList = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 55,
    45, 5, 56, 57, 58, 59, 90, 60,
]

print(arrayList.filter { $0 > 50 }.first ?? 0)

//MARK: Write a program to check if a given number is even or odd.

print(
    "Enter the number to check even or odd:-"
)
if let number = readLine() {
    Int(number) ?? 0 % 2 == 0 ? print("Even") : print("Odd")
}

//MARK: Write a program to categorize a person's age into groups (child, teenager, adult).
print("Enter the age:-", terminator: "")
if let age = readLine() {
    switch Int(age) ?? 0 {
    case 0..<13:
        print("Child")
    case 13..<20:
        print("Teenager")
    default:
        print("Adult")
    }
}

//MARK: Write a program to assign a grade based on a student's score.

print("Enter the student's score:-", terminator: "")
if let score = readLine() {
    switch Int(score) ?? 0 {
    case 0..<60:
        print("F")
    case 60..<70:
        print("D")
    case 70..<80:
        print("C")
    case 80..<90:
        print("B")
    default:
        print("A")
    }
}

//MARK: Write a program to print numbers from 1 to 20 but skip multiples of 3.

for i in 1...20 where i % 3 != 0 {
    print(i)
}

//MARK: Write a program using labeled loops to exit an outer loop when a condition is met.

let names: [String] = [
    "Keval", "Mihir", "jeel", "kamal", "laxit", "purv", "anurag",
]
let surname: [String] = [
    "patel", "soni", "maheta", "kumar", "garg", "singh", "sharma",
]

outerLoop: for i in 0..<names.count {
    for j in 0..<surname.count {
        if names[i] == "jeel" {
            break outerLoop
        }
        print("\(names[i]) \(surname[j])")
    }
}

//MARK: Write a program to print the first 10 numbers in the Fibonacci sequence.

var fibonacci: [Int] = Array(repeating: 0, count: 10)

fibonacci[1] = 0
fibonacci[2] = 1

for i in 3...9 {
    fibonacci[i] = fibonacci[i - 1] + fibonacci[i - 2]
}

print(fibonacci)

//MARK: Write a program to print all prime numbers between 1 and 50.

func isPrime(number: Int) -> Bool {
    if number < 3 { return true }
    for i in 3..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}
for i in 1...50 {
    if isPrime(number: i) {
        print(i)
    }
}

//MARK: Write a function to validate user input using guard.

func validateUserInput(name: String?) -> String {
    guard let name = name else {
        return "Please enter your name."
    }

    guard !name.isEmpty else {
        return "Name cannot be empty."
    }

    return "Hello, \(name)!"
}
print("Enter Your Name:-", terminator: "")
if let name = readLine() {
    print(validateUserInput(name: name))
}

//MARK: Write a program to calculate the factorial of a given number using a loop.
// recursion
func factorial(of number: Int) -> Int {
    guard number >= 0 else {
        return 0
    }

    if number == 0 || number == 1 {
        return 1
    }

    return number * factorial(of: number - 1)
}

// loop

func factorialLoop(of number: Int) -> Int {
    guard number >= 0 else {
        return 0
    }
    var result = 1
    if number > 1 {
        for i in 1...number {
            result *= i
        }
    }
    return result
}

print("Enter Your Number:")
if let number = readLine(), let intNumber = Int(number) {
    print("Factorial of \(intNumber) is: \(factorialLoop(of: intNumber))")
}

