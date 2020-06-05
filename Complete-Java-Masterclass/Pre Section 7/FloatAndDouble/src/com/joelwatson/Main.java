package com.joelwatson;

import java.sql.SQLOutput;

public class Main {

    public static void main(String[] args) {

        // an int (32 bits) represents only whole numbers
        int myIntValue = 5 / 3;

        // A float (32 bits) can represent decimal values with single accuracy (7 decimals)
        float myFloatValue = 5F / 3F; // needs a F on the end or it will be read as a double

        // A double (64 bits) can represent decimal values with double accuracy (16 decimals)
        double myDoubleValue = 5D / 3D; // put a D at the end to tell java it is a double.

        System.out.println("myIntValue: " + myIntValue);
        System.out.println("myFloatValue: " + myFloatValue);
        System.out.println("myDoubleValue: " + myDoubleValue);

        // Challenge
        double myPounds = 200D;
        double myKilograms = myPounds * 0.45359237D;
        System.out.println(myPounds + " pounds can be converted to " + myKilograms + " kilograms");
    }
}
