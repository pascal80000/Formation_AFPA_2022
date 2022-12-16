import java.util.Scanner;

import static java.lang.System.in;



public class Calculatrice
{
    public static void main(String[] args)
    {

        char operateur;
        double resultat = 0, val1 = 0, val2 = 0;


        //System.out.println("Saisir l'opérateur, puis les 2 opérandes (séparés par des virgules) ");

        Scanner sc = new Scanner(in);
        System.out.println("Entrer l'opérateur : ");
        operateur = sc.next();
        System.out.println("Entrer la première valeur : ");
        val1 = (sc.next());
        System.out.println("Entrer la seconde valeur : ");
        val2 = (sc.next());

        resultat = Calcul(operateur, val1, val2);
        System.out.println("Ce qui donne = " + (resultat));


        Calcul (operateur, val1, val2)
        {
            switch (operateur)
            {
                case "+":
                    resultat = (val1 + val2);
                    return resultat;
                break;
                case "-":
                    resultat = (val1 - val2);
                    return resultat;

                break;
                case "*":
                    resultat = (val1 * val2);
                    return resultat;

                break;
                case "/":
                    if (val2 != 0) {
                        resultat = (val1 / val2);
                        return resultat;

                    } else {
                        System.out.println("OHHHHH là  ON A DIT PAS DE DIVISION PAR ZERO !!!!!");
                    }
                    break;
                default:
                    System.out.println("  ERREUR, ");
            }
            return resultat;
        }
    }

    private static double Calcul(char operateur, double val1, double val2) {
        return 0;
    }
}