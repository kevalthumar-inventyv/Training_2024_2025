## Questions

#### 1. What is type casting used for in Swift?

```text
Type casting is used in Swift to upcast or downcast their type from the actual type, the superclass, or the subclass.
```

#### 2. What are the `is` and `as` operators used for?

``` text
Type casting in Swift is implemented with the `is` and `as` operators:

is: Checks if an instance is of a certain subclass type.
as: Casts an instance to a different type.
```

#### 3. How does Swift's `is` operator work with class types?

``` text
The "is" operator works with class types to determine whether this is a subclass or superclass of the specific class being checked.
The `is` operator checks if an instance is of a certain subclass type. It returns `true` if the instance is of that type or a subclass of that type, and `false` otherwise.
```

#### 4. What is the difference between upcasting and downcasting?

``` text
Downcasting is the process of treating an instance as if it were a subclass of its current type. Swift provides two operators for downcasting:

Upcasting is the process of treating an instance as its superclass type. In Swift, upcasting is implicit and doesn't require any special syntax.
```

#### 5. How does conditional downcasting with `as?` differ from forced downcasting with `as!`?

``` text
Conditional downcast (as?): This function returns an optional value, which will be nil if the downcast fails.
Forced downcast (as!): Forces the downcast and triggers a runtime error if it fails.
```

#### 6. Why might you prefer to use `as?` over `as!`?

``` text
It is used as per situation if we know that it we definitely downcast then we use as! and if we don't know whether it happened or not then we use as?.
```

#### 7. What could happen if you use `as!` and the cast fails?

``` text
Yes, It can happen as we use "as!" and casting fails then it gives a run time error.
```

#### 8. What is the purpose of the `Any` type in Swift?

``` swift
// The main purpose of the type any is it Can represent an instance of any type, including function types.
var items: [Any] = []

items.append(94)
items.append(9.11)
items.append("Keval K Thumar")
items.append((5.88, 2003))
items.append({ (name: String) -> String in "Hello, \(name)" })
```

#### 9. How is `AnyObject` different from `Any`?

``` text
The key difference is that `Any` can represent any type, while `AnyObject` is limited to class types.
In Any: It is highly flexible and can hold any type of value, except for protocol types or protocol compositions.
AnyObject: It is used when you need to work specifically with reference types and cannot be used with structures, enumerations, or functions.
```

#### 10. How can you use a `switch` statement to check for specific types in an array of `Any`?

``` swift
var items: [Any] = []

items.append(94)
items.append(9.11)
items.append("Keval K Thumar")
items.append((5.88, 2003))
items.append({ (name: String) -> String in "Hello, \(name)" })


for item in items {
    switch item {
    case let number as Int:
        print("Integer: \(number)")
    case let number as Double:
        print("Double: \(number)")
    case let text as String:
        print("String: \(text)")
    case let tuple as (Double, Double):
        print("Tuple: \(tuple)")
    case let closure as (String) -> String:
        print(closure("World"))
    default:
        print("Unknown type")
    }
}
// Outputs:
// Integer: 94
// Double: 9.11
// String: Keval K Thumar
// Tuple: (5.88, 2003)
// Hello, World
```

#### 11. When would you use upcasting in Swift? (maybe difficult)

``` text
upcasting is the process of converting a subclass instance to its superclass type. This is useful when you want to treat a subclass instance as its superclass for some time.
```

#### 12. How does downcasting allow access to subclass-specific properties?

``` text
This is useful when you have a reference to a superclass and want to access properties or methods that are specific to a subclass. Without downcasting, you can only access properties or methods defined on the superclass, but downcasting gives you access to those that are unique to the subclass.
```

#### 13. Why might you need to cast items in a collection with mixed types?

``` swift
// because if any array has a mixed type then it stores in type 'any' and if we need all that element in separate variables then we need to downcast to get all values in the variable.

var items: [Any] = []

items.append(94)
items.append(9.11)
items.append("Keval K Thumar")
items.append((5.88, 2003))
items.append({ (name: String) -> String in "Hello, \(name)" })


for item in items {
    switch item {
    case let number as Int:
        print("Integer: \(number)")
    case let number as Double:
        print("Double: \(number)")
    case let text as String:
        print("String: \(text)")
    case let tuple as (Double, Double):
        print("Tuple: \(tuple)")
    case let closure as (String) -> String:
        print(closure("World"))
    default:
        print("Unknown type")
    }
}
```

#### 14. What is the role of `Any` in holding values of different types?

``` text
Any allows storing values of any data type, including classes, structs, and functions, without specifying a concrete type. It is useful for creating heterogeneous collections or handling dynamic data.
```

#### 15. In what scenarios would you use `AnyObject`?

``` swift
// if we use class or protocol to store different type of that then we need to use AnyObject in that.

class Person {
    var name: String
    init(name: String) { self.name = name }
}

class Employee: Person {
    var company: String
    init(name: String, company: String) {
        self.company = company
        super.init(name: name)
    }
}

let people: [AnyObject] = [
    Person(name: "Alice"),
    Employee(name: "Bob", company: "Apple"),
    Person(name: "Charlie")
]

for person in people {
    if let employee = person as? Employee {
        print("\(employee.name) works at \(employee.company).")
    } else if let regularPerson = person as? Person {
        print("\(regularPerson.name) is not an employee.")
    }
}

```

#### 16. How does typecasting support polymorphism in Swift?

``` text
through subtyping  
```

#### 17. Why is type-checking useful when dealing with class hierarchies?

``` swift
//If we don't check type checking and it is not typecast then it can leat towards to the runtime error which is more dangerous. 
let myDog = Dog(name: "Bruno")
let myAnimal: Animal = myDog // Upcasting (Implicit)

print(myAnimal.name)  // Accessible because it's defined in Animal
// myAnimal.bark()  ❌ Not allowed because myAnimal is treated as Animal
```

#### 18. What happens if you try to downcast to a subclass that the instance does not belong to? (maybe difficult)

``` swift
// if it does not belong to that instance that we downcast then it leads to runtime error or returns nil as per what we use like as! or as?.

class Animal {
    var name: String
    init(name: String) { self.name = name }
}

class Dog: Animal {
    func bark() { print("Woof!") }
}

class Cat: Animal {
    func meow() { print("Meow!") }
}

let myPet: Animal = Dog(name: "Buddy")

if myPet is Dog {
    print("\(myPet.name) is a Dog.")
} else if myPet is Cat {
    print("\(myPet.name) is a Cat.")
} else {
    print("\(myPet.name) is some other animal.")
}
```

#### 19. How can `Any` and `AnyObject` enhance the flexibility of collections in Swift? (maybe difficult)

- **`Any` allows heterogeneous collections**, meaning a single array or dictionary can store values of different types.
- **`AnyObject` restricts elements to class instances**, ensuring type safety while still allowing flexibility.

#### 20. What is one advantage of using `is` for type checking before attempting a downcast?

- **Prevents runtime crashes** by ensuring an object is of the expected type before downcasting.
- **Improves code safety** by avoiding forced downcasting (`as!`) on incompatible types.

``` swift
let item: Any = "Hello"
print(item) // It give Error.
if item is String {
    let str = item as! String  
    print(str.uppercased())
}

```
