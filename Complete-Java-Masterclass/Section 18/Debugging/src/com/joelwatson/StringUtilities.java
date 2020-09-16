package com.joelwatson;

import org.jetbrains.annotations.NotNull;

public class StringUtilities {

    private StringBuilder sb = new StringBuilder();
    private int charsAdded = 0;

    public void addChar(@NotNull StringBuilder sb, char c) {
        sb.append(c);
//        this.sb.append(c);
        charsAdded++;
    }

    public String upperAndPrefix(String str) {
        String upper = str.toUpperCase();
        return "Prefix_" + upper;
    }

    public String andSuffix(String str) {
        return str + "_Suffix";
    }
}
