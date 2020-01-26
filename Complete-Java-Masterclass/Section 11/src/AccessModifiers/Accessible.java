package AccessModifiers;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/11/2019
 * Project: Section 11
 * Description: ...
 */

/*
1. package-private -
2. package-private - public static final since in an interface
3. public to all   -
4. package-private - public - methods of an interface is always public
 */
interface Accessible {
    int SOME_CONSTANT = 100;
    public void methodA();
    void methodB();
    boolean methodC();
}
