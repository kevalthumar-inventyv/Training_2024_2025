# Day 1: Historian Hysteria

## Task Description

The Chief Historian is missing, and we need to help the Elvish Senior Historians reconcile their lists of historically significant locations. Each location is identified by a unique number called the location ID. The goal is to:

1. Calculate the total distance between two lists of location IDs.
2. Calculate the total similarity score by finding how often each number from the left list appears in the right list.

## Approach

### Part One

1. **Split the Array**: Divide the given array into two separate arrays, `arr1` and `arr2`.
2. **Sort the Arrays**: Sort both arrays.
3. **Calculate Distance**: Pair up the smallest numbers from each array and calculate the absolute difference. Sum these differences to get the total distance.

### Part Two

1. **Count Occurrences**: For each number in `arr1`, count how many times it appears in `arr2`.
2. **Calculate Similarity Score**: Multiply each number in `arr1` by its count in `arr2` and sum these values to get the total similarity score.

# Day 2: Red-Nosed Reports

## Task Description

The engineers at the Red-Nosed Reindeer nuclear fusion/fission plant need help analyzing unusual data from the reactor. Each report is a list of levels, and a report is considered safe if:

1. The levels are either all increasing or all decreasing.
2. Any two adjacent levels differ by at least one and at most three.

### Part One

1. **Check Safety**: Determine if the levels in each report are either all increasing or all decreasing, with adjacent levels differing by 1 to 3.
2. **Count Safe Reports**: Count the number of reports that meet the safety criteria.

### Part Two

1. **Problem Dampener**: Introduce a mechanism that allows removing a single level from an unsafe report to make it safe.
2. **Recheck Safety**: Re-evaluate each report by considering the removal of one level to see if it becomes safe.
3. **Count Safe Reports**: Count the number of reports that are safe after applying the Problem Dampener.

## Approach

### Part One

1. **Read Data**: Read the input data from a file and split it into individual reports.
2. **Check Safety**: Implement a function to check if a report is safe by verifying the increasing/decreasing order and the difference between adjacent levels.
3. **Count Safe Reports**: Iterate through the reports and count how many are safe.

### Part Two

1. **Check Safety with Removal**: Implement a function to check if a report can be made safe by removing one level.
2. **Count Safe Reports with Dampener**: Iterate through the reports and count how many are safe after considering the removal of one level.

# Day 3: Mull It Over

## Task Description

The computers at the North Pole Toboggan Rental Shop are having issues, and the memory (your puzzle input) is corrupted. The goal of the program is to multiply some numbers using instructions like `mul(X,Y)`, where X and Y are each 1-3 digit numbers. However, the memory is corrupted with invalid characters and additional conditional statements.

### Part One

1. **Extract Valid Instructions**: Scan the corrupted memory for valid `mul(X,Y)` instructions.
2. **Calculate Sum**: Add up all the results of the valid multiplications.

### Part Two

1. **Handle Conditional Statements**: Introduce `do()` and `don't()` instructions to enable or disable future `mul` instructions.
2. **Calculate Sum with Conditions**: Add up the results of the enabled multiplications, considering the most recent `do()` or `don't()` instruction.

## Approach

### Part One

1. **Read Input File**: Read the corrupted memory from the input file.
2. **Extract Valid Instructions**: Use a regular expression to extract valid `mul(X,Y)` instructions.
3. **Calculate Sum**: Iterate through the extracted instructions and sum the results of the multiplications.

### Part Two

1. **Extract Valid Instructions**: Use a regular expression to extract valid `mul(X,Y)`, `do()`, and `don't()` instructions.
2. **Process Instructions**: Iterate through the extracted instructions, keeping track of whether `mul` instructions are enabled or disabled based on the most recent `do()` or `don't()` instruction.
3. **Calculate Sum with Conditions**: Sum the results of the enabled `mul` instructions.

# Day 4: Ceres Search

## Task Description

The Elf needs help finding the word "XMAS" in a word search grid. The word can appear in various directions: horizontal, vertical, diagonal, and backwards.

### Part One

1. **Read Input File**: Read the word search grid from the input file.
2. **Define Directions**: Define all possible directions to search for the word "XMAS" (right, left, down, up, and diagonals).
3. **Search for Word**: Iterate through each cell in the grid and check for the word "XMAS" in all defined directions.
4. **Count Occurrences**: Count the number of times "XMAS" appears in the grid.

### Part Two

1. **Define X-MAS Pattern**: Define the pattern for "X-MAS" where "MAS" forms an X shape.
2. **Search for Pattern**: Iterate through each cell in the grid and check for the "X-MAS" pattern.
3. **Count Occurrences**: Count the number of times the "X-MAS" pattern appears in the grid.

# Day 5: Print Queue

## Task Description

The North Pole printing department is busier than ever this close to Christmas, and the new sleigh launch safety manual updates won't print correctly. Safety protocols indicate that new pages for the safety manuals must be printed in a very specific order. The notation X|Y means that if both page number X and page number Y are to be produced as part of an update, page number X must be printed at some point before page number Y.

### Part One

1. **Identify Correctly Ordered Updates**: Determine which updates are already in the correct order according to the given rules.
2. **Find Middle Page Number**: For each correctly-ordered update, find the middle page number.
3. **Calculate Sum**: Add up the middle page numbers of all correctly-ordered updates.

### Part Two

1. **Identify Incorrectly Ordered Updates**: Find the updates which are not in the correct order.
2. **Reorder Updates**: Use the page ordering rules to put the page numbers in the right order.
3. **Find Middle Page Number**: For each reordered update, find the middle page number.
4. **Calculate Sum**: Add up the middle page numbers of all reordered updates.

## Approach

### Part One

1. **Read Input Files**: Read the ordering rules and updates from the input files.
2. **Create Rule Map**: Create a map where each key is a page number and the value is a set of page numbers that must come after the key.
3. **Validate Sequences**: For each update, check if it is valid according to the rules.
4. **Find Middle Page Numbers**: For each valid update, find the middle page number and add it to the total sum.

### Part Two

1. **Identify Invalid Sequences**: For sequences that are not valid, reorder them correctly using the rules.
2. **Reorder Sequences**: Determine the correct order by counting how many other pages must come after each page.
3. **Find Middle Page Numbers**: For each reordered update, find the middle page number and add it to the total sum.
