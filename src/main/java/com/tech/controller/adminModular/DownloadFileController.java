package com.tech.controller.adminModular;

import com.tech.common.ServerResponse;
import com.tech.pojo.DownloadFile;
import com.tech.service.DownloadFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DownloadFileController {
    @Autowired
    DownloadFileService downloadFileService;

//    @RequestMapping("/downloads")
//    @ResponseBody
//    public ServerResponse<String> listDownloadFile(){
//        List<DownloadFile> downloadFiles = downloadFileService.getAll();
//        return ServerResponse.createBySuccess();
//    }

}
