package com.tech.controller.adminModular;

import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import com.tech.common.ServerResponse;
import com.tech.pojo.Admin;
import com.tech.pojo.Levels;
import com.tech.pojo.User;
import com.tech.service.LevelService;
import com.tech.service.TotalService;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage")
public class TotalController {
    @Autowired
    TotalService totalService;
    @Autowired
    LevelService levelService;

    @RequestMapping(value = "/data_import",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse dataImport(MultipartFile file) throws Exception {
        ImportParams params = new ImportParams();
        params.setTitleRows(0);
        params.setHeadRows(1);
        List<User> list = ExcelImportUtil.importExcel(file.getInputStream(),
                User.class, params);
        System.out.println(list.size());
        String[] friends = new String[list.size()];
        for (String name:friends) {

        }
        return ServerResponse.createBySuccess(list);
    }


    /**
     * 项目统计 E_chart异步加载bar
     * @return
     */
    @RequestMapping(value = "/get_level_json",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getLevelJson(){
        List<Levels> list = levelService.getALL();
        String[] levels = new String[list.size()];
        Integer[] counts = new Integer[list.size()];
        int index = 0;
        for (Levels l:list) {
            levels[index] = l.getLevelName();
            int count = totalService.getNumberOfPeopleByPrizeID(l.getId());
            counts[index] = count;
            index++;
        }
        Map<String, Object> res = new HashMap<>();
        res.put("categories",levels);
        res.put("data",counts);
        return Json.toJson(res);
    }

    /**
     * 获取个人报名参赛次数
     */
    @RequestMapping("/get_count")
    @ResponseBody
    public ServerResponse<Integer> getCount(String sno){
       int count =  totalService.getCountBySno(sno);
       return ServerResponse.createBySuccess("成功查询",count);
    }

    /**
     * 获取每个赛事的报名人数
     */
    @RequestMapping("/get_p_count")
    @ResponseBody
    public ServerResponse<Integer> getPCount(Integer matchID){
        int count =  totalService.getMatchPCount(matchID);
        return ServerResponse.createBySuccess("成功查询",count);
    }

    @RequestMapping("/to_itemTotal_list")
    public String toItemTotalList(){
        return "Admin/itemTotal_list";
    }
}
