public class Numbers {

    public static int solution(int A, int B) {
        String word = new StringBuilder().append(B).toString();
        return word.indexOf(Integer.toString(A));

    }

    public static void main(String[] args) {
        System.out.println(solution(53,1953786));
        System.out.println(solution(53,1953786) == 2);
        System.out.println(solution(54,1953786));
        System.out.println(solution(54,1953786) == -1);
        System.out.println(solution(78,195378678));
        System.out.println(solution(78,195378678) == 4);
        System.out.println(solution(0,0));
        System.out.println(solution(0,0) == 0);
        System.out.println(solution(0,5));
        System.out.println(solution(0,5) == -1);
        System.out.println(solution(5,-5));
        System.out.println(solution(5,-5) == 1);
        System.out.println(solution(0,999999999));
        System.out.println(solution(0,999999999) == -1);
    }
}
