package sample;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.BorderPane;
import sample.datamodel.Contact;
import sample.datamodel.ContactData;

import java.io.IOException;
import java.util.Optional;

public class Controller {

    private ContactData data = new ContactData();

    @FXML
    private BorderPane mainBorderPane;

    @FXML
    private TableView<Contact> tableView;

    @FXML
    private TableColumn<Contact, String> fNameCol;

    @FXML
    private TableColumn<Contact, String> lNameCol;

    @FXML
    private TableColumn<Contact, String> phoneCol;

    @FXML
    private TableColumn<Contact, String> notesCol;

    public void initialize() {
        // Sets column widths
        tableView.setColumnResizePolicy(TableView.CONSTRAINED_RESIZE_POLICY);

        // Get data
        data.loadContacts();

        // Set up columns for data (Could also do in xml like main.fxml)
        fNameCol.setCellValueFactory(new PropertyValueFactory<Contact, String>("firstName"));
        lNameCol.setCellValueFactory(new PropertyValueFactory<Contact, String>("lastName"));
        phoneCol.setCellValueFactory(new PropertyValueFactory<Contact, String>("phoneNumber"));
        notesCol.setCellValueFactory(new PropertyValueFactory<Contact, String>("notes"));

        // Place data in table
        tableView.setItems(data.getContacts());
        tableView.getSelectionModel().selectFirst();
    }

    @FXML
    public void handleShowDialog() {
        Dialog<ButtonType> dialog = new Dialog<>();
        dialog.initOwner(mainBorderPane.getScene().getWindow());
        dialog.setTitle("Add New Contact");
        dialog.setHeaderText("Use this dialog to create a new contact");
        FXMLLoader fxmlLoader = new FXMLLoader();
        fxmlLoader.setLocation(getClass().getResource("ContactDialog.fxml"));
        try {
            dialog.getDialogPane().setContent(fxmlLoader.load());
        } catch (IOException e) {
            System.out.println("Couldn't load the dialog");
            e.printStackTrace();
            return;
        }

        dialog.getDialogPane().getButtonTypes().add(ButtonType.OK);
        dialog.getDialogPane().getButtonTypes().add(ButtonType.CANCEL);

        Optional<ButtonType> result = dialog.showAndWait();
        if (result.isPresent() && result.get() == ButtonType.OK) {
            DialogController controller = fxmlLoader.getController();
            Contact newContact = controller.processResults();
            data.addContact(newContact);
            data.saveContacts();
            tableView.getSelectionModel().select(newContact);
        }
    }

    @FXML
    public void handleEditContact() {
        Contact contact = tableView.getSelectionModel().getSelectedItem();

        Dialog<ButtonType> dialog = new Dialog<>();
        dialog.initOwner(mainBorderPane.getScene().getWindow());
        dialog.setTitle("Edit Contact");
        dialog.setHeaderText("Use this dialog to edit a contact");
        FXMLLoader fxmlLoader = new FXMLLoader();
        fxmlLoader.setLocation(getClass().getResource("ContactDialog.fxml"));
        try {
            dialog.getDialogPane().setContent(fxmlLoader.load());
        } catch (IOException e) {
            System.out.println("Couldn't load the dialog");
            e.printStackTrace();
            return;
        }

        dialog.getDialogPane().getButtonTypes().add(ButtonType.OK);
        dialog.getDialogPane().getButtonTypes().add(ButtonType.CANCEL);

        DialogController controller = fxmlLoader.getController();
        controller.fillForm(contact);

        Optional<ButtonType> result = dialog.showAndWait();
        if (result.isPresent() && result.get() == ButtonType.OK) {
            controller.updateContact(contact);
            // This refresh is required because we set up cell factory in code note in fxml
            tableView.refresh();
            data.saveContacts();
        }
    }

    @FXML
    public void handleRemoveContact() {
        Contact contact = tableView.getSelectionModel().getSelectedItem();
        Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
        alert.setTitle("Delete Contact");
        alert.setHeaderText("Delete Contact: " + contact.getFirstName() + " " + contact.getLastName());
        alert.setContentText("Are you sure? Press OK to confirm, or Cancel to back out.");
        Optional<ButtonType> result = alert.showAndWait();

        if (result.isPresent() && result.get() == ButtonType.OK) {
            data.deleteContact(contact);
            data.saveContacts();
        }
    }
}
