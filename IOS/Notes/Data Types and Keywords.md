
# [DataType](https://github.com/amanverasia-inventyv/iOS-Training/blob/main/Data%20Types%20and%20Keywords.md#data-types-1)

## 1. What’s the difference between `Int` and `UInt` in Swift?

`Ans:` Int is used for sign and unsign value and UInt is used for sign only. The range of the Int value is - Int64:- -2^63 to -2^63-1 and for UInt:- 0 to -2^64-1.

## 2. What would happen if you tried to assign a negative value to a `UInt` variable?

`Ans:` var height: UInt8 = -170 it gives an error like this `Negative integer '-170' overflows when stored into unsigned type 'UInt8'`

## 3. How does Swift handle the size of `Int` on 32-bit vs. 64-bit platforms?

`Ans:`

- **32-bit Architecture**: On a 32-bit platform, `Int` is equivalent to `Int32`, meaning it has a maximum value of 2^31−1 and a minimum value of −2^31.
- **64-bit Architecture**: On a 64-bit platform, `Int` is equivalent to `Int64`, meaning it has a maximum value of 2^63−1 and a minimum value of −2^63.
- If you need to store a value that exceeds the maximum limit of `Int32` (2^31−1), you should use `Int64` to avoid overflow issues.
- It is generally recommended to use `Int` for integer values in Swift code, as it automatically adapts to the native word size of the platform.

## 4. Why might you choose a `Float` instead of a `Double` in Swift?

`Ans:` You might choose `Float` for its **memory efficiency** and **potential performance benefits**. `Float` uses 32 bits, whereas `Double` uses 64 bits, making it suitable for large datasets also it is based on the scenario that for which purpose you need to want that variable.

## 5. What’s the maximum precision of a `Float` in Swift?

`Ans:`
The maximum precision of a `Float` in Swift is `6 to 9` digits. For Example `**let** div: Float = 67/7`gives `9.571428` as the answer.

## 6. What type of values does a `Bool` represent?

`Ans:`  `Bool` represents `true` and `false`-based values.

## 7. How is a `Character` different from a `String` in Swift?

`Ans:`

- In Swift, a `Character` represents a single character string, such as “a”, “@”, or “5”.
- It stores a single Unicode scalar value, which can be one or more Unicode code points.
- On the other hand, a `String` stores textual data and is a collection of `Character` objects. While a `Character` can only hold a single character

## 8. What is an optional in Swift, and why is it useful?

`Ans:`

- An `Option` in Swift is a type that can either contain a value or no value at all; it can be represented by nil. It is denoted by appending a question mark (?) to the type declaration. For example, `var message: String?`
- This feature is useful because it allows developers to represent the absence of a value explicitly, which is crucial when dealing with data that might not always be available, such as data fetched from a network request.
- It helps to prevent runtime errors that could occur if a value is unexpectedly nil.

## 9. How would you safely unwrap an optional to avoid runtime errors?

`Ans:`

```swift
 let dateOfBirth: String?= 20-09-2003;
 print(dateOfBirth!)
 %% Another Method %%
 var optionalString: String? = "Hello"
 if let safeString = optionalString {
     print(safeString)
 }
```

## [Keywords](https://github.com/amanverasia-inventyv/iOS-Training/blob/main/Data%20Types%20and%20Keywords.md#keywords-1)

## 1. What is the main difference between `let` and `var`?

`Ans:-`

1. `let` is block scope and `var` is function scope.
2. `let` is used to declare a constant, which is an immutable value that cannot be changed after its initial assignment. Conversely, `var` is used to declare a variable, which is a mutable value that can be modified after its initial assignment.

## 2. Why might you prefer to use `let` instead of `var`?

`Ans:-`

- In the `Let` we need to initialize the variables at compile time and also once they initialize they can't be changed so if we need to runtime changes in our code then we need to use `var` instead of `let`.

## 3. What does the `func` keyword do in Swift?

`Ans:-`

- The `func` keyword is used to create a function in the swift.

## 4. What keyword would you use to check for a condition in Swift?

`Ans:-`

- To check for a condition in Swift we use an `if-else` ladder.

## 5. What is the purpose of a `for` loop?

`Ans:-`

- A `for` loop is used to repeat a block of code a known number of times.
- Its primary purpose is to automate repetitive tasks, making the code more efficient and easier to read.

## 6. When would you use a `while` loop instead of a `for` loop?

`Ans:-`

- A `while` loop is preferred when you do not know in advance how many times the loop will need to run.
- This is useful when the loop’s continuation depends on a condition that is not predetermined.
- `For Example:-` user input or processing data until a specific condition is met
- Number of iteration upar depends hoy to for loop and condition upar depend hoy to while loop.

## 7. What does a `switch` statement do in Swift?

`Ans:-`

- Like other programming languages `switch` statements create a switch between some specific conditions and give output.

## 8. How does a `switch` statement differ from an `if-else` chain in Swift?

`Ans:-`

- Swift requires switch statements to be exhaustive, meaning you `must cover all possible` cases or include a`default case`. This helps prevent runtime errors due to missing cases.
- In `switch statements`, the value is `read only once`, whereas `if-else` statements might `read the value multiple times`, especially when function calls are involved. This can be more efficient, particularly with slow function calls.
- Switch statements in Swift support advanced `pattern matching`, which can be unwieldy with if-else statements. For example, you can use ranges, tuples, and more complex patterns in switch cases.

## [Gauging Understanding](https://github.com/amanverasia-inventyv/iOS-Training/blob/main/Data%20Types%20and%20Keywords.md#gauging-understanding)

## 1. What is the purpose of optional chaining?

`ans:-`

- The purpose of Optional chaining is to avoid runtime errors and write more robust code.
- It allows you to safely access properties, methods, and subscripts on optional values.

## 2. How would you use optional chaining to access a property that might be `nil`?

`ans:-`

- `!` is used to access a property that might be `nil` when we use optional chaining.

## 3. What is type inference, and how does Swift use it?

`ans:-`

- `Type Inference` is a feature in programming languages where the compiler automatically deduces the data type of a variable, constant, or expression based on its initial value or context.
- In Swift, type inference is used to enhance code readability and maintain strong, static typing.
- For example, if you declare a constant `let name = "keval Thumar"`, Swift infers that `helloWorld` is of type `String`.
- Swift assumes the optional is not `nil` and attempts to access the underlying value. If the optional is indeed `nil`, this will trigger a runtime error, leading to a crash.

## 4. What is the risk of using forced unwrapping on an optional?

`ans:-`

- Using forced unwrapping on an optional in Swift poses a significant risk because it can cause your application to crash if the optional value is `nil`.
- When you force unwrap an optional with the exclamation mark `!` .
- Swift assumes the optional is not `nil` and attempts to access the underlying value. If the optional is indeed `nil`, this will trigger a runtime error, leading to a crash.

``` swift
 let dateOfBirth: String? = nil;
 print(dateOfBirth!)
```

## 5. How would you create a constant in Swift?

`ans:-`

- we can create a constant variable with the help of `let`.

## 6. How would you create a variable in Swift?

`ans:-`

- we can create variables using `let and var`.

## 7. What is the syntax to declare a multiline string in Swift?

`ans:-`

``` swift
 var multiLineString:String = """
         keval Thumar
         jetalsar gam
         inventyv
        """
 print(multiLineString)
```
