package com.tech.controller.adminModular;

import com.tech.common.ServerResponse;
import com.tech.pojo.ScrollImg;
import com.tech.service.ScrollImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/manage")
public class ScrollController {
    @Autowired
    ScrollImgService scrollImgService;

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
