package com.tech.test;


import org.apache.commons.lang3.StringUtils;

public class TestFor {
    public static void main(String[] args) {
//        String[] strings = {"a","b","c"};
//        for (String s:strings) {
//            if(StringUtils.equals("b",s))
//                continue;
//            System.out.println(s);
//        }
        String members = "黄庭彬、梁艺可、、小红、";
        String[] strings = members.trim().split("、");
        System.out.println(strings.length);
        for (String s:strings) {
            if(StringUtils.isEmpty(s))
                continue;
            System.out.println(s);
        }
    }
}
