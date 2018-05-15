import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class Examples {

    public static void main(String[] args) {
        String[] myStrings = {"1", "2", "3", "2"};
        System.out.println(toString(wordMultiple(myStrings)));
    }

    public static Map<String, Boolean> wordMultiple(String[] strings) {
        Map<String, Boolean> counts = new HashMap<>();
        System.out.println("in");
        for (String str : strings) {
            System.out.println("str");
            Boolean curCount = counts.get(str);
            if (curCount == null) {
                System.out.println("null");
                counts.put(str, false);
            } else {
                System.out.println("found");
                counts.put(str, true);
            }
        }
        return counts;
    }

    public static <K, V> String toString(Map<K, V> map) {
        StringBuilder sb = new StringBuilder();
        Iterator<Map.Entry<K, V>> iter = map.entrySet().iterator();
        while (iter.hasNext()) {
            Map.Entry<K, V> entry = iter.next();
            sb.append(entry.getKey());
            sb.append('=').append('"');
            sb.append(entry.getValue());
            sb.append('"');
            if (iter.hasNext()) {
                sb.append(',').append(' ');
            }
        }
        return sb.toString();
    }
}
