package org.afpa.baseclients;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;

public class App extends Application {

    static  Stage Accueil = new Stage();


    @Override

    public void start(Stage stage) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("App.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        Accueil.setTitle("Accueil");
        Accueil.setScene(scene);
        Accueil.show();
    }

    public static void main(String[] args) {
        launch(args);
    }


}

