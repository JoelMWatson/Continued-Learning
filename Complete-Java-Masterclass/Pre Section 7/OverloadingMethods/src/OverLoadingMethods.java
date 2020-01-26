public class OverLoadingMethods {

    public static void main(String[] args) {
//        int score1 = calculateScore("Joel", 500);
//        System.out.println("New score is " + score1);
//        int score2 = calculateScore(75);
//        System.out.println("New score is " + score2);
//        int score3 = calculateScore();
//        System.out.println("New score is " + score3);

        System.out.println(calcFeetAndInchesToCentimeters(72));
        System.out.println(calcFeetAndInchesToCentimeters(6,0));
    }

    public static int calculateScore(String playerName, int score) {
        System.out.println("Player " + playerName + " scored " + score + " points");
        return score * 1000;
    }

    public static int calculateScore(int score) {
        System.out.println("Unnamed player scored " + score + " points");
        return score * 1000;
    }

    public static int calculateScore() {
        System.out.println("No player scored, no player score");
        return 0;
    }

    // challenge
    public static double calcFeetAndInchesToCentimeters(double feet, double inches) {
        double centimeters;
        if (feet >= 0 && inches >= 0 && inches <= 12) {
            centimeters = ((12 * feet) + inches) * 2.54;
        } else {
            System.out.println("Invalid feet or inches parameters");
            centimeters = -1.0;
        }
        return centimeters;
    }

    public static double calcFeetAndInchesToCentimeters(double inches) {
        double centimeters;
        if (inches >= 0) {
            double feet = inches / 12;
            inches = inches % 12;
            centimeters = calcFeetAndInchesToCentimeters(feet, inches);
        } else {
            centimeters = -1.0;
        }
        return centimeters;
    }
}
