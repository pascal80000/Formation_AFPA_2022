package org.afpa.baseclients;

import javafx.fxml.FXML;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class AppController {



    @FXML
        protected void onFournisseursButtonClick()
            {
            try {
                String url = "jdbc:mysql://localhost:3306/papyrus";
                Connection con = DriverManager.getConnection(url, "admin", "1122");
                System.out.println("Connexion a la base OK ");
                }
            catch (SQLException e)
                {
                System.out.println("la connexion a échoué");
                System.exit(0);

                }
            }
}
