public class DecimalComparator {

    public static void main(String[] args) {
        System.out.println(areEqualByThreeDecimalPlaces(-3.1756, -3.175));
        System.out.println(areEqualByThreeDecimalPlaces(3.175, 3.176));
        System.out.println(areEqualByThreeDecimalPlaces(3.0, 3.0));
        System.out.println(areEqualByThreeDecimalPlaces(-3.123, 3.123));
    }

    public static boolean areEqualByThreeDecimalPlaces(double first, double second) {
        boolean equal = false;
        first = (first * 1000);
        first -= (first % 1);
        second = (second * 1000);
        second -= (second % 1);
        System.out.println(first + " and " + second);
        if (first == second) {
            equal = true;
        }
        return equal;
    }
}
