package com.tech.service;

import com.tech.dao.ExcellentMapper;
import com.tech.dao.MemberMapper;
import com.tech.pojo.Excellent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TotalService {

    @Autowired
    MemberMapper memberMapper;
    @Autowired
    ExcellentMapper excellentMapper;

    public int getCountBySno(String sno) {
        int count = memberMapper.selectCountBySno(sno);
        return count;
    }

    public int getMatchPCount(Integer matchID) {
        //TODO 修改
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

    /**
     * 
     * @param id
     * @param time
     * @param pId
     * @return
     */
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

    public int getPrizePeopleCountByCompeteLevel(Integer id) {
        return excellentMapper.selectPrizePeopleCountByCompeteLevel(id);
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
}
