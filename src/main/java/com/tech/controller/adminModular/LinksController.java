package com.tech.controller.adminModular;

import com.tech.common.ServerResponse;
import com.tech.pojo.FriendLink;
import com.tech.service.FriendLinkService;
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
public class LinksController {
    @Autowired
    FriendLinkService friendLinkService;

    @RequestMapping("/links")
    public String toShowLink(){
        return "Admin/link";
    }

    @RequestMapping("/link")
    @ResponseBody
    public String showLink(){
        int count = friendLinkService.getAllCount();
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", friendLinkService.getAllFriendLinks());
        return Json.toJson(map);
    }

    @RequestMapping("/add_link")
    @ResponseBody
    public ServerResponse<String> addLink(FriendLink friendLink){
        ServerResponse serverResponse = friendLinkService.insertLink(friendLink);
        return serverResponse;
    }

    @RequestMapping("/update_link")
    @ResponseBody
    public ServerResponse<String> updateLink(FriendLink friendLink){
        ServerResponse serverResponse = friendLinkService.updatetLink(friendLink);
        return serverResponse;
    }

    @RequestMapping("/delete_link/{id}")
    @ResponseBody
    public ServerResponse<String> addLink(@PathVariable("id")Integer id){
        ServerResponse serverResponse = friendLinkService.deleteLink(id);
        return serverResponse;
    }
}
