package Statics;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/11/2019
 * Project: Section 11
 * Description: ...
 */

public class StaticTest {

    private static int numInstance = 0;
    private String name;

    public StaticTest(String name) {
        this.name = name;
        numInstance++;
    }

    public static int getNumInstance() {
        return numInstance;
    }

    public String getName() {
        return name;
    }
}
