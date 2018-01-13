package com.jswl.controllers;

import com.riversoft.weixin.common.oauth2.AccessToken;
import com.riversoft.weixin.common.oauth2.OpenUser;
import com.riversoft.weixin.mp.oauth2.MpOAuth2s;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 微信授权登陆
 *
 * @author zhangzf
 * @create 2017-03-22 15:03
 **/
@Controller
public class WxOauthController {

    private static Logger logger = LoggerFactory.getLogger(WxOauthController.class);

    @Autowired

    @RequestMapping(value = "/wx_login/")
    public String wxLogin(HttpServletRequest request) {
        String redirect = "http://test.wwjswl.com/wxoauth/";
        String url = MpOAuth2s.defaultOAuth2s().authenticationUrl(redirect, "snsapi_userinfo", "state");
        System.out.print(url);
        logger.info(url);
        return "redirect:" + url;
    }

    @RequestMapping(value = "/wxoauth/")
    public String wxOauth(String code, HttpServletRequest request) {

        AccessToken wxAccessToken = MpOAuth2s.defaultOAuth2s().getAccessToken(code);
        String openid = wxAccessToken.getOpenId();
        OpenUser wxUser = MpOAuth2s.defaultOAuth2s().userInfo(wxAccessToken.getAccessToken(), openid);
        return "redirect:/index";
    }
}