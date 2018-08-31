package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.LevelsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.Level;

@Service
public class LevelService {
    @Autowired
    LevelsMapper levelsMapper;

    public ServerResponse getALL(){
        List<Level> list = levelsMapper.selectAll();
        return ServerResponse.createBySuccess(list);
    }
}
