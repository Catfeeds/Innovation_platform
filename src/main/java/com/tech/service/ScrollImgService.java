package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.ScrollImgMapper;
import com.tech.pojo.ScrollImg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScrollImgService {
    @Autowired
    ScrollImgMapper scrollImgMapper;

    public List<ScrollImg> getShowScrollImg(){
        List<ScrollImg> scrollImgs  = scrollImgMapper.selectShowScrollImg();
        return scrollImgs;
    }

    public ServerResponse insertScrollImg(ScrollImg scrollImg) {
        int count =  scrollImgMapper.insert(scrollImg);
        if (count>0){
            return ServerResponse.createBySuccessMessage("add_success");
        }
        return ServerResponse.createByErrorMessage("add_fail");
    }

    public ServerResponse updateScrollImg(ScrollImg scrollImg) {
        int count =  scrollImgMapper.updateByPrimaryKeySelective(scrollImg);
        if (count>0){
            return ServerResponse.createBySuccessMessage("update_success");
        }
        return ServerResponse.createByErrorMessage("update_fail");
    }

    public ServerResponse deleteScrollImg(Integer id) {
        int count =  scrollImgMapper.deleteByPrimaryKey(id);
        if (count>0){
            return ServerResponse.createBySuccessMessage("delete_success");
        }
        return ServerResponse.createByErrorMessage("delete_fail");
    }
}