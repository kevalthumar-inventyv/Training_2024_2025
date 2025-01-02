const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});

readline.question('Enter the first number: ', (num1) => {
    readline.question('Enter the second number: ', (num2) => {
        console.log(`The maximum of ${num1} and ${num2} is: ${Math.max(parseInt(num1), parseInt(num2))}`);
        readline.close();
    });
});