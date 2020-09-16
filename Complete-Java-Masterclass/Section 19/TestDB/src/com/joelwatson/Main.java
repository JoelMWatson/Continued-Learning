package com.joelwatson;

import java.sql.*;

public class Main {

    public static final String DB_NAME = "testjava.db";
    public static final String CONNECTION_STRING = "jdbc:sqlite:C:\\Users\\Joel\\Projects\\udemy\\Complete-Java-Masterclass\\Section 19\\TestDB\\" + DB_NAME;

    public static final String CONTACTS = "contacts";

    public static final String COL_NAME = "name";
    public static final String COL_PHONE = "phone";
    public static final String COL_EMAIL = "email";

    public static void main(String[] args) {

        try (Connection conn = DriverManager.getConnection(CONNECTION_STRING);
             Statement statement = conn.createStatement()) {

            // Drop Table
            statement.execute("DROP TABLE IF EXISTS " + CONTACTS);

            // Create Table
            statement.execute("CREATE TABLE IF NOT EXISTS " + CONTACTS +
                    " (" + COL_NAME + " TEXT, " + COL_PHONE + " INTEGER, " + COL_EMAIL + " TEXT)");

            // Insert Rows
            insertContact(statement, "Joel", 1234567890, "joel@email.com");
            insertContact(statement, "Dog", 1239874567, "dog@email.com");
            insertContact(statement, "Ham", 2134567890, "ham@email.com");
            insertContact(statement, "Moo", 2111455660, "moo@email.com");


            // Update
            statement.execute("UPDATE " + CONTACTS + " SET " + COL_PHONE + "=5555555555 WHERE " + COL_NAME + "='Joel'");

            // Delete
            statement.execute("DELETE FROM " + CONTACTS + " WHERE " + COL_NAME + "='Moo'");

            // Select
//            statement.execute("SELECT * FROM " + CONTACTS);
//            ResultSet results = statement.getResultSet();
            // Cleaner Select
            ResultSet results = statement.executeQuery("SELECT * FROM " + CONTACTS);
            while (results.next()) {
                System.out.println(results.getString(COL_NAME) + "|" +
                        results.getInt(COL_PHONE) + "|" +
                        results.getString(COL_EMAIL));
            }

//            statement.close();
//            conn.close();
        } catch (SQLException e) {
            System.out.println("Something went wrong: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static void insertContact(Statement statement, String name, int phone, String email) throws SQLException {
        statement.execute("INSERT INTO " + CONTACTS +
                " (" + COL_NAME + ", " +
                COL_PHONE + ", " +
                COL_EMAIL + ") " +
                "VALUES('" + name + "', " + phone + ", '" + email + "')");
    }
}
