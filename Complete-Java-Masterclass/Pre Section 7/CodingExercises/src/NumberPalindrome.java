public class NumberPalindrome {

    public static void main(String[] args) {
        System.out.println(isPalindrome(100));
        System.out.println(isPalindrome(111));
        System.out.println(isPalindrome(2002));
        System.out.println(isPalindrome(875));
    }

    public static boolean isPalindrome(int number) {
        int reverse = 0;
        int original = number;
        while (true) {
            int lastDigit = number % 10;
            reverse += lastDigit;
            number /= 10;
            if (number == 0) {
                break;
            }
            reverse *= 10;
        }
        System.out.println("Does " + reverse + " = " + original + "?");
        return (reverse == original);
    }
}
