package uz.lesson.test;

import java.util.HashMap;
import java.util.Map;

public class Test {
    public static void main(String[] args) {
        Map<Integer,String>map = new HashMap<>();
        map.put(17,"Firdavs");
        System.out.println(map.keySet());
        System.out.println(args[0]);
    }
}
