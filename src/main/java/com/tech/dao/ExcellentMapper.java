package com.tech.dao;

import com.tech.pojo.Excellent;
import com.tech.pojo.Item;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ExcellentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Excellent record);

    int insertSelective(Excellent record);

    Excellent selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Excellent record);

    int updateByPrimaryKey(Excellent record);

    int selectAllCount();

    List<Excellent> selectAll();

    List<Excellent> selectByLevelId(Integer id);

    int selectGetPrizeItemCountByLevelId(Integer id);

    List<Excellent> selectNumberOfPeopleByPrizeIDLevelID(@Param("prizeId") Integer id,@Param("levelId") Integer levelId);

    int selectPrizePeopleCountByCompeteLevel(Integer levelId);

    int selectPrizeItemCountByCompeteLevelWithSelective(@Param("levelId") Integer levelId,@Param("time") String time, @Param("pId")Integer pId);

    int selectPrizePeopleCountByLevelIdPrizeIdWithSelective(@Param("prizeId") Integer prizeId, @Param("levelId") Integer levelId,@Param("time") String time, @Param("pId")Integer pId);

    int selectPrizeItemCountByLevelIdPrizeIdWithSelective(@Param("prizeId") Integer prizeId, @Param("levelId") Integer levelId,@Param("time") String time, @Param("pId")Integer pId);

    int selectPrizePeopleCountByCompeteLevelWithSelective(@Param("levelId")Integer id, @Param("time") String time, @Param("pId")Integer pId);

    int selectSearchCount(String key);

    List<Excellent> selectSearch(String key);

    int selectSelectiveCount(@Param("time") String time, @Param("pId") Integer pId);

    List<Excellent> selectSelective(@Param("time") String time, @Param("pId") Integer pId);

    Integer selectPIdByPName(String professionName);

    List<Excellent> selectPrizeItemBySno(String sno);
}