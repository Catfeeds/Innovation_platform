package com.tech.controller.adminModular;

import com.tech.common.ServerResponse;
import com.tech.pojo.FriendLink;
import com.tech.service.FriendLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/manage")
public class LinksController {
    @Autowired
    FriendLinkService friendLinkService;

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
