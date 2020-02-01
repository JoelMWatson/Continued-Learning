// Prototypes
var james = { 
    name: "James",
    yearOfBirth: 1990,
    job: "teacher"
};

var Person = function(name, yearOfBirth, job) {
    this.name = name;
    this.yearOfbirth = yearOfBirth;
    this.job = job;    
}

Person.prototype.calcAge = function() {
    console.log(2020 - this.yearOfbirth);
}

Person.prototype.lastName = "smith"


var john = new Person("John", 1990, "teacher");
var mark = new Person("Mark", 1948, "retired");

john.calcAge();
mark.calcAge();

console.log(john.lastName);
console.log(mark.lastName);

mark.lastName = "watson"; // adds a property lastname that overrides the lastname property in proptype

console.log(john.lastName);
console.log(mark.lastName);


// Object.create
var personProto = {
    calcAge: function() {
        console.log(2020 - this.yearOfBirth);
    }
}

var jeff = Object.create(personProto);
jeff.name = "Jeff";
jeff.yearOfBirth = 1995;
jeff.job = "teacher";

var jane = Object.create(personProto, 
{
    name: { value: "Jane" },
    yearOfBirth: { value: 1960 },
    job: { value: "Engineer" }
});

// Gamme to show an IIFE (Immediately Invoed Function Exression)

(function() {
    var score = Math.random() * 10;
    console.log("Random " + score);
})();

// closure

function retirement(retirementAge) {
    var a = " years left until retiremnet.";
    return function(yearOfBirth) {
        var age = 2020 - yearOfBirth;
        console.log((retirementAge - age) + a);
    }
}

var retirementUS = retirement(66);
retirementUS(1990);

// Bind call and apply

var john = {
    name: "john",
    age: 26,
    job: "teacher",
    presentation: function(style, timeOfDay) {
        if (style === "formal") {
            console.log("Good " + timeOfDay + "! I'm " + 
                        this.name + ", I'm a " + 
                        this.job + " and I'm " +
                        this.age + " years old");
        } else if (style === "friendly") {
            console.log("Whats up? I'm " + 
                        this.name + ", I'm a " + 
                        this.job + " and I'm " +
                        this.age + " years old. Have a nice " + timeOfDay + ".");
        }
    }
}
john.presentation("formal", "morning")
john.presentation("friendly", "afternoon")

var emily = {
    name: "Emily",
    age: 29,
    job: "torcher"
}

// Method borrowing using call 
john.presentation.call(emily, "formal", "morning");

// Method borrowing using apply
john.presentation.apply(emily, ["friendly", "afternoon"]);

// creating function using bind called currying
var johnFriendly = john.presentation.bind(emily, 'friendly')

// always for emily and always friendly...omg this is useful
johnFriendly("evening")
