package com.tech.controller.adminModular;

import com.tech.common.ServerResponse;
import com.tech.pojo.Levels;
import com.tech.service.LevelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
public class LevelController {

    @Autowired
    LevelService levelService;

    @RequestMapping("/getLevel")
    @ResponseBody
    public ServerResponse getAllLevel(){
        List<Levels> list = levelService.getALL();
        return ServerResponse.createBySuccess(list);
    }

}
