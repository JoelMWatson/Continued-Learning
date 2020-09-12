package com.joelwatson;

import java.util.*;

public class Main {

    public static void main(String[] args) {

//        // equivalent with lambda
//        new Thread(() -> {
//            System.out.println("Printing from the runnable");
//            System.out.println("Line 2");
//            System.out.printf("This is line %d\n", 3);
//        }).start();

        // Without lambda
//        new Thread(new Runnable() {
//            @Override
//            public void run() {
//                System.out.println("Printing from the Runnable");
//            }
//        }).start();

        Employee joel = new Employee("Joel", 28);
        Employee tim = new Employee("Tim", 30);
        Employee tyler = new Employee("Tyler", 27);
        Employee danielle = new Employee("Danielle", 27);

        List<Employee> employees = new ArrayList<>();
        employees.add(joel);
        employees.add(tim);
        employees.add(tyler);
        employees.add(danielle);

        employees.forEach(employee -> {
            System.out.println(employee.getName());
            System.out.println(employee.getAge());
        });

//        Collections.sort(employees, (employee1, employee2) ->
//                employee1.getName().compareTo(employee2.getName()));
//
//        // Without Lambda
////        Collections.sort(employees, new Comparator<Employee>() {
////            @Override
////            public int compare(Employee o1, Employee o2) {
////                return o1.getName().compareTo(o2.getName());
////            }
////        });
//        for (Employee employee : employees) {
//            System.out.println(employee.getName());
//        }
//
////        String sillyString = doStirngStuff(new UpperConcat() {
////            @Override
////            public String upperAndConcat(String s1, String s2) {
////                return s1.toUpperCase() + s2.toUpperCase();
////            }
////        },
////                employees.get(0).getName(), employees.get(1).getName());
//
//        UpperConcat uc = (s1, s2) -> s1.toUpperCase() + s2.toUpperCase();
//        String sillyString = doStirngStuff(uc, employees.get(0).getName(), employees.get(1).getName());
//        System.out.println(sillyString);

        AnotherClass anotherClass = new AnotherClass();
        System.out.println(anotherClass.doSomething());
    }

    public final static String doStirngStuff(UpperConcat uc, String s1, String s2) {
        return uc.upperAndConcat(s1, s2);
    }
}

class Employee {
    private String name;
    private int age;

    public Employee(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}

interface UpperConcat {
    public String upperAndConcat(String s1, String s2);
}

class AnotherClass {
    public String doSomething() {
        UpperConcat uc = (s1, s2) -> {
            System.out.println("The lambdas name is " + getClass().getSimpleName());
            return s1.toUpperCase() + s2.toUpperCase();
        };

        System.out.println("The AnotherClass's name is " + getClass().getSimpleName());
        return Main.doStirngStuff(uc, "String1", "String2");

//        System.out.println("The AnotherClass's name is " + getClass().getSimpleName());
//        return Main.doStirngStuff(new UpperConcat() {
//            @Override
//            public String upperAndConcat(String s1, String s2) {
//                System.out.println("The AnotherClass's name is " + getClass().getSimpleName());
//                return s1.toUpperCase() + s2.toUpperCase();
//            }
//        },"String1", "String2");
    }

    public void printValue() {
        int number = 25;

        Runnable r = () -> {
            try {
                Thread.sleep(5000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("The value is " + number);
        };

        new Thread(r).start();
    }
}