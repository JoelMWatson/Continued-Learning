package com.joelwatson;

public class Main {

    public static void main(String[] args) {

        // A byte datatype has 8 bits so it can fit 2^7
        byte myMinByte = -128;
        byte myMaxByte = 127;

        // Java will automatically set this equation to an int unless you cast to byte
        byte myByteValue = (byte) (myMaxByte / 2);

        // A Short datatype has 16 bits so it can fit 2^15
        short myMinShort = -32_768;
        short myMaxShort = 32_767; // using underscore makes more readable

        // Java will automatically set this equation to an int unless you cast to short
        short myShortValue = (short) (myMinShort / 2);

        // An int datatype has 32 bits so it can fit 2^31
        int myMinInt = -2_147_483_648;
        int myMaxInt = 2_147_483_647;

        // A Long datatype has 64 bits so it can fit 2^63
        long myMinLong = -9_223_372_036_854_775_808L;
        long myMaxLong = 9_223_372_036_854_775_807L; // Ends with L to tell Java it is a long


    }
}
