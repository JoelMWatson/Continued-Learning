public class EqualSumChecker {
    public static void main(String[] args) {

    }

    public static boolean hasEqualSum(int first, int second, int third) {
        boolean equal = false;
        if (first + second == third) {
            equal = true;
        }
        return equal;
    }
}
