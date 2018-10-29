package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.*;
import com.tech.pojo.Excellent;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TotalService {
    @Autowired
    MemberMapper memberMapper;
    @Autowired
    ExcellentMapper excellentMapper;
    @Autowired
    LevelsMapper levelsMapper;
    @Autowired
    PrizeMapper prizeMapper;
    @Autowired
    StudentMapper studentMapper;

    public int getCountBySno(String sno) {
        int count = memberMapper.selectCountBySno(sno);
        return count;
    }

    public int getMatchPCount(Integer matchID) {
        int count = memberMapper.selectMatchPCount(matchID);
        return count;
    }

    public int getNumberOfPeopleByLevelID(Integer id) {
        List<Excellent> list = excellentMapper.selectByLevelId(id);
        int count = 0;
        for (Excellent e:list) {
            String members = e.getMembers();
            String[] strings = members.split("、");
            count += strings.length;
        }
        return count;
    }

    public int getNumberOfItemByLevelID(Integer id) {
        return excellentMapper.selectGetPrizeItemCountByLevelId(id);
    }

    public int getNumberOfPeopleByPrizeIDLevelID(Integer id, Integer levelId) {
        List<Excellent> list = excellentMapper.selectNumberOfPeopleByPrizeIDLevelID(id,levelId);
        int count = 0;
        for (Excellent e:list) {
            String members = e.getMembers();
            String[] strings = members.split("、");
            count += strings.length;
        }
        return count;
    }

    public int getPrizePeopleCountByCompeteLevelWithSelective(Integer id,String time,Integer pId) {
        if(time==null){
            return excellentMapper.selectPrizePeopleCountByCompeteLevelWithSelective(id,null,pId);
        }else{
            try {
                String startTime = time.split("~")[0].split("-")[0] + "." + time.split("~")[0].split("-")[1];
                String endTime = time.split("~")[1].split("-")[0] + "." + time.split("~")[1].split("-")[1];
                time = startTime.replace(" ","") + "~" + endTime.replace(" ","");
                return excellentMapper.selectPrizePeopleCountByCompeteLevelWithSelective(id,time,pId);
            }catch (Exception e){
                throw new RuntimeException("错误");
            }
        }
    }

    public int getPrizeItemCountByCompeteLevelWithSelective(Integer id,String time,Integer pId) {
        if(time==null){
            return excellentMapper.selectPrizeItemCountByCompeteLevelWithSelective(id,null,pId);
        }else{
            try {
                String startTime = time.split("~")[0].split("-")[0] + "." + time.split("~")[0].split("-")[1];
                String endTime = time.split("~")[1].split("-")[0] + "." + time.split("~")[1].split("-")[1];
                time = startTime.replace(" ","") + "~" + endTime.replace(" ","");
                return excellentMapper.selectPrizeItemCountByCompeteLevelWithSelective(id,time,pId);
            }catch (Exception e){
                throw new RuntimeException("错误");
            }
        }
    }

    public int getPrizePeopleCountByLevelIdPrizeIdWithSelective(Integer prizeId, Integer levelId,String time,Integer pId) {
        if(time==null){
            return excellentMapper.selectPrizePeopleCountByLevelIdPrizeIdWithSelective(prizeId,levelId,null,pId);
        }else{
            try {
                String startTime = time.split("~")[0].split("-")[0] + "." + time.split("~")[0].split("-")[1];
                String endTime = time.split("~")[1].split("-")[0] + "." + time.split("~")[1].split("-")[1];
                time = startTime.replace(" ","") + "~" + endTime.replace(" ","");
                return excellentMapper.selectPrizePeopleCountByLevelIdPrizeIdWithSelective(prizeId,levelId,time,pId);
            }catch (Exception e){
                throw new RuntimeException("错误");
            }
        }
    }

    public int getPrizeItemCountByLevelIdPrizeIdWithSelective(Integer prizeId, Integer levelId,String time,Integer pId) {
        if(time==null){
            return excellentMapper.selectPrizeItemCountByLevelIdPrizeIdWithSelective(prizeId,levelId,null,pId);
        }else{
            try {
                String startTime = time.split("~")[0].split("-")[0] + "." + time.split("~")[0].split("-")[1];
                String endTime = time.split("~")[1].split("-")[0] + "." + time.split("~")[1].split("-")[1];
                time = startTime.replace(" ","") + "~" + endTime.replace(" ","");
                return excellentMapper.selectPrizeItemCountByLevelIdPrizeIdWithSelective(prizeId,levelId,time,pId);
            }catch (Exception e){
                throw new RuntimeException("错误");
            }
        }
    }

    /**
     * 优秀项目导入
     * @param list
     * @return
     */
    public ServerResponse<List<Excellent>> dateImport(List<Excellent> list) {
        for (Excellent e:list) {
            //! 设置赛事级别ID.
            e.setCompeteLevel(levelsMapper.selectIdByName(e.getLevelName()));
            //! 设置奖项ID
            e.setPrizeId(prizeMapper.selectIdByName(e.getPrizeName()));
            //! 设置专业ID
            e.setProfessionID(excellentMapper.selectPIdByPName(e.getProfessionName()));

            if(e.getPrizeId()==null){
                throw new RuntimeException("参赛题目为:"+e.getTitle()+" 的记录导入失败,\n 原因:奖项设置可能存在问题！ ");
            }else if(e.getProfessionID()==null){
                throw new RuntimeException("参赛题目为:"+e.getTitle()+" 的记录导入失败,\n 原因:专业名称可能存在问题！");
            }else if(e.getCompeteLevel()==null){
                throw new RuntimeException("参赛题目为:"+e.getTitle()+" 的记录导入失败,\n 原因:赛事级别可能存在问题！");
            }

            //校验成员是否存在
            String[] members = e.getMembers().trim().split("、");
            String sno;
            for (String name:members) {
                if (StringUtils.isBlank(name)) continue;
                sno = studentMapper.selectSnoBySname(name);
                if (sno == null) {
                    throw new RuntimeException("学生库中不存在名为:" + name + " 的学生!");
                }
            }

            try {
                excellentMapper.insert(e);
            }catch (Exception ex){
                throw new RuntimeException("参赛题目为:"+e.getTitle()+" 的记录导入失败,\n原因:不明！");
            }
        }
        return ServerResponse.createBySuccess(list);
    }
}
