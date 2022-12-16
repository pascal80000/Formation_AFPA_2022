import java.util.Scanner;

import static java.lang.System.in;

public class SommeInfN {
    public static void main(String[] args) {
        Integer n, somme=0, i;
        System.out.println("Entrer une valeur N: ");
        Scanner sc = new Scanner(in);
        n = (Integer.valueOf(sc.next()));
        for (i=1; i<n; i++)
        {
            somme = somme + i;
            System.out.println(i + "ième entier < à " + n);
        }
        System.out.println( "...................la somme est de : " + somme );
    }
}


