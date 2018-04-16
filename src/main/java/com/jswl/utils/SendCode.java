package com.jswl.utils;

import com.google.common.annotations.VisibleForTesting;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Random;

/**
 * Created by JavaDer on 2018-04-12.
 */
public class SendCode {
    public static String sendCode(String tel) {
        String result = "";
        String pushUrl = "http://web.duanxinwang.cc/asmx/smsservice.aspx";
        String type = "pt";
        // 用户名
        String name = "dxwwwjswly";
        // 密码
        String pwd = "18149834EE7208273C81F8C8A4CC";
        // 电话号码字符串，中间用英文逗号间隔
        StringBuffer mobileString = new StringBuffer(tel);
        String verifyCode = String
                .valueOf(new Random().nextInt(899999) + 100000);
        // 内容字符串
        StringBuffer contextString = new StringBuffer(verifyCode + " (货源发布平台注册验证码)，请在20分钟内完成注册。如非本人操作，请忽略。");
        // 签名
        String sign = "武威市金沙物流园";
        // 追加发送时间，可为空，为空为及时发送
        String stime = "";
        // 扩展码，必须为数字 可为空
        StringBuffer extno = new StringBuffer();
        try {
            result = doPost(pushUrl, name, pwd, mobileString, contextString, sign, stime, extno);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(result);
        return result;
    }

    public static String doPost(String pushUrl, String name, String pwd,
                                StringBuffer mobileString, StringBuffer contextString,
                                String sign, String stime, StringBuffer extno) throws Exception {
        StringBuffer param = new StringBuffer();
        param.append("name=" + name);
        param.append("&pwd=" + pwd);
        param.append("&mobile=").append(mobileString);
        param.append("&content=").append(URLEncoder.encode(contextString.toString(), "UTF-8"));
        param.append("&stime=" + stime);
        param.append("&sign=").append(URLEncoder.encode(sign, "UTF-8"));
        param.append("&type=pt");
        param.append("&extno=").append(extno);

        URL localURL = new URL(pushUrl);
        URLConnection connection = localURL.openConnection();
        HttpURLConnection httpURLConnection = (HttpURLConnection) connection;

        httpURLConnection.setDoOutput(true);
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setRequestProperty("Accept-Charset", "utf-8");
        httpURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        httpURLConnection.setRequestProperty("Content-Length", String.valueOf(param.length()));

        OutputStream outputStream = null;
        OutputStreamWriter outputStreamWriter = null;
        InputStream inputStream = null;
        InputStreamReader inputStreamReader = null;
        BufferedReader reader = null;
        String resultBuffer = "";

        try {
            outputStream = httpURLConnection.getOutputStream();
            outputStreamWriter = new OutputStreamWriter(outputStream);

            outputStreamWriter.write(param.toString());
            outputStreamWriter.flush();

            if (httpURLConnection.getResponseCode() >= 300) {
                throw new Exception("HTTP Request is not success, Response code is " + httpURLConnection.getResponseCode());
            }

            inputStream = httpURLConnection.getInputStream();
            resultBuffer = convertStreamToString(inputStream);

        } finally {

            if (outputStreamWriter != null) {
                outputStreamWriter.close();
            }

            if (outputStream != null) {
                outputStream.close();
            }

            if (reader != null) {
                reader.close();
            }

            if (inputStreamReader != null) {
                inputStreamReader.close();
            }

            if (inputStream != null) {
                inputStream.close();
            }

        }

        return resultBuffer;
    }


    /**
     * 转换返回值类型为UTF-8格式.
     *
     * @param is
     * @return
     */
    public static String convertStreamToString(InputStream is) {
        StringBuilder sb1 = new StringBuilder();
        byte[] bytes = new byte[4096];
        int size = 0;

        try {
            while ((size = is.read(bytes)) > 0) {
                String str = new String(bytes, 0, size, "UTF-8");
                sb1.append(str);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return sb1.toString();
    }

}

