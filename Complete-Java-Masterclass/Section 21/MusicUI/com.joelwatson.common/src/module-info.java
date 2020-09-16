module com.joelwatson.common {
    requires java.sql;
    requires javafx.base;

    opens com.joelwatson.common to javafx.base;

    exports com.joelwatson.common;
}