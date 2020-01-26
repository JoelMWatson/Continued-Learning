package com.joelwatson;

import java.util.ArrayList;
import java.util.Scanner;

public class MobilePhone {

    private ArrayList<Contact> contacts;
    private static Scanner scanner = new Scanner(System.in);

    public MobilePhone() {
        this.contacts = new ArrayList<Contact>();
    }

    public MobilePhone(ArrayList<Contact> contacts) {
        this.contacts = contacts;
    }


    public boolean addNewContact(Contact contact) {
        if (findContact(contact.getName()) >=0) {
            System.out.println("Contact is already on file.");
            return false;
        }
        contacts.add(contact);
        return true;
    }

    public boolean updateContact(Contact contact) {
        int position = findContact(contact.getName());
        if (position >=0) {
            System.out.print("Enter the updated contact name: ");
            String newName = scanner.nextLine();
            System.out.print("Enter the updated contact phone number: ");
            String newPhoneNumber = scanner.nextLine();
            Contact newContact = new Contact(newName, newPhoneNumber);
            contacts.set(position, newContact);
            System.out.println("Contact " + (position + 1) + " has been modified.");
            return true;
        }
        System.out.println("Contact could not be found in the arrayList.");
        return false;
    }

    public boolean removeContact(Contact contact) {
        int position = findContact(contact.getName());
        if (position >= 0) {
            contacts.remove(position);
            System.out.println("Removed " + contact.getName() + " from posiiton " + (position + 1) + " in the arrayList.");
            return true;
        } else {
            System.out.println("Contact could not be found in the arrayList.");
            return false;
        }
    }

    private int findContact(Contact contact) {
        return contacts.indexOf(contact);
    }

    private int findContact(String name) {
        for (int i = 0; i < contacts.size(); i++) {
            if (contacts.get(i).getName().equals(name)) {
                return i;
            }
        }
        return -1;
    }

    public String queryContact(Contact contact) {
        if (findContact(contact) >=0) {
            return contact.getName();
        }
        return null;
    }

    public Contact getContact() {
        System.out.print("Enter contact name: ");
        String name = scanner.nextLine();
        System.out.print("Enter contact phone number: ");
        String phoneNumber = scanner.nextLine();
        return Contact.createContact(name, phoneNumber);
    }

    public void length() {
        System.out.println(contacts.size());
    }

    public void printContacts() {
        for (int i = 0; i < contacts.size(); i++) {
            System.out.println(contacts.get(i).getName() + " | " + contacts.get(i).getPhoneNumber());
        }
    }

    public void printInstructions() {
        System.out.println("\nPress ");
        System.out.println("\t 0 - To print choice options.");
        System.out.println("\t 1 - To add a new contact.");
        System.out.println("\t 2 - To update an existing contact.");
        System.out.println("\t 3 - To remove an existing contact");
        System.out.println("\t 4 - To query the contacts");
        System.out.println("\t 5 - To print the contacts");
        System.out.println("\t 6 - To get the length of the contacts list.");
        System.out.println("\t 7 - To quit the application");
    }
}
