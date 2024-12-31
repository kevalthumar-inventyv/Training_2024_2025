
const sum_of_array = (element, arr) => {
    var arr_2 = [element, Symbol("9"), Symbol("1"), Symbol("1"), Symbol("asv"), ...arr]
    let sum = 0;
    for (let i = 0; i < arr_2.length; i++) {
        if (typeof arr_2[i] === "symbol") {
            // check if the description is a number or not
            // if (!Object.is(Number(arr_2[i].description), NaN)) {
            //     sum += Number(arr_2[i].description);
            // }
            if (Number(arr_2[i].description) === Number(arr_2[i].description)) {
                sum += Number(arr_2[i].description);
            }
        }
    }
    console.log(sum)
    new Promise((resolve, reject) => {
        if (sum > 30) {
            resolve("Sum is greater than 30");
        } else {
            reject("Sum is less than 30");
        }
    }).then((value) => {
        console.log(value);
    }).catch((error) => {
        console.log(error);
    });
}
(() => {
    var arr_1 = [Symbol(1), Symbol(2), Symbol("3"), Symbol("4"), Symbol("5"),];
    const element = arr_1.shift();
    sum_of_array(element, arr_1);
})();

