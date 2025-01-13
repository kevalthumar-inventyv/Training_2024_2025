const fs = require('fs');
const path = require('path');
const filePath = path.join(__dirname, 'input.txt');

fs.readFile(filePath, 'utf8', (err, data) => {
    if (err) {
        console.error('Error reading the file:', err);
        return;
    }
    const lines = data.split('\n');
    const arr = lines.map(line => {
        return line.split('');
    });

    // Part one
    const result_1 = findDistrictPositions(arr);
    console.log('Part One Result:', result_1);

    // Part two
    const result_2 = findLoopObstructions(arr);
    console.log('Part Two Result:', result_2);
});

function findDistrictPositions(arr) {
    const direction = [
        [-1, 0], // up
        [0, 1],  // right
        [1, 0],  // down
        [0, -1]  // left
    ];
    let curDir = 0;
    let [i, j] = findStartPositions(arr);
    const visited = new Set();

    while (true) {
        visited.add(`${i},${j}`);
        const [newI, newJ] = [i + direction[curDir][0], j + direction[curDir][1]];

        if (newI < 0 || newI >= arr.length || newJ < 0 || newJ >= arr[0].length) {
            break;
        }

        if (arr[newI][newJ] === '#') {
            curDir = (curDir + 1) % 4;
        } else {
            i = newI;
            j = newJ;
        }
    }
    return visited.size;
}

function findLoopObstructions(arr) {
    const direction = [
        [-1, 0], // up
        [0, 1],  // right
        [1, 0],  // down
        [0, -1]  // left
    ];

    const start = findStartPositions(arr);
    let count =0;

    for (let i = 0; i < arr.length; i++) {
        for (let j = 0; j < arr[0].length; j++) {
            if (arr[i][j] === '.' && (i !== start[0] || j !== start[1])) {

                arr[i][j] = '#';

                if (isStuckInLoop(arr, direction, start)) {
                    count++;
                }

                arr[i][j] = '.';
            }
        }
    }

    return count;
}

function isStuckInLoop(arr, direction, start) {
    let [i, j] = start;
    let curDir = 0;
    const visited = new Set();

    while (true) {
        // new logic
        const key = `${i},${j},${curDir}`;

        if (visited.has(key)) {
            return true; 
        }
        // old one
        visited.add(key);
        const [newI, newJ] = [i + direction[curDir][0], j + direction[curDir][1]];

        if (newI < 0 || newI >= arr.length || newJ < 0 || newJ >= arr[0].length) {
            return false; 
        }

        if (arr[newI][newJ] === '#') {
            curDir = (curDir + 1) % 4;
        } else {
            i = newI;
            j = newJ;
        }
    }
}

function findStartPositions(arr) {
    for (let i = 0; i < arr.length; i++) {
        for (let j = 0; j < arr[0].length; j++) {
            if (arr[i][j] === '^') {
                return [i, j];
            }
        }
    }
    return [0, 0];
}
