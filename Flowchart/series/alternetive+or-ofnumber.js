const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Enter a number: ', (input) => {
    let i = 1;
    let mul = 1;
    let n = parseInt(input);
    while (i <= n) {
        console.log(mul*i);
        mul = mul * -1;
        i = i + 1;
    }
    rl.close();
});