module com.joelwatson.db {
    requires java.sql;
    requires sqlite.jdbc;
    requires transitive com.joelwatson.common;

    exports com.joelwatson.db;
}