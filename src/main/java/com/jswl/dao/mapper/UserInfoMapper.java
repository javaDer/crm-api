package com.jswl.dao.mapper;

import com.jswl.dao.models.UserInfo;

public interface UserInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);

    UserInfo selectByTelphone(String telphone);

    UserInfo selectByTelphoneAndPwd(UserInfo user);

    int updateAndInsertByTelphone(UserInfo user);
}