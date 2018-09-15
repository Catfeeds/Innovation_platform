package com.tech.controller.studentModular;

import com.tech.common.Const;
import com.tech.common.ResponseCode;
import com.tech.common.ServerResponse;
import com.tech.pojo.Student;
import com.tech.service.CompeteService;
import com.tech.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/stu")
public class StuCompeteController {

    @Autowired
    CompeteService competeService;
    @Autowired
    StudentService studentService;

    @RequestMapping("/to_compete_list")
    public String toCompeteList(Model model){
        model.addAttribute("competes",competeService.getAllCompeteNoTimeOut());
        return "Student/compete_list";
    }

    @RequestMapping("/check_time/{competeId}")
    @ResponseBody
    public ServerResponse checkTime(@PathVariable("competeId") Integer id){
        ServerResponse serverResponse = competeService.checkTime(id);
        return serverResponse;
    }

    @RequestMapping("/to_compete_enroll/{id}")
    public String toEnrollCompetePage(Model model, HttpSession session, @PathVariable("id")Integer id) throws IOException {
        Student student = (Student) session.getAttribute(Const.CURRENT_USER);
        if (student==null){
            return "forward:/login.html";
        }
        model.addAttribute("stu",studentService.getInfoExceptPwdBySno(student.getSno()));
        model.addAttribute("compete",competeService.getById(id));
        return "Student/compete_enroll";
    }
}
