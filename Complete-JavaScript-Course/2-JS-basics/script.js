// Coding challenge 1
//var markM = prompt("What is marks mass?");
//var markH = prompt("What is marks height?");
//var johnM = prompt("What is john mass?");
//var johnH = prompt("What is john height?");
//
//var markBMI = markM / Math.pow(markH,2);
//var johnBMI = johnM / Math.pow(johnH,2);
//
//var chonkyBoi = markBMI > johnBMI;
//
//console.log("Mark's chonk: " + markBMI);
//console.log("John's chonk: " + johnBMI);
//console.log("Mark is the chonky boi: " + chonkyBoi);
//console.log("John is the chonky boi: " + (!chonkyBoi));


/* truthy and falsy values

falsy: null, undefined, 0, "", NaN
truthy: everything else

*/


// Coding Challenge 2
// John 89 120 103
// Mike 116 94 123

//var john = (90 + 90 + 90) / 3;
//var mark = (100 + 100 + 100) / 3;
//var mary = (100 + 100 + 100) / 3;
//
//if (john > mark && john > mary) {
//    console.log("Johns team won this time with an avg of " + john);
//} else if (mark > john && mark > mary) {
//    console.log("Marks team won this time with an avg of " + mark) ;
//} else if (mary > john && mary > mark) {
//    console.log("Marks team won this time with an avg of " + mark) ;
//} else if (john == mark && john == mary) {
//    console.log("There is a three way tie with an avg of " + john);
//} else if (john == mark) {
//    console.log("There is a draw between john and mark with an avg of " + john);
//} else if (john == mary) {
//    console.log("There is a draw between john and mary with an avg of " + john);    
//} else {
//    console.log("There is a draw between mark and mary with an avg of " + mary);    
//}

// Coding Challenge 3
// Tip Calculator

//var bills = [124, 48, 268];
//
//function tipCalculator(bill) {
//    var tip;
//    if (bill < 50) {
//        tip = bill * .2;
//    } else if (bill < 200) {
//        tip = bill * .15;
//    } else {
//        tip = bill * .1;
//    }
//    return tip;
//}
//
//console.log("Tip for " + bills[0] + " " + tipCalculator(bills[0]));
//console.log("Tip for " + bills[1] + " " + tipCalculator(bills[1]));
//console.log("Tip for " + bills[2] + " " + tipCalculator(bills[2]));

//// Coding challenge 4
//var mark = {
//    mass: 84,
//    height: 1.6,
//    BMI: function() {
//        this.bmi =  this.mass / (this.height * this.height);
//    }
//}
//
//var john = {
//    mass: 84,
//    height: 1.4,
//    BMI: function() {
//        this.bmi = this.mass / (this.height * this.height);
//    }
//}
//
//
//if (mark.bmi > john.bmi) {
//    console.log("Mark is the chonky boi with a BMI of " + mark.bmi);
//} else if (john.BMI > mark.BMI) {
//    console.log("John is the chonky boi with a BMI of " + john.bmi);
//} else {
//    console.log("Draw");
//}


// Coding Challenge 3
// Tip Calculator
function tipCalculator(bill) {
    var tip;
    if (bill < 50) {
        tip = bill * .2;
    } else if (bill < 200) {
        tip = bill * .15;
    } else {
        tip = bill * .1;
    }
    return tip;
}


var reciepts = {
    bills: [124, 48, 268, 180, 42],
    calcTips: function() {
        var tips = [];
        for(var i=0; i < this.bills.length; i++) {
            tips[i] = tipCalculator(this.bills[i])
        }
        this.tips = tips;
        return tips;
    },
    calcTotals: function() {
        var totals = [];
        for(var i=0; i < this.bills.length; i++) {
            totals[i] = this.tips[i] + this.bills[i]
        }
        this.totals = totals;
        return totals;
    }
}

reciepts.calcTips();
reciepts.calcTotals();
console.log(receipts);