package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.EnrollMapper;
import com.tech.pojo.Enroll;
import com.tech.pojo.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnrollService {
    @Autowired
    EnrollMapper enrollMapper;

    public ServerResponse<String> addEnroll(Enroll enroll){
        int count =  enrollMapper.insert(enroll);
        if (count>0){
            return ServerResponse.createBySuccess();
        }else{
            return ServerResponse.createByError();
        }
    }

}
