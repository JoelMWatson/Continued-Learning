package com.joelwatson;

import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import java.util.Arrays;
import java.util.Collection;

import static org.junit.Assert.assertEquals;

@RunWith(Parameterized.class)

public class UtilitiesTestParameterized {

    private Utilities utils;
    private String source;
    private String expected;

    public UtilitiesTestParameterized(String source, String expected) {
        this.source = source;
        this.expected = expected;
    }

    @org.junit.Before
    public void setup() {
        utils = new Utilities();
    }

    @Parameterized.Parameters
    public static Collection<Object> testCondition() {
        return Arrays.asList(new Object[][] {
                {"ABCDEFF", "ABCDEF"},
                {"AB88EFFG", "AB8EFG"},
                {"112233445566", "123456"},
                {"ZYZQQB", "ZYZQB"},
                {"A", "A"},
        });
    }

    @org.junit.Test
    public void removePairs() {
        String output = utils.removePairs(source);
        assertEquals(expected, output);
    }

}
