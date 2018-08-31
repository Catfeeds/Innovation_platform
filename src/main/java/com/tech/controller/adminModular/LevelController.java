package com.tech.controller.adminModular;

import com.tech.common.ServerResponse;
import com.tech.service.LevelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/manage")
public class LevelController {

    @Autowired
    LevelService levelService;

    @RequestMapping("/getLevel")
    @ResponseBody
    public ServerResponse getAllLevel(){
        return levelService.getALL();
    }
}
