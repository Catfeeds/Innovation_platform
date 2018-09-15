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

    public List<ScrollImg> getCoverScrollShow(){
        List<ScrollImg> scrollImgs  = scrollImgMapper.selectCoverScrollShow();
        return scrollImgs;
    }

    public List<ScrollImg> getTeacherScrollShow() {
        List<ScrollImg> scrollImgs  = scrollImgMapper.selectTeacherScrollShow();
        return scrollImgs;
    }

    public ServerResponse insertScrollImg(ScrollImg scrollImg) {
        scrollImg.setIsShow(1);
        int count =  scrollImgMapper.insert(scrollImg);
        if (count>0){
            return ServerResponse.createBySuccessMessage("添加成功");
        }
        return ServerResponse.createByErrorMessage("添加失败");
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
            return ServerResponse.createBySuccessMessage("删除成功");
        }
        return ServerResponse.createByErrorMessage("删除失败");
    }

    public int getAllCount() {
        return scrollImgMapper.selectAllCount();
    }

    public List<ScrollImg> getAllCoverScroll() {
        List<ScrollImg> scrollImgs  = scrollImgMapper.selectAllCoverScroll();
        return scrollImgs;
    }

    public List<ScrollImg> getAllTeacherScroll() {
        List<ScrollImg> scrollImgs  = scrollImgMapper.selectAllTeacherScroll();
        return scrollImgs;
    }

    public ServerResponse setHideById(Integer id) {
        int count =  scrollImgMapper.updateHide(id);
        if (count>0){
            return ServerResponse.createBySuccessMessage("隐藏成功");
        }
        return ServerResponse.createByErrorMessage("隐藏失败");
    }

    public ServerResponse setShowById(Integer id) {
        int count =  scrollImgMapper.updateShow(id);
        if (count>0){
            return ServerResponse.createBySuccessMessage("显示成功");
        }
        return ServerResponse.createByErrorMessage("显示失败");
    }


    public int getCoverScrollCount() {
        return scrollImgMapper.selectCoverScrollCount();
    }

    public int getTeacherScrollCount() {
        return scrollImgMapper.selectTeacherScrollCount();
    }
}
