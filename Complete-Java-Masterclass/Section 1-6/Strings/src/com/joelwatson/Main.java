package com.joelwatson;

public class Main {

    public static void main(String[] args) {
        // Primitive Datatypes
        // 1. byte
        // 2. short
        // 3. int
        // 4. long
        // 5. float
        // 6. double
        // 7. char
        // 8. boolean
        // ------------
        // 10. String (not primitive but basically built into the language at this point)

        String myString = "This is a string";
        System.out.println(myString);
        myString = myString + ", and this is more.";
        System.out.println(myString);
        myString = myString + " \u00A9 2015";

        String numberString = "250.55";
        numberString = numberString + "49.95";
        System.out.println("The result is " + numberString);

        String lastString = "10";
        int myInt = 50;
        lastString = lastString + myInt;
        System.out.println("LastString = " + lastString);
        double myDouble = 120.47;
        lastString = lastString + myDouble;
        System.out.println("LastString = " + lastString);
    }
}
