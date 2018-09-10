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
            if(e.getEnrollId()==null){
                throw new RuntimeException("参赛题目为:"+e.getTitle()+" 的记录导入失败,\n原因:报名表中不存在该参赛题目名的数据！");
            }else if (e.getPrizeId()==null){
                throw new RuntimeException("参赛题目为:"+e.getTitle()+" 的记录导入失败,\n原因:奖项可能存在问题！");
            }else if(e.getCompeteId()==null){
                throw new RuntimeException("参赛题目为:"+e.getTitle()+" 的记录导入失败,\n原因:赛事名称可能存在问题！");
            }else if(e.getCompeteLevel()==null){
                throw new RuntimeException("参赛题目为:"+e.getTitle()+" 的记录导入失败,\n原因:赛事级别可能存在问题！");
            }
            int count = excellentMapper.insert(e);
            if (count<=0){
                throw new RuntimeException("参赛题目为:"+e.getTitle()+" 的记录导入失败,\n原因:不明！");
            }
        }
        return ServerResponse.createBySuccess("导入成功",list);
    }
}
