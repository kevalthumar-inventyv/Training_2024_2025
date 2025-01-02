const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Enter a number: ', (input) => {
    let n = parseInt(input);
    let x = 1;

    while (n >= 1) {
        x = x * n;
        n--;
    }

    console.log(x);
    rl.close();
});