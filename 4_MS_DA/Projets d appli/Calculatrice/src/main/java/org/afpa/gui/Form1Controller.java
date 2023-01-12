package org.afpa.gui;

import javafx.event.ActionEvent;
import javafx.scene.control.*;
import javafx.scene.layout.AnchorPane;

import java.lang.reflect.Array;
import java.util.ArrayList;

import static java.lang.Long.valueOf;

public class Form1Controller {
    public Button Btn1;
    public Button Btn2;
    public Button Btn3;
    public Button Btn4;
    public Button Btn5;
    public Button Btn6;
    public Button Btn7;
    public Button Btn8;
    public Button Btn9;
    public Button Btn0;
    public Button BtnPoint;
    public Button BtnPlus;
    public Button BtnMoins;
    public Button BtnFois;
    public Button BtnDivise;
    public TextField Afficheur;
    public Button BtnEnter;
    public ToggleButton BtnOnOff;
    public Button BtnC;
    public Button BtnAC;
    public TextField affiche_pile_x;
    public TextField affiche_pile_z;
    public TextField affiche_pile_y;
    public TextField affiche_pile_t;
    public Label Label_HP;
    public AnchorPane Form1;
    public TextField Affiche_i;
    public Slider SliderTest;


    String Saisie = "";
    boolean Point = false;                                          // création d'un 'flag' pour saisie du point (décimal)
    public long pile_x, pile_y, pile_z, pile_t, resultat = 0;
    ArrayList<Long> Saisies = new ArrayList<>();                    //  définition du tableau 'pile' de 4 cases
    public int i = 0;                                               //  init de l'index de la pile



    public void Btn1_click(ActionEvent clickListener) {
        Saisie += "1";
        Afficheur.setText(Saisie);
    }

    public void Btn2_click(ActionEvent actionEvent) {
        Saisie += "2";
        Afficheur.setText(Saisie);
    }

    public void Btn3_click(ActionEvent actionEvent) {
        Saisie += "3";
        Afficheur.setText(Saisie);
    }

    public void Btn4_click(ActionEvent actionEvent) {
        Saisie += "4";
        Afficheur.setText(Saisie);
    }

    public void Btn5_click(ActionEvent actionEvent) {
        Saisie += "5";
        Afficheur.setText(Saisie);
    }

    public void Btn6_click(ActionEvent actionEvent) {
        Saisie += "6";
        Afficheur.setText(Saisie);
    }

    public void Btn7_click(ActionEvent actionEvent) {
        Saisie += "7";
        Afficheur.setText(Saisie);
    }

    public void Btn8_click(ActionEvent actionEvent) {
        Saisie += "8";
        Afficheur.setText(Saisie);
    }

    public void Btn9_click(ActionEvent actionEvent) {
        Saisie += "9";
        Afficheur.setText(Saisie);
    }

    public void Btn0_click(ActionEvent actionEvent) {
        Saisie += "0";
        Afficheur.setText(Saisie);
    }

    public void BtnPoint_click(ActionEvent actionEvent) {
            if (! Point)                                    //  contrôle de l'existence d'un point
            {                                               //  pour éviter d'en saisir pluqieurs
                Saisie += ".";
                Point = true;
                Afficheur.setText(Saisie);
            }
        }

   public void BtnEnter_click(ActionEvent actionEvent) {        // click sur ENTER  =============================
       switch (i) {                                             //===============================================
           case 0:
               Saisies.set(0, Long.parseLong(Saisie));
               Affiche_i.setText(String.valueOf(i));
               affiche_pile_x.setText(String.valueOf(Saisies.get(0)));
               affiche_pile_y.setText(String.valueOf(Saisies.get(1)));
               affiche_pile_z.setText(String.valueOf(Saisies.get(2)));
               affiche_pile_t.setText(String.valueOf(Saisies.get(3)));
               i++;
               Afficheur.setText(Saisie);

               Saisie = "";
               break;



           case 1:
               Saisies.set(2, Saisies.get(1));
               Saisies.set(1, Saisies.get(0));

               Saisies.set(0, Long.parseLong(Saisie));
               Affiche_i.setText(String.valueOf(i));

               affiche_pile_x.setText(String.valueOf(Saisies.get(0)));
               affiche_pile_y.setText(String.valueOf(Saisies.get(1)));
               affiche_pile_z.setText(String.valueOf(Saisies.get(2)));
               affiche_pile_t.setText(String.valueOf(Saisies.get(3)));
               i++;
               Afficheur.setText(Saisie);
               Saisie = "";
               break;



           case 2:
               Saisies.set(3, Saisies.get(2));
               Saisies.set(2, Saisies.get(1));
               Saisies.set(1, Saisies.get(0));

               Saisies.set(0, Long.parseLong(Saisie));
               Affiche_i.setText(String.valueOf(i));

               affiche_pile_x.setText(String.valueOf(Saisies.get(0)));
               affiche_pile_y.setText(String.valueOf(Saisies.get(1)));
               affiche_pile_z.setText(String.valueOf(Saisies.get(2)));
               affiche_pile_t.setText(String.valueOf(Saisies.get(3)));
               i++;
               Afficheur.setText(Saisie);
               Saisie = "";
               break;



           case 3:
               Affiche_i.setText(String.valueOf(i));

               Afficheur.setText("Stack Overflow");
               Saisie = "";
               break;



           default:
               Affiche_i.setText(String.valueOf(i));

               Afficheur.setText("ERROR");
               break;


        }


    }

    public void BtnPlus_click(ActionEvent actionEvent) {
    }

    public void BtnMoins_click(ActionEvent actionEvent) {
    }

    public void BtnFois_click(ActionEvent actionEvent) {
    }

    public void BtnDivise_click(ActionEvent actionEvent) {
    }

    public void BtnC_click(ActionEvent actionEvent) {
    }

    public void BtnAC_click(ActionEvent actionEvent) {
        Saisie = "";
        for (i=0; i<4; i++){
            Saisies.set(i, (long) 0L);
        }
        Point = false;
        i=0;
        Afficheur.setText(Saisie);



    }

    public void BtnOnOff_click(ActionEvent actionEvent) {
    }




}
