import java.util.*;

public class Tableau_ex_3 {
    public static void main(String[] args) {

    System.out.println("<<<     TRI A BULLES     >>>");

            ArrayList<Integer> maliste = new ArrayList<Integer>();
        int i=0, j=0,temp=0;

            maliste.add(555);
            maliste.add(333);
            maliste.add(222);
            maliste.add(444);
            maliste.add(111);

            System.out.println("maliste original: " + maliste);
        int longueur = maliste.size();
        System.out.println("Taille de la liste = " + longueur);
            for (i=0; i<longueur-1; i++)
            {
                if (maliste.get(i) > maliste.get(i+1))
                {
                    System.out.println("nb1 > nb2  "+ i );
                    temp = maliste.get(i);
                    System.out.println(temp);
                    maliste.set(i, (maliste.get(i+1)));
                    maliste.set(i+1, temp);
                    i--;

                    System.out.println("i= " + i);
                }
            }

            System.out.println("liste triée = " + maliste);

Collections.sort(maliste);
System.out.println(" après un \'sort\'" + maliste);
    }
}


/*

    static void tri_bulle(int[] tab)
    {
        int taille = tab.length;
        int tmp = 0;
        for(int i=0; i < taille; i++)
        {
            for(int j=1; j < (taille-i); j++)
            {
                if(tab[j-1] > tab[j])
                {
                    tmp = tab[j-1];
                    tab[j-1] = tab[j];
                    tab[j] = tmp;
                }
            }
        }
    }
    static void displayTab(int[] tab)
    {
        for(int i=0; i < tab.length; i++)
        {
            out.print(tab[i] + " ");
        }
        out.println();
    }

    public static void main(String[] args)
    {
        int arr[] ={600, 385, 6, 43, 18, 69};

        out.println("---Avant le tri a bulle---");

        displayTab(arr);

        tri_bulle(arr);

        out.println("---Apres le tri a bulle---");

        displayTab(arr);
    }
}

 */
