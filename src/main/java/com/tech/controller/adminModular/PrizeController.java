package com.tech.controller.adminModular;

import com.tech.common.ServerResponse;
import com.tech.service.PrizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/manage")
public class PrizeController {
    @Autowired
    PrizeService prizeService;

    @RequestMapping("/getPrize")
    @ResponseBody
    public ServerResponse getAllPrize(){
        ServerResponse serverResponse = prizeService.getAllPrize();
        return serverResponse;
    }

}
