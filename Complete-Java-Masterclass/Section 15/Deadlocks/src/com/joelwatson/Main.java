package com.joelwatson;

public class Main {

    public static Object lock1 = new Object();
    public static Object lock2 = new Object();

    public static void main(String[] args) {
        new Thread1().start();
        new Thread2().start();
    }

    private static class Thread1 extends Thread {
        @Override
        public void run() {
            synchronized (lock1) {
                System.out.println("Thread 1: Has lock 1");
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println("Thread 1: Waiting for lock 2");
                synchronized (lock2) {
                    System.out.println("Thread 1: has lock 1 and 2");
                }
                System.out.println("Thread 1: Released lock 2");
            }
            System.out.println("Thread 1: release lock 1, exiting...");
        }
    }

    private static class Thread2 extends Thread {
        @Override
        public void run() {
            // must get locks in the same order as thread1 (or all other threads) to avoid deadlock
            synchronized (lock1) {
                System.out.println("Thread 2: Has lock 1");
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println("Thread 2: Waiting for lock 2");
                synchronized (lock2) {
                    System.out.println("Thread 2: Has locks 1 and 2");
                }
                System.out.println("Thread 2: released lock 2");
            }
            System.out.println("Thread 2: relased lock 1, exiting...");
        }
    }
}


