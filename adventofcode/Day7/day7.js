const fs = require('fs');
const path = require('path');
const filePath = path.join(__dirname, 'input.txt');

fs.readFile(filePath, 'utf8', (err, data) => {
    if (err) {
        console.error('Error reading the file:', err);
        return;
    }

    const lines = data.split('\n').filter(line => line.trim() !== '');
    const finalValue = [];
    const values = [];

    lines.forEach(line => {
        const [id, numbers] = line.split(":");
        finalValue.push(parseInt(id.trim(), 10));
        values.push(numbers.trim().split(" ").map(Number));
    });

    const result_1 = findSumOfAllPosiableWay(finalValue, values);
    console.log(result_1);
});

function findSumOfAllPosiableWay(finalValue, values) {
    let totalCalibrationResult = 0;

    for (let i = 0; i < values.length; i++) {
        const target = finalValue[i];
        const numbers = values[i];
        const signCombinations = makeArrOfSign(numbers.length);

        let isPossible = false;

        for (const signs of signCombinations) {
            let expression = numbers[0].toString();
            for (let j = 0; j < signs.length; j++) {
                expression += signs[j] + numbers[j + 1];
            }

            // Evaluate the expression left-to-right
            const result = evaluateLeftToRight(expression);
            if (result === target) {
                isPossible = true;
                break;
            }
        }

        if (isPossible) {
            totalCalibrationResult += target;
        }
    }

    return totalCalibrationResult;
}

function makeArrOfSign(lengthOfInputs) {
    let signArray = [];
    let n = lengthOfInputs - 1;
    for (let i = 0; i < 2 ** n; i++) {
        const sign = ["*", "+"];
        let result = [];
        let binary = i.toString(2).padStart(n, '0');
        for (let j = 0; j < n; j++) {
            result.push(binary[j] === '0' ? sign[0] : sign[1]);
        }
        signArray.push(result);
    }
    return signArray;
}

function evaluateLeftToRight(expression) {
    const tokens = expression.split(/(\+|\*)/);
    let result = parseInt(tokens[0], 10);

    for (let i = 1; i < tokens.length; i += 2) {
        const operator = tokens[i];
        const value = parseInt(tokens[i + 1], 10);
        if (operator === '+') {
            result += value;
        } else if (operator === '*') {
            result *= value;
        }
    }

    return result;
}
