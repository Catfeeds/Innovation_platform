package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.FriendLinkMapper;
import com.tech.pojo.FriendLink;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FriendLinkService {
    @Autowired
    FriendLinkMapper friendLinkMapper;

    public List<FriendLink> getAllFriendLinks(){
        List<FriendLink> friendLinks = friendLinkMapper.selectAllFriendLinks();
        return friendLinks;
    }

    public ServerResponse insertLink(FriendLink friendLink) {
        int count = friendLinkMapper.insert(friendLink);
        if (count > 0){
            return ServerResponse.createBySuccessMessage("add_success");
        }
        return ServerResponse.createByErrorMessage("add_fail");
    }

    public ServerResponse updatetLink(FriendLink friendLink) {
        int count = friendLinkMapper.updateByPrimaryKeySelective(friendLink);
        if (count > 0){
            return ServerResponse.createBySuccessMessage("update_success");
        }
        return ServerResponse.createByErrorMessage("update_fail");
    }

    public ServerResponse deleteLink(Integer id) {
        int count = friendLinkMapper.deleteByPrimaryKey(id);
        if (count > 0){
            return ServerResponse.createBySuccessMessage("delete_success");
        }
        return ServerResponse.createByErrorMessage("delete_fail");
    }

}
