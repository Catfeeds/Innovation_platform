package com.tech.controller.adminModular;

import com.github.pagehelper.PageHelper;
import com.tech.common.ServerResponse;
import com.tech.pojo.Match;
import com.tech.service.MatchService;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage")
public class MatchController {
    @Autowired
    MatchService matchService;

    @RequestMapping("/matches_list")//好像没用到
    public String matchesList(Model model){
        model.addAttribute("matches",matchService.getAllMatches());
        return "matchesList";
    }

    @RequestMapping("/to_match_list")
    public String toShowMatchList(){
        return "Admin/match_list";
    }

    @RequestMapping("/to_match_edit/{id}")
    public String toShowMatchEdit(Model model,@PathVariable("id") Integer id){
        model.addAttribute("action","edit");
        model.addAttribute("match",matchService.getMatch(id));
        return "Admin/match_edit";
    }

    @RequestMapping("/to_match_add")
    public String toShowMatchAdd(Model model){
        model.addAttribute("action","add");
        return "Admin/match_edit";
    }

    @RequestMapping(value = "/match_list",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String matchList(Integer page,Integer limit){
        PageHelper.startPage(page,limit);
        int count = matchService.getMatchCount();
        List<Match> list = matchService.getAllMatches();
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", list);
        return Json.toJson(map);
    }

    @RequestMapping("/match_add")
    @ResponseBody
    public ServerResponse<String> addMatch(Match match){
        ServerResponse serverResponse =  matchService.insertMatch(match);
        System.out.println(match);
        return serverResponse;
    }

    @RequestMapping("/match_update")
    @ResponseBody
    public ServerResponse<String> updateMatch(Match match){
        match.setUpdateTime(new Date());
        ServerResponse serverResponse =  matchService.updateMatch(match);
        return serverResponse;
    }

    @RequestMapping("/match_delete/{id}")
    @ResponseBody
    public ServerResponse<String> deleteMatch(@PathVariable("id") Integer id){
        ServerResponse serverResponse =  matchService.deleteMatch(id);
        return serverResponse;
    }

}
