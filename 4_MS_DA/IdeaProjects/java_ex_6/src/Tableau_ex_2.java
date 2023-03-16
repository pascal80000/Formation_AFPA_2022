import java.util.ArrayList;

public class Tableau_ex_2 {
    public static void main(String[] args) {
        ArrayList<String> maliste = new ArrayList<String>();




        maliste.add("prenom1");
        maliste.add("prenom2");
        maliste.add("prenom3");
        maliste.add("prenom4");
        maliste.add("prenom5");

        System.out.println(maliste);

        maliste.get(1);
        maliste.remove(1);

        System.out.println(maliste);

        maliste.add("- - -");

        System.out.println(maliste);

        for (int i = 0; i < maliste.size(); i++) {
            System.out.println(maliste.get(i));
        }

        System.out.println("Maintenant avec foreach:");
        for (String i : maliste) {
            System.out.println(i);
        }


    }
}
