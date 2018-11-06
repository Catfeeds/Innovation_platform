package com.tech.controller.adminModular;

import com.github.pagehelper.PageHelper;
import com.tech.common.ServerResponse;
import com.tech.pojo.News;
import com.tech.service.FileService;
import com.tech.service.NewsService;
import org.nutz.json.Json;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage")
public class NewsController {

    @Autowired
    NewsService newsService;

    @RequestMapping(value = "/to_news_list/{id}",method = RequestMethod.GET)
    public String toShowNew(Model model,@PathVariable("id") Integer typeNews){
        model.addAttribute("newsTypeID",typeNews);
        model.addAttribute("newsType",newsService.getTypeNameByTypeId(typeNews));
        return "Admin/news_list";
    }

    @RequestMapping(value = "/news_list/{typeId}",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String newsList(@PathVariable(value = "typeId")Integer typeNew,Integer page,Integer limit){
        PageHelper.startPage(page,limit);
        List<News> list = newsService.getAllKindNews(typeNew);
        int count = newsService.getKindNewsCount(typeNew);
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", list);
        return Json.toJson(map);
    }

    @RequestMapping(value = "/news_search",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String newsSearch(Integer page,Integer limit,String key,Integer newsTypeId){
        PageHelper.startPage(page,limit);
        List<News> list = newsService.getSearchNewsByKey(key,newsTypeId);
        int count = newsService.getSearchNewsByKeyCount(key,newsTypeId);
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", list);
        return Json.toJson(map);
    }

    @RequestMapping("/get_news/{id}")
    public String getNews(@PathVariable("id")Integer id,Model model){
        News news = newsService.getNews(id);
        model.addAttribute("news",news);
        return "get_news";
    }

    @RequestMapping("/add_news")
    @ResponseBody
    public ServerResponse newsAdd(News news){
        news.setCreateTime(new Date());
        news.setUpdateTime(new Date());
        return newsService.insertNews(news);
    }

    @RequestMapping("/to_add_news/{id}")
    public String toShowAddPage(Model model,@PathVariable("id") Integer id){
        model.addAttribute("newsType",id);
        model.addAttribute("action","add");
        return "Admin/news_edit";
    }

    @RequestMapping("/to_edit_news/{id}")
    public String toShowEditPage(Model model,@PathVariable("id") Integer id){
        model.addAttribute("action","edit");
        model.addAttribute("news",newsService.getNews(id));
        return "Admin/news_edit";
    }

    @RequestMapping("/update_news")
    @ResponseBody
    public ServerResponse newsEdit(News news){
        news.setUpdateTime(new Date());
        return newsService.updateNews(news);
    }
    @RequestMapping("/delete_news/{id}")
    @ResponseBody
    public ServerResponse newsDelete(@PathVariable("id") Integer id){
        return  newsService.deleteNews(id);
    }

    /**
     * 批量删除
     */
    @RequestMapping("/delete_news")
    @ResponseBody
    public ServerResponse moreNewsDelete(String list){
        return newsService.deleteMore(list);
    }

}
