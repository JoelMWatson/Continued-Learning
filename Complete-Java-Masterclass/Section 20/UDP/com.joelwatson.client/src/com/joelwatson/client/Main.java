package com.joelwatson.client;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketTimeoutException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        try {
            InetAddress address = InetAddress.getLocalHost();
            DatagramSocket dataSocket = new DatagramSocket();

            Scanner scanner = new Scanner(System.in);
            String echoString;

            do {
                System.out.println("Enter string to echo: ");
                echoString = scanner.nextLine();
                byte[] buffer = echoString.getBytes();

                DatagramPacket packet = new DatagramPacket(buffer, buffer.length, address, 5000);
                dataSocket.send(packet);

                byte[] buffer2 = new byte[50];
                packet = new DatagramPacket(buffer2, buffer2.length);
                dataSocket.receive(packet);
                System.out.println("Text recieved is " + new String(buffer2, 0, packet.getLength()));

            } while (!echoString.equals("exit"));
        } catch (SocketTimeoutException e) {
            System.out.println("Timed out");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
