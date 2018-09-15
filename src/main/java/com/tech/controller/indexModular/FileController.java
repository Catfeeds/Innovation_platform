package com.tech.controller.indexModular;

import com.tech.common.Const;
import com.tech.common.ResponseCode;
import com.tech.common.ServerResponse;
import com.tech.pojo.Student;
import com.tech.service.FileService;
import com.tech.service.StudentService;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;;

@Controller
public class FileController {
    @Autowired
    FileService fileService;
    @Autowired
    StudentService studentService;

    private Logger logger = LoggerFactory.getLogger(FileService.class);

    /**
     * 获取文件下载
     * @param session
     * @param id
     * @return
     */
    @RequestMapping("/download_file/{id}")
    public String downloadFile(HttpSession session, @PathVariable("id")Integer id, RedirectAttributes attr){
        Object object = session.getAttribute(Const.CURRENT_USER);
        //判断用户是否登录
        if (object==null){
            attr.addFlashAttribute("message","请登录后重新请求下载~");
            return "redirect:/login.html";
        }else{
            String filename = fileService.getFileNameById(id);
            return "forward:/download.do?fileName="+filename;
        }
    }

    @RequestMapping("/file_download")
    public String enrollFileDownload(String filename){
        return "forward:/download.do?fileName="+filename;
    }

    /**
     * 头像文件上传
     * @param file
     * @param request
     * @return
     */
    @RequestMapping("/userFace_upload")
    @ResponseBody
    public ServerResponse<String> uploadFile(MultipartFile file, HttpServletRequest request, HttpSession session){
        Student student = (Student) session.getAttribute(Const.CURRENT_USER);
        if (student==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"请登录后重试");
        }
        if (file==null)
            return ServerResponse.createByErrorMessage("获取上传文件失败");
        String path = request.getSession().getServletContext().getRealPath("upload/userFace");
        ServerResponse serverResponse = fileService.upload(file,path);
        if (serverResponse.isSuccess()){
            String saveUrl = request.getContextPath() + "/upload/userFace/"+serverResponse.getMsg();
            Student newStudent = new Student();
            newStudent.setSno(student.getSno());
            newStudent.setImgurl(saveUrl);
            newStudent.setUpdateTime(new Date());
            serverResponse = studentService.updateStudentImg(newStudent);
            if (serverResponse.isSuccess()){
                session.setAttribute(Const.CURRENT_USER,studentService.getInfoExceptPwdBySno(student.getSno()));
                return ServerResponse.createBySuccess("更新头像成功,刷新即可",saveUrl);
            }
        }
        return serverResponse;
    }

    /**
     * 文件下载
     * @param fileName
     * @return
     * @throws IOException
     */
    @RequestMapping("/download")
    public ResponseEntity<byte[]> downloadFile(String fileName, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String path = request.getSession().getServletContext().getRealPath("/");
        HttpHeaders headers = new HttpHeaders();
        File file = new File(path,fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", fileName);
        try {
            logger.info("下载文件{}",fileName);
            ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
            return entity;
        }catch (Exception e){
            logger.info("文件不存在{}",fileName);
            response.setContentType("text/html; charset=utf-8");
            PrintWriter out;
            out = response.getWriter();
            out.print("<script>alert('文件不存在~');</script>");
            out.flush();
            return null;
        }
    }
}
