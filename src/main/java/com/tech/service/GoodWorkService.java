package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.GoodWorkMapper;
import com.tech.pojo.GoodWork;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodWorkService {
    @Autowired
    GoodWorkMapper goodWorkMapper;

    public List<GoodWork> getAllGoodWorks(){
        List<GoodWork> goodWorks = goodWorkMapper.selectAllGoodWorks();
        String intro ;
        for (GoodWork m:goodWorks) {
            intro = m.getIntroduce().replaceAll("<(S*?)[^>]*>.*?|<.*? />", "").replaceAll("&.{2,6}?;", "");
            intro = intro.length()>120?intro.substring(0,120):intro;
            m.setIntroduce(intro);
        }
        return goodWorks;
    }

    public ServerResponse insertGoodWork(GoodWork goodWork) {
        int count = goodWorkMapper.insert(goodWork);
        if (count>0){
            return ServerResponse.createBySuccessMessage("add_success");
        }
        return ServerResponse.createByErrorMessage("add_fail");
    }

    public ServerResponse updateGoodWork(GoodWork goodWork) {
        int count = goodWorkMapper.updateByPrimaryKeySelective(goodWork);
        if (count>0){
            return ServerResponse.createBySuccessMessage("update_success");
        }
        return ServerResponse.createByErrorMessage("update_fail");
    }

    public ServerResponse deleteGoodWork(Integer id) {
        int count = goodWorkMapper.deleteByPrimaryKey(id);
        if (count>0){
            return ServerResponse.createBySuccessMessage("delete_success");
        }
        return ServerResponse.createByErrorMessage("delete_fail");
    }

    public GoodWork getById(Integer id) {
        GoodWork goodWork = goodWorkMapper.selectByPrimaryKey(id);
        return goodWork;
    }

    public int getAllCount() {
        return goodWorkMapper.selectAllCount();
    }

    public int getSearcgCount(String key) {
        return goodWorkMapper.selectSeachCount(key);
    }

    public List<GoodWork> getSeach(String key) {
        return goodWorkMapper.selectSearch(key);
    }
}
