package com.tech.controller.adminModular;

import com.tech.common.ServerResponse;
import com.tech.pojo.News;
import com.tech.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
@RequestMapping("/manage")
public class NewsController {
    @Autowired
    NewsService newsService;

    @RequestMapping("/news_list/{typeId}")
    public String newsList(@PathVariable(value = "typeId")Integer typeNew, Model model){
        model.addAttribute("notices",newsService.getAllKindNews(typeNew));
        return "newsList";
    }

    @RequestMapping("/get_news/{id}")
    public String getNews(@PathVariable("id")Integer id,Model model){
        News news = newsService.getNews(id);
        model.addAttribute("news",news);
        return "get_news";
    }

    @RequestMapping("/add_news")
    @ResponseBody
    public ServerResponse<News> newsAdd(News news){
        news.setCreateTime(new Date());
        news.setUpdateTime(new Date());
        ServerResponse serverResponse =  newsService.insertNews(news);
        return serverResponse;
    }

    @RequestMapping("/update_news")
    @ResponseBody
    public ServerResponse<News> newsEdit(News news){
        news.setUpdateTime(new Date());
        ServerResponse serverResponse =  newsService.updateNews(news);
        return serverResponse;
    }
    @RequestMapping("/delete_news/{id}")
    @ResponseBody
    public ServerResponse<String> newsDelete(@PathVariable("id") Integer id){
        ServerResponse serverResponse =  newsService.deleteNews(id);
        return serverResponse;
    }

}
