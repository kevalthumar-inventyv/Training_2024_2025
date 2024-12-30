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
