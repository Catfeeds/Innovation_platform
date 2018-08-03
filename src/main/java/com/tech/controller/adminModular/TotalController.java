package com.tech.controller.adminModular;

import com.tech.common.ServerResponse;
import com.tech.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/manage")
public class TotalController {
    @Autowired
    MemberService memberService;

    /**
     * 获取个人报名参赛次数
     */
    @RequestMapping("/get_count")
    @ResponseBody
    public ServerResponse<Integer> getCount(String sno){
       int count =  memberService.getCountBySno(sno);
       return ServerResponse.createBySuccess("成功查询次数",count);
    }
}
