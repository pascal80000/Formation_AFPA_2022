import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

import static java.lang.Integer.valueOf;
import static java.lang.System.in;
public class Age {
    public static void main(String[] args) {
        Date cejour;
        Integer annee, an, age;
        Calendar cal = Calendar.getInstance();
        String redate;
        an = cal.get(Calendar.YEAR);
        System.out.println("Entrer votre année de naissance :");
        Scanner sc = new Scanner(in);
        annee = valueOf(sc.next());
        System.out.println(an);

        age = an - annee;
        System.out.println("Ton âge est:  "+ age + " ans");

    }
}

