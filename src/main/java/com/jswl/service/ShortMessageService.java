package com.jswl.service;

import com.jswl.dao.mapper.ShortMessageMapper;
import com.jswl.dao.models.ShortMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Javaer on 2018/4/17.
 */
@Service
public class ShortMessageService {
    @Autowired
    private ShortMessageMapper shortMessageMapper;

    public int insertByShortMessage(ShortMessage shortMessage) {
        return shortMessageMapper.insert(shortMessage);
    }
}
