package com.joelwatson;

import javafx.collections.ObservableList;
import javafx.concurrent.Service;
import javafx.concurrent.Task;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.ProgressBar;

public class Controller {
    private Task<ObservableList<String>> task;

    @FXML
    private ListView listView;

    @FXML
    private ProgressBar progressBar;

    @FXML
    private Label progressLabel;

    private Service<ObservableList<String>> service;

    public void initialize() {
//        task = new Task<ObservableList<String>>() {
//            @Override
//            protected ObservableList<String> call() throws Exception {
//
//                String[] names = {
//                        "Tim Buchalka",
//                        "Jim johnson",
//                        "Ronald Mcdonald",
//                        "Joel Watson",
//                        "Tyler Bradshaw"
//                };
//
//                ObservableList<String> employees = FXCollections.observableArrayList();
//
//                for (int i=0; i<5; i++) {
//                    employees.add(names[i]);
//                    updateMessage("Added " + names[i] + " to the list");
//                    updateProgress(i + 1, 5);
//                    Thread.sleep(200);
//                }
//
//                return employees;
//            }
//        };

        // using a service allows javafx runtime to manage the threads for us
        service = new EmployeeService();
        progressLabel.textProperty().bind(service.messageProperty());
        progressBar.progressProperty().bind(service.progressProperty());
        listView.itemsProperty().bind(service.valueProperty());

//        // on run
//        service.setOnRunning(new EventHandler<WorkerStateEvent>() {
//            @Override
//            public void handle(WorkerStateEvent workerStateEvent) {
//                progressBar.setVisible(true);
//                progressLabel.setVisible(true);
//            }
//        });
//
//        // on success
//        service.setOnSucceeded(new EventHandler<WorkerStateEvent>() {
//            @Override
//            public void handle(WorkerStateEvent workerStateEvent) {
//                progressLabel.setVisible(false);
//                progressBar.setVisible(false);
//            }
//        });
//
//        // default
//        progressLabel.setVisible(false);
//        progressBar.setVisible(false);

        // property binding is much cleaner than above method with setOn methods
        progressBar.visibleProperty().bind(service.runningProperty());
        progressLabel.visibleProperty().bind(service.runningProperty());
    }

    @FXML
    public void buttonPressed() {
        if (service.getState() == Service.State.SUCCEEDED) {
            service.reset();
            service.start();
        } else if (service.getState() == Service.State.READY) {
            service.start();
        }
    }
}
