package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.CompeteMapper;
import com.tech.pojo.Compete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
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

    public ServerResponse checkTime(Integer id) {
        Compete compete = competeMapper.selectByPrimaryKey(id);
        Calendar date = Calendar.getInstance();
        date.setTime(new Date());

        Calendar after = Calendar.getInstance();
        after.setTime(compete.getStartTime());

        Calendar before = Calendar.getInstance();
        before.setTime(compete.getEndTime());

        if (date.after(after)&&date.before(before)){
            return ServerResponse.createBySuccess("时间校验成功",date);
        }else{
            return ServerResponse.createByErrorDataMessage("报名时间不符",date);
        }
    }

    public Integer getIdByName(String competeName) {
        return competeMapper.selectIdByName(competeName);
    }

    public List<Compete> getAllCompeteNoTimeOut() {
        return competeMapper.selectAllCompeteNoTimeOut();
    }
}
