const readline = require("readline");

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

rl.question("Enter a number: ", (n) => {
    n = parseInt(n);
    let id = 1;
    let fact = 1;

    while (id <= n) {
        process.stdout.write(`${fact} `);
        id += 2;
        fact *= id * (id - 1) * -1;
    }

    rl.close();
});