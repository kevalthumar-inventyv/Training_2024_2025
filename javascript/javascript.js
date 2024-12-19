

// console.log(name)
// let name ="Keval";

var k = true;

k == true ? (console.log("keval"), console.log("thumar")) : console.log("inventyv");


console.log(age)
var age = 18;


const car = {
    name: "bmw"
}
console.log(car.name);
car.name = 'volvo';
console.log(car.name);

car.title = "car title";
console.log(car.title);

console.log(Object.keys(car).length);



let x = xe();
var y = ye();
var z = ze();

function xe() {
    return ye() + 1;

}
function ye() {
    return ze() + 5;
}
function ze() {

    return 2;
}

console.log(x, y, z);

/**
 * que :-
 *  let x = y++;
 *  let y = x+5;
 *  let z = 2
 * 
 *  clg(x, y, z) // it should be print [8,7,2]
 */



const objx = {
    x: 0,
}
const objy = {
    y: 0,
}
const objz = {
    z: 0,
}

eval(objx.x = eval(objy.y = 5 + eval(objz.z = 2)) + 1)

console.log(objx.x, objy.y, objz.z)




// Dynamic property variables
const dynamicFName = window.prompt("Enter your dynamicFName");
const dynamicLName = window.prompt("Enter your dynamicLName");;
const dynamicAge = window.prompt("Enter your dynamicAge");;
// Function calling
function personPrintObject(args) {
    console.log(args[dynamicFName] + " " + args[dynamicLName] + " is " + args[dynamicAge] + " Years Old."); // prints John Doe is 40 Years Old.
}
personPrintObject({ [dynamicFName]: "John", [dynamicAge]: 40, [dynamicLName]: "Doe" })