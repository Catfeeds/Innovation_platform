package com.tech.controller.adminModular;

import com.github.pagehelper.PageHelper;
import com.tech.common.ServerResponse;
import com.tech.pojo.Excellent;
import com.tech.service.ExcellentService;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage")
public class ExcellentController {
    @Autowired
    ExcellentService excellentService;

    @RequestMapping("/add_excellent")
    @ResponseBody
    public ServerResponse addExcellent(Excellent excellent){
        ServerResponse serverResponse = excellentService.add(excellent);
        return serverResponse;
    }

    @RequestMapping(value = "/excellent_list",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String excellentList(Integer page,Integer limit){
        int count = excellentService.getAllCount();
        PageHelper.startPage(page,limit);
        List<Excellent> list = excellentService.getAll();
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", list);
        return Json.toJson(map);
    }
}
