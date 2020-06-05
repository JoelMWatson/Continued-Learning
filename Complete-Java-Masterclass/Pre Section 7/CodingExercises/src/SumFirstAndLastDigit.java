public class SumFirstAndLastDigit {

    public static void main(String[] args) {
        System.out.println(sumFirstAndLastDigit(100));
        System.out.println(sumFirstAndLastDigit(1));
        System.out.println(sumFirstAndLastDigit(11));
        System.out.println(sumFirstAndLastDigit(-207));
    }

    public static int sumFirstAndLastDigit(int number) {
        int sum = 0;
        if (number < 0) {
            sum = -1;
        } else {
            int lastDigit = number % 10;
            while (number >= 10) {
                number /= 10;
            }
            int firstDigit = number % 10;
            sum = firstDigit + lastDigit;
        }
        return sum;
    }
}
