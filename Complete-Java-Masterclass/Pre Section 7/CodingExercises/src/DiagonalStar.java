public class DiagonalStar {

    public static void main(String[] args) {
        printSquareStar(5);
        printSquareStar(8);
    }

    public static void printSquareStar(int number) {
        if (number < 5) {
            System.out.println("Invalid Value");
        } else {
            double rowCount = number;
            double currentRow = 1;
            for (int i=1; i <= rowCount; i++) {
                String row = "";
                if (currentRow == 1 || currentRow == number) {
                    for (int k=1; k <= rowCount; k++) {
                        row += '*';
                    }
                } else {
                    for (int k=1; k <= rowCount; k++) {
                        if (k == 1 || k == rowCount) {
                            row += '*';
                        } else if (k == currentRow || rowCount - currentRow + 1 == k) {
                            row += '*';
                        } else {
                            row += ' ';
                        }
                    }
                }
                System.out.println(row);
                currentRow ++;
            }
        }
    }
}
