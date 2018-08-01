package com.tech.controller.adminModular;

import com.tech.common.ServerResponse;
import com.tech.pojo.Match;
import com.tech.service.MatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
@RequestMapping("/manage")
public class MatchController {
    @Autowired
    MatchService matchService;

    @RequestMapping("/matches_list")
    public String matchesList(Model model){
        model.addAttribute("matches",matchService.getAllMatches());
        return "matchesList";
    }

    @RequestMapping("/match_add")
    @ResponseBody
    public ServerResponse<String> addMatch(Match match){
        ServerResponse serverResponse =  matchService.insertMatch(match);
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
