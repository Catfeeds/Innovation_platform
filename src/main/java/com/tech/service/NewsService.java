package com.tech.service;


import com.tech.common.ServerResponse;
import com.tech.dao.NewsMapper;
import com.tech.pojo.News;
import org.apache.commons.lang3.StringUtils;
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

    public ServerResponse insertNews(News news) {
        int count = newsMapper.insert(news);
        if (count>0){
            return ServerResponse.createBySuccessMessage("添加成功");
        }
        return ServerResponse.createByErrorMessage("添加失败");
    }

    public ServerResponse updateNews(News news){
        int count = newsMapper.updateByPrimaryKeySelective(news);
        if (count>0){
            return ServerResponse.createBySuccessMessage("更新成功");
        }
        return ServerResponse.createByErrorMessage("更新失败");
    }

    public ServerResponse deleteNews(Integer id) {
        int count = newsMapper.deleteByPrimaryKey(id);
        if (count>0){
            return ServerResponse.createBySuccessMessage("删除成功");
        }
        return ServerResponse.createByErrorMessage("删除失败");
    }

    public int getKindNewsCount(Integer typeNew) {
        return newsMapper.selectKindNewsCount(typeNew);
    }

    public String getTypeNameByTypeId(Integer typeNewsId) {
        return newsMapper.selectTypeName(typeNewsId);
    }

    public String getTypeNameByNewsId(Integer newsID) {
        return newsMapper.selectTypeNameByNewsId(newsID);
    }

    public List<News> getSearchNewsByKey(String key, Integer newsTypeId) {
        return newsMapper.selectSearchNewsByKey(key,newsTypeId);
    }

    public int getSearchNewsByKeyCount(String key, Integer newsTypeId) {
        return newsMapper.selectSearchNewsByKeyCount(key,newsTypeId);
    }

    public List<News> getSearchNews(String key) {
        return newsMapper.selectSearchNews(key);
    }

    public int getSearchCount(String key) {
        return newsMapper.selectSearchCount(key);
    }

    public ServerResponse deleteMore(String list) {
        if (StringUtils.isEmpty(list)){
            return ServerResponse.createByErrorMessage("参数为空");
        }
        String[] ids = list.split("-");
        for (String id:ids) {
            newsMapper.deleteByPrimaryKey(Integer.parseInt(id));
        }
        return ServerResponse.createBySuccessMessage("删除成功");
    }
}
