# Access Control

#### What is the purpose of Swift access control?

```text
Swift provides a robust access control system that lets you specify the visibility and accessibility of your classes, properties, methods, and other entities. Proper use of access control helps encapsulate your code and protect implementation details.
```

#### Name the five access levels in Swift and briefly describe each

```text
1)Open: This is only for classes and class members. It is available outside the module and can be subclassed or overridden.

2)Public:- Classes, functions, properties, etc., are available outside the module but cannot be subclassed or overridden externally.

1) Internal: This is the default access level if none is specified, and it can be accessed within the same module, making it user-friendly and convenient!

4)fileprivate:- Limits access to the current Swift file, and It is accessible within the file it's declared.

5)Private:- Restricts access to the enclosing declaration, and it is accessible only within the enclosing class or struct.
```

#### What is the difference between `open` and `public` access levels?

```text
In the open access levels, it can be accessed in the subclass also and in the Public access level, it cannot be subclassed or overridden externally.
```

#### Why is `internal` the default access level in Swift?

```text
The `internal` access level is the default because it allows entities to be accessible within the same module but not outside of it, providing a balance between encapsulation and accessibility.
```

#### When should you use `fileprivate` instead of Private`?

```text
If we want our variable to be private with in the file then we use fileprivate other we can use private to make the variable private within the declaration block.
```

#### Can a `public` class be subclassed outside of its defining module? Why or why not?

```swift
// No, a `public` class **cannot** be subclassed outside its defining module. To allow subclassing, the class must be marked as `open`.
public class A {}  // Cannot be subclassed outside the module
open class B {}    // Can be subclassed outside the module
```

#### What is the most restrictive access level in Swift, and how does it impact class properties and methods

The most restrictive access level is `private`. It ensures that properties and methods are only accessible **within the same scope**, preventing unintended modifications from other parts of the code.

#### How does access control contribute to encapsulation and modularity in Swift?

```text
Access control enforces data hiding, allowing developers to expose only necessary parts of a module or class. This improves code maintainability and prevents unintended dependencies.
```

#### Can a `private` property be accessed from an extension of the same class? Explain why

```swift
//No, a `private` property **cannot** be accessed from an extension of the same class. `private` restricts access to the declaring scope only, whereas `fileprivate` allows access within the same file.
class Example {
    private var value = 10
}

extension Example {
    func printValue() {
        // print(value) // Compilation Error
    }
}

```

#### What are the best practices when deciding which access level to use?

- **Use `private`** to restrict access within the class.
- **Use `fileprivate`** when multiple class members in the same file need access.
- **Use `internal` (default)** for module-wide access.
- **Use `public`** to expose functionality without subclassing.
- **Use `open`** only when subclassing outside the module is required.

#### Identify the Issue

What will be the output of the following code? If there is an error, explain why.

```swift
class Employee {
    private var salary: Double = 50000

    func getSalary() -> Double {
        return salary
    }
}

let emp = Employee()
print(emp.salary) // Will this line work? Why or why not?
```

`Ans:-`

```text
It is not working with the private var salary it gives errors like 'salary' is inaccessible due to the 'private' protection level.
```

#### Predict the Output

What will be the output of the following code?

```swift
open class Animal {
    open func sound() {
        print("Animal sound")
    }
}

class Dog: Animal {
    override func sound() {
        print("Bark")
    }
}

let pet = Dog()
pet.sound() // Bark because here we make the object of Dog.
```

#### Fix the Error

The following code produces an error. Identify and correct it.

```swift
// In Module 1
public class Vehicle {
    public func start() {
        print("Vehicle started")
    }
}
// In Module 2
class Car: Vehicle {
    override func start() {
        print("Car started")
    }
}
//It gives an error because public access can not be accessed in another module
```

#### Fileprivate vs Private

Consider the following code:

```swift
class DataManager {
    fileprivate var data: String = "Sensitive Data"
    
    fileprivate func fetchData() -> String {
        return data
    }
}

class Logger {
    func log() {
        let manager = DataManager()
        print(manager.fetchData()) // Will this work?
    }
}
```

- Will `log()` be able to access `fetchData()`? Why or why not?  :- `Yes, It can because it is in the same file.`
- What happens if `fileprivate` is changed to `private`? `Then we fetchdata() won't be able to access log() method.`

#### Creating an Encapsulated Class

Write a Swift class `BankAccount` that:

- Has a `private` balance property.
- Provides a `public` method `deposit(amount:)` to add money.
- Provides a `public` method `getBalance()` to retrieve the balance.
- Prevents direct modification of the balance property from outside the class.

```swift
class BankAccount{
    private var balance:Int = 0;
    public func  deposit(amount:Int){
        balance += amount;
    }
    public func getBalance() -> Int{
        balance
    }
    
}

let account = BankAccount()
// account.balance = 1000  This will cause a compilation error (balance is private)
account.deposit(amount: 500)  // Allowed
print(account.getBalance())   // Output: 500.0
```

## Best Practices

- **Default to Internal**: Use the default internal access level unless you need to expose entities outside the module.
- **Use Private for Encapsulation**: Hide internal implementation details that should not be accessed directly.
- **Leverage Fileprivate for Shared Implementation**: Use fileprivate when multiple entities in the same file need access.
- **Choose Open Carefully**: Use open only when you want to allow subclassing and overriding outside the module.
