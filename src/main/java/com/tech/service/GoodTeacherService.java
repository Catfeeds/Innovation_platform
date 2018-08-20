package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.GoodTeacherMapper;
import com.tech.pojo.GoodTeacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodTeacherService {
    @Autowired
    GoodTeacherMapper goodTeacherMapper;

    public List<GoodTeacher> getAllGoodTeachers(){
        List<GoodTeacher> goodTeachers = goodTeacherMapper.selectAllGoodTeachers();
        return goodTeachers;
    }

    public ServerResponse insertGoodTeacher(GoodTeacher goodTeacher) {
        int count = goodTeacherMapper.insert(goodTeacher);
        if(count>0){
            return ServerResponse.createBySuccessMessage("add_success");
        }
        return ServerResponse.createByErrorMessage("add_fail");
    }

    public ServerResponse updateGoodTeacher(GoodTeacher goodTeacher) {
        int count = goodTeacherMapper.updateByPrimaryKeySelective(goodTeacher);
        if(count>0){
            return ServerResponse.createBySuccessMessage("update_success");
        }
        return ServerResponse.createByErrorMessage("update_fail");
    }

    public ServerResponse deleteGoodTeacher(Integer id) {
        int count = goodTeacherMapper.deleteByPrimaryKey(id);
        if(count>0){
            return ServerResponse.createBySuccessMessage("delete_success");
        }
        return ServerResponse.createByErrorMessage("delete_fail");
    }

    public GoodTeacher getById(Integer id) {
        return goodTeacherMapper.selectByPrimaryKey(id);
    }

    public int getAllCount() {
        return goodTeacherMapper.selectAllCount();
    }
}
