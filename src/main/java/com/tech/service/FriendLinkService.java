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
            return ServerResponse.createBySuccessMessage("添加成功");
        }
        return ServerResponse.createByErrorMessage("添加失败,请重新尝试!");
    }

    public ServerResponse updatetLink(FriendLink friendLink) {
        int count = friendLinkMapper.updateByPrimaryKeySelective(friendLink);
        if (count > 0){
            return ServerResponse.createBySuccessMessage("修改成功");
        }
        return ServerResponse.createByErrorMessage("修改失败");
    }

    public ServerResponse deleteLink(Integer id) {
        int count = friendLinkMapper.deleteByPrimaryKey(id);
        if (count > 0){
            return ServerResponse.createBySuccessMessage("删除成功");
        }
        return ServerResponse.createByErrorMessage("删除失败");
    }

    public int getAllCount() {
        return friendLinkMapper.getAllCount();
    }
}
