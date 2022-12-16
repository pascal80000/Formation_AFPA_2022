import java.util.Scanner;

import static java.lang.Integer.valueOf;
import static java.lang.System.in;

public class Calculette {
    public static void main(String[] args) {
        Integer n1, n2;
        String enter;
        Boolean op;

        System.out.println("Entrer le premier opérande: ");
        Scanner sc = new Scanner(in);
        n1 = (valueOf(sc.next()));
        System.out.println(n1);


        System.out.println("Entrer le second opérande: ");
        Scanner sc2 = new Scanner(in);
        n2 = (valueOf(sc2.next()));
        System.out.println(n2);

        System.out.println("Entrer l'opérateur : ");
        Scanner ope = new Scanner(in);
        String operat = String.valueOf(ope.next());
        System.out.println("operateur : " + operat);

        switch (operat) {

            case "+":
                System.out.println( n1 + " + " + n2 + " = " + (n1 + n2));
                break;
            case "-":
                System.out.println( n1 + " - " + n2 + " = " + (n1-n2));
                break;
            case "*":
                System.out.println(n1 + " * " + n2 + " = " + (n1*n2));
                break;

            case "/":
                if (n2 != 0){
                    System.out.println(n1 + " / " + (n2) + " = " + (n1/n2));
                }
                else {
                    System.out.println("P..... de B..... de M....         2" +
                            "ON A DIT PAS DE DIVISION PAR ZERO !!!!!");

                }
                break;

            default:
                System.out.println("  ERREUR, ");
            }
        }
    }
