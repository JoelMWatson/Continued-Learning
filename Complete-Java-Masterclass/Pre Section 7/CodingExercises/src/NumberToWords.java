public class NumberToWords {

    public static void main(String[] args) {
        System.out.println(reverse(-12345));
    }

    public static void numberToWords(int number) {
        if (number < 0) {
            System.out.print("Invalid Value");
        }
        int digits = getDigitCount(number);
        number = reverse(number);
        for (int i = 0; i < digits; i++) {
            int lastDigit = number % 10;
            number = number / 10;
            if (lastDigit == 1) {
                System.out.println("One");
            } else if(lastDigit == 2) {
                System.out.println("Two");
            } else if(lastDigit == 3) {
                System.out.println("Three");
            } else if(lastDigit == 4) {
                System.out.println("Four");
            } else if(lastDigit == 5) {
                System.out.println("Five");
            } else if(lastDigit == 6) {
                System.out.println("Six");
            } else if(lastDigit == 7) {
                System.out.println("Seven");
            } else if(lastDigit == 8) {
                System.out.println("Eight");
            } else if(lastDigit == 9) {
                System.out.println("Nine");
            } else {
                System.out.println("Zero");
            }
        }

    }

    public static int reverse(int number) {
        int reverseNumber = 0;
        while (number != 0) {
            reverseNumber *= 10;
            reverseNumber += number % 10;
            number /= 10;
        }
        return reverseNumber;
    }

    public static int getDigitCount(int number) {
        if (number < 0) {
            return -1;
        }
        int digits = 0;
        do {
            digits++;
            number /= 10;
        } while (number > 0);
        return digits;
    }

}
