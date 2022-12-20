public class Math {
            public static int Factorielle(int a) {
            if (a <= 1)
                return 1;
            return a * Factorielle(a - 1);
        }
    }


