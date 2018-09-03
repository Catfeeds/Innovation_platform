package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.ExcellentMapper;
import com.tech.pojo.Excellent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExcellentService {

    @Autowired
    ExcellentMapper excellentMapper;

    public ServerResponse addExcellent(Excellent excellent) {
        int count = excellentMapper.insert(excellent);
        if (count>0){
            return ServerResponse.createBySuccessMessage("添加优秀作品成功");
        }else{
            return ServerResponse.createByErrorMessage("添加优秀作品失败");
        }
    }

    public int getAllCount() {
        return excellentMapper.selectAllCount();
    }

    public List<Excellent> getAllExcellent() {
        return excellentMapper.selectAll();
    }

    public Excellent getById(Integer id) {
        return excellentMapper.selectByPrimaryKeyWithTitle(id);
    }
}
