# Details of Tasks

## RPGGame

## Scenario

Create a console-based RPG Adventure Game in Swift. The player controls a character who must explore a dungeon, fight enemies, collect treasures, and upgrade their stats.The game will include interactive features that incorporate all the requested Swift concepts. The game must include.

- `Character Creation:` Use a struct for the player character.Include properties like name, health, attack, defense, and inventory (collection type).
- `Enemy Encounters:` Use an enum for different enemy types (e.g., Goblin, Dragon).Each enemy type has unique properties like health and damage.
- `Battle Mechanics:` Use functions and control flow for combat.Implement attack logic using operators.
- `Treasure System:` Generate random treasures (e.g., weapons, potions) using closures.=At a time only one Item was added in inventory and Store them in the inventory.
- `Level Progression:` Use methods to allow the character to level up and increase stats.Incorporate computed properties to display the current stats.
- `Classes and Structures:` Use a class for the game engine and a struct for items.  
- `Enumeration and Closures:` Use enums to manage item types and closures to simulate random events.

## Requirements

- Use all the topics: Basic Operations, Strings and Characters, Collection Types, Control Flow, Functions, Closures, Enumerations, Structures and Classes, Properties, and Methods.
- The game must be entirely console-based with clear instructions and feedback.

## Features Used in the Code

- Basic Operations: Math calculations for health, attack, and defense.
- Strings and Characters: Custom messages with string interpolation.
- Collection Types: Inventory stored in an array.
- Control Flow: if, switch, and loops for decision-making.
- Functions: Modular actions like battle and findTreasure.
- Closures: Random treasure generation.
- Enumerations: Enemy and item types.
- Structures and Classes: Character, Item, and RPGGame.
- Properties: Stored and computed properties in Character.
- Methods: Player actions and game logic are encapsulated in methods.

## How It Works

- Players enter their names.
- The game randomly generates encounters (battles or treasures).
- Players interact using the console (choose actions during battles, use items, etc.).
- The game concludes after 3 events menace total battles,  treasures can be any time , displaying the player’s final stats.

## Solved Questions

### **Collection Types**

1. Write a program to reverse the elements of an array.
2. Write a program to filter only even numbers from an array.
3. Write a program to find the maximum and minimum values in an array.
4. Write a program to remove duplicate elements from an array using a set.
5. Write a program to find common elements between two arrays using sets.
6. Write a program to check if one set is a subset of another.
7. Write a program to count the occurrences of each word in an array using a dictionary.
8. Write a program to create a phone book where names are keys and phone numbers are values.
9. Write a program to swap the keys and values in a dictionary.
10. Write a program to group words by their length using a dictionary.
11. Write a program to store student names and grades, calculate the average grade, and find the top-performing student.

### **Control Flow**

1. Write a program to print the multiplication table for a given number.
2. Write a program to calculate the sum of numbers from 1 to 100 using a loop.
3. Write a program to find the first number greater than 50 in a list.
4. Write a program to check if a given number is even or odd.
5. Write a program to categorize a person's age into groups (child, teenager, adult).
6. Write a program to assign a grade based on a student's score.
7. Write a program to print numbers from 1 to 20 but skip multiples of 3.
8. Write a program using labeled loops to exit an outer loop when a condition is met.
9. Write a program to print the first 10 numbers in the Fibonacci sequence.
10. Write a program to print all prime numbers between 1 and 50.
11. Write a function to validate user input using guard.
12. Write a program to calculate the factorial of a given number using a loop.

### **Higher Order Functions**

1. Write a program to double each element in an array using map.
2. Write a program to convert an array of temperatures in Celsius to Fahrenheit using map.
3. Write a program to flatten a nested array of integers using flatMap.
4. Write a program to combine all strings from nested arrays into a single array using flatMap.
5. Write a program to calculate the product of all elements in an array using reduce.
6. Write a program to join an array of words into a single sentence using reduce.
7. Write a program to sort an array of names in alphabetical order.
8. Write a program to sort an array of numbers in descending order using sorted.
9. Write a program to sort a dictionary by its values using sorted.
10. Write a program to group numbers into even and odd using reduce.
11. Write a program to find the longest string in an array using reduce.
12. Write a program to transform and flatten nested arrays of numbers, keeping only even numbers.

### **Class and Structure**

1. Basic Class Creation

    - Create a class named Book with the following properties:
        1. title (String)
        2. author (String)
        3. pages (Int)
    - Add a method description() that prints the book's details in this format: "Title: [title], Author: [author], Pages: [pages]".
    - Create an instance of the class and call the description() method.
2. Understanding Reference Types

    - Create a class Person with properties name (String) and age (Int).
    - Create two instances of Person pointing to the same object. Modify the name using one instance and print the name from the other. What happens? Notice the differences. Note it down inside your obsidian notes.
3. Basic Structure Creation

    - Define a structure Rectangle with properties width (Double) and height (Double).
    - Add a method area() that calculates and returns the area of the rectangle.
    - Create two instances of Rectangle and modify one instance’s width. Print the area for both instances to show that they are independent.
4. Working with Mutating Methods

    - Define a structure Counter with a property count (Int) initialized to 0.
    - Add a mutating method increment(by:) that increases the count by the given amount.
    - Create an instance of Counter, increment it by 5, and print the updated count.
5. Using self in Initializers

    - Create a class Circle with a property radius (Double) and an initializer that uses the self keyword to set the value of radius.
    - Add a method circumference() that calculates and returns the circumference of the circle (2 *π* radius).
    - Create an instance of the class and print the circumference.
6. Classes vs. Structures

    - Write a program to demonstrate the difference between a class and a structure. Create a class Car and a structure Bicycle, both with a speed property (Double).
    - Modify the speed of a class instance and a structure instance after assigning them to new variables. Print the results to explain the reference and value type behavior.
7. Inheritance with Classes

    - Create a base class Animal with a property name (String) and a method sound() that prints "Some generic sound".
    - Create a subclass Dog that overrides the sound() method to print "Woof!".
    - Create instances of Animal and Dog, call their sound() methods.
8. Custom Initializers in Structures

    - Create a structure Point with properties x (Double) and y (Double).
    - Add a custom initializer that takes a single value and initializes both x and y to the same value.
    - Create an instance of Point using this initializer and print its properties.
