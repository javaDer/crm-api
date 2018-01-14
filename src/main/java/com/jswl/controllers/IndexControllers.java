package com.jswl.controllers;

import com.riversoft.weixin.common.jsapi.JsAPISignature;
import com.riversoft.weixin.mp.jsapi.JsAPIs;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Javaer on 2018/1/13.
 */
@Controller
public class IndexControllers {
    private static Logger logger = LoggerFactory.getLogger(IndexControllers.class);

    @RequestMapping(value = "/index")
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView("index");
        String url = "http://test.wwjswl.com";
        JsAPISignature jsSignature = JsAPIs.defaultJsAPIs().createJsAPISignature(url);
        logger.info(jsSignature.toString());
        jsSignature.setTimestamp(jsSignature.getTimestamp());
        modelAndView.addObject("signature", jsSignature );
        modelAndView.addObject("timestamp", jsSignature.getTimestamp() + "");
        return modelAndView;
    }
}
