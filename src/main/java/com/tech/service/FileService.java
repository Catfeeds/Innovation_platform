package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.DownloadFileMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class FileService {
    @Autowired
    DownloadFileMapper downloadFileMapper;

    private Logger logger = LoggerFactory.getLogger(FileService.class);
    /**
     * 文件上传
     * @param file
     * @param path
     * @return
     */
    public ServerResponse upload(MultipartFile file, String path){
        String fileName = file.getOriginalFilename();
        String fileExtsName = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
        List<String> extList = new ArrayList<>();
        extList.add("jpg");
        extList.add("png");
        extList.add("jpeg");
        if (!extList.contains(fileExtsName)){
            return ServerResponse.createByErrorMessage("上传文件扩展名是不允许的扩展名。");
        }
        String uploadFileName = UUID.randomUUID().toString()+"."+fileExtsName;

        logger.info("开始上传文件,上传文件的文件名:{},上传的路径:{},新文件名:{}",fileName,path,uploadFileName);
        File fileDir = new File(path);
        if (!fileDir.exists()){
            fileDir.setWritable(true);
            fileDir.mkdirs();
        }
        File targetFile = new File(path,uploadFileName);
        try {
            file.transferTo(targetFile);
            return ServerResponse.createBySuccessMessage(uploadFileName);
        } catch (IOException e) {
            logger.info("上传文件错误",e);
            return ServerResponse.createByErrorMessage("上传文件错误");
        }
    }

    public String getFileNameById(Integer id) {
        String attachment = downloadFileMapper.getFileNameById(id);
        return attachment;
    }
}
