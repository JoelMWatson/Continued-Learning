package Statics;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/11/2019
 * Project: Section 11
 * Description: ...
 */

public class Main {

    public static int classCounter = 0;
    public final int INSTANCE;
    private String name;

    public Main(String name) {
        this.INSTANCE = ++classCounter;
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public static void main(String[] args) {
//        Main test1 = new Main("1st Instance");
//        Main test2 = new Main("2nd Instance");
//        Main test3 = new Main("3rd Instance");
//
//
//        System.out.println(test1.getName() + " is instance number " + test1.INSTANCE + " / " + Main.classCounter);
//        System.out.println(test2.getName() + " is instance number " + test2.INSTANCE + " / " + Main.classCounter);
//        System.out.println(test3.getName() + " is instance number " + test3.INSTANCE + " / " + Main.classCounter);
//
////        Math m = new Math(); // private initializer
//
//        int num = 723799;
//        Password password = new ExtendedPassword(num);
//        password.storePassword();
//        password.letMeIn(1);
//        password.letMeIn(5);
//        password.letMeIn(723799);

        System.out.println("Main Method Called");
        SIBTest test = new SIBTest();

        test.someMethod();

        System.out.println("Owner: " + SIBTest.owner);

    }

}
