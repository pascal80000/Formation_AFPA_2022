import java.util.Scanner;

import static java.lang.Integer.parseInt;
import static java.lang.Math.round;
import static java.lang.System.in;

public class ConversionHeures {
    public static void main (String[] args){

        int hh, mm, ss, sec;
        int h, m, s, r;

        Scanner saisie = new Scanner(System.in);

        System.out.println("Entrer le nombre de secondes :");
        sec = saisie.nextInt();

        System.out.println("je note : " + sec + " secondes");

        if (sec>3600)
            {
            h = round(sec / 3600);
            r = sec % 3600;
            m = round(r/60);
            s = r % 60;
            //System.out.println("ça fait: " + h + ":" + m + ":" + s );
                System.out.printf("ça fait %d:%d:%d",h,m,s);        // %d : format d comme digit (chiffre)
            }                                                       // ou %s format s comme string (chaîne)

        else if (sec > 60)
            {
            m = sec / 60;
            r = sec % 60;
            System.out.println("m= " + m + " reste : " + r + " secondes");
            }
        }
    }

