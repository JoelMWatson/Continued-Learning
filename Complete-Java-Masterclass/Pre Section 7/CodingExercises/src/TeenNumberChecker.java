public class TeenNumberChecker {

    public static void main(String[] args) {
        System.out.println(hasTeen(9, 99, 19));
        System.out.println(hasTeen(23, 15, 42));
        System.out.println(hasTeen(22, 23, 34));
    }

    public static boolean hasTeen(int first, int second, int third) {
        boolean teen = false;
        if ((first > 12 && first < 20) ||
                (second > 12 && second < 20) ||
                (third > 12 && third < 20)) {
            teen = true;
        }
        return teen;
    }

    public static boolean isTeen(int number) {
        return (number >= 13 && number <=19);
    }
}