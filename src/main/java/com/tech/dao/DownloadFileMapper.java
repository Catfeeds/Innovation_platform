package com.tech.dao;

import com.tech.pojo.DownloadFile;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DownloadFileMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DownloadFile record);

    int insertSelective(DownloadFile record);

    DownloadFile selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DownloadFile record);

    int updateByPrimaryKey(DownloadFile record);

    List<DownloadFile> selectAll();

    List<DownloadFile> selectPart(Integer count);

    String getFileNameById(Integer id);

    int selectCount();

    int selectSeachCountByKey(String key);

    List<DownloadFile> selectSeachByKey(String key);

    List<DownloadFile> selectSearch(@Param("key") String key,@Param("condition") String condition);

    int selectSearchCount(@Param("key") String key,@Param("condition") String condition);
}