package com.tech.controller.studentModular;

import com.tech.service.MatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/stu")
public class StuMatchController {
    @Autowired
    MatchService matchService;

    @RequestMapping("/to_match_list")
    public String toMatchList(Model model){
        model.addAttribute("matches",matchService.getAllMatches());
        return "Student/match_list";
    }

    @RequestMapping("/to_enroll_match")
    public String toEnrollMatchPage(){
        return "Student/match_enroll";
    }
}
