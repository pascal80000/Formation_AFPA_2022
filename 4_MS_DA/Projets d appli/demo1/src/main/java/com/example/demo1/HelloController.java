package com.example.demo1;

import javafx.fxml.FXML;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;

import java.sql.Connection;
import java.sql.DriverManager;

public class HelloController {
    public TableView table;
    public TableColumn colFou;
    public ComboBox comboFou;
    @FXML
    private Label welcomeText;

    @FXML
    protected void onHelloButtonClick() {
        welcomeText.setText("Welcome to JavaFX Application!");

        String url = "jdbc:mysql://localhost:3306/papyrus";

        try
        {

            //String url ="jdbc:mysql://localhost:3306/papyrus";
            Connection con= DriverManager.getConnection(url,"admin","1122");

            System.out.println ("ça marche ");

        }
        catch(Exception e)
        {
            System.out.println ("la connexion a échoué");
        }
    }
}