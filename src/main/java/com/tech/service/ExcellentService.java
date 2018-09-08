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

    public ServerResponse add(Excellent excellent) {
        int count = excellentMapper.insert(excellent);
        if (count>0){
            return ServerResponse.createBySuccessMessage("添加获奖作品成功");
        }else {
            return ServerResponse.createByErrorMessage("添加获奖作品失败");
        }
    }

    public int getAllCount() {
        return excellentMapper.selectAllCount();
    }

    public List<Excellent> getAll() {
        return excellentMapper.selectAll();
    }

    public ServerResponse addExcellentList(List<Excellent> list) {
        for (Excellent e:list) {
            int count = excellentMapper.insert(e);
            if (count<=0){
                return ServerResponse.createByErrorDataMessage("导入获奖作品失败",e);
            }
        }
        return ServerResponse.createBySuccess("导入成功",list);
    }
}
