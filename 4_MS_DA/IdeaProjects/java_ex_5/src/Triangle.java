import java.util.Scanner;

import static java.lang.System.in;

public class Triangle {
    public static void main(String[] args) {    // lvkgngjdlkjnlkj

        System.out.println("Combien de lignes tu veux ???  ");
        Scanner lig = new Scanner(in);
        Integer nbLignes = (Integer.valueOf(lig.next()));
        //System.out.println(lignes);

        //String str="";
        Integer i,j;
        String spaces, stars;

        for (i=1; i<nbLignes; i++)
        {
            System.out.println(" ".repeat(nbLignes-i)+("*".repeat(2*i-1)));
        }
    }
}
