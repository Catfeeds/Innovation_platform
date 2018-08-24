package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.CompeteMapper;
import com.tech.pojo.Compete;
import com.tech.pojo.GoodWork;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompeteService {

    @Autowired
    CompeteMapper competeMapper;

    public int getAllCount() {
        return competeMapper.selectAllCount();
    }

    public List<Compete> getAllCompete() {
        return competeMapper.selectAllCompete();
    }

    public Compete getById(Integer id) {
        return competeMapper.selectByPrimaryKey(id);
    }

    public ServerResponse insertCompete(Compete compete) {
        int count = competeMapper.insert(compete);
        if (count>0){
            return ServerResponse.createBySuccessMessage("add_success");
        }
        return ServerResponse.createByErrorMessage("add_fail");
    }

    public ServerResponse updateCompete(Compete compete) {
        int count = competeMapper.updateByPrimaryKeySelective(compete);
        if (count>0){
            return ServerResponse.createBySuccessMessage("update_success");
        }
        return ServerResponse.createByErrorMessage("update_fail");
    }

    public ServerResponse deleteCompete(Integer id) {
        int count = competeMapper.deleteByPrimaryKey(id);
        if (count>0){
            return ServerResponse.createBySuccessMessage("delete_success");
        }
        return ServerResponse.createByErrorMessage("delete_fail");
    }
}
