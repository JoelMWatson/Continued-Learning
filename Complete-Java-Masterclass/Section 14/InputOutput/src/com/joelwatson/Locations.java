package com.joelwatson;

import java.io.*;
import java.util.*;

import static java.lang.Integer.parseInt;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 1/5/2020
 * Project: InputOutput
 * Description: ...
 */

public class Locations implements Map<Integer, Location> {

    private static Map<Integer, Location> locations = new HashMap<>();

    public static void main(String[] args) throws IOException {
        try (FileWriter locFile = new FileWriter("locations.txt");
             FileWriter dirFile = new FileWriter("directions.txt")) {
            for (Location location : locations.values()) {
                locFile.write(location.getLocationID() + "," + location.getDescription() + "\n");
                for (String direction : location.getExits().keySet()) {
                    dirFile.write(location.getLocationID() + "," + direction + "," + location.getExits().get(direction) + "\n");
                }
            }
        }
    }

    // Fill locations static value when the class is initially loaded
    static {
        try (Scanner locScanner = new Scanner(new FileReader("locations.txt"))) {
            locScanner.useDelimiter(",");
            while(locScanner.hasNextLine()) {
                int loc = locScanner.nextInt();
                locScanner.skip(locScanner.delimiter());
                String descrption = locScanner.nextLine();
                System.out.println("Imported loc: " + loc + ": " + descrption);
                Map<String, Integer> tempExit = new HashMap<>();
                locations.put(loc, new Location(loc, descrption, tempExit));
            }
            try (Scanner dirScanner = new Scanner(new BufferedReader(new FileReader("directions.txt")))) {
                dirScanner.useDelimiter(",");
                while(dirScanner.hasNextLine()) {
                    String input = dirScanner.nextLine();
                    String[] data = input.split(",");
                    int loc = Integer.parseInt(data[0]);
                    String direction = data[1];
                    int destination = Integer.parseInt(data[2]);

                    System.out.println(loc + ": " + direction + ": " + destination);
                    Location location = locations.get(loc);
                    location.addExit(direction, destination);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Override
    public int size() {
        return locations.size();
    }

    @Override
    public boolean isEmpty() {
        return locations.isEmpty();
    }

    @Override
    public boolean containsKey(Object key) {
        return locations.containsKey(key);
    }

    @Override
    public boolean containsValue(Object value) {
        return locations.containsValue(value);
    }

    @Override
    public Location get(Object key) {
        return locations.get(key);
    }

    @Override
    public Location put(Integer key, Location value) {
        return locations.put(key, value);
    }

    @Override
    public Location remove(Object key) {
        return locations.remove(key);
    }

    @Override
    public void putAll(Map<? extends Integer, ? extends Location> m) {
        // Skip
    }

    @Override
    public void clear() {
        locations.clear();
    }

    @Override
    public Set<Integer> keySet() {
        return locations.keySet();
    }

    @Override
    public Collection<Location> values() {
        return locations.values();
    }

    @Override
    public Set<Entry<Integer, Location>> entrySet() {
        return locations.entrySet();
    }
}
