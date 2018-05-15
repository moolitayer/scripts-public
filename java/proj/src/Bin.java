import java.util.Arrays;

public class Bin {
    public static int solution(int n) {
        int[] d = new int[30];
        int l = 0;
        int p;
        while (n > 0) {
            d[l] = n % 2;
//            System.out.printf("d[%d]=%d\n", l, d[l]);
            n /= 2;
//            System.out.printf("n=%d\n", n);
            l++;
        }
        // l = 3
        System.out.printf("l=%d\n", l);

        System.out.println(Arrays.toString(d));
        for (p = 1; p < 1 + l; ++p) { // p = 1, .. 3
            int i;
            boolean ok = true;
            for (i = 0; i < l - p; ++i) { // 0 .. 2, 0.. 1
                if (d[i] != d[i + p]) { // d[1] != d[1+1]
                    ok = false;
                    break;
                }
            }
            if (ok) {
                return p;
            }
        }
        return -1;
    }

    public static void main(String[] args) {
        System.out.println(solution(4)); // 100, l=
//        System.out.println(solution(5)); // 101

    }
}
