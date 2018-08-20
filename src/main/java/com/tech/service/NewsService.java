package com.tech.service;


import com.tech.common.ServerResponse;
import com.tech.dao.NewsMapper;
import com.tech.pojo.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
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
            return ServerResponse.createBySuccessMessage("添加成功");
        }
        return ServerResponse.createByErrorMessage("添加失败");
    }

    public ServerResponse<String> updateNews(News news){
        int count = newsMapper.updateByPrimaryKeySelective(news);
        if (count>0){
            return ServerResponse.createBySuccessMessage("更新成功");
        }
        return ServerResponse.createByErrorMessage("更新失败");
    }

    public ServerResponse<String> deleteNews(Integer id) {
        int count = newsMapper.deleteByPrimaryKey(id);
        if (count>0){
            return ServerResponse.createBySuccessMessage("删除成功");
        }
        return ServerResponse.createByErrorMessage("删除失败");
    }

    public int getKindNewsCount(Integer typeNew) {
        return newsMapper.selectKindNewsCount(typeNew);
    }
}
