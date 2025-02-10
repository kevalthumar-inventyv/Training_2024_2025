# Function and Completion Handlers

##### What is a global function in Swift?

```swift
// Global functions are declared at the top level of your code and are accessible anywhere within the same module // example
func sayHello() {
 print("Hello, World!")
}
sayHello()
```

##### Why might you use a global function instead of a method inside a class or struct?

```swift
// We can put all common utility functions on top of the code and use them where required. But when we put inside class or struct, then we need to create an instance of that to use them.
// So we can prefer to use a global function.
```

##### Write a global function that takes two integers and returns their sum

```swift
func add(num1: Int, num2: Int)-> Int{
 return num1 + num2;
}
add(1,2) // output: 3
```

##### Where can a nested function be accessed?

```swift
// Functions can be defined within other functions, creating a nested structure. Nested functions are not accessible outside their parent function.
// Nested function only access within the same level or inside the body of function which is the same level as that function.
```

##### What is the benefit of using nested functions?

- **Encapsulation**: Hide helper functions within other functions.
- **Organization**: Keep related functionality grouped.

##### Write an `outerFunction` that contains an `innerFunction`, which prints "Swift is fun!". Call the `innerFunction` inside `outerFunction`

```swift
func outerFunction() {
 func innerFunction() {
  print("Swift is fun!")
 }
 innerFunction()
}
outerFunction() // Output: Swift is fun!
```

##### In the following code, what will be printed when calling `counter()` three times? (without running the code)

```swift
 func makeCounter() -> () -> Int {
     var count = 0
     func increment() -> Int {
         count += 1
         return count
     }
     return increment
 }

 let counter = makeCounter()
 print(counter()) // 1
 print(counter()) // 2
 print(counter()) // 3
```

##### By default, closures in Swift are escaping. (True/False) `False`

##### A non-escaping closure can be stored and used later. (True/False)  `False`

##### The `@escaping` keyword allows a closure to be stored and executed after the function has returned. (True/False) `True`

##### Write a function `executeTask` that takes a non-escaping closure and prints "Task completed!" after executing the closure

```swift
func executeTask(task: ()-> Void){
 task()
    print("Task completed.")
}
executeTask {
    print("Performing task...")
}
```

##### Modify the following function so that it stores the closure and executes it later

```swift
var completionHandlers: [() -> Void] = []
func performAsyncTask(completion: @escaping () -> Void) {
    print("Task in progress...")
    completionHandlers.append(completion)
}
performAsyncTask {
    print("Completion handler called.")
}

// Later in the code
for completion in completionHandlers {
    completion()
}

```

##### Why do we use `[weak self]` inside escaping closures?

When using `self` inside an escaping closure then, it will create strong reference cycles. To prevent this, we use `weak self` inside escaping closures.

##### Rewrite the following code to avoid a strong reference cycle

``

```swift
class TaskManager {
    var taskCount = 0

    func startTask(completion: @escaping () -> Void) {
        /*  completion()
          print("Task count: \(taskCount)")
        */
        func startTask(completion: @escaping () -> Void) {
          performAsyncTask { [weak self] in
            guard let self = self else { return }
            print("Value is \(self.taskCount)")
        }

   }
  }
```

##### A \_****\_\_\_****\_ closure cannot be stored after a function returns

`Non-escaping` Closure can not be stored after a function return.

##### An escaping closure requires the `_______` keyword before the closure parameter

`@escaping` is required to create escaping closure

##### Nested functions help with \_**\_\_**\*\***** and **\*\*\*\***\_\_\_\*\*

```swift
// Encapsulation and Organization
// Encapsulation: Hide helper functions within other functions.
// Organization: Keep related functionality grouped.
```

##### Identify and fix the issue in the following code

```swift
  func addHandler(handler: () -> Void) {
      completionHandlers.append(handler)
  }
 //After solving the problem
func addHandler(handler: @escaping () -> Void) {
    completionHandlers.append(handler)
}
```

##### Can you think of a real-world example where an escaping closure is useful?

A real-world example of an escaping closure is using a **Timer** to schedule a delayed task. When you set up a timer, the closure you provide is stored (or "escapes") until the timer fires, which may be after the function that created it has returned.

another real-world example of an escaping closure in Swift is when performing an asynchronous network request. When you fetch data from a remote server, the completion handler closure you provide is stored and executed later—after the network call completes—making it an escaping closure.
