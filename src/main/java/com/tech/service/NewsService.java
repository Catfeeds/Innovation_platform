package com.tech.service;


import com.tech.common.ServerResponse;
import com.tech.dao.NewsMapper;
import com.tech.pojo.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class NewsService {
    @Autowired
    NewsMapper newsMapper;

    public List<News> getKindNews(Integer typeNews, Integer showCount){
        List<News> noticeNews =  newsMapper.selectKindNewsByType(typeNews,showCount);
        return noticeNews;
    }

    public List<News> getAllKindNews(Integer typeNews){
        List<News> noticeNews =  newsMapper.selectAllKindNewsByType(typeNews);
        return noticeNews;
    }

    public News getNews(Integer newsId) {
        News news = newsMapper.selectByPrimaryKey(newsId);
        return news;
    }

    //TODO 权限验证
    public ServerResponse<String> insertNews(News news) {
        int count = newsMapper.insert(news);
        if (count>0){
            return ServerResponse.createBySuccessMessage("add_success");
        }
        return ServerResponse.createByErrorMessage("add_fail");
    }

    public ServerResponse<String> updateNews(News news){
        int count = newsMapper.updateByPrimaryKeySelective(news);
        if (count>0){
            return ServerResponse.createBySuccessMessage("update_success");
        }
        return ServerResponse.createByErrorMessage("update_fail");
    }

    public ServerResponse<String> deleteNews(Integer id) {
        int count = newsMapper.deleteByPrimaryKey(id);
        if (count>0){
            return ServerResponse.createBySuccessMessage("delete_success");
        }
        return ServerResponse.createByErrorMessage("delete_fail");
    }

    public int getKindNewsCount(Integer typeNew) {
        return newsMapper.selectKindNewsCount(typeNew);
    }
}
