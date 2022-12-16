import java.util.Scanner;

import static java.lang.Integer.valueOf;
import static java.lang.System.in;

public class Parite {
    public static void main(String[] args) {
        System.out.println("Entrer le nombre à tester :");
        Scanner sc = new Scanner(in);
        int Valeur = valueOf(sc.next());

        if ((Valeur % 2) == 0 )
            {
            System.out.println(" Le nombre " + Valeur + " est PAIR");
            }
        else {
            System.out.println(" Le nombre " + Valeur + " est IMPAIR");
        }
    }
}

