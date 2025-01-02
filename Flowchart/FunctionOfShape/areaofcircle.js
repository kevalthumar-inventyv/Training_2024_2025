const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Enter the radius of the circle: ', (radius) => {
    const area = Math.PI * radius * radius;
    console.log(`The area of the circle is: ${area}`);
    rl.close();
});