package com.joelwatson;

public class Main {

    public static void main(String[] args) {

        // A char datatype has 16 bits (2 bytes)
        // can contain a single letter, number, special character, or a unicode character
        char myChar = '\u00A9'; // copyright symbol

        // A boolean datatype has
        boolean myBoolean = false;

        // Challenge
        char registered = '\u00AE'; // registered sign
        System.out.println("Registered Sign: " + registered);
    }
}
