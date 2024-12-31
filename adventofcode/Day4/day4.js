const fs = require('fs');
const path = require('path');

main();

function main() {
    const inputFile = path.join(__dirname, 'input.txt');
    let inputList = [];

    try {
        const data = fs.readFileSync(inputFile, 'utf-8');
        const lines = data.split('\n');
        lines.forEach(line => {
            if (line.trim() !== '') {
                inputList.push([...line]);
            }
        });
    } catch (err) {
        console.error(`Error: Unable to open file ${inputFile}`);
        return;
    }

    const ans_1 = part1(inputList);
    const ans_2 = part2(inputList);

    console.log(`Answer 1: ${ans_1} and Answer 2: ${ans_2}`);
}

function part2(inputList) {
    let mainCount = 0;
    const rowSize = inputList.length;

    for (let i = 0; i < rowSize; i++) { 
        const columnSize = inputList[0].length;
        for (let j = 0; j < columnSize; j++) {
            let count = 0;
            if (inputList[i][j] === 'A') {
                if (checkCondition('TtoB', inputList, i, j, rowSize, columnSize)) count++;
                if (checkCondition('BtoT', inputList, i, j, rowSize, columnSize)) count++;
            }
            if (count > 1) mainCount++;
        }
    }

    return mainCount;
}

function part1(inputList) {
    let count = 0;
    const rowSize = inputList.length;

    for (let i = 0; i < rowSize; i++) {
        const columnSize = inputList[0].length;
        for (let j = 0; j < columnSize; j++) {
            if (inputList[i][j] === 'X') {
                if (checkCondition('Right', inputList, i, j, rowSize, columnSize)) count++;
                if (checkCondition('Left', inputList, i, j, rowSize, columnSize)) count++;
                if (checkCondition('Down', inputList, i, j, rowSize, columnSize)) count++;
                if (checkCondition('Up', inputList, i, j, rowSize, columnSize)) count++;
                if (checkCondition('TopLeft', inputList, i, j, rowSize, columnSize)) count++;
                if (checkCondition('TopRight', inputList, i, j, rowSize, columnSize)) count++;
                if (checkCondition('BottomLeft', inputList, i, j, rowSize, columnSize)) count++;
                if (checkCondition('BottomRight', inputList, i, j, rowSize, columnSize)) count++;
            }
        }
    }

    return count;
}

function checkCondition(direction, inputList, i, j, rowSize, columnSize) {
    switch (direction) {
        case 'TtoB':
            return j < columnSize - 1 && j > 0 && i < rowSize - 1 && i > 0 &&
                ((inputList[i - 1][j - 1] === 'M' && inputList[i + 1][j + 1] === 'S') ||
                    (inputList[i - 1][j - 1] === 'S' && inputList[i + 1][j + 1] === 'M'));
        case 'BtoT':
            return j < columnSize - 1 && j > 0 && i < rowSize - 1 && i > 0 &&
                ((inputList[i + 1][j - 1] === 'M' && inputList[i - 1][j + 1] === 'S') ||
                    (inputList[i + 1][j - 1] === 'S' && inputList[i - 1][j + 1] === 'M'));
        case 'Right':
            return j < columnSize - 3 && inputList[i][j + 1] === 'M' && inputList[i][j + 2] === 'A' && inputList[i][j + 3] === 'S';
        case 'Left':
            return j > 2 && inputList[i][j - 1] === 'M' && inputList[i][j - 2] === 'A' && inputList[i][j - 3] === 'S';
        case 'Down':
            return i < rowSize - 3 && inputList[i + 1][j] === 'M' && inputList[i + 2][j] === 'A' && inputList[i + 3][j] === 'S';
        case 'Up':
            return i > 2 && inputList[i - 1][j] === 'M' && inputList[i - 2][j] === 'A' && inputList[i - 3][j] === 'S';
        case 'TopLeft':
            return j > 2 && i > 2 && inputList[i - 1][j - 1] === 'M' && inputList[i - 2][j - 2] === 'A' && inputList[i - 3][j - 3] === 'S';
        case 'TopRight':
            return j < columnSize - 3 && i > 2 && inputList[i - 1][j + 1] === 'M' && inputList[i - 2][j + 2] === 'A' && inputList[i - 3][j + 3] === 'S';
        case 'BottomLeft':
            return i < rowSize - 3 && j > 2 && inputList[i + 1][j - 1] === 'M' && inputList[i + 2][j - 2] === 'A' && inputList[i + 3][j - 3] === 'S';
        case 'BottomRight':
            return j < columnSize - 3 && i < rowSize - 3 && inputList[i + 1][j + 1] === 'M' && inputList[i + 2][j + 2] === 'A' && inputList[i + 3][j + 3] === 'S';
        default:
            return false;
    }
}