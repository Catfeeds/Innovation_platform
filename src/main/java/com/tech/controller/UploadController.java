package com.tech.controller;

import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class UploadController {

    @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
    @ResponseBody
    public void fileUpload(HttpServletRequest request,
                           HttpServletResponse response) {
        //文件保存目录路径
        String savePath = request.getServletContext().getRealPath("/")
                + "upload/";

        //文件保存目录URL
        String saveUrl = request.getContextPath() + "/upload/";

        //定义允许上传的文件扩展名
        HashMap<String, String> extMap = new HashMap<>();
        extMap.put("image", "gif,jpg,jpeg,png,bmp");
        extMap.put("flash", "swf,flv");
        extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
        extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

        //最大文件大小
        long maxSize = 1000000;

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();

            if (!ServletFileUpload.isMultipartContent(request)) {
                out.println(getError("请选择文件。"));
                return;
            }
            //检查目录
            File uploadDir = new File(savePath);
            if (!uploadDir.isDirectory()) {
                uploadDir.mkdirs();
            }
            //检查目录写权限
            if (!uploadDir.canWrite()) {
                out.println(getError("上传目录没有写权限。"));
                return;
            }

            String dirName = request.getParameter("dir");
            if (dirName == null) {
                dirName = "image";
            }
            if (!extMap.containsKey(dirName)) {
                out.println(getError("目录名不正确。"));
                return;
            }
            //创建文件夹
            savePath += dirName + "/";
            saveUrl += dirName + "/";
            File saveDirFile = new File(savePath);
            if (!saveDirFile.exists()) {
                saveDirFile.mkdirs();
            }
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
            String ymd = sdf.format(new Date());
            savePath += ymd + "/";
            saveUrl += ymd + "/";
            File dirFile = new File(savePath);
            if (!dirFile.exists()) {
                dirFile.mkdirs();
            }

            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("UTF-8");
            // 转换成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            // 取得request中的所有文件名
            Iterator<String> itr = multiRequest.getFileNames();
            while (itr.hasNext()) {
                // 取得上传文件 (遍历)
                MultipartFile file = multiRequest.getFile(itr.next());
                if (file != null) {
                    // 取得当前上传文件的文件名称
                    String fileName = file.getOriginalFilename();

                    //检查文件大小
                    if (file.getSize() > maxSize) {
                        out.println(getError("上传文件大小超过限制。"));
                        return;
                    }
                    //检查扩展名
                    String fileExt = fileName
                            .substring(fileName.lastIndexOf(".") + 1)
                            .toLowerCase();
                    if (!Arrays.<String> asList(extMap.get(dirName).split(","))
                            .contains(fileExt)) {
                        out.println(getError("上传文件扩展名是不允许的扩展名。\n只允许"
                                + extMap.get(dirName) + "格式。"));
                        return;
                    }

                    SimpleDateFormat df = new SimpleDateFormat(
                            "yyyyMMddHHmmss");
                    String newFileName = df.format(new Date()) + "_"
                            + new Random().nextInt(1000) + "." + fileExt;
                    try {
                        File uploadedFile = new File(savePath, newFileName);
                        file.transferTo(uploadedFile);
                    } catch (Exception e) {
                        out.println(getError("上传文件失败。"));
                        return;
                    }

                    JSONObject obj = new JSONObject();
                    obj.put("error", 0);
                    obj.put("url", saveUrl + newFileName);
                    out.println(obj.toJSONString());
                }
            }
        } catch (IOException e1) {
            e1.printStackTrace();
        }
    }

    private String getError(String message) {
        JSONObject obj = new JSONObject();
        obj.put("error", 1);
        obj.put("message", message);
        return obj.toJSONString();
    }
}
