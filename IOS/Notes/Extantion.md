# Extensions

Extensions are a powerful feature in Swift that allow you to add new functionality to existing classes, structures, enumerations, and protocols. This enables you to extend types for which you don't have access to the source code, such as types defined in the Swift Standard Library or third-party libraries.

## What Are Extensions?

An extension adds new functionality to an existing type:

### Features of Extensions

- **Computed Properties**: Add new computed properties.
- **Methods**: Add new instance and type methods.
- **Initializers**: Provide new initializers.
- **Subscripts**: Add new subscripts.
- **Nested Types**: Define and use new nested types.
- **Conform to Protocols**: Make an existing type conform to a protocol.

## Syntax

The basic syntax for an extension is:

``` swift
extension SomeType {  
 // New functionality to add to SomeType 
}
```

## Use of Extensions

### Adding Functionality

- **Computed Properties**: Add new computed properties to an existing type.
- **Methods**: Add new instance and type methods to an existing type.
- **Mutating Instance Methods**: Add new mutating instance methods to an existing type.
- **Initializers**: Provide new initializers to an existing type.
- **Subscripts**: Add new subscripts to an existing type.
- **Nested Types**: Define and use new nested types in an existing type.
- **Conforming to Protocols**: Make an existing type conform to a new protocol.

## Limitations

### Stored Properties

Extensions cannot add stored properties or property observers to existing types.

``` swift
// This will result in a compile-time error 
extension Person {
 var age: Int = 0 // Error: Extensions may not contain stored properties 
}
```

## Extending Generic Types

Extensions can also be used to add functionality to generic types.

## Practical Use Cases

- **Adding Utility Functions**: Extend types to include utility methods relevant to your project.
- **Protocol Conformance**: Use extensions to conform existing types to new protocols.
- **Code Organization**: Separate functionality into extensions to keep code readable and maintainable.

## Summary

- Extensions add new functionality to existing types without subclassing.
- You can extend classes, structures, enumerations, and protocols.
- Use extensions to conform types to protocols and organize code logically.

Extensions allow you to add new functionality to existing types without modifying their original implementation. This makes them powerful tools for code organization and reuse.

### Questions

#### What are extensions in Swift, and why are they useful?  

``` text
Extensions are a powerful feature in Swift that allows you to add new functionality to existing classes, structures, enumerations, and protocols.

It is useful because it gives the advantage to write more clear and concise code with less overhead.

```

---

#### Can you extend a class, struct, and enum in Swift? Provide an example  

``` swift
// Yes, We can extend a class, struct, and enum in Swift.
// class
class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

extension Person {
    func greet() {
        print("Hello, my name is \(name) and I'm \(age) years old.")
    }
}

let person = Person(name: "John", age: 30)
person.greet() // Output: Hello, my name is John and I'm 30 years old.

// struct

struct Point {
    var x: Int
    var y: Int
}

extension Point {
    mutating func moveBy(dx: Int, dy: Int) {
        x += dx
        y += dy
    }
}

var point = Point(x: 10, y: 20)
point.moveBy(dx: 5, dy: 10)
print(point) // Output: Point(x: 15, y: 30)

// enum
enum Color {
    case red
    case green
    case blue
}

extension Color {
    var description: String {
        switch self {
        case .red:
            return "The color is red."
        case .green:
            return "The color is green."
        case .blue:
            return "The color is blue."
        }
    }
}

let color = Color.red
print(color.description) // Output: The color is red.

```

---

#### What are the different functionalities that an extension can add to an existing type?  

 **Computed Properties**: An extension can add computed properties to an existing type. These properties do not store any value, but calculate them on the fly.

``` swift
extension Double {
    var squared: Double {
        return self * self
    }
}
```

**Methods**: An extension can add new methods to an existing type. These methods can be instance methods (called on an instance of the type) or type methods (called on the type itself).

``` swift
extension String {
    func uppercaseFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst().lowercased()
    }
}
```

**Initializers**: An extension can add new initializers to an existing type. These initializers can provide additional ways to create instances of the type.

``` swift
extension String {
    init(repeatingString string: String, times: Int) {
        self = String(repeating: string, count: times)
    }
}
```

 **Subscripts**: An extension can add new subscripts to an existing type. These subscripts can provide additional ways to access elements of the type.

``` swift
extension String {
    subscript(r: Int... ) -> String {
        return String(self[index(startIndex, offsetBy: r.startIndex)..<index(startIndex, offsetBy: r.endIndex)])
    }
}
```

**Nested Types**: An extension can add new nested types to an existing type. These nested types can be enumerations, structures, classes, or protocols.

