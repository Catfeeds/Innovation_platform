package com.tech.dao;

import com.tech.pojo.DownloadFile;

public interface DownloadFileMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DownloadFile record);

    int insertSelective(DownloadFile record);

    DownloadFile selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DownloadFile record);

    int updateByPrimaryKey(DownloadFile record);
}