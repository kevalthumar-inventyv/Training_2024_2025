// The Swift Programming Language
// https://docs.swift.org/swift-book

/*
 Custom Initializers in Structures
 Create a structure Point with properties x (Double) and y (Double).
 Add a custom initializer that takes a single value and initializes both x and y to the same value.
 Create an instance of Point using this initializer and print its properties.
 */

struct Point {
    var x: Double
    var y: Double

    init(_ value: Double) {
        x = value
        y = value
    }
}

let point = Point(10.0)
print("x: \(point.x)")  // x: 10
print("y: \(point.y)")  // y: 10

/*
 Inheritance with Classes
 Create a base class Animal with a property name (String) and a method sound() that prints "Some generic sound".
 Create a subclass Dog that overrides the sound() method to print "Woof!".
 Create instances of Animal and Dog, call their sound() methods.
 */

class Animal {
    var name: String
    init(name: String) {
        self.name = name
    }
    func sound() {
        print("Some generic sound")
    }
}

class Dog: Animal {
    override func sound() {
        print("Woof!")
    }
}

let animal = Animal(name: "Charlie")
animal.sound()  //Some generic sound
let dog: Dog = Dog(name: "Moti")
dog.sound()  // Woof!

/*
 Classes vs. Structures
 Write a program to demonstrate the difference between a class and a structure. Create a class Car and a structure Bicycle, both with a speed property (Double).
 Modify the speed of a class instance and a structure instance after assigning them to new variables. Print the results to explain the reference and value type behavior.

 */

class Car {
    var speed: Double = 0
}
struct Bicycle {
    var speed: Double = 0
}

var myCar = Car()
var yourCar = myCar
yourCar.speed = 100
var myBicycle = Bicycle()
var yourBicycle = myBicycle
yourBicycle.speed = 10

print(
    "Speed value of myCar class is \(myCar.speed) and myBicycle struct is \(myBicycle.speed)"
)  //Speed value of myCar class is 100.0 and myBicycle struct is 0.0

/*
 Using self in Initializers
 Create a class Circle with a property radius (Double) and an initializer that uses the self keyword to set the value of radius.
 Add a method circumference() that calculates and returns the circumference of the circle (2 * π * radius).
 Create an instance of the class and print the circumference.
 */

class Circle {
    var radius: Double
    private let pi: Double = 3.14

    init(radius: Double) {
        self.radius = radius
    }

    func circumference() -> Double {
        return 2 * pi * radius
    }
}

let circle = Circle(radius: 5.0)
print(circle.circumference())  // 2 * 3.4 * 5 = 34

/*
 Working with Mutating Methods
 Define a structure Counter with a property count (Int) initialized to 0.
 Add a mutating method increment(by:) that increases the count by the given amount.
 Create an instance of Counter, increment it by 5, and print the updated count.
 */

struct Counter {
    var count: Int = 0

    mutating func increment(by amount: Int) {
        count += amount
    }
}
var count = Counter()
count.increment(by: 5)
print(count.count)  // 5

/*
 Basic Structure Creation
 Define a structure Rectangle with properties width (Double) and height (Double).
 Add a method area() that calculates and returns the area of the rectangle.
 Create two instances of Rectangle and modify one instance’s width. Print the area for both instances to show that they are independent.
 */

struct Rectangle {
    var width: Double
    var height: Double

    func area() -> Double {
        return width * height
    }
}

var rect1 = Rectangle(width: 10.0, height: 20.0)
var rect2 = rect1
rect1.width = 5.0
print(
    "Area of Rectangle one is \(rect1.area()) and area of Rectangle two is \(rect2.area())"
)  //Area of Rectangle one is 100.0 and area of Rectangle two is 200.0

/*
**Basic Class Creation**

- Create a class named `Book` with the following properties:
    - `title` (String)
    - `author` (String)
    - `pages` (Int)
- Add a method `description()` that prints the book's details in this format: `"Title: [title], Author: [author], Pages: [pages]"`.
- Create an instance of the class and call the `description()` method.
*/
class Book {
    var title: String
    var author: String
    var pages: Int
    init(title: String, author: String, pages: Int) {
        self.title = title
        self.author = author
        self.pages = pages
    }
    func description() {
        print("Title: [\(title)], Author: [\(author)], Pages: [\(pages)]")
    }
}

let book = Book(title: "The Alchemist", author: "Paulo Coelho", pages: 222)
book.description()

/*
**Understanding Reference Types**

- Create a class `Person` with properties `name` (String) and `age` (Int).
- Create two instances of `Person` pointing to the same object. Modify the `name` using one instance and print the `name` from the other. What happens? Notice the differences. Note it down inside your obsidian notes.
*/
class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func introduce() {
        print("Hello, my name is \(name). I am \(age) years old.")
    }
}

let person = Person(name: "Keval", age: 22)
let person2 = person

person.name = "Purv"

print(person2.name)  // Purv