``` swift
extension String {
    enum Prefix {
        case lowercase
        case uppercase
    }
}
```

 **Conform to Protocols**: An extension can make an existing type conform to additional protocols. This can be useful for adopting new functionality without altering the original type.

``` swift
extension String: CustomStringConvertible {
    var description: String {
        return self
    }
}
```

---

#### Adding a Computed Property via an Extension

You can add a computed property to an existing type using an extension. The property does not store data but computes its value on the fly.

```swift
swiftextension Int {
    var squared: Int {
        return self * self
    }
}

let number = 5
print(number.squared) // Output: 25
```

---

#### Extension for Double: Kilometers to Miles

This extension adds a computed property that converts kilometers (represented as a Double) to miles.

```swift
swiftextension Double {
    var kilometersToMiles: Double {
        return self * 0.621371
    }
}

let distanceInKilometers = 10.0
print(distanceInKilometers.kilometersToMiles) // Output: ~6.21371
```

---

#### Adding an Instance Method via an Extension

You can add new instance methods to an existing type. This example adds a method to reverse a string.

```swift
swiftextension String {
    func reversedString() -> String {
        return String(self.reversed())
    }
}

let greeting = "Hello"
print(greeting.reversedString()) // Output: "olleH"
```

---

#### Modified `repetitions` Method That Returns Execution Count

This extension on `Int` runs a closure a given number of times and returns the count of executions.

```swift
swiftextension Int {
    func repetitions(task: () -> Void) -> Int {
        var count = 0
        for _ in 0..<self {
            task()
            count += 1
        }
        return count
    }
}

let times = 5
let executedCount = times.repetitions {
    print("Task executed")
}
print("Executed \(executedCount) times") // Output: Executed 5 times
```

---

#### Normal Instance Method vs. Mutating Method

- **Normal instance methods:** Do not modify the instance.
- **Mutating methods:** Can modify the instance's properties in value types (like structs).

```swift
swiftextension Int {
    // This would be a mutating method if we wanted to change self,
    // but note that for built-in types like Int, you need a variable (var) to call mutating methods.
    mutating func increment() {
        self += 1
    }
}

var numberValue = 10
numberValue.increment()
print(numberValue) // Output: 11
```

---

#### Adding a `cube()` Mutating Method to Int

This extension adds a method that changes the integer to its cube.

```swift
swiftextension Int {
    mutating func cube() {
        self = self * self * self
    }
}

var value = 3
value.cube()
print(value) // Output: 27
```

---

#### Adding a New Initializer to an Existing Struct

Extensions can add new initializers to an existing type.

```swift
swiftstruct Point {
    var x: Double
    var y: Double
}

extension Point {
    init(both value: Double) {
        self.x = value
        self.y = value
    }
}

let p = Point(both: 5.0)
print(p) // Output: Point(x: 5.0, y: 5.0)
```

---

#### Can Extensions Override Existing Initializers?

**Answer:** No. Extensions cannot override existing initializers because they are meant to add new functionality, not modify or replace existing behavior. This restriction helps maintain type safety and the original implementation’s integrity.

---

#### Adding a Subscript to an Existing Type via an Extension

You can add subscripts to types using extensions. Here’s a safe subscript for arrays.

```swift
swiftextension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

let arr = [1, 2, 3]
print(arr[safe: 1] ?? "Index out of range") // Output: 2
print(arr[safe: 5] ?? "Index out of range") // Output: Index out of range
```

---

#### Adding a Nested Type Within an Extension

Nested types group related functionality. For example, adding a nested enum to determine the sign of an integer.

```swift
swiftextension Int {
    enum Sign {
        case positive, negative, zero
    }
    
    var sign: Sign {
        if self > 0 { return .positive }
        else if self < 0 { return .negative }
        else { return .zero }
    }
}

print(10.sign)   // Output: positive
print((-5).sign) // Output: negative
```

---

#### Using Extensions to Make a Type Conform to a Protocol

Extensions can help you add protocol conformance to an existing type.

```swift
swiftprotocol Describable {
    func description() -> String
}

extension Double: Describable {
    func description() -> String {
        return "Value is \(self)"
    }
}

let valueDouble: Describable = 3.14
print(valueDouble.description()) // Output: Value is 3.14
```

---

#### Making Int Conform to a `Divisible` Protocol

Define a protocol and extend `Int` to conform to it.

```swift
swiftprotocol Divisible {
    func isDivisible(by number: Int) -> Bool
}

extension Int: Divisible {
    func isDivisible(by number: Int) -> Bool {
        return number != 0 && self % number == 0
    }
}

print(10.isDivisible(by: 2)) // Output: true
print(10.isDivisible(by: 3)) // Output: false
```

