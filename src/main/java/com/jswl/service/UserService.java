package com.jswl.service;

import com.jswl.dao.mapper.UserModelMapper;
import com.jswl.dao.models.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Javaer on 2018/1/5.
 */
@Service
public class UserService {
    @Autowired
    private UserModelMapper userModelMapper;

    public int insert(UserModel userModel) {
        int flag = userModelMapper.insert(userModel);
        return flag;
    }
}
