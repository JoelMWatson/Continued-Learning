package AccessModifiers;

import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/11/2019
 * Project: Section 11
 * Description: ...
 */

public class Account {

    private String accountName;
    private int balance = 0;
    private ArrayList<Integer> transactions;

    public Account(String name) {
        this.accountName = name;
        this.transactions = new ArrayList<>();
    }

    public int getBalance() {
        return balance;
    }

    public void deposit(int amount) {
        if (amount > 0) {
            transactions.add(amount);
            this.balance += amount;
            System.out.println("Deposited");
        } else {
            System.out.println("Could not deposit negative funds.");
        }
    }

    public void withdraw(int amount) {
        int withdrawl = -amount;
        if (withdrawl < 0) {
            transactions.add(withdrawl);
            this.balance += withdrawl;
            System.out.println("Withdrawn");
        } else {
            System.out.println("Could not withdraw a negative amount.");
        }
    }

    public void calculateBalance() {
        this.balance = 0;
        for (int i : this.transactions) {
            this.balance += i;
        }
        System.out.println("Balance: " + this.balance);
    }

}
