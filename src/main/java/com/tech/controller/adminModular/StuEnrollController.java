package com.tech.controller.adminModular;

import com.github.pagehelper.PageHelper;
import com.tech.common.ServerResponse;
import com.tech.pojo.Item;
import com.tech.service.EnrollService;
import com.tech.service.StudentService;
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
    @Autowired
    StudentService studentService;

    @RequestMapping("/to_enroll_detail/{id}")
    public String toItemDetail(@PathVariable("id") Integer id, Model model){
        Item item = enrollService.getItemByEnrollId(id);
        model.addAttribute("item",item);
        return "Admin/enroll_detail";
    }

    @RequestMapping("/to_enroll_detail2/{id}")
    public String toItemDetail2(@PathVariable("id") Integer id, Model model){
        Item item = enrollService.getItemByEnrollId(id);
        model.addAttribute("item",item);
        return "Admin/enroll_detail2";
    }

    @RequestMapping("/to_enroll_list")
    public String toItemEnrollList(){
        return "Admin/enroll_list";
    }


    /**展示学生所参与的项目
     * @param sno
     * @param model
     * @return
     */
    @RequestMapping("/enroll_record/{sno}")
    public String showEnrollRecord(@PathVariable("sno")String sno,Model model){
        List<Item> item = enrollService.getEnrollItemBySno(sno);
        model.addAttribute("user",studentService.getInfoBySno(sno).getData());
        model.addAttribute("items",item);
        return "Admin/enroll_record";
    }

    /**
     * 获取所有报名项目  vw_item *
     * @param page
     * @param limit
     * @return
     */
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

    @RequestMapping(value = "/enroll_search",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String itemEnrollList(Integer page,Integer limit,String key){
        int count = enrollService.getSearchCount(key);
        PageHelper.startPage(page,limit);
        List<Item> list = enrollService.getSeach(key);
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", list);
        return Json.toJson(map);
    }

    /** 删除
     * 获取已经通过的报名项目 vw_item  status == 1  添加优秀作品模块
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value = "/pass_enroll_list",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String itemPassEnrollList(Integer page,Integer limit){
        int count = enrollService.getPassItemCount();
        PageHelper.startPage(page,limit);
        List<Item> list = enrollService.getPassEnroll();
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
