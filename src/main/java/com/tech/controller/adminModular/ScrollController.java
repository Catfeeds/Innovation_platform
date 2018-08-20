package com.tech.controller.adminModular;

import com.github.pagehelper.PageHelper;
import com.tech.common.ServerResponse;
import com.tech.pojo.FriendLink;
import com.tech.pojo.ScrollImg;
import com.tech.service.ScrollImgService;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage")
public class ScrollController {
    @Autowired
    ScrollImgService scrollImgService;

    @RequestMapping("/to_scroll_list")
    public String toScrollList(){
        return "Admin/scroll_list";
    }

    @RequestMapping("/to_scroll_add")
    public String toScrollAdd(){
        return "Admin/scroll_edit";
    }

    @RequestMapping(value = "/scroll_list",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String showLink(Integer page,Integer limit){
        int count = scrollImgService.getAllCount();
        PageHelper.startPage(page,limit);
        List<ScrollImg> linkList = scrollImgService.getAllScrollImg();
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", linkList);
        return Json.toJson(map);
    }

    @RequestMapping("/add_scroll")
    @ResponseBody
    public ServerResponse<String> addScrollImg(ScrollImg scrollImg){
        ServerResponse serverResponse = scrollImgService.insertScrollImg(scrollImg);
        return serverResponse;
    }

    @RequestMapping("/update_scroll")
    @ResponseBody
    public ServerResponse<String> updateScrollImg(ScrollImg scrollImg){
        ServerResponse serverResponse = scrollImgService.updateScrollImg(scrollImg);
        return serverResponse;
    }

    @RequestMapping("/delete_scroll/{id}")
    @ResponseBody
    public ServerResponse<String> updateScrollImg(@PathVariable("id") Integer id){
        ServerResponse serverResponse = scrollImgService.deleteScrollImg(id);
        return serverResponse;
    }
}
