module com.joelwatson.ui {
    requires javafx.fxml;
    requires javafx.controls;
    requires com.joelwatson.db;

    opens com.joelwatson.ui to javafx.fxml;

    exports com.joelwatson.ui to javafx.graphics, javafx.fxml;
}