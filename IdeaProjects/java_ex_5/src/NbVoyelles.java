import java.util.Scanner;
import static java.lang.System.in;

public class NbVoyelles {
    public static void main(String[] args) {    // lvkgngjdlkjnlkj

        String chaine;
        String voyelles = "aeiouy";
        //char scannee;
        Integer longueur=0, trouvees=0, i=0, j=0;

        System.out.println("Entrer une chaîne de caractères (alphabétiques):");
        Scanner chr= new Scanner(in);
        chaine = chr.next();
        longueur = chaine.length();

        System.out.println("La chaîne comporte " + longueur + " lettres,");

        for (i=0; i<longueur; i++)
            {
                char lettre = chaine.charAt(i);

                for (j=0; j<5; j++)
                {

                    char scannee = voyelles.charAt(j);
                    if (lettre == scannee){
                        trouvees++;
                    }

                }




/*                if (lettre == 'a'|| lettre == 'e' || lettre == 'i' || lettre == 'o' || lettre == 'u' || lettre == 'y')
                {trouvees++;}
*/
            }
        System.out.println("J'ai trouvé " + trouvees + " voyelles.");
        }
    }