---

#### Applying Extensions to Generic Types

Extensions can be constrained to generic types. For example, adding a method to sort arrays with comparable elements.

```swift
swiftextension Array where Element: Comparable {
    func sortedArray() -> [Element] {
        return self.sorted()
    }
}

let unsorted = [3, 1, 2]
print(unsorted.sortedArray()) // Output: [1, 2, 3]
```

---

#### Explanation of `extension Array where Element: Equatable`

This syntax adds functionality to an `Array` only when its elements conform to `Equatable`. For example, you can add a method to remove duplicate elements.

```swift
swiftextension Array where Element: Equatable {
    func removeDuplicates() -> [Element] {
        var result: [Element] = []
        for element in self {
            if !result.contains(element) {
                result.append(element)
            }
        }
        return result
    }
}

let numbers = [1, 2, 3, 2, 1]
print(numbers.removeDuplicates()) // Output: [1, 2, 3]
```

---

#### Why Extensions Can't Add Stored Properties

**Explanation:**  
Extensions cannot add stored properties because they do not have a memory allocation for additional storage. They can only add computed properties, methods, and nested types.

---

#### Alternatives to Adding Stored Properties

If you need stored properties, you can use:

- **Associated Objects:** (for classes using the Objective-C runtime)
- **Wrapper Types:** Create a new type that encapsulates the existing type and adds stored properties.
- **Subclassing:** If applicable, subclass the type and add properties.

---

#### Improving Code Organization with Extensions

Extensions help separate functionality and group related methods. For example, you can extend a class to conform to different protocols in separate extensions.

```swift
swiftclass MyClass {
    // Core functionality
}

extension MyClass: CustomStringConvertible {
    var description: String {
        return "MyClass description"
    }
}

extension MyClass {
    func additionalMethod() {
        print("Additional functionality")
    }
}
```

---

#### Separating Concerns in a UIViewController

Using extensions, you can separate protocol implementations (like delegates) from the main class code.

```swift
swiftclass MyViewController: UIViewController {
    // Main functionality
}

extension MyViewController: UITableViewDataSource {
    // Data source methods
}

extension MyViewController: UITableViewDelegate {
    // Delegate methods
}
```

---

#### Benefits of Using Extensions for Multiple Protocol Conformances

**Explanation:**  
Using extensions for each protocol keeps the code modular and organized. It makes it easier to read and maintain by isolating each protocol’s implementation in its own block.

---

#### String Extension: Palindrome Checker

This extension adds a method to check if a string is a palindrome.

```swift
extension String {
    func isPalindrome() -> Bool {
        let cleaned = self.lowercased().filter { $0.isLetter }
        return cleaned == String(cleaned.reversed())
    }
}

print("Racecar".isPalindrome()) // Output: true
print("Hello".isPalindrome())   // Output: false
```

---

#### Array Extension: Remove Duplicates for Equatable Elements

This extension provides a method to return a new array without duplicate elements.

```swift
extension Array where Element: Equatable {
    func removingDuplicates() -> [Element] {
        var result: [Element] = []
        for element in self {
            if !result.contains(element) {
                result.append(element)
            }
        }
        return result
    }
}

let duplicateArray = [1, 2, 2, 3, 1]
print(duplicateArray.removingDuplicates()) // Output: [1, 2, 3]
```

---

#### Given the following code, what will be the output?

``` swift
 extension Int {
      var squared: Int { return self * self }
   }

   let number = 4
   print(number.squared) // It print 16
```

#### What happens if you try to add a stored property inside an extension? Why?  

If we try to add store property inside an extension then you'll get a compiler error.

- **Memory Allocation:** Extensions cannot allocate memory for new data. They can only extend the functionality of existing types by adding methods or computed properties, not by introducing new data.
- **Type Safety:** Allowing stored properties in extensions would disrupt Swift's type system and its guarantees of memory safety and performance.

#### Can you add a private method inside an extension? If so, when would this be useful?

``` swift
// Yes, you can add a private method inside an extension in Swift. This is useful when you want to add functionality that is only relevant to the extension itself and should not be accessed outside of it.

extension MyClass {
    private func helperMethod() {
        print("This is a private helper method.")
    }

    func publicMethod() {
        helperMethod()  
    }
}

let myObject = MyClass()
myObject.publicMethod() 

```

##### When it's useful

- **Encapsulation:** Helps keep internal logic hidden from the outside, making the code cleaner and more maintainable.
- **Separation of concerns:** Allows you to split functionality into smaller, private methods used only within the context of the extension.
