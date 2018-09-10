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
            return ServerResponse.createBySuccessMessage("添加优秀教师成功");
        }
        return ServerResponse.createByErrorMessage("添加优秀教师失败");
    }

    public ServerResponse updateGoodTeacher(GoodTeacher goodTeacher) {
        int count = goodTeacherMapper.updateByPrimaryKeySelective(goodTeacher);
        if(count>0){
            return ServerResponse.createBySuccessMessage("更新优秀教师成功");
        }
        return ServerResponse.createByErrorMessage("更新优秀教师失败");
    }

    public ServerResponse deleteGoodTeacher(Integer id) {
        int count = goodTeacherMapper.deleteByPrimaryKey(id);
        if(count>0){
            return ServerResponse.createBySuccessMessage("删除优秀教师成功");
        }
        return ServerResponse.createByErrorMessage("删除优秀教师失败");
    }

    public GoodTeacher getById(Integer id) {
        return goodTeacherMapper.selectByPrimaryKey(id);
    }

    public int getAllCount() {
        return goodTeacherMapper.selectAllCount();
    }

    public int getSearchCount(String key) {
        return goodTeacherMapper.selectSearchCount(key);
    }

    public List<GoodTeacher> getSeach(String key) {
        return goodTeacherMapper.selectSearch(key);
    }

}
