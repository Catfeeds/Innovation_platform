package com.tech.controller.indexModular;

import com.github.pagehelper.PageHelper;
import com.tech.pojo.*;
import com.tech.service.*;
import com.tech.utils.CreateImageCode;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class IndexController {
    @Autowired
    NewsService newsService;
    @Autowired
    DownloadFileService downloadFileService;
    @Autowired
    MatchService matchService;
    @Autowired
    ScrollImgService scrollImgService;
    @Autowired
    FriendLinkService friendLinkService;
    @Autowired
    GoodTeacherService goodTeacherService;
    @Autowired
    GoodWorkService goodWorkService;
    @Autowired
    FileService fileService;

    /**
     * 跳转至登录页面
     * @return
     */
    @RequestMapping("/login")
    public String toLogin(){
        return "login";
    }

    /**
     * 生成验证码
     */
    @RequestMapping("/makeCode")
    public void Captcha(HttpServletResponse response, HttpSession session)throws IOException {
        CreateImageCode vCode = new CreateImageCode(116,36,5,10);
        session.setAttribute("code", vCode.getCode());
        vCode.write(response.getOutputStream());
    }

    @RequestMapping("/index")
    public String showIndex(Model model){
        List<News> notices =  newsService.getKindNews(1,7);//通知公告
        List<News> policies =  newsService.getKindNews(2,7);//政策新闻
        List<News> questions =  newsService.getKindNews(3,7);//常见问题
        List<DownloadFile> downloadFiles = downloadFileService.getPartByCount(7);//文件下载
        List<Match> matches = matchService.getCountMatches(3);//赛事项目
        List<ScrollImg> scrollImages = scrollImgService.getShowScrollImg();//滚动图
        List<FriendLink> friendLinks = friendLinkService.getAllFriendLinks();//友情链接
        List<GoodTeacher> goodTeachers = goodTeacherService.getAllGoodTeachers();//获取优秀教师
        List<GoodWork> goodWorks = goodWorkService.getAllGoodWorks();//获取优秀作品
        model.addAttribute("notices",notices).addAttribute("policies",policies).addAttribute("questions",questions);
        model.addAttribute("matches",matches);
        model.addAttribute("scrollImages",scrollImages);
        model.addAttribute("friendLinks",friendLinks);
        model.addAttribute("goodTeachers",goodTeachers);
        model.addAttribute("goodWorks",goodWorks);
        model.addAttribute("downloadFiles",downloadFiles);
        return "Index/index";
    }

    /**
     * 根据新闻类型获取新闻
     * @param model
     * @return
     */
    @RequestMapping("/news_list/{type_id}")
    public String newsList(@PathVariable("type_id") Integer typeNewsId, Model model){
        model.addAttribute("newsTypeId",typeNewsId);
        model.addAttribute("newsType",newsService.getTypeNameByTypeId(typeNewsId));
        model.addAttribute("newsCount",newsService.getKindNewsCount(typeNewsId));
        return "Index/news_list";
    }

    @RequestMapping(value = "/news_page/{type_id}",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String newsListJson(@PathVariable("type_id") Integer typeNews,Integer page,Integer limit){
        if(page==null){
            page=1;
        }
        if(limit==null){
            limit=10;
        }
        PageHelper.startPage(page,limit);
        List<News> list = newsService.getAllKindNews(typeNews);
        int count = newsService.getKindNewsCount(typeNews);
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", list);
        return Json.toJson(map);
    }

    @RequestMapping(value = "/download_page",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String downloadListJson(Integer page,Integer limit){
        if(page==null){
            page=1;
        }
        if(limit==null){
            limit=10;
        }
        PageHelper.startPage(page,limit);
        List<DownloadFile> list = downloadFileService.getAll();
        int count = downloadFileService.getAllCount();
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", list);
        return Json.toJson(map);
    }

    /**
     * 获取新闻详细信息
     * @param newsID
     * @param model
     * @return
     */
    @RequestMapping("/news/{id}")
    public String newsDetail(@PathVariable("id")Integer newsID,Model model){
        News news = newsService.getNews(newsID);
        model.addAttribute("news",news);
        return "Index/news";
    }

    @RequestMapping("/compete_display")
    public String competeList(Model model){
        model.addAttribute("count",matchService.getMatchCount());
        return "Index/compete_display";
    }

    @RequestMapping(value = "/compete_page",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String competeListJson(Integer page,Integer limit){
        if(page==null){
            page=1;
        }
        if(limit==null){
            limit=10;
        }
        PageHelper.startPage(page,limit);
        List<Match> list = matchService.getAllMatches();
        int count = matchService.getMatchCount();
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", list);
        return Json.toJson(map);
    }



    @RequestMapping("/compete/{id}")
    public String competeDetail(@PathVariable("id")Integer matchId,Model model){
        Match match = matchService.getMatch(matchId);
        model.addAttribute("match",match);
        return "Index/compete";
    }

    @RequestMapping("/downloads")
    public String downloadList(Model model){
        model.addAttribute("count",downloadFileService.getAllCount());
        return "Index/download";
    }

    @RequestMapping("/achievements")
    public String goodWorkList(Model model){
        model.addAttribute("count",goodWorkService.getAllCount());
        return "Index/achievement_display";
    }

    @RequestMapping(value = "/achievement_page",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String achievementListJson(Integer page,Integer limit){
        if(page==null){
            page=1;
        }
        if(limit==null){
            limit=10;
        }
        PageHelper.startPage(page,limit);
        List<GoodWork> list = goodWorkService.getAllGoodWorks();
        int count = goodWorkService.getAllCount();
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", list);
        return Json.toJson(map);
    }

    @RequestMapping("/achievement/{id}")
    public String goodWorkDetail(@PathVariable("id") Integer id,Model model){
        GoodWork goodWork = goodWorkService.getById(id);
        model.addAttribute("goodWork",goodWork);
        return "Index/achievement";
    }

    @RequestMapping("/teacher")
    public String goodTeacherList(Model model){
        List<GoodTeacher> goodTeachers = goodTeacherService.getAllGoodTeachers();
        model.addAttribute("goodTeachers",goodTeachers);
        return "Index/teacher_display";
    }

    @RequestMapping("/teacher/{id}")
    public String goodTeacherDetail(@PathVariable("id") Integer id,Model model){
        GoodTeacher goodTeachers = goodTeacherService.getById(id);
        model.addAttribute("teacher",goodTeachers);
        return "Index/teacher_detail";
    }

}
