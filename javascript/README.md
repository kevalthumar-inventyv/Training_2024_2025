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
    - Use only one inbuilt function: `reduce` or `unshift`.
    - Use only two array variables and one sum variable.

## Solution_1

Here is the solution approch used to solve this task:

1. Create an IIFE that shifts the first element from an array and passes it to a function that calculates the sum of a new array.
2. If the sum is greater than 30, it resolves a promise with a success message; otherwise, it rejects the promise with a failure message.
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
    - Use only one inbuilt function: `reduce` or `unshift`.
    - Use only two array variables and one sum variable.
    - Use only array of `Symbol` in both arrays.

## Solution_2

Here is the solution approch used to solve this task:

1. In this solution, we create An IIFE initializes an array of `Symbol` values, removes the first element, and calls `sum_of_array` with the remaining elements, demonstrating promise handling, array manipulation, and validation in JavaScript.

2. After that we implemented the `sum_of_array` function, which calculates the sum of numeric descriptions from an array of `Symbol` values. The function takes two parameters: an `element` and an array `arr`.

3. It creates a new array that includes both the `element` and the contents of `arr`.

4. During iteration, it validates and converts each symbol's description to a number before adding it to the sum and check if conversion is successful then only add to the sum otherwise ignore don't add to the sum.

5. A promise is created to resolve with a message if the sum exceeds 30 or reject if it does not.

## Task 3

In this task, we need to:

1. create an LocalStorage object and store registered users in it.
2. At time of login, check if the user data is present in LocalStorage.
3. If user data is present in LocalStorage, check if the username and password match.
4. If username and password match, redirect to home.html page and create a session.
5. After 42 sec of inactivity, destroy the session and redirect to page.html page.
6. Give Delete Session button to destroy the session and clear LocalStorage and redirect to page.html page.

## Solution_3

In this solution, we implemented the following features:

1. **User Registration**: Implemented in `page.js` where the user's details are saved in `LocalStorage` upon registration.
2. **User Login**: Implemented in `page.js` where the user's credentials are checked against `LocalStorage` data. If valid, a session is created in `sessionStorage` and the user is redirected to `home.html`.
3. **Session Management**: Implemented in `page.js` where the session timer is set for 42 seconds. If the session expires, the user is redirected to `page.html`.
4. **Delete Session**: Implemented in `page.js` where a button is provided to delete the session, clear `LocalStorage`, and redirect to `page.html`.

This solution ensures that user registration, login, and session management are handled correctly, providing a seamless user experience.
