
# Classes, Structures, and the self Keyword

## What is the main difference between a class and a structure in Swift?

`ANS:-`

- A class is a reference type, while a struct is a value type.
- A class supports inheritance, whereas a struct does not.
- Type casting allows you to check and interpret the type of a class instance at runtime.
- Deinitializers enable a class instance to release any resources it has allocated.
- Reference counting permits multiple references to a class instance.
- A struct has mutability control and, by default, manages the init method.

## When to Use `struct` vs. `class`

- **Use `struct`** when:
  - You need value semantics.
  - Your type is simple and lightweight.
  - You don’t need inheritance.
  - Immutability is desirable by default.
- **Use `class`** when:
  - You need reference semantics.
  - You need inheritance or polymorphism.
  - You need to manage a shared mutable state.

## How would you define a property inside a class?

`ANS:-`
Properties in a class can be of two types:
 **Stored Properties**   : These store actual values as part of the class instance.
 **Computed Properties** : These calculate a value dynamically instead of storing it directly.

``` swift
class Person {

    // Stored properties
    var firstName: String
    var lastName: String
    var age: Int
    
    // Computed property
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    // with init 
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
 // with function
    func describe() {
        print("Name: \(fullName), Age: \(age)")
    }
}

```

## What is a **reference type** in Swift?

`ANS:-`

- Reference type in Swift like if you create an instance of anything that in the new variable shares the address of the value not an actual copy of that value.

## Why does changing a property in one instance of a class affect another variable pointing to the same instance?

`ANS:-`

- Because Class is a Reference type it affects the address where it is stored so eventually it involves the actual variable.

## What does it mean that structures are **value types**?

`ANS:-`

- it just means that if you assign the instance of the structure to another variable then it generates a copy of that instance.

## What happens to the original structure's values if you assign a structure to a new variable?

`ANS:-`

``` swift
struct keval{
 var name: String;
 var age: Int;
}
let person = keval();
var person2 = person;
```

- It does not affect anything on the old value

## How does inheritance work in classes? Can structures inherit properties or methods?

`ANS:-`

- Inheritance means access to their present properties in the child class.
- No, We can not inherit properties or methods in Structure

## When would you choose to use a structure instead of a class?

`ANS:-`

### Use a Structure When

1. **You need value-type semantics.**
    - Example: When designing small, immutable objects like a `Point` or `Color` where the focus is on the data itself.
2. **You want lightweight memory allocation.**
    - Example: For scenarios where performance is critical, such as mathematical computations, where frequent allocations and deallocations might occur.

Use a Class When

1. **You need polymorphism or abstract behavior.**
    - Example: Designing a hierarchy of shapes like `Circle` and `Rectangle` that share a common interface or base class.
2. **You want to utilize advanced object-oriented features like encapsulation and constructors.**
    - Example: Managing complex data structures, such as a `DatabaseConnection` object with methods and initialization logic.

## What is the `self` keyword used for in Swift?

`ANS:-`

- The `self` keyword refers to the current instance of a class, struct, or enum, and is used to access its properties or methods.

``` swift
 class Person {
     var name: String
     init(name: String) {
         self.name = name
     }
     func introduce() {
         print("Hi, my name is \(self.name).")  
     }
 }
 let person = Person(name: "Alice")
 person.introduce() 
```

## Why would you use `self` inside an initializer or method?

`ANS:-`

- To change the variable that is declared in the context of that method.

## Can you omit `self` in a method? When would you need to include it?

`ANS:-`

- Yes, we can omit `self` in a method if we work in the same class or structure or enum.
- We need to include when we use closure or the same parameter name that is also present in the class name.

## How do you check if two variables point to the same instance of a class?

`ANS:-`

- with the help of `===` operator

## What keyword is used to release resources when a class instance is no longer needed?

`ANS:-`

- The keyword used to release resources when a class instance is no longer needed is `deinit`.
- The deinitializers are automatically called by the Automatic Reference Counting (ARC) system just before the instance is deallocated.

## Can structures have deinitializers? Why or why not?

`ANS:-`

- NO, structures (structs) do not have deinitializers because they are value types and do not require the same level of memory management as reference types like classes.

## How does Swift provide a default initializer for structures?

`ANS:-`

- In Swift, a default initializer for structure is provided but if you write the custom init it overwrites it.
- This default initializer is also known as the **memberwise initializer**. It allows you to create an instance of the structure by passing values for each of its properties.

``` swift
 struct Person {
     var name: String
     var age: Int
     
 }
 let person = Person(name: "John Doe", age: 30)
```

## Why might you need to create custom initializers in both classes and structures?

`ANS:-`

- It might be useful when you need to validate your input or process your input and then assign it to the variable.

 ``` swift
// Using a Class
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name.capitalized
        self.age = max(0, age)
    }
}

let person = Person(name: "john", age: -2)
print(person.name) // John
print(person.age)  // 0
```

## What are some scenarios where a class would be more appropriate than a structure?

`ANS:-`

- the class would be more appropriate than a structure where we need to add **Subclassing** and **Complex Relationships** or **Interoperability with Objective-C** because Objective-C does not support interoperability with Objective-C.

## How do you create an instance of a class in Swift?

`ANS:-`

```swift
class User{
    var name: String;
    var password: String;
       init(name:String,passwor:String){
        self.name = name
        self.password = password
       }
} 
let user = User(name:"Keval",password:"MyPassword");
```

## How do you create an instance of a structure in Swift?

`ANS:-`

``` swift
struct User{
    var name: String;
    var password: String;
       init(name:String,passwor:String){
        self.name = name
        self.password = password
       }
} 
let user = User(name:"Keval",password:"MyPassword");
```

## In the example where `vehicle1` and `vehicle2` are instances of a structure, why does changing `vehicle2` not affect `vehicle1`?

`ANS:-`

- Because structure is a value type it creates another copy of the instance and does change in that variable so the actual value does not affect.
