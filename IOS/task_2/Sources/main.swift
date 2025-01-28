//
//  main.swift
//  task_2
//
//  Created by Keval Thumar on 27/01/25.
//

/*
 Write a program to reverse the elements of an array.
 Write a program to filter only even numbers from an array.
 Write a program to find the maximum and minimum values in an array.
 Write a program to remove duplicate elements from an array using a set.
 Write a program to find common elements between two arrays using sets.
 Write a program to check if one set is a subset of another.
 Write a program to count the occurrences of each word in an array using a dictionary.
 Write a program to create a phone book where names are keys and phone numbers are values.
 Write a program to swap the keys and values in a dictionary.
 Write a program to group words by their length using a dictionary.
 Write a program to store student names and grades, calculate the average grade, and find the top-performing student.
 */
import Foundation

//MARK: 1)Write a program to reverse the elements of an array.
var inputArray: [Int] = [1, 2, 3, 4, 5]
inputArray.reverse()

print("Reversed array: \(inputArray)")

//MARK: 2)Write a program to filter only even numbers from an array.
var oneToHundred: [Int] = Array(1...100)
let evenNumberArray = oneToHundred.filter { $0 % 2 == 0 }

print(evenNumberArray)

//MARK:  Write a program to find the maximum and minimum values in an array.
var findMaxAndMinInThisArray = [1, 2, 3, 4, 5]

print("Max Value of the \(findMaxAndMinInThisArray.max() ?? 0)")
print("Min Value of the \(findMaxAndMinInThisArray.min() ?? 0)")

//MARK: 3)Write a program to remove duplicate elements from an array using a set.
let arrayWithDuplicateValue = [1, 2, 3, 4, 5, 2, 3, 4, 5]
var uniqueValues: Set<Int> = []
uniqueValues.formUnion(arrayWithDuplicateValue)

print("Array with unique values: \(Array(uniqueValues).sorted())")

//MARK: 4)Write a program to find common elements between two arrays using sets.
var firstArray: [Int] = [1, 2, 3, 3, 2, 5, 9, 3, 9, 3, 5]
var secondArray: [Int] = [1, 2, 3, 9, 4, 5]
var firstSet: Set<Int> = Set(firstArray)
var secondSet: Set<Int> = Set(secondArray)

print(
    "Common element in the two arrays: \(Array(firstSet.intersection(secondSet)))"
)

//MARK: 5)Write a program to check if one set is a subset of another.
print(
    "\(firstSet) is \(firstSet.isSubset(of: secondSet) ? "" : "not ")subset of \(secondSet)."
)

//MARK: 6)Write a program to count the occurrences of each word in an array using a dictionary.
var stringArray: [String] = [
    "apple", "banana", "cherry", "apple", "banana", "cherry", "Mango", "Graps",
    "Pineapple", "Banana", "Mango", "Pineapple",
]

var groupedWords: [String: Int] = [:]

for word in stringArray {
    if let existingWord = groupedWords[word] {
        groupedWords[word] = existingWord + 1
    } else {
        groupedWords[word] = 1
    }
}

print(groupedWords)

//MARK: 7)Write a program to create a phone book where names are keys and phone numbers are values.
//PhoneBook()
func PhoneBook() {
    var phoneBook: [String: String] = [:]

    print(
        """
        Enter 1) to add a new contact to the phone book
              2) to search for a contact in the phone book
              3) to exit the program
        """)
    while true {
        print("Enter Your Choice:-")
        switch readLine() ?? "" {
        case "1":
            print("Enter Name and PhoneNumber:-")
            guard let name = readLine(), let phoneNumber = readLine() else {
                print("Invalid input. Please try again.")
                continue
            }
            phoneBook[name] = phoneNumber
        case "2":
            print(
                "Enter Name to Search:-"
            )
            if let nameToSearch = readLine(),
                let phoneNumberToSearch = phoneBook[nameToSearch]
            {
                print(
                    "Phone number for \(nameToSearch) is: \(phoneNumberToSearch)"
                )
            } else {
                print("Contact not found.")
            }
        case "3":
            print("Phone Book Program Exited.")
            exit(0)
        default:
            print("Invalid input. Please try again.")
        }
    }
}

//MARK: 8)Write a program to swap the keys and values in a dictionary.
let dict: [String: Int] = ["a": 1, "b": 2]

var newDict: [Int: String] = [:]

dict.forEach { key, value in
    newDict[value] = key
}
print(newDict)

//MARK: 9)Write a program to group words by their length using a dictionary.
var groupWordLengthByCount: [Int: [String]] = [:]

stringArray.forEach {
    groupWordLengthByCount[$0.count, default: []].append($0)
}
print(groupWordLengthByCount)

//MARK: 10)Write a program to store student names and grades, calculate the average grade, and find the top-performing student.
func findTopPerformingStudent(studentGrades: [String: [String: Int]]) {
    var studentAverageGrades: [String: Double] = [:]

    for (studentName, grades) in studentGrades {
        let totalGrade = grades.values.reduce(0, { $0 + $1 })  // Or khali + pan rakhi Sakai
        studentAverageGrades[studentName] =
            Double(totalGrade) / Double(grades.count)
    }
    print(studentAverageGrades)
    let topStudent = studentAverageGrades.max(by: { $0.value < $1.value })
    print(
        "\(topStudent!.key) is top-performing student with \(topStudent!.value.rounded(.toNearestOrEven)) average grade."
    )

}
var studentGrades: [String: [String: Int]] = [
    "Keval": ["Math": 98, "Science": 92, "English": 90],
    "Purv": ["Math": 100, "Science": 100, "English": 99],
    "Kailash": ["Math": 91, "Science": 94, "English": 93],
]

findTopPerformingStudent(studentGrades: studentGrades)
