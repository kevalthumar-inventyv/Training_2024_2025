# **Flowchart Tasks**

`what is Flowchart?` : A Flowchart is a visual representation of a program's execution flow, typically used for debugging and understanding how a program works.

`Type of Flowchart` : Three are three types of Flowcharts: Sequence Flowchart, Decision Flowchart, and Loop Flowchart that also know as simple Flowchart,complex Flowchart and dynamic Flowchart.

[Click Here to view the Flowchart](https://www.figma.com/board/K0xqhMVvkevvgVNfrEKpJz/Keval's-Flowchart?node-id=0-1&p=f&t=OTRWeg3mX77IURLb-0)

## **1to5number**

### Description

This folder contains basic programs to perform operations on numbers from 1 to 5:

- **print1to5number.js**: Prints numbers from 1 to 5 sequentially.
- **sumof1to5number.js**: Calculates and displays the sum of numbers from 1 to 5.

### Approach

- For **printing numbers**, a simple `for` loop iterates through the range.
- For **sum calculation**, an accumulator variable adds numbers in the range within a loop.

---

## **factorial**

### Description

This folder contains programs related to factorials and series of factorials:

- **factorialofnumber.js**: Computes the factorial of a given number.
- **seriesoffactorial.js**: Generates a series of factorials for a specified range of numbers.
- **seriesoffactorialwithalternetsign.js**: Produces a factorial series with alternating positive and negative signs.

### Approach

- **Factorial Calculation**:

  - Implemented using both iterative (loop-based) and recursive methods.
  - Recursive approach involves calling the function repeatedly until the base case (n=1) is met.

- **Series of Factorials**:

  - A loop iterates through the range of numbers to calculate factorials.
  - An array or string is used to store and display the resulting series.

- **Alternating Signs**:

  - A sign variable (`+1` or `-1`) toggles its value at each step in the loop to manage alternating signs.

### Challenges

Handling alternating signs and optimizing factorial calculations for larger inputs required careful attention to avoid performance issues.

## **FunctionOfShape**

### Description

This folder contains programs to compute basic geometric properties:

- **areaofcircle.js**: Calculates the area of a circle based on its radius.
- **perimeterofrectangle.js**: Computes the perimeter of a rectangle given its length and width.

### Approach

- Applied standard geometric formulas:
  - Circle Area = 3.14 \* R \* R
  - Rectangle Perimeter =&#x20;
- Constants like are taken from built-in libraries (e.g., `Math.PI` in JavaScript).

## **MaxOfNumber**

### Description

Programs in this folder find the maximum among given numbers:

- **maxofthreenumber.js**: Finds the maximum value among three numbers.
- **maxoftwonumber.js**: Determines the larger of two numbers.

### Approach

- Utilized conditional statements (`if-else`) for comparisons.

## **series**

### Description

This folder contains programs to generate mathematical and pattern-based series:

- **alternative+-ofnumber.js**: Generates a series with alternating addition and subtraction (e.g., 1 - 2 + 3 - 4 + 5).
- **peramidinsingleline.js**: Prints a pyramid pattern in a single line.
- **seriesofsinx.js**: Computes the sine series approximation for a given angle using its Taylor series expansion.
- **triangleseriesinoneline.js**: Outputs a triangular number series in a single line.

### Approach

- **Input Handling**:

  - The program reads the number of terms and the angle from the user using `readline`.
  - &#x20;is treated as the angle in radians.

- **Loop Logic**:

  - The outer loop runs times, adding terms of the series.
  - An `i` variable keeps track of the exponent (odd numbers: 1, 3, 5, ...).
  - A `mul` variable alternates the sign of each term (+1, -1, +1, ...).

- **Term Calculation**:

  - Two nested loops compute the power and factorial .
  - The term is calculated as and added to the sum.

- **Precision**:

  - The result is returned with two decimal places using `toFixed(2)`.
