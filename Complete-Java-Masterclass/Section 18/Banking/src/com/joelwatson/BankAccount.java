package com.joelwatson;

public class BankAccount {
    public static final int CHECKING = 1;
    public static final int SAVINGS = 2;

    private String firstNam;
    private String lastName;
    private double balance;
    private int accountType;

    public BankAccount(String firstNam, String lastName, double balance, int type) {
        this.firstNam = firstNam;
        this.lastName = lastName;
        this.balance = balance;
        this.accountType = type;
    }

    // Branch = true if at branch with teller, False if at ATM
    public double deposit(double amount, boolean branch) {
        balance += amount;
        return balance;
    }

    // Branch = true if at branch with teller, False if at ATM
    public double withdraw(double amount, boolean branch) {
        if ((amount > 500) & !branch) {
            throw new IllegalArgumentException();
        }
        balance -= amount;
        return balance;
    }

    public double getBalance() {
        return balance;
    }

    public boolean isChecking() {
        return this.accountType == CHECKING;
    }

    // other methods
}
