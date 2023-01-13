package org.afpa.gui;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.scene.control.Label;
import javafx.scene.control.Slider;

import java.lang.Object;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.layout.Region;
import javafx.scene.control.Control;
import javafx.scene.control.TextInputControl;



import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.util.converter.NumberStringConverter;

public class MixerController {

    public AnchorPane Mixer;
    public Slider R_Slider;
    public Slider G_Slider;
    public Slider B_Slider;
    public Label Melange;
    public TextField R_Level;
    public TextField G_Level;
    public TextField B_Level;

    public void initialize(){

        int Rouge, Vert, Bleu;
        String TRouge, TVert, TBleu;

        AnchorPane Mixer;
        Label Melange;


        return R_Slider.valueProperty().addListener(new ChangeListener<>() {
            @Override
            public void changed(ObservableValue<? extends Number> observable, Number oldValue, Number newValue) {
            }


            Rouge =R_Slider.getValue();


            //public R_Level.promptText(Rouge.toString());

            String TRouge = NumberStringConverter.toString(Rouge);



            R_Level.setText(TRouge);
        }
