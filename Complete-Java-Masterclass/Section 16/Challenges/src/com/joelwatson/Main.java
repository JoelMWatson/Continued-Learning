package com.joelwatson;

import java.util.Arrays;
import java.util.List;
import java.util.function.Function;

public class Main {
    public static void main(String[] args) {
        List<String> topNames2015 = Arrays.asList(
                "Amelia",
                "Olivia",
                "emily",
                "Isla",
                "Ava",
                "oliver",
                "Jack",
                "Charlie",
                "harry",
                "Jacob"
        );

//        // create new list
//        List<String> uppercaseList = new ArrayList<>();
//        // fill list with names from first list correctly capitalized
//        topNames2015.forEach(name -> {
//            uppercaseList.add(name.substring(0,1).toUpperCase() + name.substring(1));
//        });
//        // sorts the new list
//        uppercaseList.sort(String::compareTo);
////        uppercaseList.sort((s1, s2) -> s1.compareTo(s2));
//        // outputs new list to console
//        uppercaseList.forEach(System.out::println);
////        uppercaseList.forEach(s -> System.out.println(s));

        // or with a steam like this
        topNames2015.stream()
                .map(s-> s.substring(0,1).toUpperCase() + s.substring(1))
                .peek(System.out::println)
                .sorted(String::compareTo)
                .toArray();


//        Runnable runnable = () -> {
//                String myString = "Let's split this up into an array";
//                String[] parts = myString.split(" ");
//                for (String part: parts) {
//                    System.out.println(part);
//                }
//        };
//        new Thread(runnable).start();
//        System.out.println(stringChallenge("Ham is Good"));
//        Function<String, String> stringChallenge = (s) -> {
//            StringBuilder returnVal = new StringBuilder();
//            for (int i = 0; i < s.length(); i++) {
//                if (i % 2 == 1) {
//                    returnVal.append(s.charAt(i));
//                }
//            }
//            return returnVal.toString();
//        };
//        System.out.println(stringChallenge.apply("Ham is Good"));
//        System.out.println(everySecondString(stringChallenge, "0987654321"));
//
//
//        Supplier<String> iLoveJava = () -> "I Love Java";
//        String supplierResult = iLoveJava.get();
//        System.out.println(supplierResult);
    }

    public static String everySecondString(Function<String, String> func, String s) {
        return func.apply(s);
    }

    public static String stringChallenge(String s) {
        StringBuilder returnVal = new StringBuilder();
        for (int i = 0; i < s.length(); i++) {
            if (i % 2 == 1) {
                returnVal.append(s.charAt(i));
            }
        }
        return returnVal.toString();
    }
}
