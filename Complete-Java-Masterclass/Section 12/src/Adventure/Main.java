package Adventure;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/13/2019
 * Project: Section 12
 * Description: ...
 */

public class Main {

    private static Map<Integer, Location> locations = new HashMap<>();

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        Map<String, Integer> tempExit = new HashMap<>();
        locations.put(0, new Location(0,"You are sitting in front of your computer learning Java.", tempExit));

        tempExit = new HashMap<>();
        tempExit.put("W", 2);
        tempExit.put("E", 3);
        tempExit.put("S", 4);
        tempExit.put("N", 5);
        tempExit.put("Bad Example", 7);
        locations.put(1, new Location(1,"You are standing at the end of a road before a small brick building", tempExit));

        tempExit = new HashMap<>();
        tempExit.put("N", 5);
        locations.put(2, new Location(2,"You are at the top of a hill", tempExit));

        tempExit = new HashMap<>();
        tempExit.put("W", 1);
        locations.put(3, new Location(3,"You are inside a building, a well house for a small spring", tempExit));

        tempExit = new HashMap<>();
        tempExit.put("W", 2);
        tempExit.put("N", 1);
        locations.put(4, new Location(4,"You are in a valley beside a stream", tempExit));

        tempExit = new HashMap<>();
        tempExit.put("W", 2);
        tempExit.put("S", 1);
        locations.put(5, new Location(5,"You are in the forest", tempExit));


        int loc = 1;
        String move;
        while(true) {
            System.out.println(locations.get(loc).getDescription());
            if (loc == 0) {
                break;
            }

            Map<String, Integer> exits = locations.get(loc).getExits();
            System.out.println("Available exits are: ");
            for(String exit : exits.keySet()) {
                System.out.print(exit + ", ");
            }
            System.out.println();

            String[] sentence = scanner.nextLine().toLowerCase().split(" ");
            String direction = "Empty";
            for (String word : sentence) {
                if (word.equals("north") || word.equals("n")) {
                    direction = "N";
                    break;
                } else if (word.equals("south") || word.equals("s")) {
                    direction = "S";
                    break;
                } else if (word.equals("east") || word.equals("e")) {
                    direction = "E";
                    break;
                } else if (word.equals("west") || word.equals("w")) {
                    direction = "W";
                    break;
                } else if (word.equals("quit") || word.equals("q")) {
                    direction = "Q";
                    break;
                }
            }
            if (!exits.containsKey(direction)) {
                System.out.println("You cannot go in that direction");
            } else {
                loc = exits.get(direction);
            }

        }
    }

}
