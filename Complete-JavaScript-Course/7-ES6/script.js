//// ES5 Variables
//var name5 = "Jane Smith";
//var age5 =  23;
//name5 = "Jane Miller";
//console.log(name5);
//
//
//// ES6 Variables
//// Constant
//const name6 = "Jane Smith";
//// Non Constant
//let age6 = 23;
//
//// fails because it is a constant
//// name6 = "Jane Miller"; 
////console.log(name6);
//
////_____________________________________________________________________________________________________
//
//// ES5 Functions (Function Scoped)
//function driversLicense5(passedTest) {
//    if (passedTest) {
//        var firstName = "John";
//        var yearOfBirth = 1990;                
//    }
//    
//    console.log(firstName + " born in " + yearOfBirth + " is now officially allowed to drive a car.");
//}
//driversLicense5(true);
//
//// ES6 Functions (Block Scoped) OMG For Loop Savior!!!
//function driversLicense6(passedTest) {
////    let firstName; // declaring here makes available to whole function 
////    const yearOfBirth; // declairing here makes available to function but not inside if-block;
//    
//    if (passedTest) {
////        firstName = "John"; // works with let
////        yearOfBirth = 1990; // Doesnt work with const
//        let firstName = "John";
//        const yearOfBirth = 1990;
//
//    }
//    // fails because firstName and yearOfBirth were created inside if-block
//    //console.log(firstName + " born in " + yearOfBirth + " is now officially allowed to drive a car."); 
//}
//driversLicense6(true);
//
////_______________________________________________________________________________________________________
//
//// ES6 Blocks
//
//// ES5 IIFE (For Data Privacy)
//(function() {
//    var a = 1;
//    var b = 2;
//})();
//
//// ES6 blocks (For Data Privacy)
//{
//    const a = 1;
//    let b = 2;
//}
//
////_______________________________________________________________________________________________________
//
//// ES6 Strings
//
//let firstName = "John";
//let lastName = "Smith";
//const yearOfBirth = 1990;
//function calcAge(year) {
//    return 2020 - year;
//}
//
//// ES5 
//console.log("This is " + firstName + " " + lastName + ". He was born in " + yearOfBirth + ". Today, he is " + calcAge(yearOfBirth) + " years old.")
//
//// ES6 Template Literal
//console.log(`This is ${firstName} ${lastName}. He was born in ${yearOfBirth}. Today, he is ${calcAge(yearOfBirth)} years old.`);
//
//const n = `${firstName} ${lastName}`;
//// new ES6 functions
//console.log(n.startsWith("J")); // 'J' ohn Smith
//console.log(n.endsWith("h")); // John Smit 'h'
//console.log(n.includes("n S"))// Joh 'n S' mith
//
////_______________________________________________________________________________________________________
//
//// ES6 Arrow Functions
//
//const years = [1990, 1965, 1982, 1937];
//
////ES 5 
//var ages5 = years.map(function(current, index, array) {
//    return 2020 - current; 
//});
//console.log(ages5);
//
//// ES6
//// single argument
//let ages6 = years.map(current => 2020 - current);
//console.log(ages6);
//
//// multi argument single line
//ages6 = years.map((current, index) => `Age element ${index + 1}: ${2020 - current}.`);
//console.log(ages6);
//
//// multi argument multi line
//ages6 = years.map((current, index) => {
//    const now = new Date().getFullYear;
//    const age = now - current;
//    return `Age element ${index + 1}: ${age}.`;
//});
//
//
//// ES6 Lexical "this" Variable
//
//// ES5
//var box5 = {
//    color: 'green',
//    position: 1,
//    clickMe: function() {
//        var self = this; // This workaround allows the function access to the this variable
//        document.querySelector('.green').addEventListener('click', function() {
//            var str = "This is box number " + self.position + " and it is " + self.color;
//            alert(str);
//        })
//    }
//}
//box5.clickMe();
//
//// ES6
//const box6 = {
//    color: 'green',
//    position: 1,
//    clickMe: function() {
//        document.querySelector('.green').addEventListener('click', () => {
//            var str = "This is box number " + this.position + " and it is " + this.color;
//            alert(str);
//        })
//    }
//}
//box6.clickMe();
//
//
//function Person(name) {
//    this.name = name;
//}
//const friends = ["joel", "tyler", "danielle"];
//
//
//// ES5
//Person.prototype.myFriends5 = function(friends) {
//    var arr = friends.map(function(current) {
//        return this.name + " is friends with " + current;
//    }.bind(this));
//    console.log(arr);
//}
//new Person("John").myFriends5(friends);
//
//// ES6
//Person.prototype.myFriends6 = function(friends) {
//    var arr = friends.map(current => `${this.name} is friends with ${current}`);
//    console.log(arr);
//}
//new Person("Mike").myFriends6(friends);
//
//
////_______________________________________________________________________________________________________
//
//// ES6 Destructuring
//
//// ES5
////var john = ["John", 26];
////var name = john[0];
////var age = john[1];
//
//
//// ES6
//let [name, year] = ["John", 26];
//
//const obj = {
//    firstName2: "John",
//    lastName2: "Smith"
//};
//
//const {firstName2, lastName2} = obj;
//console.log(firstName2);
//console.log(lastName2);
//
//// gives an alias
//const {firstName: a, lastName: b} = obj;
//console.log(a);
//console.log(b);
//
//
//
//function calcAgeRetirement(year) {
//    const age = new Date().getFullYear() - year;
//    return [age, 65 - age];
//}
//
//
//const [age2, retirement] = calcAgeRetirement(1992);
//console.log(age2);
//console.log(retirement);
//
//
////_______________________________________________________________________________________________________
//
//// ES6 Array Looping
//
//const boxes = document.querySelectorAll(".box");
//
//// ES5
//var boxesArray5 = Array.prototype.slice.call(boxes);
//boxesArray5.forEach(function(current) {
//    current.style.backgroundColor = "dodgerblue";
//});
//
//// ES6
//const boxesArray6 = Array.from(boxes);
//boxesArray6.forEach(current => current.style.backgroundColor = "dodgerblue");
//
//// ES6 breaking and skipping loops
//
//// ES5 // only in for loop
//for(var i = 0; i < boxesArray5.length; i++) {
//    if (boxesArray5[i].className.includes("blue")) {
//        continue;
//    }
//    
//    boxesArray5[i].textContent = "I am now blue";
//}
//
//// ES6 for-of // Allows ability to break and continue without a whole for loop
//for (const current of boxesArray6) {
//    if (current.className === "box blue") {
//        continue;
//    }
//    current.textContent = "I am now blue";
//}
//
//
//var ages = [20, 15, 12, 34, 41, 3, 30, 17];
//
//var full = ages.map(function(current) {
//    return current >= 18;
//});
//console.log(ages[full.indexOf(true)]);
//
//
//// ES6
//console.log(ages.find(current => current >= 18));
//
//
////_______________________________________________________________________________________________________
//
////ES6 Spread Operator
//
//function addFourAges(a, b, c, d) {
//    return a + b + c + d;
//}
//
//var sum1 = addFourAges(18, 20, 21, 15);
//console.log(sum1);
//
//// ES5
//var ages3 = [18, 20, 21, 15];
//var sum2 = addFourAges.apply(null, ages3);
//console.log(sum2);
//
//
//
//// ES6
//const sum3 = addFourAges(...ages3); 
//console.log(sum3);
//
//const familyWatson = ["Joel", "Jana", "Tracie"];
//const familyCostin = ["Bob", "Marcy", "Meghan", "Nick"];
//
//const familyBig = [...familyWatson, ...familyCostin];
//console.log(familyBig);
//
//const h = document.querySelector("h1");
////const boxes = document.querySelectorAll(".box"); already defined
//const all = [h, ...boxes];
//
//Array.from(all).forEach(current => current.style.color = "purple"); 
//
//
////ES6 Rest Parameters (opposite to the spread operator)
//
//// ES5
//function isFullAge5() {    
//    // get arguments as an array
//    argsArray = Array.prototype.slice.call(arguments);
//    
//    argsArray.forEach(function(current) {
//        console.log(2020 - current >= 18);
//    });
//}
//isFullAge5(1992,1990,2001, 2010);
//
//// ES6
//function isFullAge6(...years) {    // takes the args and puts into an array for you
//    years.forEach(function(current) {
//        console.log(2020 - current >= 18);
//    });
//}
//isFullAge5(1992,1990,2001, 2010);
//
//// with Arguments
//
//// ES5
//function isFullAge5(limit) {    
//    // get arguments as an array
//    argsArray = Array.prototype.slice.call(arguments, 1); // skip arg[0]
//    
//    argsArray.forEach(function(current) {
//        console.log(2020 - current >= limit);
//    });
//}
//isFullAge5(18, 1992,1990,2001, 2010);
//
//// ES6
//function isFullAge6(limit, ...years) {    // takes the multiple args and puts into an array for you
//    years.forEach(function(current) {
//        console.log(2020 - current >= limit);
//    });
//}
//isFullAge6(18, 1992, 1990, 2001, 2010);
//
//
//
////_______________________________________________________________________________________________________
//
//// ES6 default parameters
//
//// ES5
//function SmithPerson(first, yob, last, nat) {
//    
//    // defaults
//    last === undefined ? last = "Smith" : last = last;
//    nat === undefined ? nat = "American" : nat = nat;
//    
//    this.first = first;
//    this.last = last;
//    this.yob = yob;
//    this.nat = nat;
//}
////var john = new SmithPerson("John", 1990); // uses defaults
////var emily = new SmithPerson("Emily", 1983, "Diaz", "spanish"); // Overrides defautls;
//
//// ES 6
//function SmithPerson(first, yob, last = "Smith", nat = "American") {
//this.first = first;
//    this.last = last;
//    this.yob = yob;
//    this.nat = nat;
//}
//var john = new SmithPerson("John", 1990); // uses defaults
//var emily = new SmithPerson("Emily", 1983, "Diaz", "spanish"); // Overrides defautls;
//
//
////_______________________________________________________________________________________________________
//
//
//// ES6 Maps
//
//const questions = new Map();
//
//questions.set("quesiton", "What is the official name of the latest major JavaScript version?");
//
//questions.set(1, "ES5");
//questions.set(2, "ES6");
//questions.set(3, "ES2015");
//questions.set(4, "ES7");
//questions.set("correct", 3);
//questions.set(true, "Correct answer");
//questions.set(false, "Incorrect answer");
//
//console.log(questions.get("question"));
//console.log(questions.size);
//
//
//if (questions.has(4)) {
//    //questions.delete(4); // removes "ES7"
//    console.log("I still got it");
//}
//
////questions.clear(); // empties map
//
//// Maps are iterable
//questions.forEach((value, key) => console.log(`This is ${key}, and its set to ${value}`));
//
//for (let [key, value] of questions.entries()) { // uses destructuring
//    if (typeof(key) === "number") {
//        console.log(`${key}: ${value}`);
//    }
//}
//const ans = parseInt(prompt("Enter the correct answer"));
//
//console.log(questions.get(ans === questions.get("correct")));
//
//
//
////_______________________________________________________________________________________________________
//
//
//// ES6 Classes 
//
//
//// ES5
//var Person5 = function(name, yob, job) {
//    this.name = name; 
//    this.yob =  yob;
//    this.job = job;
//}
//
//Person5.prototype.calcAge = function() {
//    var age = new Date().getFullYear - this.yob;
//    console.log(age);
//}
//// ES5 Subclasses
//var Athelete5 = function(name, yob, job, olyGames, medals) {
//    Person5.call(this, name, yob, job);
//    this.olyGames = olyGames;
//    this.medals = medals;
//}
//Athelete5.prototype = Object.create(Person5.prototype); // gives access to calcAge
//Athelete5.prototype.wonMedal = function() {
//    this.medals++;
//    console.log(this.medals);
//}
//
//// ES6
//class Person6 {
//    
//    constructor(name, yob, job) {
//        this.name = name;
//        this.yob = yob;
//        this.job = job;
//    }
//    
//    calcAge() {
//        let age = new Date().getFullYear - this.yob;
//        console.log(age);
//    }
//    
//    static greeting() {
//        console.log("Hey there!")
//    }
//    
//}
//// ES6 Subclasses
//class Athelete6 extends Person6 {
//    
//    constructor(name, yob, job, olyGames, medals) {
//        super(name, yob, job);
//        this.olyGames = olyGames;
//        this.medals = medals;
//    }
//    
//    wonMedal() {
//        this.medals++;
//        console.log(this.medals)
//    }
//}
//
//
//
