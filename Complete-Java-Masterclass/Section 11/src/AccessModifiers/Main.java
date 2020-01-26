package AccessModifiers;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/11/2019
 * Project: Section 11
 * Description: ...
 */

public class Main {
    public static void main(String[] args) {
        Account joel = new Account("Joel");
        joel.deposit(1000);
        joel.calculateBalance();
        joel.withdraw(500);
        joel.calculateBalance();
        joel.withdraw(-200);
        joel.deposit(-20);
        joel.calculateBalance();
    }

}
