import java.util.Scanner;

public class Main {

    //Section 5 (29/31) // MinAndMaxInputChallenge()
    public static void main_74(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int max = 0;
        int min = 0;

        while (true) {
            System.out.println("Enter number:");
            boolean isAnInt = scanner.hasNextInt();
            if (isAnInt) {
                int number = scanner.nextInt();
                if (number > max || max == 0) {
                    max = number;
                }
                if (number < min || min == 0) {
                    min = number;
                }
            } else {
                System.out.println("Min: " + min + " Max: " + max);
                break;
            }
            scanner.nextLine();
        }
    }

    //Section 5 (28/31) // ReadingUserInputChallenge()
    public static void main_73(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int count = 1;
        int sum = 0;

        while (count <= 10) {
            System.out.println("Enter number #" + count + ":");

            boolean hasNextInt = scanner.hasNextInt();

            if (hasNextInt) {
                int number = scanner.nextInt();
                sum += number;
                count++;
            } else {
                System.out.println("Please enter a valid number.");
            }
            scanner.nextLine();
        }
        System.out.println("The sum of the entered numbers is " + sum);

        scanner.close();
    }

    //Section 5 (27/31)
    public static void main_72(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("What is your birth year?");

        boolean hasNextInt = scanner.hasNextInt();

        if (hasNextInt) {
            int yearOfBirth = scanner.nextInt();
            scanner.nextLine(); // avoids setting name to "\n" (new line character)

            System.out.println("Enter your name: ");
            String name = scanner.nextLine();

            int age = 2019 - yearOfBirth;

            if (age >= 0 && age <= 100) {
                System.out.println("Your name is " + name + ", and you are " + age + " years old.");
            } else {
                System.out.println("Invalid year of birth.");
            }
        } else {
            System.out.println("Unable to parse year of birth.");
        }

        scanner.close();
    }

    //Section 5 (26/31)
    public static void main_71() {
        Scanner scanner = new Scanner(System.in);

        System.out.println("What is your birth year?");

        // scanner.nextInt only handles the numbers entered, not the new line character (enter key).
        // This means the next input to the scanner will be a new line character so it is
        // considered best practices to follow scanner.nextInt with scanner.nextLine
        int yearOfBirth = scanner.nextInt();
        scanner.nextLine(); // avoids setting name to "\n" (new line character)

        System.out.println("Enter your name: ");
        String name = scanner.nextLine();

        int age = 2019 - yearOfBirth;

        System.out.println("Your name is " + name + ", and you are " + age + " years old.");

        scanner.close();
    }
}
