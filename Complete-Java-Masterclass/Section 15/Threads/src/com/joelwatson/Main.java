package com.joelwatson;

public class Main {
    public static void main(String[] args) {
        System.out.println(ThreadColor.ANSI_PURPLE + "Hello World from main thread");

        Thread anotherThread = new AnotherThread();
        anotherThread.setName("AnotherThread");
        anotherThread.start();

        new Thread() {
            public void run() {
                System.out.println(ThreadColor.ANSI_CYAN +"Hello from anonymous thread");
            }
        }.start();

        Thread myRunnableThread = new Thread(new MyRunnable() {
            // overrides my own run method
            @Override
            public void run() {
                System.out.println(ThreadColor.ANSI_GREEN + "Hello from anonymous myrunnable thread");
                try {
                    anotherThread.join(); // Will now finish anotherThread before finishing this thread
                    System.out.println(ThreadColor.ANSI_GREEN + "AnotherThread terminated, so im running again");
                } catch (InterruptedException e) {
                    System.out.println(ThreadColor.ANSI_GREEN + "Couldn't wait after all. I was interrupted");
                }
            }
        });

        myRunnableThread.start();
        // anotherThread.interrupt();

        System.out.println(ThreadColor.ANSI_PURPLE + "Hello again from main thread");
    }
}
