import org.germain.tool.ManaBox;
import org.junit.Assert;
import org.junit.Test;

import static java.lang.Math.random;


public class TransCoder {

        String KeyDecrypt = "CFfrkowl.aDzyS:eHjsGPZgMApWvRYVmtnK!BuU IQiEXTxbqhLdNJO,'c";
        int longueur = KeyDecrypt.length();
@Test
        /**
         *      Création de la clé
         *      de manière aléatoire
         *      */
        String cle;
        String chaine;
        chaine = "AZERTYUIOPMLKJHGFDSQWXCVBNazertyuiopmlkjhgfdsqwxcvbn!?.:=+-*/@# ";
        int lg = chaine.length();

        for (i=1; i<lg+1; i++){
                int index =  Math.round(lg*random());
                if (index !=0)
                {
                cle = cle + chaine(index);
                }



        }
}
