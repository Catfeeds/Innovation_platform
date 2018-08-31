package com.tech.controller.adminModular;

import com.github.pagehelper.PageHelper;
import com.tech.common.Const;
import com.tech.common.ServerResponse;
import com.tech.pojo.Admin;
import com.tech.pojo.DownloadFile;
import com.tech.service.DownloadFileService;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage")
public class DownloadFileController {
    @Autowired
    DownloadFileService downloadFileService;

    @RequestMapping("/to_download_list")
    public String toShowDownloadPage(){
        return "Admin/download_list";
    }

    @RequestMapping("/to_download_add")
    public String toShowDownloadAddPage(Model model){
        model.addAttribute("action","add");
        return "Admin/download_edit";
    }

    @RequestMapping("/to_download_edit/{id}")
    public String toShowDownloadEditPage(Model model,@PathVariable("id") Integer id){
        model.addAttribute("download",downloadFileService.getById(id));
        model.addAttribute("action","edit");
        return "Admin/download_edit";
    }


    @RequestMapping(value = "/download_list",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String toShowDownloadPage(Integer page,Integer limit){
        int count = downloadFileService.getAllCount();
        PageHelper.startPage(page,limit);
        List<DownloadFile> list = downloadFileService.getAll();
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", list);
        return Json.toJson(map);
    }

    @RequestMapping("/download_add")
    @ResponseBody
    public ServerResponse<String> addDownloadFile(DownloadFile downloadFile){
        downloadFile.setCreateTime(new Date());
        downloadFile.setUpdateTime(new Date());
        ServerResponse<String> serverResponse =  downloadFileService.insertDownloadFile(downloadFile);
        return serverResponse;
    }

    @RequestMapping("/download_update")
    @ResponseBody
    public ServerResponse<String> updateDownloadFile(DownloadFile downloadFile,HttpSession session){
        downloadFile.setUpdateTime(new Date());
        ServerResponse<String> serverResponse =  downloadFileService.updateDownloadFile(downloadFile);
        return serverResponse;
    }

    @RequestMapping("/download_delete/{id}")
    @ResponseBody
    public ServerResponse<String> deleteDownloadFile(@PathVariable("id") Integer id){
        ServerResponse<String> serverResponse =  downloadFileService.deleteDownloadFile(id);
        return serverResponse;
    }

}
