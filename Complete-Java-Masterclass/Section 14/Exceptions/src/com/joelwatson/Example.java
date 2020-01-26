package com.joelwatson;

import java.util.InputMismatchException;
import java.util.NoSuchElementException;
import java.util.Scanner;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 1/5/2020
 * Project: Exceptions
 * Description: ...
 */

public class Example {

    public static void main(String[] args) {
        int result;
        try {
            result = divide();
            System.out.println(result);
        } catch (ArithmeticException e) {
            System.out.println(e.toString());
            System.out.println("Unable to preform division. Autopilot shutting down.");
        }
    }

    public static int divide() {
        int x, y;
        try {
            x = getInt();
            y = getInt();
            System.out.println("x is " + x + " and y is " + y);
            return x / y;
        } catch (NoSuchElementException e) {
            throw new ArithmeticException("No suitable input");
        }catch (ArithmeticException e) {
            throw new ArithmeticException("Attempted to divide by zero");
        }
    }

    private static int getInt() {
        Scanner scan = new Scanner(System.in);
        System.out.println("Please enter an integer:");
        while (true) {
            try {
                return scan.nextInt();
            } catch (InputMismatchException e) {
                // go around again
                scan.nextLine();
                System.out.println("Please enter a number using only the digits 0 - 9");
            }
        }
    }
}

