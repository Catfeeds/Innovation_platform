package com.tech.controller.adminModular;

import com.tech.common.ServerResponse;
import com.tech.service.TotalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/manage")
public class TotalController {
    @Autowired
    TotalService totalService;

    /**
     * 获取个人报名参赛次数
     */
    @RequestMapping("/get_count")
    @ResponseBody
    public ServerResponse<Integer> getCount(String sno){
       int count =  totalService.getCountBySno(sno);
       return ServerResponse.createBySuccess("成功查询次数",count);
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
