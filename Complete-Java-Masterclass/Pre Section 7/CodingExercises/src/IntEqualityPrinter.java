public class IntEqualityPrinter {

    public static void main(String[] args) {
        printEqual(3, 3, 3);
        printEqual(3, 2, 3);
        printEqual(3, 2, 1);

    }

    public static void printEqual(int first, int second, int third) {
        if (first < 0 || second < 0 || third < 0) {
            System.out.println("Invalid Value");
        } else if (first == second && first == third) {
            System.out.println("All numbers are equal");
        } else if (first != second && first != third && second != third) {
            System.out.println("All numbers are different");
        } else {
            System.out.println("Neither all are equal or different");
        }
    }
}
