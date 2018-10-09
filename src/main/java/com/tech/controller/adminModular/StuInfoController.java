package com.tech.controller.adminModular;

import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import com.github.pagehelper.PageHelper;
import com.tech.common.ServerResponse;
import com.tech.pojo.Student;
import com.tech.service.StudentService;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage")
public class StuInfoController {
    @Autowired
    StudentService studentService;

    @RequestMapping("/to_student_info_list")
    public String toShowStudentInfo(){
        return "Admin/student_info_list";
    }

    /**
     * 学生数据导入
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/student_import",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse studentImport(MultipartFile file) throws Exception {
        ImportParams params = new ImportParams();
        params.setTitleRows(0);
        params.setHeadRows(1);
        List<Student> list = ExcelImportUtil.importExcel(file.getInputStream(),
                Student.class, params);
        try {
           studentService.insertList(list);
        }catch (RuntimeException ex){
            return ServerResponse.createByErrorMessage(ex.getMessage());
        }
        return ServerResponse.createBySuccessMessage("导入成功");
    }

    /**
     * 学生信息展示
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value = "/student_info_list",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String studentInfoList(Integer page,Integer limit){
        int count = studentService.getAllCount();
        PageHelper.startPage(page,limit);
        List<Student> list = studentService.getAllStudent();
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", list);
        return Json.toJson(map);
    }

    @RequestMapping(value = "/student_search",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String studentSearch(Integer page,Integer limit,String key){
        int count = studentService.getSearchCount(key);
        PageHelper.startPage(page,limit);
        List<Student> list = studentService.getSearch(key);
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", list);
        return Json.toJson(map);
    }


}
