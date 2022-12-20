module org.afpa.mapremierefenetre {
    requires javafx.controls;
    requires javafx.fxml;


    opens org.afpa.mapremierefenetre to javafx.fxml;
    exports org.afpa.mapremierefenetre;
}