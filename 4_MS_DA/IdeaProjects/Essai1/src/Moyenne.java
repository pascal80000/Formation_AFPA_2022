import java.util.Scanner;

import static java.lang.System.in;

public class Moyenne {
    public static void main (String[] args)
    {
        System.out.println("Entrer la première note: ");
        Scanner sc = new Scanner(in);
        float note1 = Long.parseLong(sc.next());
        System.out.println("N1 = "+note1);

        System.out.println("Entrer la seconde note: ");
        Scanner sd = new Scanner(in);
        float note2 = Long.parseLong(sd.next());
        System.out.println("N2 = "+note2);

        System.out.println("Entrer la troisième note: ");
        Scanner se = new Scanner(in);
        float note3 = Long.parseLong(se.next());
        System.out.println("N3 = "+note3);

        float notes1, notes2, notes3,moyenne;
        int coef1, coef2, coef3, sumcoef;
        coef1=3;
        coef2=2;
        coef3=1;
        sumcoef=(coef1 + coef2 + coef3);
        notes1 = (note1 * coef1);
        notes2 = (note2 * coef2);
        notes3 = (note3 * coef3);

        moyenne = (notes1+notes2+notes3)/sumcoef;

        System.out.println("Moyenne= " + moyenne);
    }
}
