package com.joelwatson;

import static org.junit.Assert.*;

public class BankAccountTest {

    private BankAccount account;
    @org.junit.BeforeClass
    public static void beforeClass() {
        System.out.println("Running test suite setup...");
    }

    @org.junit.Before
    public void setup() {
        account = new BankAccount("Joel", "Watson", 1000.00, BankAccount.CHECKING);
        System.out.println("Running test setup...");
    }

    @org.junit.Test
    public void deposit() throws Exception {
        double balance = account.deposit(200.00, true);
        assertEquals(1200.00, balance, 0);
    }

    @org.junit.Test
    public void withdraw_branch() throws Exception {
        double balance = account.withdraw(600.00, true);
        assertEquals(400.00, balance, 0);
    }

    @org.junit.Test(expected = IllegalArgumentException.class)
    public void withdraw_notBranch() throws Exception {
        account.withdraw(600.00, false);
        fail("Should have thrown IllegalArgumentException");
    }

    @org.junit.Test
    public void getBalance() throws Exception {
        double balance = account.getBalance();
        assertEquals(1000.00, balance, 0);
    }

    @org.junit.Test
    public void isChecking() throws Exception {
        assertTrue("The account is not a checking account", account.isChecking());
    }

    @org.junit.AfterClass
    public static void afterClass() {
        System.out.println("Running test suite teardown...");
    }

    @org.junit.After
    public void teardown() {
        System.out.println("Running test teardown...");
    }
}