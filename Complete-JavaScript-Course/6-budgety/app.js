//// Module Pattern
//var module = (function() {
//    
//    var x = 23;
//    
//    var add = function(a) {
//        return a + x;
//    }
//    
//    
//    // returns all public methods
//    return {
//        publicTest: function(b) {
//            return add(b);
//        }
//    }
//    
//})();

// Budget Model
var budgetController = (function() {
    
    var Expense = function(id, description, value) {
        this.id = id;
        this.description = description;
        this.value = value;
        this.percentage = -1;
    };
    
    Expense.prototype.calcPercentage = function(totalIncome) {
        if (totalIncome > 0) {
            this.percentage = Math.round((this.value / totalIncome) * 100);
        } else {
            this.percentage = -1;
        }
    };
    
    Expense.prototype.getPercentage = function() {
        return this.percentage;
    }
    
    var Income = function(id, description, value) {
        this.id = id;
        this.description = description;
        this.value = value;
    };
    
    var calcTotal = function(type) {
        var sum = 0;
        
        data.allItems[type].forEach(function(current, index, array) {
            sum += current.value;
        });
        data.totals[type] = sum;
    };
    
    var data = {
        allItems: {
            exp: [],
            inc: [],
        },            
        totals: {
            exp: 0,
            inc: 0,
        },
        budget: 0,
        percentage: -1,
    };
    
    
    
    return {
        addItem: function(type, des, val) {
            var newItem, ID;
            
            // Last ID + 1
            
            // Create ID
            if (data.allItems[type].length > 0) {
                ID = data.allItems[type][data.allItems[type].length - 1].id + 1;
            } else {
                ID = 1;
            }
            // Create Item of exp or inc type
            if (type === "exp") {
                newItem = new Expense(ID, des, val);
            } else if (type === "inc") {
                newItem = new Income(ID, des, val);
            }
            
            // push it into the data structure
            data.allItems[type].push(newItem);
            
            // return the new item
            return newItem;   
        },
        
        deleteItem: function(type, ID) {
            var IDs, index;
            IDs = data.allItems[type].map(function(current, index, array) {
                return current.id;
            });
            index = IDs.indexOf(ID);
            
            if (index !== -1) {
                data.allItems[type].splice(index, 1);
            }
        },
        
        calculateBudget: function() {
            
            // calc total inc and exp
            calcTotal("exp");
            calcTotal("inc");

            // calc budget: inc - exp
            data.budget = data.totals.inc - data.totals.exp;
            
            // calc percent inc spent
            if (data.totals.inc > 0) {
                data.percentage = Math.round((data.totals.exp / data.totals.inc) * 100);
            } else {
                data.percentage = -1;
            }
            
        },
        
        calculatePercentages: function() {
            data.allItems["exp"].forEach(function(current, index, array) {
                current.calcPercentage(data.totals.inc);
            });
        },
        
        getBudget: function() {
            return {
                budget: data.budget,
                totalInc: data.totals.inc,
                totalExp: data.totals.exp,
                percentage: data.percentage
            }
        },
        
        getPercentages: function() {
            var allPercent = data.allItems["exp"].map(function(current, index, array) {
                return current.getPercentage();
            });
            return allPercent;
        },
        
        testing: function() {
            console.log(data);
        }
        
    };
    
})();

