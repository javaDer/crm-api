package com.jswl.dao.mapper;

import com.jswl.dao.models.ShipmentInfo;

import java.util.List;

public interface ShipmentInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ShipmentInfo record);

    int insertSelective(ShipmentInfo record);

    ShipmentInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ShipmentInfo record);

    int updateByPrimaryKey(ShipmentInfo record);

    int countShipmentInfo();

    List<ShipmentInfo> selectByAll();
}