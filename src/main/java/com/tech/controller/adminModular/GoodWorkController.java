package com.tech.controller.adminModular;


import com.github.pagehelper.PageHelper;
import com.tech.common.ServerResponse;
import com.tech.pojo.GoodWork;
import com.tech.service.GoodWorkService;
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
public class GoodWorkController {
    @Autowired
    GoodWorkService goodWorkService;

    @RequestMapping("/to_work_add")
    public String toShowAddPage(Model model){
        model.addAttribute("action","add");
        return "Admin/work_edit";
    }

    @RequestMapping("/to_work_edit/{id}")
    public String toShowAddPage(Model model,@PathVariable("id") Integer id){
        model.addAttribute("work",goodWorkService.getById(id));
        model.addAttribute("action","edit");
        return "Admin/work_edit";
    }
    @RequestMapping("/to_work_list")
    public String toWorkList(){
        return "Admin/work_list";
    }


    @RequestMapping(value = "/work_list",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String workList(Integer page,Integer limit){
        PageHelper.startPage(page,limit);
        int count = goodWorkService.getAllCount();
        List<GoodWork> list = goodWorkService.getAllGoodWorks();
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", list);
        return Json.toJson(map);
    }

    @RequestMapping("/add_gwork")
    @ResponseBody
    public ServerResponse<String> addGoodWork(GoodWork goodWork){
        goodWork.setCreateTime(new Date());
        goodWork.setUpdateTime(new Date());
        ServerResponse serverResponse = goodWorkService.insertGoodWork(goodWork);
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
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }


    @RequestMapping("/update_gwork")
    @ResponseBody
    public ServerResponse<String> updateGoodWork(GoodWork goodWork){
        goodWork.setUpdateTime(new Date());
        ServerResponse serverResponse = goodWorkService.updateGoodWork(goodWork);
        return serverResponse;
    }

    @RequestMapping("/delete_gwork/{id}")
    @ResponseBody
    public ServerResponse<String> deleteGoodWork(@PathVariable("id") Integer id){
        ServerResponse serverResponse = goodWorkService.deleteGoodWork(id);
        return serverResponse;
    }
}
