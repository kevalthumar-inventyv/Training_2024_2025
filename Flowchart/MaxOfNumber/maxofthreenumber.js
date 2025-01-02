const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Enter first number: ', (firstNum) => {
    rl.question('Enter second number: ', (secondNum) => {
        rl.question('Enter third number: ', (thirdNum) => {
            const maxNum = Math.max(firstNum, secondNum, thirdNum);
            console.log(`The maximum number between ${firstNum}, ${secondNum}, and ${thirdNum} is: ${maxNum}`);
            rl.close();
        });
    });
});