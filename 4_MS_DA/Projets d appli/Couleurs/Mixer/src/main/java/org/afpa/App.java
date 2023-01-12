package org.afpa;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

//import java.io.IOException;

public class App extends Application {

    public static void main(String[] args) { launch(args); }

    @Override
    public void start(Stage primaryStage) throws Exception {
        //FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("Mixer.fxml"));
        Parent root = FXMLLoader.load(getClass().getResource("gui/Mixer.fxml"));

        Scene scene = new Scene(root);

        //Scene scene = new Scene(fxmlLoader.load());
        //stage.setTitle("Mélangeur");
        //stage.setScene(scene);
        //stage.show();

        primaryStage.setScene(scene);
        primaryStage.setResizable(false);
        primaryStage.show();
    }


}
