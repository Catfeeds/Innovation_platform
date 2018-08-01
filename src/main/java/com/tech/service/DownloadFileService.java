package com.tech.service;

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
}
