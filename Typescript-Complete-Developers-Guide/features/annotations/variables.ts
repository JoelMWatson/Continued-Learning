let apples: number = 5;
// apples = 'hi';

let speed: string = 'fast';
// speed = 1;

let nothing: null = null;
// nothing = 1;

let otherNothing: undefined = undefined;

// built in objects
let now: Date = new Date();

// Arrays
let colors: string[] = ['red', 'green', 'blue'];

let myNumbers: number[] = [1,2,3];

let truths: boolean[] = [true, true, true];

// created classes
class Car {}

let car: Car = new Car();

// Object Literal
let point: {x:number, y:number} = {
  x: 20,
  y: 20
}

// Function
const logNum: (i: number) => void = (i: number) => { 
  console.log(i);
 }