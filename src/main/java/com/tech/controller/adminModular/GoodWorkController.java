package com.tech.controller.adminModular;


import com.tech.common.ServerResponse;
import com.tech.pojo.GoodWork;
import com.tech.service.GoodWorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/manage")
public class GoodWorkController {
    @Autowired
    GoodWorkService goodWorkService;

    @RequestMapping("/add_gwork")
    @ResponseBody
    public ServerResponse<String> addGoodWork(GoodWork goodWork){
        ServerResponse serverResponse = goodWorkService.insertGoodWork(goodWork);
        return serverResponse;
    }

    @RequestMapping("/update_gwork")
    @ResponseBody
    public ServerResponse<String> updateGoodWork(GoodWork goodWork){
        ServerResponse serverResponse = goodWorkService.updateGoodWork(goodWork);
        return serverResponse;
    }

    @RequestMapping("/delete_gwork/{id}")
    @ResponseBody
    public ServerResponse<String> deleteGoodWork(@PathVariable("id") Integer id){
        ServerResponse serverResponse = goodWorkService.deleteGoodWork(id);
        return serverResponse;
    }
}
