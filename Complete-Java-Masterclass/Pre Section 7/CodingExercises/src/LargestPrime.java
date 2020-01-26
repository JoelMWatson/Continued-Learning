public class LargestPrime {

    public static void main(String[] args) {
        System.out.println(getLargestPrime(21));
        System.out.println(getLargestPrime(217));
        System.out.println(getLargestPrime(16));
    }

    public static int getLargestPrime(int number) {
        if (number <= 1) {
            return -1;
        }
        int prime = 1;
        for (int i = 2; i <= number; i++) {
            if (number % i == 0) {
                boolean isPrime = true;
                for (int k = 2; k <= i / 2; k++) {
                    if (i % k == 0) {
                        isPrime = false;
                    }
                }
                if (isPrime) {
                    prime = i;
                }
            }
        }
        return prime;
    }
}
