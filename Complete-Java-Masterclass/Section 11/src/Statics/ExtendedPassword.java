package Statics;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/12/2019
 * Project: Section 11
 * Description: ...
 */

public class ExtendedPassword extends Password {

    private int decryptedPassword;

    public ExtendedPassword(int password) {
        super(password);
        this.decryptedPassword = password;
    }
//  Ha cant do that now because declared as final method in password
//    @Override
//    public void storePassword() {
//        System.out.println("Saving password as " + this.decryptedPassword);
//    }
}
