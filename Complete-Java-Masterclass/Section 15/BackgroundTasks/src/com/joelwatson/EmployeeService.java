package com.joelwatson;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.concurrent.Service;
import javafx.concurrent.Task;

public class EmployeeService extends Service<ObservableList<String>> {
    @Override
    protected Task<ObservableList<String>> createTask() {
        return new Task<ObservableList<String>>() {
            @Override
            protected ObservableList<String> call() throws Exception {

                String[] names = {
                        "Tim Buchalka",
                        "Jim johnson",
                        "Ronald Mcdonald",
                        "Joel Watson",
                        "Tyler Bradshaw"
                };

                ObservableList<String> employees = FXCollections.observableArrayList();

                for (int i = 0; i < 5; i++) {
                    employees.add(names[i]);
                    updateMessage("Added " + names[i] + " to the list");
                    updateProgress(i + 1, 5);
                    Thread.sleep(200);
                }

                return employees;
            }
        };
    }
}
