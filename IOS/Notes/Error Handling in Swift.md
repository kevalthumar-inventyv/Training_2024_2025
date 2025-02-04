# Error Handling in Swift

#### Initial Code

```swift
enum FileError: Error {
    case fileNotFound
    case unreadable
    case encodingFailed
}

func readFile(at path: String) throws -> String {
    guard path == "validPath" else {
        throw FileError.fileNotFound
    }
    return "File content"
}

func processFile() throws {
    let content = try readFile(at: "invalidPath")
    print(content)
}
```

#### What are the different ways to handle errors in Swift? Explain each method briefly with examples

##### Using Do-Catch Blocks to Handle Errors

```swift
do {
    let content = try readFile(at: "invalidPath")
    print(content)
} catch FileError.fileNotFound {
    print("The file was not found.")
} catch {
    print("An unexpected error occurred: \(error).")
}
```

##### Using Try? to Convert the Result to an Optional

```swift
let content = try? readFile(at: "invalidPath")
if let content = content {
    print(content)
} else {
    print("Failed to read the file.")
}
```

##### Using Try! to Assert No Error Will Be Thrown

```swift
let content = try! readFile(at: "validPath")
print(content) // File content
```

##### Initializers Can Throw Errors

```swift
struct User {
    let name: String
    let age: Int

    init(name: String, age: Int) throws {
        guard age >= 0 else {
            throw InitializationError.invalidAge
        }
        self.name = name
        self.age = age
    }
}

enum InitializationError: Error {
    case invalidAge
}

do {
    let user = try User(name: "Alice", age: 1)
    print(user.age, terminator: " years old: ")
    print(user.name)
} catch InitializationError.invalidAge {
    print("Invalid age provided.")
}
```

#### What is the `Error` protocol in Swift, and how is it used in defining custom error types?

``` swift
// The Error protocol defines your error types using enumerations, structs, or classes.
// That helps to remember to add your error that can be identified while working on the project

enum FileError: Error {
    case fileNotFound
    case unreadable
    case encodingFailed
}
```

#### What is the difference between `throws`, `try?`, and `try!`? When should you use each?

``` text
throws: it is used when the function might be thrown.
try?: it is used when Converting Errors to Optionals.
try!: it is used when asserts that no error will be thrown. If an error does occur, the program will crash.
```

- `throws`: Use when you want to declare a function or method that can throw an error, and the caller must handle that error.
- `try?`: Use when you want to call a function or method that `throws` an error, and you want to handle the error by returning an optional value.
- `Try!`: Use when you're sure that the function or method will not throw an error, and you want to avoid the overhead of error handling.

#### How does Swift’s error handling model differ from languages that use `try-catch-finally` (e.g., Java, Python)?

``` text
1. Explicit Error Declaration: In Swift, functions that can throw errors are marked with the throws keyword. This makes it clear which functions can fail and forces developers to handle errors (using try, try?, or try!), whereas in languages like Java and Python, functions don't need to declare that they may throw an error. 

2. No finally Block: Swift doesn't have a finally block like Java or Python. Instead, it focuses on handling errors through do-catch blocks. Cleanup code is typically done using defer statements, which are executed just before leaving the current scope. 

3. Error Types: Swift uses a distinct Error protocol to define custom error types, while Java and Python often use classes or exceptions (e.g., Exception in Java, Exception in Python) for error handling. 

4. No Checked Exceptions: Unlike Java, which distinguishes between checked and unchecked exceptions, Swift does not have checked exceptions. All errors are treated equally and must be explicitly handled, without distinguishing between recoverable and non-recoverable errors.
```

#### What is a `do-catch` block in Swift, and how does it work? How can you catch specific error cases?

A **`do-catch` block** in Swift is used to handle errors thrown by functions. It allows you to try code that might throw an error and catch errors gracefully.

#### Basic Syntax

```swift
do {
    try someThrowingFunction()
    // Code that runs if no error occurs
} catch {
    // Handles any error
    print("An error occurred: \(error)")
}
```

- **`do`**: Executes code that might throw an error.
- **`try`**: Mark the code that could throw an error.
- **`catch`**: Handles the error if one occurs.

#### How does Swift allow error propagation in functions, and what happens when an error is thrown inside a function that is marked with `throws`?

```swift
// In Swift, error propagation allows functions marked with throws to pass errors to the calling function. When an error is thrown inside a throws function, the error is propagated up the call stack unless it's explicitly handled.

enum MyError: Error {
    case invalidInput
}

func reCallFn() throws {
    throw MyError.invalidInput
}

func callrFn() throws {
    try reCallFn() // Propagates the error from rFn
}

do {
    try callrFn()
} catch MyError.invalidInput {
    print("Handled error: Invalid input")
}
```

#### Working with Asynchronous Operations Using Completion Handlers

```swift
let semaphore = DispatchSemaphore(value: 0)
func fetchData(completion: @escaping (Result<String, Error>) -> Void) {
    DispatchQueue.global().async {
        // Simulate a network request
        let success = false
        if success {
            completion(.success("Data received"))
        } else {
            completion(.failure(NetworkError.connectionLost))
        }
    }
}

enum NetworkError: Error {
    case connectionLost
}

fetchData { result in
    switch result {
    case .success(let data):
        print("Success: \(data)")
    case .failure(let error):
        print("Failure: \(error)")
    }
}

semaphore.wait()
```

#### Divide by Any Number

```swift
enum CalculatorError: Error {
    case divisionByZero
}

func divide(_ a: Double, by b: Double) throws -> Double {
    guard b != 0 else {
        throw CalculatorError.divisionByZero
    }
    return a / b
}

// Test it
do {
    let result = try divide(10, by: 2)
    print("Result: \(result)")
} catch CalculatorError.divisionByZero {
    print("Error: Cannot divide by zero.")
}
```
