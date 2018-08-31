package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.PrizeMapper;
import com.tech.pojo.Prize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PrizeService {
    @Autowired
    PrizeMapper prizeMapper;

    public ServerResponse getAllPrize() {
        List<Prize> list = prizeMapper.selectAll();
        return ServerResponse.createBySuccess(list);
    }
}
