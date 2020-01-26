package interfaces;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
//        ITelephone joelsPhone = new DeskPhone("253-326-6660");
//        joelsPhone.powerOn();
//        joelsPhone.callPhone("253-326-6660");
//        joelsPhone.answer();
//
//        joelsPhone = new MobilePhone("253-326-6660");
//        joelsPhone.powerOn();
//        joelsPhone.callPhone("253-326-6660");
//        joelsPhone.answer();

        Player joel = new Player("Joel", 5, 10);
        System.out.println(joel.toString());
        saveObject(joel);


    }

    public static ArrayList<String> readValues() {
        ArrayList<String> values = new ArrayList<String>();

        Scanner scanner = new Scanner(System.in);
        boolean quit = false;
        int index = 0;
        System.out.println("Choose\n" +
                "1 to enter a string\n" +
                "0 to quit");

        while (!quit) {
            System.out.print("Choose an option: ");
            int choice = scanner.nextInt();
            scanner.nextLine();
            switch (choice) {
                case 0:
                    quit = true;
                    break;
                case 1:
                    System.out.print("Enter a string: ");
                    String stringInput = scanner.nextLine();
                    values.add(index, stringInput);
                    index++;
                    break;
            }
        }
        return values;
    }

    public static void saveObject(ISaveable saveableObject) {
        for (int i = 0; i < saveableObject.write().size(); i++) {
            System.out.println("Saving " + saveableObject.write().get(i) + " to storage device");
        }
    }

    public static void loadObject(ISaveable objectToLoad) {
        List<String> values = readValues();
        objectToLoad.read(values);

    }
}
