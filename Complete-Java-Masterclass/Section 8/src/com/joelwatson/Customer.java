package com.joelwatson;

import java.util.ArrayList;

public class Customer {

    private String name;
    private ArrayList<Double> transactions;

    public Customer() {
        this("No Name", new ArrayList<Double>());
    }

    public Customer(String name) {
        this(name, new ArrayList<Double>());
    }

    public Customer(String name, ArrayList<Double> transactions) {
        this.name = name;
        this.transactions = transactions;
        System.out.println(name + " has been created.");
    }

    public void addTransaction(double amount) {
        this.transactions.add(amount);
        System.out.println("Transaction for: " + amount + " recorded for $" + this.name + ".");
    }

    public void showTransactions() {
        for (int i = 0; i < transactions.size(); i++) {
            System.out.println(transactions.get(i));
        }
    }

    public String getName() {
        return name;
    }

    public ArrayList<Double> getTransactions() {
        return transactions;
    }
}
