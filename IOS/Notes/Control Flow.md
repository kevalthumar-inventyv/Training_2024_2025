# Control Flow

## [Loop Statements](https://github.com/amanverasia-inventyv/iOS-Training/blob/main/Control%20Flow.md#loop-statements)

### For-in Loop

The `for-in` loop is used to iterate over collections, ranges, or sequences.

``` swift
 func primeNumbers(start: Int, end: Int) -> [Int] {
     var arr:[Int] = []
     for i in 400...6000{
         isPrimeNumber(number: i) == true ? arr.append(i):nil
     }
    return arr;
 }
```

### While Loop

The `while` loop repeats a code block as long as a specified condition remains true. It is beneficial when the number of iterations is not known beforehand.

``` swift
func checkPalindrome(number:Int) -> String {
 var tempNumber = number
 var reversedNumber: Int = 0
     
 while tempNumber != 0 {
     let lastDigit = tempNumber % 10
     reversedNumber = reversedNumber * 10 + lastDigit
     tempNumber /= 10
         
 }
 return number == reversedNumber ? "\(number) is palindrome" : "\(number) is not palindrome";
}
```

### Guard Statement

The `guard` statement is used to exit a scope early when a certain condition is not met. It’s commonly used for input validation.

``` swift
 func greet(person: String?,email:String?) {
    guard let name = person , let pemail = email else{
        print("No name provided.")
        return
    }
    print(person!)
    print(email!)
}
 greet(person: "Alice",email:"thumatkeval@12")   // Output: Hello, Alice!
 greet(person: nil,email: "thumatkeval@12")    // Output: No name provided.
 greet(person: "Alice", email: nil)
```

### Repeat-While Loop

The repeat-while loop is similar to the while loop, except the condition is checked after each iteration, ensuring that the loop body is executed at least once.

``` swift
 var i = 1
 var n = 5

 repeat {
  print(i)
  i += 1
 } while i <= n
```
