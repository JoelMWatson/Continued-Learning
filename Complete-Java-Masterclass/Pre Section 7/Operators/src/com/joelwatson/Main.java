package com.joelwatson;

public class Main {

    public static void main(String[] args) {
        // Equals or Assignment Operator =
        int result = 1;
        System.out.println("Initial Result: " + result);
        int previousResult = result;

        // Add Operator +
        result = result + 2;
        System.out.println(previousResult + " + 2 = " + result);
        previousResult = result;

        // Subtract Operator -
        result = result - 1;
        System.out.println(previousResult + " - 1 = " + result);
        previousResult = result;

        // Multiply Operator *
        result = result * 10;
        System.out.println(previousResult + " * 10 = " + result);
        previousResult = result;

        // Divide Operator /
        result = result / 5;
        System.out.println(previousResult + " / 5 = " + result);
        previousResult = result;

        // Remainder or Modulus Operator %
        result = result % 3;
        System.out.println(previousResult + " % 3 = " + result);
        previousResult = result;

        // Increment Operator ++
        result++;
        System.out.println(previousResult + "++ = " + result);
        previousResult = result;

        // Decrement Operator --
        result--;
        System.out.println(previousResult + "-- = " + result);
        previousResult = result;

        // Shorthand
        // result += 5
        // result -= 5
        // result *= 5
        // result /= 5

        // Evaluate Operator == (is equal)
        boolean isAlien = false;
        if (isAlien == false) {
            System.out.println("It is not an Alien.");
        }

        // Evaluate Operator != (not equal)
        int topScore = 100;
        if (topScore != 100) {
            System.out.println("You got the high score!");
        }

        // More Evaluation Operators
        // Less than <
        // Greater than >
        // Less than or equal to <=
        // Greater than or equal to >=

        // And Operator &&
        if (topScore > 40 && topScore < 120) {
            System.out.println("You got the high score!");
        }

        // Or Operator ||
        if (topScore == 40 || topScore == 100) {
            System.out.println("You got the high score!");
        }

        // ternerary operator
        boolean isCar = false;

        boolean wasCar = isCar ? false : true;
        if (wasCar == false) {
            System.out.println("WasCar is " + wasCar);
        }

        // challenge
        double firstDouble = 20D;
        double secondDouble = 80D;
        double resultSum = (firstDouble + secondDouble) * 25;
        double remainder = resultSum % 40;
        if (remainder <= 20) {
            System.out.println("Total was over the limit");
        }

    }
}
