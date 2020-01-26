package com.joelwatson;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        int x = getIntLBYL();
        System.out.println("X is " + x);
    }

    private static int getInt() {
        Scanner scan = new Scanner(System.in);
        return scan.nextInt();
    }

    private static int getIntLBYL() {
        Scanner scan = new Scanner(System.in);
        boolean isValid = true;
        System.out.println("Please enter an integer ");
        String input = scan.next();
        for (int i=0; i<input.length(); i++) {
            if (!Character.isDigit(input.charAt(i))) {
                isValid = false;
                break;
            }
        }
        if (isValid) {
            return Integer.parseInt(input);
        }
        return 0;
    }

    private static int getIntEAFP() {
        Scanner scan = new Scanner(System.in);
        boolean isValid = true;
        System.out.println("Please enter an integer ");
        try {
            return scan.nextInt();
        } catch (InputMismatchException e) {
            return 0;
        }
    }

    // Look Before You Leap
    private static int divideLBYL (int x, int y) {
        if (y != 0) {
            return x/y;
        } else {
            return 0;
        }
    }

    // Easier to Ask for Forgiveness than Permission
    private static int divideEAFP (int x, int y) {
        try {
            return x / y;
        } catch (ArithmeticException e) {
            return 0;
        }
    }

    // No error handling so it will crash
    private static int divide(int x, int y) {
        return x / y;
    }
}
