// --------------------------------------------------PART-1-------------------------------
// const fs = require('fs');
// const path = require('path');


// const filePath = path.join(__dirname, '../input.txt');
// fs.readFile(filePath, 'utf8', (err, data) => {
//     if (err) {
//         console.error('Error reading the file:', err);
//         return;
//     }
//     const regex = /mul\(\d{1,3},\d{1,3}\)/g; //part - 1

//     const matches = data.match(regex);

//     console.log(matches);

//     const mulAns = findMul(matches)
//     console.log(mulAns)
// })

// function findMul(matches) {
//     let mul = 0;
//     matches.forEach((element) => {
//         const first = element.substring(4);
//         const a = Number(first.substring(0, first.length - 1).split(",")[0]);
//         const b = Number(first.substring(0, first.length - 1).split(",")[1]);
//         mul = mul + a * b;
//     }
//     );
//     return mul;
// }


// ---------------------------------------PART-2--------------------------------------------------------

const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, '../input.txt');
fs.readFile(filePath, 'utf8', (err, data) => {
    if (err) {
        console.error('Error reading the file:', err);
        return;
    }

    const regex = /mul\(\d{1,3},\d{1,3}\)|do\(\)|don't\(\)/g;
    const matches = data.match(regex);

    console.log(matches);

    const mulAns = findMul(matches);
    console.log(mulAns);
});

function findMul(matches) {
    let mul = 0;
    let isEnabled = true;

    matches.forEach((element) => {
        if (element === "do()") {
            isEnabled = true;
        } else if (element === "don't()") {
            isEnabled = false;
        } else if (isEnabled && element.startsWith("mul")) {
            const first = element.substring(4);
            const a = Number(first.substring(0, first.length - 1).split(",")[0]);
            const b = Number(first.substring(0, first.length - 1).split(",")[1]);
            mul += a * b;
        }
    });

    return mul;
}