package com.jswl.controllers;

import cn.hutool.crypto.SecureUtil;
import com.alibaba.fastjson.JSON;
import com.jswl.dao.models.ShipmentInfo;
import com.jswl.dao.models.UserInfo;
import com.jswl.service.ShipmentInfoService;
import com.jswl.service.UserInfoService;
import com.riversoft.weixin.common.jsapi.JsAPISignature;
import com.riversoft.weixin.mp.jsapi.JsAPIs;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Javaer on 2018/1/13.
 */
@Controller
public class IndexControllers {
    private static Logger logger = LoggerFactory.getLogger(IndexControllers.class);
    @Autowired
    private ShipmentInfoService shipmentInfoService;
    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping(value = "/index")
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView("index");
        String url = "http://test.wwjswl.com/index";
        JsAPISignature jsSignature = JsAPIs.defaultJsAPIs().createJsAPISignature(url);
        logger.info(jsSignature.toString());
        jsSignature.setTimestamp(jsSignature.getTimestamp());
        modelAndView.addObject("signature", jsSignature);
        modelAndView.addObject("timestamp", jsSignature.getTimestamp() + "");
        return modelAndView;
    }

    @RequestMapping(value = "/")
    public ModelAndView login() {
        ModelAndView mv = new ModelAndView("login");
        return mv;
    }


    @RequestMapping(value = "/publish")
    public ModelAndView publish(String telphone, String homeid) {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("publish");
//        modelAndView.addObject("telphone", telphone);
//        modelAndView.addObject("homeid", homeid);
        return modelAndView;
    }

    @RequestMapping(value = "/login")
    @ResponseBody
    public Map<String, Object> login(String telphone, String pwd) {
        Map<String, Object> map = new HashMap<String, Object>();
        UserInfo user = new UserInfo();
        if (telphone != null && pwd != null) {
            user.setTelphone(telphone);
            user.setPassword(SecureUtil.md5(pwd));
            UserInfo userInfo = userInfoService.selectByTelphoneAndPwd(user);
            //判断userInfo是否为空
            if (userInfo == null && "".equals(userInfo)) {
                map.put("msg", "密码错误");
                map.put("status", false);
            } else {
                map.put("msg", "登录成功");
                map.put("parameter", userInfo.getHomeid());
                map.put("status", true);
            }
        } else {
            map.put("msg", "电话号码,密码不能为空");
            map.put("status", false);
        }

        return map;
    }

    @RequestMapping(value = "/list")
    public ModelAndView list() {
        ModelAndView modelAndView = new ModelAndView("list");

        return modelAndView;
    }

    @RequestMapping("/itemsPage")
    @ResponseBody
    public List<ShipmentInfo> itemsPage(int currentPage, int pageSize) {
        return shipmentInfoService.findItemByPage(currentPage, pageSize);
    }

    @RequestMapping(value = "/save")
    @ResponseBody
    public Map<String, Object> saveData(String begin_city, String end_city, String commander, String homeid, String
            telphone, String cargo_type, String date_time, Integer weight, Integer volume, String remake) {
        ShipmentInfo shipmentInfo = new ShipmentInfo();
        Map<String, Object> map = new HashMap<String, Object>();
        Date date = new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());
        shipmentInfo.setBeginCity(delDistrict(begin_city));
        shipmentInfo.setHomeid(homeid);
        shipmentInfo.setTelphone(telphone);
        shipmentInfo.setBeginCity(delDistrict(begin_city));
        shipmentInfo.setCargoType(cargo_type);
        shipmentInfo.setCommander(commander);
        shipmentInfo.setEndCity(delDistrict(end_city));
        shipmentInfo.setLoadingTime(date_time);
        shipmentInfo.setReleaseDate(timeStamp);
        shipmentInfo.setRemarks(remake);
        shipmentInfo.setStatus(0);
        if (volume != null) {

            shipmentInfo.setVolume(volume);
        } else {
            shipmentInfo.setWeight(weight);
        }
        int flag = shipmentInfoService.saveData(shipmentInfo);
        if (flag > 0) {
            map.put("msg", "信息发布成功");
            map.put("success", true);

        } else {
            map.put("msg", "信息发布失败,请联系管理员");
            map.put("success", false);
        }

        return map;
    }

    public String delDistrict(String data) {
        String[] strArr = data.split("\\-");

        return strArr[0].toString() + "" + strArr[1].toString();
    }

    //    注册页面跳转
    @RequestMapping(value = "/reg")
    public ModelAndView reg() {
        ModelAndView mv = new ModelAndView("register");
        return mv;
    }

    @RequestMapping(value = "/submit_reg")
    @ResponseBody
    public Map<String, Object> submit_reg(String telphone, String homeid, String paw) {
//        根据电话号码查询房间号
        Map<String, Object> map = new HashMap<String, Object>();
        UserInfo user = userInfoService.selectByTelphone(telphone);
        if (user.getHomeid().equals(homeid)) {
            //密码md5加密
            String pws_md5 = SecureUtil.md5(paw);
            user.setPassword(pws_md5);
            user.setTelphone(telphone);
            int flag = userInfoService.updateAndInsertByTelphone(user);
            if (flag > 0) {
                map.put("msg", "注册成功,感谢使用金沙物流园信息发布平台!");
                map.put("status", true);
            } else {
                map.put("msg", "注册失败,请联系管理员!");
                map.put("status", true);
            }

        } else {
            map.put("msg", "房间信息与电话号码不匹配,请联系管理员!");
            map.put("status", false);
        }
        return map;
    }
}
