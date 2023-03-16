import java.util.Scanner;
import static java.lang.Long.valueOf;
import static java.lang.System.in;
import static java.lang.System.out;

public class Conversion {
    public static void main (String[] args)
    {
        System.out.println("Entrer la T° en °F :");
        Scanner sc = new Scanner(in);
        double te = Long.parseLong(sc.next());
        float div = (5f / 9f);
        //System.out.println(div);
        double co = ((te - 32) * div );
        System.out.println(te+"°F="+co+"°C");
    }
}
