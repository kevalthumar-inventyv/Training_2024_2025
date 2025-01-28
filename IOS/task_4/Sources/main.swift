//
//  main.swift
//  task_4
//
//  Created by Keval Thumar on 27/01/25.
//

import Foundation

/*
 Write a program to double each element in an array using map.
 Write a program to convert an array of temperatures in Celsius to Fahrenheit using map.
 Write a program to flatten a nested array of integers using flatMap.
 Write a program to combine all strings from nested arrays into a single array using flatMap.
 Write a program to calculate the product of all elements in an array using reduce.
 Write a program to join an array of words into a single sentence using reduce.
 Write a program to sort an array of names in alphabetical order.
 Write a program to sort an array of numbers in descending order using sorted.
 Write a program to sort a dictionary by its values using sorted.
 Write a program to group numbers into even and odd using reduce.
 Write a program to find the longest string in an array using reduce.
 Write a program to transform and flatten nested arrays of numbers, keeping only even numbers.
 */

//MARK: Write a program to double each element in an array using map.
var array: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
var doubleArray = array.map { $0 * 2 }
print("Doubled array: \(doubleArray)")

//MARK: Write a program to convert an array of temperatures in Celsius to Fahrenheit using map.

var celsiusArray: [Int] = [0, 10, 20, 30, 40, 50, 60, 70, 80]
var fahrenheitArray = celsiusArray.map { (celsius) -> Int in
    let fahrenheit = (celsius * 9 / 5) + 32
    return fahrenheit
}
print("Fahrenheit array: \(fahrenheitArray)")

//MARK: Write a program to flatten a nested array of integers using flatMap.
var nonFatallyNestedArray: [[Int]] = [[1, 2], [3, 4], [5, 6]]
var flattenedArray: [Int] = nonFatallyNestedArray.flatMap { $0 }
print("Flattened array: \(flattenedArray)")

// MARK: Write a program to combine all strings from nested arrays into a single array using flatMap.
var nestedArrayOfStrings: [[String]] = [["a", "b"], ["c", "d"], ["e", "f"]]
var combinedStrings: [String] = nestedArrayOfStrings.flatMap { $0 }
print("Combined strings: \(combinedStrings)")

//MARK: Write a program to calculate the product of all elements in an array using reduce.
var productArray: [Int] = [1, 2, 3, 4, 5]
var product = productArray.reduce(1, *)
print("Product: of \(productArray) is:\(product)")

//MARK: Write a program to join an array of words into a single sentence using reduce.
var arrayOfWords: [String] = ["Hello", "world", "!"]
var sentence = arrayOfWords.reduce("", +)
print("Sentence: \(sentence)")

//MARK: Write a program to sort an array of names in alphabetical order.
var name = ["kamal", "jeet", "purv", "Keval"]
print(name.sorted(by: <))

//MARK: Write a program to sort an array of numbers in descending order using sorted.
var numbers: [Int] = [1, 2, 3, 4, 5]
print(numbers.sorted(by: >))

//MARK: Write a program to sort a dictionary by its values using sorted.
var unsortedDictionary: [String: Int] = ["e": 5, "a": 1, "i": 3, "o": 4]
let sortedDictionary = unsortedDictionary.sorted {
    $0.value < $1.value
}
print(sortedDictionary)

//MARK: Write a program to find the longest string in an array using reduce.

var arrayOfStrings1: [String] = ["Keval", "Thuma", "Name", "Kamleshbhai"]
let longestString = arrayOfStrings1.reduce("") { (longest, current) in
    print("longest:-\(longest) and current:-\(current)")
    return longest.count > current.count ? longest : current
}
print("Longest string is: \(longestString)")

// MARK:  Write a program to transform and flatten nested arrays of numbers, keeping only even numbers.
var envenOddMixedArray: [[Int]] = [[1, 2, 3], [4, 5], [6, 7, 8], [9]]
var evenNumbersArray: [Int] = envenOddMixedArray.flatMap { $0 }.filter {
    $0.isMultiple(of: 2)
}
print("Only even numbers are: \(evenNumbersArray)")

//MARK: Write a program to group numbers into even and odd using reduce.
var arrayWithOutGroup: [Int] = Array(1...100)
var evenOddGroupedArray = arrayWithOutGroup.reduce(
    into: ([Int](), [Int]())
) {
    acc, current in
    current.isMultiple(of: 2)
        ? acc.0.append(current)
        : acc.1.append(current)
}
print(
    """
        EvenNumberArray Is :- \(evenOddGroupedArray.0)
        OddNumberArray Is :- \(evenOddGroupedArray.1)
    """)
