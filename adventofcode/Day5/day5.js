const fs = require('fs');
const path = require('path');
const filePath = path.join(__dirname, 'input.txt');
const filePath2 = path.join(__dirname, 'input_2.txt');
fs.readFile(filePath, 'utf8', (err, data) => {
    if (err) {
        console.error('Error reading the file:', err);
        return;
    }
    const lines = data.split('\n');
    const lineSegmentValues = lines.map(line => {
        return line.trim().split('|').map(Number).filter(num => !isNaN(num));
    });
    fs.readFile(filePath2, 'utf8', (err, arr) => {
        if (err) {
            console.log('Error reading the file:', err);
            return;
        }
        const linesArray = arr.split('\r\n');
        const resultArray = linesArray.map(line => {
            return line.trim().split(',').map(Number).filter(num => !isNaN(num));
        });
        let [sum1, sum2] = findSum(lineSegmentValues, resultArray);
        console.log(sum1, sum2);
    });
});

function findSum(lineSegmentValues, resultArray) {
    const ruleMap = new Map();
    for (const [before, after] of lineSegmentValues) {
        if (!ruleMap.has(before)) {
            ruleMap.set(before, new Set());
        }
        // darek number na appropreat ketal number 6r te gothava 6e
        ruleMap.get(before).add(after);
    }
    let totalSum_1 = 0;
    let totalSum_2 = 0;
    // part 1
    for (const sequence of resultArray) {
        if (isValidSequence(sequence, ruleMap)) {
            const middleIndex = Math.floor(sequence.length / 2);
            totalSum_1 += sequence[middleIndex];
        }
        else{
            totalSum_2 += middleNumber(sequence, ruleMap);
        }
    }
    return [totalSum_1, totalSum_2];
}

function middleNumber(sequence, ruleMap) {
    let countMap = new Map();
    for (let i = 0; i < sequence.length; i++) {
        const first = sequence[i];
        let count = 0;
        for (let j = 0; j < sequence.length; j++) {
            if(i!==j){
                const second = sequence[j];
                if (ruleMap.get(first).has(second)) {
                    count++;
                }
            }
        }
        countMap.set(count,first);
    }
    return countMap.get(Math.floor(countMap.size / 2));
}

function isValidSequence(sequence, ruleMap) {
    for (let i = 0; i < sequence.length; i++) {
        for (let j = i + 1; j < sequence.length; j++) {
            const first = sequence[i];
            const second = sequence[j];
            if (ruleMap.has(second) && ruleMap.get(second).has(first)) {
                return false;
            }
        }
    }
    return true;
}