# Details of Tasks

## Task 1

    In this task, we need to:

    1. Create an IIFE (Immediately Invoked Function Expression).
        - Make one array of `Numbers`.
        - Use `unshift` to remove the first number from the array.
        - Call the function within the IIFE with the remaining numbers and the first element.
    2. Call a function within the IIFE that:
       - Returns the sum of all numbers in an array.
       - If the sum is greater than 30, it creates a promise and resolves it with the message "Sum is greater than 30".
       - If the sum is less than or equal to 30, it rejects the promise with the message "Sum is less than 30".
    3. Constraints:
       - Use only one inbuilt function: `reduce`.
       - Use only one additional inbuilt function: `unshift`.
       - Use only two array variables and one sum variable.

## Solution_1

    Here is the solution approch used to solve this task:

    - Create an IIFE that shifts the first element from an array and passes it to a function that calculates the sum of a new array.
    - If the sum is greater than 30, it resolves a promise with a success message; otherwise, it rejects the promise with a failure message.
    - The result is logged to the console.

## Task 2

    In this task, we need to:

    1. Create an IIFE (Immediately Invoked Function Expression).
        - Make one array of `Symbol`.
        - Use `unshift` to remove the first `Symbol` from the array.
        - Call the function within the IIFE with the remaining numbers and the first element.
    2. Call a function within the IIFE that:
       - Returns the sum of all `Symbol` in an array.
       - If the sum is greater than 30, it creates a promise and resolves it with the message "Sum is greater than 30".
       - If the sum is less than or equal to 30, it rejects the promise with the message "Sum is less than 30".
    3. Constraints:
       - Use only one inbuilt function: `reduce`.
       - Use only one additional inbuilt function: `unshift`.
       - Use only two array variables and one sum variable.
       - Use only array of `Symbol` in both arrays.

## Solution_2

    Here is the solution approch used to solve this task:

    - In this solution, we create An IIFE initializes an array of `Symbol` values, removes the first element, and calls `sum_of_array` with the remaining elements, demonstrating promise handling, array manipulation, and validation in JavaScript.

    - After that we implemented the `sum_of_array` function, which calculates the sum of numeric descriptions from an array of `Symbol` values. The function takes two parameters: an `element` and an array `arr`.

    - It creates a new array that includes both the `element` and the contents of `arr`.

    - During iteration, it validates and converts each symbol's description to a number before adding it to the sum and check if conversion is successful then only add to the sum otherwise ignore don't add to the sum.

    - A promise is created to resolve with a message if the sum exceeds 30 or reject if it does not.
