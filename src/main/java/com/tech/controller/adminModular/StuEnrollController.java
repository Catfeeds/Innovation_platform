package com.tech.controller.adminModular;

import com.github.pagehelper.PageHelper;
import com.tech.common.ServerResponse;
import com.tech.pojo.Enroll;
import com.tech.pojo.Item;
import com.tech.service.EnrollService;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage")
public class StuEnrollController {
    @Autowired
    EnrollService enrollService;

    @RequestMapping("/to_enroll_detail/{id}")
    public String toItemDetail(@PathVariable("id") Integer id, Model model){
        Item item = enrollService.getItemByEnrollId(id);
        model.addAttribute("item",item);
        return "Admin/enroll_detail";
    }

    @RequestMapping("/to_enroll_list")
    public String toItemEnrollList(){
        return "Admin/enroll_list";
    }

    @RequestMapping(value = "/enroll_list",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String itemEnrollList(Integer page,Integer limit){
        int count = enrollService.getAllCount();
        PageHelper.startPage(page,limit);
        List<Item> list = enrollService.getAllEnroll();
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", list);
        return Json.toJson(map);
    }

    @RequestMapping("/enroll_agree")
    @ResponseBody
    public ServerResponse agreeEnroll(Integer id){
        ServerResponse serverResponse = enrollService.agreeEnroll(id);
        return serverResponse;
    }

    @RequestMapping("/enroll_refuse")
    @ResponseBody
    public ServerResponse refuseEnroll(Integer id){
        ServerResponse serverResponse = enrollService.refuseEnroll(id);
        return serverResponse;
    }
}
