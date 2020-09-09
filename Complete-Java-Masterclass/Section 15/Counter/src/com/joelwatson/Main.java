package com.joelwatson;

public class Main {

    public static void main(String[] args) {
        Countdown cd = new Countdown();

        CountdownThread t1 = new CountdownThread(cd);
        t1.setName("Thread 1");
        CountdownThread t2 = new CountdownThread(cd);
        t2.setName("Thread 2");

        t1.start();
        t2.start();
    }
}

class Countdown {

    private int i;

    // Synchronize the whole method
    // public synchronized void doCountdown() {
    public synchronized void doCountdown() {
        String color;
        switch (Thread.currentThread().getName()) {
            case "Thread 1":
                color = ThreadColor.ANSI_BLUE;
                break;
            case "Thread 2":
                color = ThreadColor.ANSI_RED;
                break;
            default:
                color = ThreadColor.ANSI_GREEN;
        }

        // Synchronize a block of code
        synchronized(this) {
            for (i = 10; i > 0; i--) {
                System.out.println(color + Thread.currentThread().getName() + ": = " + i);
            }
        }
    }
}

class CountdownThread extends Thread {
    private Countdown threadCountdown;

    public CountdownThread(Countdown countdown) {
        threadCountdown = countdown;
    }

    public void run() {
        threadCountdown.doCountdown();
    }
}