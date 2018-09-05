package com.tech.service;

import com.tech.dao.LevelsMapper;
import com.tech.pojo.Levels;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LevelService {
    @Autowired
    LevelsMapper levelsMapper;

    public List<Levels> getALL(){
        List<Levels> list = levelsMapper.selectAll();
        return list;
    }
}
