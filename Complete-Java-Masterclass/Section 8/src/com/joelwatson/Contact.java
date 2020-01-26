package com.joelwatson;

public class Contact {
    private String name;
    private String phoneNumber;

    public Contact() {
        this("No Name", "000-000-0000");
    }

    public Contact(String name, String phoneNumber) {
        this.name = name;
        this.phoneNumber = phoneNumber;
    }

    public String getName() {
        return name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public static Contact createContact(String name, String phoneNumber) {
        return new Contact(name, phoneNumber);
    }


}
