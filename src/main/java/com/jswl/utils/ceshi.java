package com.jswl.utils;

import java.util.Arrays;

/**
 * Created by Javaer on 2018/3/2.
 */
public class ceshi {
    public static void main(String[] args) {
        String data = "贵州省-贵阳市-云岩区";
        String[] strArr = data.split("\\-");
//        String str = Arrays.toString(data.split("\\-"));
        System.out.println(strArr[1].toString());
        System.out.println(strArr[2].toString());

    }
}
