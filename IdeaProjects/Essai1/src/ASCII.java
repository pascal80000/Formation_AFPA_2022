import java.util.Scanner;

public class ASCII {
    public static void main (String[] args){

        int ascii;

        Scanner saisie = new Scanner(System.in);
        System.out.println("Entrer le code ASCII :");
        ascii = saisie.nextInt();
        char resultat = (char)ascii;
        System.out.println(" le codes ASCII " + ascii + " donne: " + resultat);
    }
}
