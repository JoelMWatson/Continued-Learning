package sample;

import javafx.fxml.FXML;
import javafx.scene.control.DialogPane;
import javafx.scene.control.TextField;
import sample.datamodel.Contact;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 1/4/2020
 * Project: Contacts
 * Description: ...
 */

public class DialogController {

    @FXML
    private DialogPane dialogPane;

    @FXML
    private TextField fname;

    @FXML
    private TextField lname;

    @FXML
    private TextField phone;

    @FXML
    private TextField notes;

    public Contact processResults() {
        return new Contact(fname.getText(), lname.getText(), phone.getText(), notes.getText());
    }

    public Contact updateContact(Contact contact) {
        contact.setFirstName(fname.getText());
        contact.setLastName(lname.getText());
        contact.setPhoneNumber(phone.getText());
        contact.setNotes(notes.getText());
        return contact;
    }

    public void fillForm(Contact contact) {
        fname.setText(contact.getFirstName());
        lname.setText(contact.getLastName());
        phone.setText(contact.getPhoneNumber());
        notes.setText(contact.getNotes());
    }

}
