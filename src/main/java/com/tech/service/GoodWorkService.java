package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.GoodWorkMapper;
import com.tech.pojo.GoodWork;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodWorkService {
    @Autowired
    GoodWorkMapper goodWorkMapper;

    public List<GoodWork> getAllGoodWorks(){
        List<GoodWork> goodWorks = goodWorkMapper.selectAllGoodWorks();
        return goodWorks;
    }

    public ServerResponse insertGoodWork(GoodWork goodWork) {
        int count = goodWorkMapper.insert(goodWork);
        if (count>0){
            return ServerResponse.createBySuccessMessage("add_success");
        }
        return ServerResponse.createByErrorMessage("add_fail");
    }

    public ServerResponse updateGoodWork(GoodWork goodWork) {
        int count = goodWorkMapper.updateByPrimaryKeySelective(goodWork);
        if (count>0){
            return ServerResponse.createBySuccessMessage("update_success");
        }
        return ServerResponse.createByErrorMessage("update_fail");
    }

    public ServerResponse deleteGoodWork(Integer id) {
        int count = goodWorkMapper.deleteByPrimaryKey(id);
        if (count>0){
            return ServerResponse.createBySuccessMessage("delete_success");
        }
        return ServerResponse.createByErrorMessage("delete_fail");
    }
}
