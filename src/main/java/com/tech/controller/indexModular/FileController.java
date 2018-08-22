package com.tech.controller.indexModular;

import com.tech.common.Const;
import com.tech.common.ResponseCode;
import com.tech.common.ServerResponse;
import com.tech.service.FileService;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class FileController {
    @Autowired
    FileService fileService;

    private Logger logger = LoggerFactory.getLogger(FileService.class);

    /**
     * 获取文件下载
     * @param session
     * @param id
     * @return
     */
    @RequestMapping("/download_file/{id}")
    public String downloadFile(HttpSession session,@PathVariable("id")Integer id){
        Object object = session.getAttribute(Const.CURRENT_USER);
        //判断用户是否登录
        if (object==null){
            return "redirect:/login.html";
        }else{
            String filename = fileService.getFileNameById(id);
            return "forward:/download.html?fileName="+filename;
        }
    }

    /**
     * 文件上传
     * @param file
     * @param request
     * @return
     */
    @RequestMapping("/upload")
    @ResponseBody
    public ServerResponse<String> uploadFile(MultipartFile file, HttpServletRequest request, HttpSession session){
        if (session.getAttribute(Const.CURRENT_USER)==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"请登录后重试");
        }
        if (file==null)
            return ServerResponse.createByErrorMessage("获取上传文件失败");
        String path = request.getSession().getServletContext().getRealPath("upload");
        String url = fileService.upload(file,path);
        if (StringUtils.isEmpty(url)){
            return ServerResponse.createByErrorMessage("上传文件失败");
        }
        return ServerResponse.createBySuccess("上传文件成功",url);
    }

    /**
     * 文件下载
     * @param fileName
     * @return
     * @throws IOException
     */
    @RequestMapping("/download")
    public ResponseEntity<byte[]> downloadFile(String fileName, HttpServletRequest request) throws IOException {
        String path = request.getSession().getServletContext().getRealPath("upload");
        HttpHeaders headers = new HttpHeaders();
        File file = new File(path,fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", fileName);
        try {
            ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
            return entity;
        }catch (Exception e){
            logger.info("文件不存在{}",fileName);
        }
        return null;
    }



}
