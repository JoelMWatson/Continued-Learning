public class LastDigitChecker {

    public static void main(String[] args) {
        System.out.println(hasSameLastDigit(50, 60, 77));
        System.out.println(hasSameLastDigit(30, 44, 77));
    }

    public static boolean hasSameLastDigit(int x, int y, int z) {
        boolean same = false;
        if (isValid(x) && isValid(y) && isValid(z)) {
            int lastX = x % 10;
            int lastY = y % 10;
            int lastZ = z % 10;
            if ((lastX == lastY) || (lastX == lastZ) || (lastZ == lastY)) {
                same = true;
            }
        }
        return same;
    }

    public static boolean isValid(int number) {
        return (number >= 10 && number <= 1000);
    }
}
