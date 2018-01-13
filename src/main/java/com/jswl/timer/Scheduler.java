package com.jswl.timer;

import com.riversoft.weixin.app.base.AppSetting;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.SQLException;

/**
 * Created by Javaer on 2018/1/13.
 */
@Component
public class Scheduler {
    private final Logger logger = Logger.getRootLogger();

    @Resource
    public void getAccessToken() throws SQLException {
        logger.info("==============开始获取access_token===============");
        String access_token = null;
        String grant_type = "client_credential";
        AppSetting appSetting = AppSetting.defaultSettings();
        String AppId = appSetting.getAppId();
        String secret = appSetting.getSecret();
        String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=" + grant_type + "&appid=" + AppId + "&secret=" + secret;
        try {
            URL urlGet = new URL(url);
            HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();
            http.setRequestMethod("GET");
            http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            http.setDoInput(true);
            http.setDoOutput(true);
            http.connect();
            InputStream is = http.getInputStream();
            int size = is.available();
            byte[] jsonBytes = new byte[size];
            is.read(jsonBytes);
            String message = new String(jsonBytes, "UTF-8");
            JSONObject demoJson = JSONObject.fromObject(message);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
