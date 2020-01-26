import java.util.Scanner;

public class InputCalculator {
    public static void main(String[] args) {
        inputThenPrintSumAndAverage();
    }

    public static void inputThenPrintSumAndAverage() {
        Scanner scanner = new Scanner(System.in);

        int XX = 0;
        long YY = 0;
        double count = 1;
        while (true) {
            boolean isAnInt = scanner.hasNextInt();
            if (isAnInt) {
                int number = scanner.nextInt();
                XX += number;
                YY = Math.round((double) XX / count);
                count += 1;
            } else {
                System.out.println("SUM = " + XX + " AVG = " + YY);
                break;
            }
            scanner.nextLine();
        }

        scanner.close();
    }
}
