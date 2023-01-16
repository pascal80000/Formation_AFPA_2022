package org.afpa.gui;

import javafx.beans.value.ChangeListener;
import javafx.event.EventHandler;
import javafx.scene.control.Label;
import javafx.scene.control.Slider;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;

public class MixerController {

    public AnchorPane Mixer;
    public Slider R_Slider;
    public Slider G_Slider;
    public Slider B_Slider;
    public Label Melange;
    public TextField R_Level;
    public TextField G_Level;
    public TextField B_Level;

    public void initialize() {

        AnchorPane Mixer;

        public Number Rouge, Vert, Bleu;
        R_Slider.valueProperty().addListener((ChangeListener<? super Number>) this);
        G_Slider.valueProperty().addListener((ChangeListener<? super Number>) this);
        B_Slider.valueProperty().addListener((ChangeListener<? super Number>) this);


        Rouge = Math.round(R_Slider.getValue());
        Vert = Math.round(G_Slider.getValue());
        Bleu = Math.round(B_Slider.getValue());


            }
        };

    //changeListener() -> updateMelange();


    }


     public void updateMelange() {



         R_Slider.setOnMouseReleased(e -> R_Level.setText(String.valueOf(Rouge)));
         G_Slider.setOnMouseReleased(e -> G_Level.setText(String.valueOf(Vert)));
         B_Slider.setOnMouseReleased(e -> B_Level.setText(String.valueOf(Bleu)));


         Melange.setStyle("-fx-background-color: rgb(" + Rouge + "," + Vert + "," + Bleu + "); -fx-background-radius: 13; --fx-border-color: yellow; -fx-border-width: 6; -fx-border-radius: 10");
         //Melange.setStyle("-fx-background-color: rgb(66,99,55)");
         // -fx-background-radius: 13; --fx-border-color: yellow; -fx-border-width: 6; -fx-border-radius: 10");
     }




    }





