
const sum_of_array = (element, arr) => {
    var arr_2 = [element, 6, 7, 8, 9, ...arr]
    console.log(arr_2)
    let sum = 0;
    for (let i = 0; i < arr_2.length; i++) {
        sum += arr_2[i];
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
    var arr_1 = [1, 2, 3, 4, 5];
    const element = arr_1.shift();
    sum_of_array(element, arr_1);
})();

