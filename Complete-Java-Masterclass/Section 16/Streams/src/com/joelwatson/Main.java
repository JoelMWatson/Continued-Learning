package com.joelwatson;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

public class Main {

    public static void main(String[] args) {
        List<String> bingoNumbers = Arrays.asList(
                "N40",
                "B12",
                "G53","g64",
                "I26",
                "O71",
                "H07"
        );

        List<String> gNums = new ArrayList<>();

        Stream<String> ioStream = Stream.of("I26", "O71", "H07");
        Stream<String> inStream = Stream.of("N40","B12", "G53", "I26", "O71", "H07");
        Stream<String> concatString = Stream.concat(ioStream, inStream);
//        System.out.println(concatString.count()); // 9
        System.out.println(concatString
                .distinct()
                .peek(System.out::println)
                .count()); // 6

//        bingoNumbers.forEach(number -> {
//            if(number.toUpperCase().startsWith("G")) {
//                gNums.add(number);
//                System.out.println(number);
//            }
//        });
//
//        gNums.sort((s1, s2) -> s1.compareTo(s2));
//        gNums.forEach(s -> System.out.println(s));

        bingoNumbers
                .stream()
                .map(String::toUpperCase)
                .filter(s->s.startsWith("G"))
                .sorted()
                .forEach(System.out::println);

        Employee joel = new Employee("Joel Watson", 28);
        Employee tim = new Employee("Tim Buchalka", 30);
        Employee tyler = new Employee("Tyler Bradshaw", 27);
        Employee danielle = new Employee("Danielle Gibson", 27);
        Employee alex = new Employee("Alex Dempster", 14);

        Department hr = new Department("Human Resources");
        hr.addEmployee(tim);
        hr.addEmployee(alex);
        Department accounting = new Department("Accounting");
        accounting.addEmployee(joel);

        List<Department> departments = new ArrayList<>();
        departments.add(hr);
        departments.add(accounting);

        departments.stream()
                .flatMap(department -> department.getEmployees().stream())
                .forEach(System.out::println);

        List<String> sortedGnums = bingoNumbers.stream()
                .map(String::toUpperCase)
                .filter(s-> s.startsWith("G"))
                .sorted()
//                .collect(Collectors.toList());
                .collect(ArrayList::new, ArrayList::add, ArrayList::addAll);

        departments.stream()
                .flatMap(department -> department.getEmployees().stream())
                .reduce((e1, e2) -> e1.getAge() < e2.getAge() ? e1 : e2)
                .ifPresent(System.out::println);

        Stream.of("ABC","AC", "BAA", "CCCC", "XY", "ST").filter(s-> {
            System.out.println(s);
            return s.length() == 3;
        }).count();
    }
}
