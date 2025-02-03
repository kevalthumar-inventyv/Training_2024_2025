
# The primary keywords are:

# Feature
# Rule (as of Gherkin 6)
# Example (or Scenario)
# Given, When, Then, And, But for steps (or *)
# Background
# Scenario Outline (or Scenario Template)
# Examples (or Scenarios)
# There are a few secondary keywords as well:

# """ (Doc Strings)
# | (Data Tables)
# @ (Tags)
# # (Comments)

# User Story format:
    # As an <actor>
    # I want a <feature>
    # So that <benefit>
# Example:
    # As a user
    # I want to see the result of the FizzBuzz game
    # So that I can understand the output of the game

Feature: Handling different types of inputs on the outputOfString function
    As a user, I want to receive clear notifications for any invalid input when I call the outputOfString function, so that I can correct the input and obtain the correct output as if number is divisible by 3 it should return "Fizz", if number is divisible by 5 it should return "Buzz", if number is divisible by 3 and 5 it should return "FizzBuzz", if number is not divisible by 3 and 5 it should return the number itself.
    Background:
        Given I have an empty string to append my answer in the outputOfString function to return the result 
        And aslo i have one number to check the divisibility of the number by 3 and 5.
    Scenario Outline: Handling different types of inputs
        When the user adds the number "<number>".
        Then the outputOfString function should return output as "<output>".
        But if the input is invalid, it should return Invalid message as "Invalid input".
    Examples:
            | number              | output        |
            | ""                  | Invalid input |
            | 1                   | 1             |
            | 3                   | Fizz          |
            | 5                   | Buzz          |
            | 15                  | FizzBuzz      |
            | 7                   | 7             |
            | 9                   | Fizz          |
            | 10                  | Buzz          |
            | "number"            | Invalid input |
            | 30                  | FizzBuzz      |
            | 11                  | 11            |
            | 13                  | 13            |
            | 14                  | 14            |
            | 16                  | 16            |
            | 17                  | 17            |
            | 18                  | Fizz          |
            | 19                  | 19            |
            | "name"              | Invalid input |
            | 20                  | Buzz          |
            | 21                  | Fizz          |
            | 22                  | 22            |
            | 23                  | 23            |
            | 24                  | Fizz          |
            | 25                  | Buzz          |
            | 26                  | 26            |
            | 27                  | Fizz          |
            | 28                  | 28            |
            | "@323#"             | Invalid input |
            | 29                  | 29            |
            | 31                  | 31            |
            | 32                  | 32            |
            | 33                  | Fizz          |
            | 34                  | 34            |
            | 35                  | Buzz          |
            | 36                  | Fizz          |
            | 37                  | 37            |
            | "34+43"             | Invalid input |
            | 38                  | 38            |
            | 39                  | Fizz          |
            | 40                  | Buzz          |
            | 41                  | 41            |
            | 42                  | Fizz          |
            | 43                  | 43            |
            | 44                  | 44            |
            | 45                  | FizzBuzz      |
            | 46                  | 46            |
            | 47                  | 47            |
            | 48                  | Fizz          |
            | 49                  | 49            |
            | 50                  | Buzz          |
            | "my number is 3434" | Invalid input |
            | 51                  | Fizz          |
            | 52                  | 52            |
            | 53                  | 53            |
            | 54                  | Fizz          |
            | 55                  | Buzz          |

