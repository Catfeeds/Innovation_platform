package com.tech.controller.adminModular;

import com.github.pagehelper.PageHelper;
import com.tech.common.Const;
import com.tech.common.ServerResponse;
import com.tech.pojo.Admin;
import com.tech.pojo.Excellent;
import com.tech.service.EnrollService;
import com.tech.service.ExcellentService;
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

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage")
public class ExcellentController {
    @Autowired
    ExcellentService excellentService;
    @Autowired
    EnrollService enrollService;

    @RequestMapping("/to_pass_enroll_list")
    public String toPassEnrollList(){
        return "Admin/pass_enroll_list";
    }


    @RequestMapping("/to_excellent_list")
    public String toExcellentList(){
        return "Admin/excellent_list";
    }

    /**
     * 获奖作品/优秀作品
     * @param page
     * @param limit
     * @return
     */
    //TODO 删除
    @RequestMapping(value = "/excellent_list",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String excellentList(Integer page,Integer limit){
        int count = excellentService.getAllCount();
        PageHelper.startPage(page,limit);
        List<Excellent> list = excellentService.getAllExcellent();
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", list);
        return Json.toJson(map);
    }

    @RequestMapping("/to_excellent_add/{id}")
    public String toAddExcellent(@PathVariable("id")Integer id, Model model){
        model.addAttribute("action","add");
        model.addAttribute("item",enrollService.getItemByEnrollId(id));
        return "Admin/excellent_edit";
    }

    @RequestMapping("/excellent_add")
    @ResponseBody
    public ServerResponse excllentAdd(Excellent excellent, HttpSession session){
        try {
            Admin admin = (Admin)session.getAttribute(Const.CURRENT_USER);
            excellent.setAuthor(admin.getUsername());
        }catch (Exception e){
            return ServerResponse.createByErrorMessage("权限错误");
        }
        excellent.setCreateTime(new Date());
        excellent.setUpdateTime(new Date());
        ServerResponse serverResponse = excellentService.addExcellent(excellent);
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
}
