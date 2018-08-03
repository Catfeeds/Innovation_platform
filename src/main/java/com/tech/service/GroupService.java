package com.tech.service;

import com.tech.dao.GroupMapper;
import com.tech.pojo.Group;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GroupService {
    @Autowired
    GroupMapper groupMapper;

    public Group addGroup(String groupName){
        Group group = new Group(groupName);
        groupMapper.insert(group);
        return group;
    }
}
