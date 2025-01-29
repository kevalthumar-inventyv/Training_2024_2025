# Initialization & Deinitialization

1. What is an initializer in Swift?
`Ans:-`

    - initializer is a special method to provide initial value to the properties with the help of `init` keyword.

2. How is a default initializer different from a custom initializer?
`Ans:-`

    - A default initializer assigns an initial value to all the properties within that structure. Alternatively, if I need to set computed values for my properties, I utilize a custom initializer.
    - This distinction highlights the differences between the two approaches.

3. What is the purpose of a memberwise initializer in a structure?
`Ans:-`

    - The purpose of the member is that there is no need to worry about the initial properties that are present in that structure It will automatically initial when we pass the value.

4. How do you create a custom initializer with parameters?
`Ans:-`

    ``` swift
    struct Size{
    var width: Double
    var height: Double
    init(width: ÏDouble , height: Double){
    self.width = width;
    self.height = height;
    }
    }
    class Area{
    var width: Double
    var height: Double
    init(width: ÏDouble , height: Double){
    self.width = width;
    self.height = height;
    }
    }

    ```

5. When would you use a failable initializer?
`Ans:-`

    - first, what failable is? It actually means that initialization can fail so swift allows you to define **failable initializers** that can return `nil`.
    - It is used where we know there might be a change to return or get the null instance of that particular class we use.

6. What is a designated initializer?
`Ans:-`

    - **Designated Initializers**: Primary initializers that fully initialize all properties introduced by that class and call an appropriate superclass initializer.:
    - Primary initializers that fully initialize all properties.
    - Must call superclass designated initializer (in a subclass).

7. What’s the role of a convenience initializer?
`Ans:-`

    - **Convenience Initializers**: Secondary initializers must call a designated initializer from the same class.
    - Secondary initializers marked with `convenience` keyword.
    - Must call designated initializer from the same class.

8. What does a required initializer enforce?
`Ans:-`

    - When we define a required initializer in a class, and then inherit from that class, the subclass must also implement that initializer.

    ```swift
    // example 
    class SomeClass {
        required init() {}
    }
    class SomeSubclass: SomeClass {
        required init() {}
    }
    ```

9. How does initializer delegation help in Swift?
`Ans:-`

    - Initializer delegation in Swift helps reduce the need to pass parameters when creating instances of a class. This means that not every object needs to have all properties passed during initialization, making it easier to work with different types of objects.

    ``` swift
    // example 
    struct Rectangle {
        var width: Double
        var height: Double
        // Custom initializer

        init(width: Double, height: Double) {
            self.width = width
            self.height = height
        }
        // Delegating initializer
        init(squareWithSide side: Double) {
            self.init(width: side, height: side)
        }
    }

    let square = Rectangle(squareWithSide: 5.0)

    ```

10. What is deinitialization, and when is it used?
`Ans:-`

    - **Deinitialization (`deinit`) is called when an instance is about to be deallocated** to free up resources.  
    - **Used for cleanup tasks** like closing files, removing observers, or releasing memory.

    ``` swift
    class Example { 
    init() { 
    print("Instance created")
    } 
    deinit { 
    print("Instance deallocated") 
    } 
    } 
    var obj: Example? = Example() // Instance created obj = nil // Instance deallocated
    ```

11. Can structures have deinitializers?
`Ans:-`

    - **No, only classes can have deinitializers (`deinit`)** because structs are value types and do not require manual memory management.
    - **Structs get deallocated automatically** when they go out of scope.

12. Explain Swift’s two-phase initialization process.
`Ans:-`

    - **Phase 1**: Each stored property is assigned an initial value by the designated initializer.
    - **Phase 2**: Superclass initializer is called (if applicable), and additional setup occurs.

    ``` swift
    class Parent {
        var name: String
        init(name: String) {
            self.name = name
            print("Parent initialized")
        }
    }

    class Child: Parent {
        var age: Int
        init(name: String, age: Int) {
            self.age = age // Phase 1: Set stored properties
            super.init(name: name) // Phase 2: Call superclass initializer
            print("Child initialized")
        }
    }

    ```

13. Why would you use lazy initialization for a property?
`Ans:-`

    - **Improves performance by deferring initialization until first access** (useful for expensive operations).
    - **Used when the property depends on external factors** that may not be available at initialization.

    ``` swift
    class Example {
        lazy var value: String = {
            print("Value initialized")
            return "Hello, Swift!"
        }()
    }

    let obj = Example()
    print("Before accessing value")
    print(obj.value) // Triggers initialization

    ```

14. How does a lazy stored property differ from a regular stored property?
`Ans:-`

    - **Lazy properties are initialized only when first accessed**, whereas regular stored properties are initialized immediately.
    - **Lazy properties must be `var` (mutable)** since they are assigned after initialization.

    ``` swift
    class Example {
        var regular = "Immediate Initialization"
        lazy var lazyProperty = "Lazy Initialization"
    }

    let obj = Example()
    print(obj.regular) // Already initialized
    print(obj.lazyProperty) // Initialized only when accessed
    ```

15. How do class initializers handle inheritance?
`Ans:-`

    - A subclass must call its superclass initializer (`super.init`) before adding its own initialization.
    - If a subclass does not define a designated initializer, it inherits the superclass’s initializers automatically.

    ``` swift
    class Parent {
        var name: String
        init(name: String) {
            self.name = name
        }
    }

    class Child: Parent {
        var age: Int
        init(name: String, age: Int) {
            self.age = age
            super.init(name: name) // Calls superclass initializer
        }
    }
    ```
