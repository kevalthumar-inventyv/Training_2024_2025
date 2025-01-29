# OOPs

## Access Control

Swift provides access control modifiers to enforce encapsulation. These modifiers determine where classes, properties, and methods can be accessed from:

- **`public`**: Accessible from any module.
- **`internal`**: Accessible within the same module (default).
- **`fileprivate`**: Accessible within the same file.
- **`private`**: Accessible within the enclosing declaration.

## Method Overriding

When a class is **subclassed** (a new class is created based on an existing one), the subclass can **override** methods from its **superclass** (the original class). This means the subclass can replace the method from the superclass with its version, so it behaves differently. We use the `override` keyword in Swift to do this.

## Why Override a Method?

Overriding is useful when you have a general method in the superclass but want a specific behavior in the subclass.

## Example of Overriding

Imagine you have an `Animal` class with a method called `makeSound`. This method prints a general sound, "Some sound". But if we create a `Cat` subclass, we might want it to say "Meow" instead.

## Method Overloading

**Method overloading** is distinct from overriding. Rather than replacing an existing method, overloading allows us to create multiple methods with the **same name** within the same class, provided they have different **parameters** (inputs). This enables you to use the same method name to manage various types or quantities of inputs.

### Why Overload a Method?

Overloading enhances code readability and usability. You can apply the same name for similar actions, which helps keep method names straightforward and consistent.

### Example of Overloading

Imagine we want to create a Calculator class to add two numbers. However, we might want to utilize the `add` method to combine either two integers or two doubles. With overloading, we can establish two `add` methods with different types of inputs.

- **Classes and Objects**: Classes are blueprints; objects are instances.
- **Encapsulation**: Bundles data and methods, restricts access.
- **Inheritance**: Subclasses inherit from superclasses, promoting code reuse.
- **Polymorphism**: Allows methods to be used generically across different classes.
- **Abstraction**: Hides implementation details, exposing only necessary features.

Understanding these OOP concepts in Swift helps you write clean, maintainable, and scalable code. By applying these principles, you can model real-world entities effectively and enhance the quality of your applications.

## Questions

## 1. What is Object-Oriented Programming (OOP) focused on?

`ANS:-`

- Object-Oriented Programming (OOP) focuses on creating modular, reusable code by modeling real-world entities.

## 2. How does Swift support the core OOP concepts?

`ANS:-`

- Swift supports the core OOP concepts with various concepts like:
  - Classes and Objects
  - Encapsulation
  - Inheritance
  - Polymorphism
  - Abstraction
  - Protocol

## 3. What is a class in Swift, and what does it contain?

`ANS:-`

- Like other language classes are the overview or the blueprint of any real word entity that contains methods and variables.

## 4. How would you create an object from a class in Swift?

`ANS:-`

``` swift
 class Car {
    var color: String
    var speed: Int
    
    init(_ color: String, _ speed: Int) {
        self.color = color
        self.speed = speed
    }
    
    func accelerate() {
        speed += 10
    }
    
    func decelerate() {
        speed -= 10
    }
}

let car = Car("Red",50)
car.accelerate() // speed = 60
car.decelerate() // speed = 50
 ```

## 5. What is encapsulation, and why is it useful?

`ANS:-`

- Encapsulation involves bundling data (properties) and the methods that operate on that data into a single unit (class) while restricting access to certain components of the object.
- This is useful because that encourages modularity and code security.

## 6. Which access control modifier would you use to restrict access to a class property within the same class only?

`ANS:-`

- To restrict access to a class property within the same class only, you would use the `private` access control modifier.

## 7. Why might you use `private` property in a class?

`ANS:-`

- To restrict access to a class property within the same class only, you would use the `private` access control modifier.

## 8. How does inheritance promote code reuse?

`ANS:-`

``` swift
class Vehicle{
 // some method or variable that is declared for all the vehicles.
}
class Car: Vehicle{
 //We can use all the methods of the Vehicle class without writing in this.  
}
```

## 9. What keyword do you use to override a method in a subclass?

`ANS:-`

- `override` is used to override a method in a subclass from a superclass.

## 10. Why would you override a superclass method in a subclass?

`ANS:-`

- To reuse the method and variable that is present in the superclass into the subclass.

## 11. How is method overloading different from method overriding?

`ANS:-`

- Method overloading` is rewriting the same method for different purposes in the same class.
- Method `Overriding` is rewriting the same method for different purposes in the subclass.

## 12. Can you give an example of method overloading with different parameter types?

`ANS:-`

``` swift
 class Calculator{
  func add(first a:Int, second b:Int) -> Int {
   return a+b;
  }
  func add(first a:Double, second b:Double) -> Double {
   return a+b;
  }  
 }
```

## 13. What is polymorphism, and how does it work in Swift?

`ANS:-`

- Polymorphism allows objects to take many forms, enabling a single function or method to work with different types using inheritance or protocols.

## 14. How does polymorphism increase flexibility in your code?

`ANS:-`

- It allows you to write generic and reusable code by handling different object types through a common interface.

``` swift
 let shapes: [Shape] = [Circle(), Square()]
 
 for shape in shapes {
     shape.draw()
 }
 // Output:
 // Drawing a Circle
 // Drawing a Square
```

## 15. What is an abstraction, and why is it beneficial in OOP?

`ANS:-`

- Abstraction hides implementation details and shows only essential features, making the code simpler and easier to manage.

## 16. How are protocols used to achieve abstraction in Swift?

`ANS:-`

- Protocols define a blueprint of methods and properties, allowing classes or structs to implement specific behaviors without exposing implementation details.

## 17. What would happen if two different classes adopted the same protocol in Swift?

`ANS:-`

- Both classes would implement the protocol’s methods and properties independently, ensuring they adhere to the same behavior.

## 18. How does encapsulation contribute to code security?

`ANS:-`

- Encapsulation restricts access to internal data and exposes only necessary parts, protecting the code from unintended interference.

## 19. Why might you use polymorphism when working with arrays of different object types?

`ANS:-`

- It allows you to store and manipulate objects of different types through a shared base type or protocol, simplifying the code.

## 20. What are the main benefits of using OOP principles in Swift programming?

`ANS:-`

- OOP makes code modular, reusable, and easier to maintain and promotes a clear structure by organizing it into objects.
