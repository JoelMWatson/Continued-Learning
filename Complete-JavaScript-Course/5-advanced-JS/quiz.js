// My solution
// Question constructor
//var Question = function(question, options, answer) {
//    this.question = question;
//    this.options = options;
//    this.answer = answer;
//    this.ask = function() {
//        console.log(this.question);
//        for (var i=0; i < this.options.length; i++) {
//            console.log(i + ": " + this.options[i]);
//        }
//        var response = prompt("Please enter your answer.")
//        return response == this.answer;
//    }
//}
//
//function game() {
//    // Creating the questions content
//    var q1 = "Is JavaScript the greatest programming language?";
//    var o1 = ["Yes", "No", "Depends on the task"];
//    var a1 = 2; 
//
//    var q2 = "Who is the instructor for THIS course?";
//    var o2 = ["Jonas Schmedtman", "Tim Buchalka", "Randy Savage"];
//    var a2 = 0;
//
//    var q3 = "Do I need more coffee?";
//    var o3 = ["Yes, obviously", "No, you're an addict"];
//    var a3 = 1;
//
//    // creating array of questions
//    var questions = [
//        new Question(q1, o1, a1),
//        new Question(q2, o2, a2),
//        new Question(q3, o3, a3)
//    ];
//    
//    //set score and wrong
//    var score = 0
//    var wrong = false;
//    
//    // While you are getting correct aswers keep playing
//    while(!wrong) {
//        // random number 0 - 2;
//        var rand = Math.floor(Math.random() * questions.length);
//        var response = questions[rand].ask();
//        if (response) {
//            console.log("Correct, keep playing!");
//            score++;
//        } else {
//            console.log("Incorrect, game over! Score correct: " + score);
//            wrong = true;
//        }
//    }
//}
//
//document.querySelector(".btn").addEventListener("click", game);

//jonas solution 

//Question constructor
(function() {
    function Question(question, answers, correct) {
        this.question = question;
        this.answers = answers;
        this.correct = correct;
    }
    
    Question.prototype.displayQuestion = function() {
        console.log(this.question);
    }
    
    Question.prototype.displayAnswers = function() {
        for (var i=0; i < this.answers.length; i++) {
            console.log(i + ": " + this.answers[i]);
        }
    }
    
    Question.prototype.checkCorrect = function(ans, callback) {
        if (ans === this.correct) {
            console.log("Correct answer!");
            sc = callback(true);
        } else { 
            console.log("Wrong answer. Try again!");
            sc = callback(false);
        }
        this.displayScore(sc);
    }
    
    Question.prototype.displayScore = function(score) {
        console.log("Current score: " + score);
        console.log("------------------------");
    }
    
    
    function nextQuestion() {        
        // random number 0 - 2;
        var rand = Math.floor(Math.random() * questions.length);

        questions[rand].displayQuestion();
        questions[rand].displayAnswers();

        var answer = prompt("Please enter the correct answer");
        
        if (answer !== null) {
            questions[rand].checkCorrect(parseInt(answer), keepScore);
            nextQuestion(questions);
        } else {
            console.log("Final score: " + keepScore() + ". Good bye!");
        }
    }
    // Note: use of closures
    function score() {
        var sc = 0;
        return function(correct) {
            if (correct) {
                sc++;
            } 
            return sc;
        }            
    }
    var keepScore = score();

    
    var q1 = "Is JavaScript the greatest programming language?";
    var a1 = ["Yes", "No", "Depends on the task"];
    var c1 = 2; 

    var q2 = "Who is the instructor for THIS course?";
    var a2 = ["Jonas Schmedtman", "Tim Buchalka", "Randy Savage"];
    var c2 = 0;

    var q3 = "Do I need more coffee?";
    var a3 = ["Yes, obviously", "No, you're an addict"];
    var c3 = 1;

    // creating array of questions
    var questions = [
        new Question(q1, a1, c1),
        new Question(q2, a2, c2),
        new Question(q3, a3, c3)
    ];


    document.querySelector(".btn").addEventListener("click", nextQuestion);
})();


