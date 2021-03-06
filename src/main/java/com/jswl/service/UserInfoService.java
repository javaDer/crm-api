package com.jswl.service;

import com.jswl.dao.mapper.UserInfoMapper;
import com.jswl.dao.models.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Javaer on 2018/4/12.
 */
@Service
public class UserInfoService {
    @Autowired
    private UserInfoMapper userInfoMapper;

    public UserInfo selectByTelphone(String telphone) {
        UserInfo userInfo = userInfoMapper.selectByTelphone(telphone);
        return userInfo;
    }

    public UserInfo selectByTelphoneAndPwd(UserInfo user) {
        UserInfo userInfo = userInfoMapper.selectByTelphoneAndPwd(user);
        return userInfo;
    }


    public int updateAndInsertByTelphone(UserInfo user) {
        return userInfoMapper.updateAndInsertByTelphone(user);
    }

    public UserInfo selectByTelphoneAndHomeid(UserInfo userInfo) {
        UserInfo user = userInfoMapper.selectByTelphoneAndHomeid(userInfo);
        return user;
    }
}
