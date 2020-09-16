public class SharedDigits {

    public static void main(String[] args) {
        System.out.println(hasSharedDigit(50, 45));
        System.out.println(hasSharedDigit(0, 45));
        System.out.println(hasSharedDigit(50, 100));
        System.out.println(hasSharedDigit(40, 45));
        System.out.println(hasSharedDigit(40, 59));
    }

    public static boolean hasSharedDigit(int x, int y) {
        boolean shared = false;
        if (x <= 99 && x >= 10 && y <= 99 && y >= 10) {
            int secondX = x % 10;
            int secondY = y % 10;

            x /= 10;
            y /= 10;

            int firstX = x % 10;
            int firstY = y % 10;

            if ((firstX == firstY) || (firstX == secondY) ||
                    (secondX == secondY) || (secondX == firstY)) {
                shared = true;
            }
        }
        return shared;
    }
}
