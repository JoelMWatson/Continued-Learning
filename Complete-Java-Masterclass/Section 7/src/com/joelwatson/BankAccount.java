package com.joelwatson;

public class BankAccount {

    private String accountNumber;
    private String customerName;
    private String email;
    private String phoneNumber;
    private double balance;

    public BankAccount() {
        this("12345", "Default Name", "Default Email", "Default Phone Number", 2.50);
    }

    public BankAccount(String accountNumber, String customerName, String email, String phoneNumber, double balance) {
        this.accountNumber = accountNumber;
        this.balance = balance;
        this.customerName = customerName;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public void deposit(double cash) {
        this.balance = this.balance + cash;
    }

    public void withdraw(double cash) {
        this.balance = this.balance - cash;
    }
}
