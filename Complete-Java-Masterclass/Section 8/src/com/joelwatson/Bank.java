package com.joelwatson;

import java.util.ArrayList;

public class Bank {

    private ArrayList<Branch> branches;

    public Bank() {
        this.branches = new ArrayList<Branch>();
    }

    public Bank(ArrayList<Branch> branches) {
        this.branches = branches;
    }

    public void addBranch(Branch branch) {
        this.branches.add(branch);
        System.out.println("New branch added.");
    }

    public void showCustomers() {
        for (int i = 0; i < branches.size(); i++) {
            System.out.print(i+1);
            branches.get(i).showCustomers();
        }
    }

    public static void main(String[] args) {
        // Create customers
        Customer customer1 = new Customer("Joel");
        Customer customer2 = new Customer("Jeff");
        Customer customer3 = new Customer("Jim");

        // Create Branches
        Branch branch1 = new Branch();
        Branch branch2 = new Branch();

        // Add transactions to customers
        customer1.addTransaction(5.55);
        customer2.addTransaction(6.66);
        customer3.addTransaction(7.77);

        // Add customers to branches
        branch1.addCustomer(customer1);
        branch1.addCustomer(customer2, 1.11);
        branch2.addCustomer(customer3, 100.00);

        // Print out customers and transactions
        branch1.showCustomers();
        branch2.showCustomers();
    }
}