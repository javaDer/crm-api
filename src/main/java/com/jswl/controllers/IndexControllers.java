package com.jswl.controllers;

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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @RequestMapping(value = "/login")
    public ModelAndView login() {
        ModelAndView mv = new ModelAndView("login");
        return mv;
    }

    @RequestMapping(value = "/publish")
    public ModelAndView publish(String telphone, String homeid) {
        ModelAndView modelAndView = new ModelAndView();
        UserInfo user = new UserInfo();
        if (telphone != null && homeid != null) {
            user.setTelphone(telphone);
            user.setHomeid(homeid);
            UserInfo userInfo = userInfoService.selectByTelphoneAndHomeId(user);
            if (userInfo == null) {
                modelAndView.setViewName("login");
                return modelAndView;
            }
            modelAndView.setViewName("publish");
            modelAndView.addObject("telphone", telphone);
            modelAndView.addObject("homeid", homeid);
        } else {
            modelAndView.setViewName("login");
        }
        return modelAndView;
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
    public Map<String, Object> saveData(String begin_city, String end_city, String commander, String homeid, String telphone, String cargo_type, String date_time, Integer weight, Integer volume, String remake) {
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
}
