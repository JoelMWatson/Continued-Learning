/*
GAME RULES:

- The game has 2 players, playing in rounds
- In each turn, a player rolls a dice as many times as he whishes. Each result get added to his ROUND score
- BUT, if the player rolls a 1, all his ROUND score gets lost. After that, it's the next player's turn
- The player can choose to 'Hold', which means that his ROUND score gets added to his GLBAL score. After that, it's the next player's turn
- The first player to reach 100 points on GLOBAL score wins the game
*/

// Global variables
var scores, roundscore, activePlayer, running, lastRoll, maxScore;

document.querySelector(".btn-new").addEventListener('click', init);


function init() {
    
    scores = [0,0];
    roundscore = 0;
    activePlayer = 0;
    running = true;
    lastRoll = 0;
    
    
    maxScore = Number(document.getElementById("max-score").value);
    
    
    // show buttons
    document.querySelector(".wrapper").classList.add("running");
    
    // set values for start of game
    document.querySelector("#name-0").textContent = "Player 1";
    document.querySelector("#name-1").textContent = "Player 2";
    document.querySelector(".player-0-panel").classList.add("active");
    document.querySelector(".player-1-panel").classList.remove("active");
    document.querySelector(".player-0-panel").classList.remove("winner");
    document.querySelector(".player-1-panel").classList.remove("winner");
    document.getElementById("score-0").textContent = "0";
    document.getElementById("score-1").textContent = "0";
    document.getElementById("current-0").textContent = "0";
    document.getElementById("current-1").textContent = "0";
    
    // Rolls Die for first roll
    rollDice();
    
    // Sets listeners
    document.querySelector(".btn-roll").addEventListener('click', rollDice);
    document.querySelector(".btn-hold").addEventListener('click', holdPoints);
}

function rollDice() {
    if (running) {
        // random number generated between 1-6
        var dice1 = Math.floor(Math.random() * 6) + 1;
        var dice2 = Math.floor(Math.random() * 6) + 1;

        // update the dice picture
        document.querySelector(".dice1").setAttribute("src", "dice-" + dice1 + ".png");
        document.querySelector(".dice2").setAttribute("src", "dice-" + dice2 + ".png");
        if (document.querySelector(".dice1").style.display === "none") {
            document.querySelector(".dice1").style.display = "block";
            document.querySelector(".dice2").style.display = "block";
        }

        if (dice1 > 1 && dice2) {
            if ((dice1 + dice2) === 6 && lastRoll === 6 || dice1 === 6 && dice2 ===6) {
                scores[activePlayer] = 0;
                switchPlayers();
            }
            lastRoll = dice1 + dice2;
            roundscore += dice1 + dice2;
            document.getElementById("current-" + activePlayer).textContent = roundscore; 
        } else {
            document.querySelector(".dice1").style.display = "none";
            document.querySelector(".dice2").style.display = "none";
            switchPlayers();
        }
    }    
}

function switchPlayers() {
    if (running) {
        lastRoll = 0;
        roundscore = 0;
        document.getElementById("current-" + activePlayer).textContent = 0;
        document.getElementById("score-" + activePlayer).textContent = scores[activePlayer];
        document.querySelector(".player-" + activePlayer + "-panel").classList.remove("active");
        if (activePlayer == 1) {
            activePlayer = 0;
        } else {
            activePlayer = 1;
        }
        document.querySelector(".player-" + activePlayer + "-panel").               classList.add("active");
    }
}

function holdPoints() {
    if (running) {
        scores[activePlayer] += roundscore;
        if (scores[activePlayer] >= maxScore) {
            document.getElementById("score-" + activePlayer).textContent = scores[activePlayer];
            document.querySelector(".player-" + activePlayer + "-panel").classList.add("winner");
            running = false;
            document.querySelector("#name-" + activePlayer).textContent = "Winner";
            document.querySelector(".dice1").style.display = "none";
            document.querySelector(".dice2").style.display = "none";
            document.querySelector(".wrapper").classList.remove("running");
        } else {
            switchPlayers();
        }
    }
}