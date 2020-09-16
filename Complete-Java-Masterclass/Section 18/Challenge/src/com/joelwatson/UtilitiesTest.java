package com.joelwatson;

import static org.junit.Assert.*;

public class UtilitiesTest {

    private Utilities utils;

    @org.junit.Before
    public void setup() {
        utils = new Utilities();
    }

    @org.junit.Test
    public void everyNthChar() {
        char[] output1 = utils.everyNthChar(new char[] {'h','e','l','l','o'}, 2);
        char[] output2 = utils.everyNthChar(new char[] {'h','e','l','l','o'}, 20);
        assertArrayEquals(new char[] {'e','l'}, output1);
        assertArrayEquals(new char[] {'h','e','l','l','o'}, output2);
    }

    @org.junit.Test
    public void removePairs() {
        String output1 = utils.removePairs("AABCDDEFF");
        String output2 = utils.removePairs("ABCCABDEEF");
        assertEquals("ABCDEF", output1);
        assertEquals("ABCABDEF", output2);
    }

    @org.junit.Test
    public void converter() {
        int output = utils.converter(10, 5);
        assertEquals(300, output);
    }

    @org.junit.Test(expected = ArithmeticException.class)
    public void converter_exception() {
        utils.converter(10, 0);
        fail("Should have thrown ArithmeticException");
    }

    @org.junit.Test
    public void nullIfOddLength() {
        String even = "even";
        String odd = "odd";
        assertNotNull(utils.nullIfOddLength(even));
        assertNull(utils.nullIfOddLength(odd));
    }
}