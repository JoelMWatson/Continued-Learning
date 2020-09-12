package com.joelwatson;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.function.Function;
import java.util.function.Predicate;

public class Main {
    public static void main(String[] args) {
        Employee joel = new Employee("Joel Watson", 28);
        Employee tim = new Employee("Tim Buchalka", 30);
        Employee tyler = new Employee("Tyler Bradshaw", 27);
        Employee danielle = new Employee("Danielle Gibson", 27);
        Employee alex = new Employee("Alex Dempster", 14);

        List<Employee> employees = new ArrayList<>();
        employees.add(joel);
        employees.add(tim);
        employees.add(tyler);
        employees.add(danielle);
        employees.add(alex);

        Function<Employee, String> getLastName = (Employee employee) -> {
            return employee.getName().substring(employee.getName().indexOf(' ') + 1);
        };

        String lastName = getLastName.apply(employees.get(2));
        System.out.println(lastName);

        Function<Employee, String> getFirstName = (Employee employee) -> {
            return employee.getName().substring(0, employee.getName().indexOf(' '));
        };

        Random random = new Random();
        for (Employee employee : employees) {
            if (random.nextBoolean()) {
                System.out.println(getName(getFirstName, employee));
            } else {
                System.out.println(getName(getLastName, employee));
            }
        }
//        printEmployeesByAge(employees, "Employees over 27", employee -> employee.getAge() > 27);
//        printEmployeesByAge(employees, "Employees under 28", employee -> employee.getAge() < 28);
//        printEmployeesByAge(employees, "Employees that are children", new Predicate<Employee>() {
//            @Override
//            public boolean test(Employee employee) {
//                return employee.getAge() < 18;
//            }
//        });
//
//        IntPredicate greaterThan15 = i -> i > 15;
//        IntPredicate lessThan100 = i -> i < 100;
//
//        System.out.println(greaterThan15.test(10));
//
//        // linking predicates
//        System.out.println(greaterThan15.and(lessThan100).test(50));
//
//
//        Random random = new Random();
//        Supplier<Integer> randomSupplier = () -> random.nextInt(1000);
//
//        for (int i=0; i<10; i++) {
//            System.out.println(randomSupplier.get());
//        }
//
//        employees.forEach(employee -> {
//            String lastName = employee.getName().substring(employee.getName().indexOf(' ') + 1);
//            System.out.println(lastName);
//        });

    }

    private static String getName(Function<Employee, String> getName, Employee employee) {
        return getName.apply(employee);
    }

    private static void printEmployeesByAge(List<Employee> employees, String text, Predicate<Employee> ageCondition) {
        System.out.println(text);
        for (Employee employee : employees) {
            if (ageCondition.test(employee)) {
                System.out.println(employee.getName());
            }
        }
    }
}
