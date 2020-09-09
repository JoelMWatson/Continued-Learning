package com.joelwatson;

public class Main {
    // continuously hands the lock back and forth and never progress in their tasks
    public static void main(String[] args) {
        final Worker w1 = new Worker("Worker 1", true);
        final Worker w2 = new Worker("Worker 2", true);

        final SharedResource resource = new SharedResource(w1);

        new Thread(new Runnable() {
            @Override
            public void run() {
                w1.work(resource, w2);
            }
        }).start();
        new Thread(new Runnable() {
            @Override
            public void run() {
                w2.work(resource, w1);
            }
        }).start();
    }
}
