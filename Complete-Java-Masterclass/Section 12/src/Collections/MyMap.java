package Collections;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/13/2019
 * Project: Section 12
 * Description: ...
 */

public class MyMap {

    public static void main(String[] args) {
        Map<String, String> languages = new HashMap<>();
        languages.put("Java", "a compiled high level, object-oriented, platform independant language.");
        languages.put("Python", "an interpreted, object oriented, high level programming language with dynamic semantics.");
        languages.put("Algol", "algorithic language");
        languages.put("BASIC", "Beginners All Purpose Symbolic Instruction Code");
        languages.put("BASIC", "Beginners All Purpose Symbolic Instruction Code");
        languages.put("Lisp", "here lies madness");

//        if (languages.containsKey("Java")) {
//            System.out.println("Java is already in the map");
//        }

        for (String key : languages.keySet()) {
            System.out.println(key + " : " + languages.get(key));
        }

        System.out.println(languages.replace("Lisp", "Nahh its great"));

        for (String key : languages.keySet()) {
            System.out.println(key + " : " + languages.get(key));
        }

//        languages.remove("Algol");
//        if (languages.remove("Lisp", "here lies madness")) {
//            System.out.println("Lisp removed");
//        } else {
//            System.out.println("Lisp not removed, key/value pair not found");
//        }
//

    }
}
