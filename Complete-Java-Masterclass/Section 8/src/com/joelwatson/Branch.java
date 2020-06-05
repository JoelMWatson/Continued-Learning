package com.joelwatson;

import java.util.ArrayList;

public class Branch {

    private ArrayList<Customer> customers;

    public Branch() {
        this.customers = new ArrayList<Customer>();
    }

    public void addCustomer(Customer customer) {
        this.customers.add(customer);
        customer.getTransactions().add(0.00);
        System.out.println(customer.getName() + " has been added with an initial transaction of $0.00.");
    }

    public void addCustomer(Customer customer, double initialAmount) {
        customer.getTransactions().add(initialAmount);
        this.customers.add(customer);
        System.out.println(customer.getName() + " has been added with an initial transaction of $" + initialAmount);
    }

    public void showCustomers() {
        for (int i = 0; i < customers.size(); i++) {
            System.out.println(customers.get(i).getName());
            customers.get(i).showTransactions();
        }
    }
}
