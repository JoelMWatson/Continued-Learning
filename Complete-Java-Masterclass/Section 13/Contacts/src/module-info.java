/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 1/4/2020
 * Project: Contacts
 * Description: ...
 */

module Contacts {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.xml;

    opens sample;
    opens sample.datamodel;
}