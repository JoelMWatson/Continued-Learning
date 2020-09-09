package com.joelwatson;

public class C1 {

    public static void main(String[] args) {
        // two people using 1 bank account
        // start 1000
        // p1: deposit: 300
        // p1: withdraw 50
        // p2 deposit 203.75
        // p2 withdraw 100

        BankAccount account = new BankAccount("12345-678", 1000.0);

        Thread t1 = new Thread(new Runnable() {
            @Override
            public void run() {
                System.out.println("Thread 1: Depositing");
                account.deposit(300.0);
                System.out.println("Thread 1: Withdrawing");
                account.withdraw(50.0);
            }
        });

        Thread t2 = new Thread(new Runnable() {
            @Override
            public void run() {
                System.out.println("Thread 2: Depositing");
                account.deposit(203.75);
                System.out.println("Thread 2: Withdrawing");
                account.withdraw(100.0);

            }
        });

        t1.start();
        t2.start();
    }
}
