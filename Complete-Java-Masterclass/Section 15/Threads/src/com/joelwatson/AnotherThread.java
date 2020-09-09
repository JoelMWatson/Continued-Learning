package com.joelwatson;

public class AnotherThread extends Thread {
    @Override
    public void run() {
        System.out.println(ThreadColor.ANSI_RED + "Hello from " + currentThread().getName());

        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            System.out.println(ThreadColor.ANSI_RED + "Another Thread woke me up");
            return;
        }

        System.out.println(ThreadColor.ANSI_RED + "Three seconds have past and i am awake");
    }
}