// View
var UIController = (function() {
    
    var DOMstrings = {
        inputType: ".add__type",
        inputDescription: ".add__description",
        inputValue: ".add__value",
        inputBtn: ".add__btn",
        incList: ".income__list",
        expList: ".expenses__list",
        budgetLabel: ".budget__value",
        incomeLabel: ".budget__income--value",
        expensesLabel: ".budget__expenses--value",
        percentageLabel: ".budget__expenses--percentage",
        container: ".container",
        itemPercent: ".item__percentage",
        dateLabel: ".budget__title--month",
        
    }
    
    var formatNumber =  function(num, type) {
        var sign, splitNum, int, dec;

        num = Math.abs(num);
        num = num.toFixed(2);

        splitNum = num.split(".");

        int = splitNum[0];
        dec = splitNum[1];            

        if (int.length > 3) {
            int = int.substr(0, int.length - 3) + "," + int.substr(int.length - 3, 3);
        }

        return (type === "inc" ? "+" : "-") + int + "." + dec;
    }
    
    var nodeListForEach = function(list, callback) {
        for (var i=0; i < list.length; i++) {
            callback(list[i], i);
        }
    };
    
    return {
        getInput: function() {
            return {
                type: document.querySelector(DOMstrings.inputType).value,
                description: document.querySelector(DOMstrings.inputDescription).value,
                value: parseFloat(document.querySelector(DOMstrings.inputValue).value),
            }            
        },
        
        addListItem: function(obj, type) {
            
            var html, element, newHtml;
            
            // Create HTML string
            if (type === "inc") {
                
                 element = DOMstrings.incList;
                 html = '<div class="item clearfix" id="inc-%id%"><div class="item__description">%description%</div><div class="right clearfix"><div class="item__value">%value%</div><div class="item__delete"><button class="item__delete--btn"><i class="ion-ios-close-outline"></i></button></div></div></div>';
            } else if (type === "exp") {
                 element = DOMstrings.expList;
                 html = '<div class="item clearfix" id="exp-%id%"><div class="item__description">%description%</div><div class="right clearfix"><div class="item__value">%value%</div><div class="item__percentage">%percentage%%</div><div class="item__delete"><button class="item__delete--btn"><i class="ion-ios-close-outline"></i></button></div></div></div>';    
            }
            
            
            // Replace the place holder text with some actual data
            newHtml = html.replace("%id%", obj.id);
            newHtml = newHtml.replace("%description%", obj.description);
            newHtml = newHtml.replace("%value%", formatNumber(obj.value, type));
            
            document.querySelector(element).insertAdjacentHTML('beforeend', newHtml);
            
        },
        
        deleteListItem: function(selectorID) {
            var el = document.getElementById(selectorID);
            el.parentNode.removeChild(el);
        },
        
        getDOMstrings: function () {
            return DOMstrings;
        },
        
        clearFields: function() {
            var fields, fieldsArray;
            
            fields = document.querySelectorAll(DOMstrings.inputDescription + ", " + DOMstrings.inputValue);
            
            fieldsArray = Array.prototype.slice.call(fields);
            
            fieldsArray.forEach(function(current, index, array) {
                current.value = "";
            });
            
            fieldsArray[0].focus();
        },
        
        displayBudget: function(obj) {
            var type;
            
            obj.budget > 0 ? type = "inc" : "exp";
            
            document.querySelector(DOMstrings.budgetLabel).textContent = formatNumber(obj.budget, type);
            document.querySelector(DOMstrings.incomeLabel).textContent = formatNumber(obj.totalInc, "inc");
            document.querySelector(DOMstrings.expensesLabel).textContent = formatNumber(obj.totalExp, "exp");
            if (obj.percentage > 0) {
                document.querySelector(DOMstrings.percentageLabel).textContent = obj.percentage + "%";
            } else {
                document.querySelector(DOMstrings.percentageLabel).textContent = "---";
            }    
        },
        
        displayPercentages: function(percents) {
            
            var fields = document.querySelectorAll(DOMstrings.itemPercent);
            
            nodeListForEach(fields, function(current, index) {
                
                if (percents[index] > 0) {
                    current.textContent = percents[index] + "%";
                } else {
                    current.textContent = "---";
                }
            });
            
        },
        
        displayMonth: function() {
            var now, year, month, months;
            
            now = new Date();
            
            year = now.getFullYear();
            months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
            month = now.getMonth();
            
            document.querySelector(DOMstrings.dateLabel).textContent = months[month] + " " + year;
        },
        
        changedType: function() {
            var fields = document.querySelectorAll(
                DOMstrings.inputType + ", " + 
                DOMstrings.inputDescription + ", " +
                DOMstrings.inputValue
            )
            
            nodeListForEach(fields, function(current) {
                current.classList.toggle('red-focus');
            });
            
            document.querySelector(DOMstrings.inputBtn).classList.toggle('red');
        }
        
    };
    
})();

// Controller
var appController = (function(budgetCtrl, UICtrl) {
    
    var setupEventListeners = function() {
        
        // get the DOM selectors
        var DOM = UICtrl.getDOMstrings();
        
        // button clicked
        document.querySelector(DOM.inputBtn).addEventListener("click", ctrlAddItem);

        // enter key
        document.addEventListener("keypress", function(event) {
            if (event.keyCode === 13 || event.which === 13) {
                ctrlAddItem();
            }
        });
        
        document.querySelector(DOM.container).addEventListener("click", ctrlDeleteItem);
        
        document.querySelector(DOM.inputType).addEventListener("change", UICtrl.changedType);

    }
    
    var updateBudget = function() {
        
        // calculate the budget
        budgetCtrl.calculateBudget();
        
        // return the budget
        var budget = budgetCtrl.getBudget();
        
        // display the budget in ui
        UICtrl.displayBudget(budget);
    }
    
    var updatePercentages = function() {
        
        // calculate the percentage
        budgetCtrl.calculatePercentages();
        
        // read percentage
        var percentages = budgetCtrl.getPercentages();
        
        // display percentage in UI
        UICtrl.displayPercentages(percentages);
    }
        
    var ctrlAddItem = function() {
        var input, newItem;
        
        // get stored data
        input = UICtrl.getInput();
        
        if (input.description !== "" && !isNaN(input.value) && input.value > 0) {
            // add item to the data controller
            newItem = budgetCtrl.addItem(input.type, input.description, input.value);

            // add item to the ui controller
            UICtrl.addListItem(newItem, input.type);
            UICtrl.clearFields();

            // calculate the budget & display the budget in ui
            updateBudget();
            updatePercentages();
        }
                
    }
    
    var ctrlDeleteItem = function(event) {
        var targetID, splitID, type, ID;
        
        targetID = event.target.parentNode.parentNode.parentNode.parentNode.id;
        if (targetID) {
            
            splitID = targetID.split("-");
            type = splitID[0];
            ID = parseInt(splitID[1]);
            
            // delete the item from the datastructure
            budgetCtrl.deleteItem(type, ID);
            
            // delete the item from the UICtrl
            UICtrl.deleteListItem(targetID);
            
            // update and show the new budget
            updateBudget();
            updatePercentages();
        }
    }
    
    return {
        init: function() {
            console.log('Application has started.');
            UICtrl.displayBudget({ budget: 0, totalInc: 0, totalExp: 0, percentage: -1 })
            setupEventListeners();
            UICtrl.displayMonth();
        }
    }
    
    
})(budgetController, UIController);

appController.init();