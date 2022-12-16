import java.util.Scanner;
import static java.lang.System.*;
public class Additionneur {

    public static void main (String[] args)
    {
        System.out.println("Entrer le premier nombre :");
        Scanner sc = new Scanner(in);
        Integer nombre1 = Integer.valueOf(String.valueOf(sc.next()));

        System.out.println("Entrer le second nombre : ");
        Scanner sd = new Scanner(in);
        Integer nombre2 = Integer.valueOf(String.valueOf(sd.next())) ;

        Integer resultat = (nombre1 / nombre2);
        System.out.println(nombre1+" / "+nombre2+" = "+resultat);
    }
}
