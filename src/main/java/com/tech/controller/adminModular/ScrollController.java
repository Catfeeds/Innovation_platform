package com.tech.controller.adminModular;

import com.github.pagehelper.PageHelper;
import com.tech.common.ServerResponse;
import com.tech.pojo.FriendLink;
import com.tech.pojo.ScrollImg;
import com.tech.service.ScrollImgService;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage")
public class ScrollController {
    @Autowired
    ScrollImgService scrollImgService;

    @RequestMapping("/to_coverScroll_list")
    public String toCoverScrollList(){
        return "Admin/coverScroll_list";
    }

    @RequestMapping("/to_teacherScroll_list")
    public String toTeacherScrollList(){
        return "Admin/teacherScroll_list";
    }

    @RequestMapping("/to_scroll_add/{type}")
    public String toScrollAdd(@PathVariable("type")Integer type,Model model){
        model.addAttribute("type",type);
        return "Admin/scroll_add";
    }

    @RequestMapping(value = "/coverScroll_list",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String showCoverScroll(Integer page,Integer limit){
        int count = scrollImgService.getCoverScrollCount();
        PageHelper.startPage(page,limit);
        List<ScrollImg> img = scrollImgService.getAllCoverScroll();
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", img);
        return Json.toJson(map);
    }

    @RequestMapping(value = "/teacherScroll_list",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String showTeacherScroll(Integer page,Integer limit){
        int count = scrollImgService.getTeacherScrollCount();
        PageHelper.startPage(page,limit);
        List<ScrollImg> img = scrollImgService.getAllTeacherScroll();
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", img);
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

    @RequestMapping("/update_scroll_show")
    @ResponseBody
    public ServerResponse<String> updateIsShowScrollImg(HttpServletRequest request){
        Integer id = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("showAction");
        ServerResponse serverResponse;
        if (action.equals("hide")){
             serverResponse = scrollImgService.setHideById(id);
        }else{
             serverResponse = scrollImgService.setShowById(id);
        }
        return serverResponse;
    }

    @RequestMapping("/delete_scroll/{id}")
    @ResponseBody
    public ServerResponse<String> updateScrollImg(@PathVariable("id") Integer id){
        ServerResponse serverResponse = scrollImgService.deleteScrollImg(id);
        return serverResponse;
    }
}
