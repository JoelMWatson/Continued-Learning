public class Main {

    public static void main(String[] args) {
//        int highScore = calculateScore(true, 800, 5, 100);
//        System.out.println("Your final score was " + highScore);
//        highScore = calculateScore(true, 10000, 8, 200);
//        System.out.println("Your final score was " + highScore);

        displayHighScorePosition("Trevor", calculateHighScorePosition(1500));
        displayHighScorePosition("Tanya", calculateHighScorePosition(900));
        displayHighScorePosition("Tanner", calculateHighScorePosition(400));
        displayHighScorePosition("Tracie", calculateHighScorePosition(50));
    }

    public static int calculateScore(boolean gameOver, int score, int levelCompleted, int bonus) {
        int finalScore;
        if (gameOver) {
            finalScore = score + (levelCompleted * bonus);
            finalScore += 1000;
        } else {
            finalScore = -1;
        }
        return finalScore;
    }

    public static void displayHighScorePosition(String name, int position) {
        System.out.println(name + " managed to get into position "
                + position + " on the highscore table.");
    }

    public static int calculateHighScorePosition(int score) {
        int position = 4;
        if (score >= 1000) {
            position = 1;
        } else if (score >= 500) {
            position = 2;
        } else if (score >= 100) {
            position = 3;
        }
        return position;
    }
}

