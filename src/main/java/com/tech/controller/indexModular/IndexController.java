package com.tech.controller.indexModular;

import com.tech.pojo.*;
import com.tech.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

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

    @RequestMapping("/index")
    public String showIndex(Model model){
        List<News> notices =  newsService.getKindNews(1,7);//通知公告
        List<News> policies =  newsService.getKindNews(2,7);//政策新闻
        List<News> questions =  newsService.getKindNews(4,7);//常见问题
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
        return "index";
    }
}
