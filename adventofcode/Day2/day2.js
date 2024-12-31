const fs = require('fs');
const path = require('path');


const filePath = path.join(__dirname, 'input.txt');

function isSafe(levels) {
    let isIncreasing = true;
    let isDecreasing = true;

    for (let i = 0; i < levels.length - 1; i++) {
        const diff = Math.abs(levels[i + 1] - levels[i]);
        if (diff < 1 || diff > 3) return false;
        if (levels[i + 1] > levels[i]) isDecreasing = false;
        else if (levels[i + 1] < levels[i]) isIncreasing = false;
    }

    return isIncreasing || isDecreasing;
};

function check_safe(levels) {

    if (isSafe(levels)) {
        return true;
    }
    // darek vakhate 1 element kadhi ne pass karva nu safe 6e ke nay jova
    for (let i = 0; i < levels.length; i++) {
        const small_array = [...levels.slice(0, i), ...levels.slice(i + 1)];
        if (isSafe(small_array)) {
            return true;
        }
    }

    return false;
}

// Read the file
fs.readFile(filePath, 'utf8', (err, data) => {
    if (err) {
        console.error('Error reading the file:', err);
        return;
    }

    const lines = data.split('\n');
    const resultArray = lines.map(line => {
        return line.trim().split(' ').map(Number).filter(num => !isNaN(num));
    });

    let count = 0;
    for (let i = 0; i < resultArray.length; i++) {
        if (check_safe(resultArray[i])) {
            count++;
        }
    }
    console.log(count);
});
