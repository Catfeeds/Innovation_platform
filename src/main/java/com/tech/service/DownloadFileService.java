package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.DownloadFileMapper;
import com.tech.pojo.DownloadFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DownloadFileService {
    @Autowired
    DownloadFileMapper downloadFileMapper;

    public List<DownloadFile> getAll() {
        List<DownloadFile> downloadFiles = downloadFileMapper.selectAll();
        return downloadFiles;
    }

    public List<DownloadFile> getPartByCount(Integer count) {
        List<DownloadFile> downloadFiles = downloadFileMapper.selectPart(count);
        return downloadFiles;
    }

    public int getAllCount() {
        return downloadFileMapper.selectCount();
    }

    public ServerResponse<String> insertDownloadFile(DownloadFile downloadFile) {
        int count = downloadFileMapper.insert(downloadFile);
        if (count>0){
            return ServerResponse.createBySuccessMessage("添加下载文件成功");
        }else{
            return ServerResponse.createByErrorMessage("添加下载文件失败");
        }
    }

    public ServerResponse<String> updateDownloadFile(DownloadFile downloadFile) {
        int count = downloadFileMapper.updateByPrimaryKeySelective(downloadFile);
        if (count>0){
            return ServerResponse.createBySuccessMessage("更新下载文件成功");
        }else{
            return ServerResponse.createByErrorMessage("更新下载文件失败");
        }
    }

    public ServerResponse<String> deleteDownloadFile(Integer id) {
        int count = downloadFileMapper.deleteByPrimaryKey(id);
        if (count>0){
            return ServerResponse.createBySuccessMessage("删除成功");
        }else{
            return ServerResponse.createByErrorMessage("删除失败");
        }
    }

    public DownloadFile getById(Integer id) {
        return downloadFileMapper.selectByPrimaryKey(id);
    }

    public int getSeachCountByKey(String key) {
        return downloadFileMapper.selectSeachCountByKey(key);
    }

    public List<DownloadFile> getSeachByKey(String key) {
        return downloadFileMapper.selectSeachByKey(key);
    }

    public List<DownloadFile> getSearch(String key, String condition) {
        return downloadFileMapper.selectSearch(key,condition);
    }

    public int getSearchCount(String key, String condition) {
        return downloadFileMapper.selectSearchCount(key,condition);
    }
}
