package com.tech.controller.adminModular;

import com.github.pagehelper.PageHelper;
import com.tech.common.ServerResponse;
import com.tech.pojo.Compete;
import com.tech.service.CompeteService;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage")
public class CompeteController {
    @Autowired
    CompeteService competeService;

    @RequestMapping("/to_compete_list")
    public String toCompeteList(){
        return "Admin/compete_list";
    }

    @RequestMapping("/to_compete_add")
    public String toCompeteAdd(Model model){
        model.addAttribute("action","add");
        return "Admin/compete_edit";
    }
    @RequestMapping("/to_compete_edit/{id}")
    public String toCompeteEdit(Model model, @PathVariable("id")Integer id){
        model.addAttribute("compete",competeService.getById(id));
        model.addAttribute("action","edit");
        return "Admin/compete_edit";
    }

    @RequestMapping(value = "/compete_list",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String competeList(Integer page,Integer limit){
        int count = competeService.getAllCount();
        PageHelper.startPage(page,limit);
        List<Compete> list = competeService.getAllCompete();
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", list);
        return Json.toJson(map);
    }

    @RequestMapping("/add_compete")
    @ResponseBody
    public ServerResponse addCompete(Compete compete){
        compete.setCreateTime(new Date());
        compete.setUpdateTime(new Date());
        ServerResponse serverResponse = competeService.insertCompete(compete);
        return serverResponse;
    }

    /**
     * form表单提交 Date类型数据绑定
     * <功能详细描述>
     * @param binder
     * @see [类、类#方法、类#成员]
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping("/update_compete")
    @ResponseBody
    public ServerResponse<String> updateCompete(Compete compete){
        compete.setUpdateTime(new Date());
        ServerResponse serverResponse = competeService.updateCompete(compete);
        return serverResponse;
    }

    @RequestMapping("/delete_compete/{id}")
    @ResponseBody
    public ServerResponse<String> deleteCompete(@PathVariable("id") Integer id){
        return ServerResponse.createByErrorMessage("删除失败！改数据用作数据保留!");
//        ServerResponse serverResponse = competeService.deleteCompete(id);
//        return serverResponse;
    }

}
