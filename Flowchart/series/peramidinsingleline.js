const readline = require("readline");

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

rl.question("Enter the value of n: ", (input) => {
    const n = parseInt(input);
    for (let i = 1; i <= n; i++) {
        for (let j = 1; j <= i; j++) {
            process.stdout.write(`${j} `);
        }
        for (let j = i - 1; j >= 1; j--) {
            process.stdout.write(`${j} `);
        }
    }
    rl.close();
});
