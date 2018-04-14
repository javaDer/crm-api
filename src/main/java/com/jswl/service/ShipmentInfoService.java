package com.jswl.service;

import com.github.pagehelper.PageHelper;
import com.jswl.dao.mapper.ShipmentInfoMapper;
import com.jswl.dao.models.ShipmentInfo;
import com.jswl.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Javaer on 2018/3/1.
 */
@Service
public class ShipmentInfoService {
    @Autowired
    private ShipmentInfoMapper shipmentInfoMapper;

    public int saveData(ShipmentInfo shipmentInfo) {
        int flag = shipmentInfoMapper.insert(shipmentInfo);
        return flag;
    }

    public List<ShipmentInfo> findItemByPage(int currentPage, int pageSize) {
        //设置分页信息，分别是当前页数和每页显示的总记录数【记住：必须在mapper接口中的方法执行之前设置该分页信息】
        PageHelper.startPage(currentPage, pageSize);
        List<ShipmentInfo> allShipmentInfo = shipmentInfoMapper.selectByAll();
        int countNums = shipmentInfoMapper.countShipmentInfo();
        PageBean<ShipmentInfo> pageData = new PageBean<>(currentPage, pageSize, countNums);
        pageData.setItems(allShipmentInfo);
        return pageData.getItems();
    }
}
