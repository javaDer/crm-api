package com.jswl.controllers;

import com.jswl.dao.models.UserModel;
import com.jswl.service.UserService;
import org.apache.commons.collections4.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * Created by Javaer on 2018/1/5.
 */
@RestController
@RequestMapping(value = "/api")
@CrossOrigin
public class APIControllers {
    private static Logger logger = LoggerFactory.getLogger(APIControllers.class);

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/record", method = RequestMethod.POST)
    public Map<String, Object> addRecord(UserModel userModel) {
        Map<String, Object> map = new HashedMap<String, Object>();
        int flag = userService.insert(userModel);
        if (flag >= 1) {
            map.put("message", "信息录入成功");
        }
        return map;
    }


}
