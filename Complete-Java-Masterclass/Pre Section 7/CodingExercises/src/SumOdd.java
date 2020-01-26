public class SumOdd {

    public static void main(String[] args) {

    }

    public static boolean isOdd(int number) {
        boolean odd = false;
        if (number > 0) {
            if (number % 2 == 1) {
                odd = true;
            }
        }
        return odd;
    }

    public static int sumOdd(int start, int end) {
        int sum = 0;
        if (start > 0 && end > 0 && end >= start) {
            for (int i = start; i <= end; i++) {
                if (isOdd(i)) {
                    sum += i;
                }
            }
        } else {
            sum = -1;
        }
        return sum;
    }
}
