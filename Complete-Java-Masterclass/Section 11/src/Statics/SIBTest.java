package Statics;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/12/2019
 * Project: Section 11
 * Description: ...
 */

public class SIBTest {
    public static final String owner;

    static {
        owner = "tim";
        System.out.println("SIBTest static initialization block called");
    }

    public SIBTest() {
        System.out.println("Constructed");
    }

    static {
        System.out.println("2nd Static");
    }

    public void someMethod() {
        System.out.println("Some Method Called");
    }
}
