public class GreatestCommonDivisor {

    public static void main(String[] args) {
        System.out.println(getGreatestCommonDivisor(25, 15));
        System.out.println(getGreatestCommonDivisor(12, 30));
        System.out.println(getGreatestCommonDivisor(9, 18));
        System.out.println(getGreatestCommonDivisor(81, 153));
    }

    public static int getGreatestCommonDivisor(int first, int second) {
        int commonDivisor = -1;
        if (first >= 10 && second >= 10) {
            if (first > second) {
                for (int i = 1; i <= first; i++) {
                    if (first % i == 0 && second % i == 0) {
                        commonDivisor = i;
                    }
                }
            } else {
                for (int i = 1; i <= second; i++) {
                    if (second % i == 0 && first % i == 0) {
                        commonDivisor = i;
                    }
                }
            }
        }
        return commonDivisor;
    }
}
