import java.util.Scanner;
import static java.lang.System.in;
public class EntiersInfaN {
    public static void main(String[] args) {
        Integer n, somme, i;
        System.out.println("Entrer une valeur N: ");
        Scanner sc = new Scanner(in);
        n = (Integer.valueOf(sc.next()));
        for (i=1; i<n; i++){
            System.out.println(i + "ième entier < à " + n );
        }
    }
}
