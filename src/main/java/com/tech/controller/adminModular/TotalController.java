package com.tech.controller.adminModular;

import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import com.tech.common.ServerResponse;
import com.tech.pojo.*;
import com.tech.service.*;
import org.apache.commons.lang3.StringUtils;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.*;

@Controller
@RequestMapping("/manage")
public class TotalController {
    @Autowired
    TotalService totalService;
    @Autowired
    LevelService levelService;
    @Autowired
    PrizeService prizeService;
    @Autowired
    CompeteService competeService;
    @Autowired
    EnrollService enrollService;
    @Autowired
    ExcellentService excellentService;
    @Autowired
    MemberService memberService;
    @Autowired
    StudentService studentService;
    @Autowired
    ExcellentMemberService excellentMemberService;

    /**
     * 数据导入
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/data_import",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse dataImport(MultipartFile file) throws Exception {
        ImportParams params = new ImportParams();
        params.setTitleRows(0);
        params.setHeadRows(1);
        List<Excellent> list = ExcelImportUtil.importExcel(file.getInputStream(),
                Excellent.class, params);
        for (Excellent e:list) {
            //设置赛事ID
            //e.setCompeteId(competeService.getIdByName(e.getCompeteName()));
            //根据Title找到对应的EnrollID
            //e.setEnrollId(enrollService.getIdByCIdAndTitle(e.getTitle()));

            //! 设置赛事级别ID
            e.setCompeteLevel(levelService.getIdByName(e.getLevelName()));
            //! 设置奖项ID
            e.setPrizeId(prizeService.getIdByName(e.getPrizeName()));
            //! 设置专业ID
            e.setProfessionID(excellentService.getPIdByPName(e.getProfessionName()));

            try {
                Excellent excellent = excellentService.addExcellent(e).getData();
                String[] excellent_members = e.getMembers().trim().split("、");
                ExcellentMember excellentMember;
                String sno;
                for (String sname:excellent_members) {
                    if (org.apache.commons.lang.StringUtils.isEmpty(sname))
                        continue;
                    sno = studentService.getSnoBySname(sname);
                    excellentMember = new ExcellentMember(sname,sno,0,excellent.getId());
                    excellentMemberService.addExcellentMember(excellentMember);
                }
            }catch (RuntimeException ex){
                return ServerResponse.createByErrorMessage(ex.getMessage());
            }
        }
        return ServerResponse.createBySuccess();
    }

    /**
     * 根据赛事级别获取获奖人数 done
     * @return
     */
    @RequestMapping(value = "/get_pc_by_level",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getPrizePeopleCountByCompeteLevel(String chooseTime,Integer profession){
        //2018-09-01 ~ 2018-10-01
        if(StringUtils.isEmpty(chooseTime)){
            chooseTime=null;
        }
        List<Levels> list = levelService.getALL();
        String[] levels = new String[list.size()];
        List<EchartData> data = new ArrayList<>();
        int index = 0;
        for (Levels l:list) {
            levels[index] = l.getLevelName();
            int count = totalService.getPrizePeopleCountByCompeteLevelWithSelective(l.getId(),chooseTime,profession);
            data.add(new EchartData(l.getId(),l.getLevelName(),count));
            index++;
        }
        Map<String, Object> res = new HashMap<>();
        res.put("categories",levels);
        res.put("data",data);
        return Json.toJson(res);
    }

    /**
     * 赛事级别下 获取每个奖项的人数 done
     * @param levelId
     * @return
     */
    @RequestMapping(value = "/get_pc_by_level2",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getPrizePeopleCountByLevelIdPrizeId(Integer levelId,String chooseTime,Integer profession){
        if(StringUtils.isEmpty(chooseTime)){
            chooseTime=null;
        }
        List<Prize> list = prizeService.getAll();
        String[] prize = new String[list.size()];
        List<EchartData> data = new ArrayList<>();
        int index = 0;
        for (Prize p:list) {
            prize[index] = p.getPrizeName();
            int count = totalService.getPrizePeopleCountByLevelIdPrizeIdWithSelective(p.getId(),levelId,chooseTime,profession);
            data.add(new EchartData(p.getId(),p.getPrizeName(),count));
            index++;
        }
        Map<String, Object> res = new HashMap<>();
        res.put("categories",prize);
        res.put("data",data);
        return Json.toJson(res);
    }

    /**
     * 根据赛事级别获取获奖项目数 done
     * @return
     */
    @RequestMapping(value = "/get_ic_by_level",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getPrizeItemCountByCompeteLevel(String chooseTime,Integer profession){
        if(StringUtils.isEmpty(chooseTime)){
            chooseTime=null;
        }
        List<Levels> list = levelService.getALL();
        String[] levels = new String[list.size()];
        List<EchartData> data = new ArrayList<>();
        int index = 0;
        for (Levels l:list) {
            levels[index] = l.getLevelName();
            int count = totalService.getPrizeItemCountByCompeteLevelWithSelective(l.getId(),chooseTime,profession);
            data.add(new EchartData(l.getId(),l.getLevelName(),count));
            index++;
        }
        Map<String, Object> res = new HashMap<>();
        res.put("categories",levels);
        res.put("data",data);
        return Json.toJson(res);
    }

    /**
     * 赛事级别下 获取每个奖项的项目数 done
     * @param levelId
     * @return
     */
    @RequestMapping(value = "/get_ic_by_level2",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getPrizeItemCountByLevelIdPrizeId(Integer levelId,String chooseTime,Integer profession){
        if(StringUtils.isEmpty(chooseTime)){
            chooseTime=null;
        }
        List<Prize> list = prizeService.getAll();
        String[] prize = new String[list.size()];
        List<EchartData> data = new ArrayList<>();
        int index = 0;
        for (Prize p:list) {
            prize[index] = p.getPrizeName();
            int count = totalService.getPrizeItemCountByLevelIdPrizeIdWithSelective(p.getId(),levelId,chooseTime,profession);
            data.add(new EchartData(p.getId(),p.getPrizeName(),count));
            index++;
        }
        Map<String, Object> res = new HashMap<>();
        res.put("categories",prize);
        res.put("data",data);
        return Json.toJson(res);
    }


//    /**
//     * 根据赛事级别获取获奖人数 done
//     * @return
//     */
//    @RequestMapping(value = "/get_pc_by_level",produces = "text/html;charset=UTF-8")
//    @ResponseBody
//    public String getPrizePeopleCountByCompeteLevel(String chooseTime,Integer profession){
//        //2018-09-01 ~ 2018-10-01
//        if(StringUtils.isEmpty(chooseTime)){
//            chooseTime=null;
//        }
//        List<Levels> list = levelService.getALL();
//        String[] levels = new String[list.size()];
//        List<EchartData> data = new ArrayList<>();
//        int index = 0;
//        for (Levels l:list) {
//            levels[index] = l.getLevelName();
//            int count = totalService.getPrizePeopleCountByCompeteLevelWithSelective(l.getId(),chooseTime,profession);
//            data.add(new EchartData(l.getId(),l.getLevelName(),count));
//            index++;
//        }
//        Map<String, Object> res = new HashMap<>();
//        res.put("categories",levels);
//        res.put("data",data);
//        return Json.toJson(res);
//    }
//
//    /**
//     * 赛事级别下 获取每个奖项的人数
//     * @param levelId
//     * @return
//     */
//    @RequestMapping(value = "/get_pc_by_level2",produces = "text/html;charset=UTF-8")
//    @ResponseBody
//    public String getPrizePeopleCountByLevelIdPrizeId(Integer levelId,String chooseTime,Integer profession){
//        if(StringUtils.isEmpty(chooseTime)){
//            chooseTime=null;
//        }
//        List<Prize> list = prizeService.getAll();
//        String[] prize = new String[list.size()];
//        List<EchartData> data = new ArrayList<>();
//        int index = 0;
//        for (Prize p:list) {
//            prize[index] = p.getPrizeName();
//            int count = totalService.getPrizePeopleCountByLevelIdPrizeIdWithSelective(p.getId(),levelId,chooseTime,profession);
//            data.add(new EchartData(p.getId(),p.getPrizeName(),count));
//            index++;
//        }
//        Map<String, Object> res = new HashMap<>();
//        res.put("categories",prize);
//        res.put("data",data);
//        return Json.toJson(res);
//    }
//
//    /**
//     * 根据赛事级别获取获奖项目数 done
//     * @return
//     */
//    @RequestMapping(value = "/get_ic_by_level",produces = "text/html;charset=UTF-8")
//    @ResponseBody
//    public String getPrizeItemCountByCompeteLevel(String chooseTime,Integer profession){
//        if(StringUtils.isEmpty(chooseTime)){
//            chooseTime=null;
//        }
//        List<Levels> list = levelService.getALL();
//        String[] levels = new String[list.size()];
//        List<EchartData> data = new ArrayList<>();
//        int index = 0;
//        for (Levels l:list) {
//            levels[index] = l.getLevelName();
//            int count = totalService.getPrizeItemCountByCompeteLevelWithSelective(l.getId(),chooseTime,profession);
//            data.add(new EchartData(l.getId(),l.getLevelName(),count));
//            index++;
//        }
//        Map<String, Object> res = new HashMap<>();
//        res.put("categories",levels);
//        res.put("data",data);
//        return Json.toJson(res);
//    }
//
//    /**
//     * 赛事级别下 获取每个奖项的项目数
//     * @param levelId
//     * @return
//     */
//    @RequestMapping(value = "/get_ic_by_level2",produces = "text/html;charset=UTF-8")
//    @ResponseBody
//    public String getPrizeItemCountByLevelIdPrizeId(Integer levelId,String chooseTime,Integer profession){
//        if(StringUtils.isEmpty(chooseTime)){
//            chooseTime=null;
//        }
//        List<Prize> list = prizeService.getAll();
//        String[] prize = new String[list.size()];
//        List<EchartData> data = new ArrayList<>();
//        int index = 0;
//        for (Prize p:list) {
//            prize[index] = p.getPrizeName();
//            int count = totalService.getPrizeItemCountByLevelIdPrizeIdWithSelective(p.getId(),levelId,chooseTime,profession);
//            data.add(new EchartData(p.getId(),p.getPrizeName(),count));
//            index++;
//        }
//        Map<String, Object> res = new HashMap<>();
//        res.put("categories",prize);
//        res.put("data",data);
//        return Json.toJson(res);
//    }

    /*------------------------------------------------------------------------------------------*/

    /**
     * 项目统计 E_chart异步加载bar  获奖人数 赛事级别
     * @return
     */
    @RequestMapping(value = "/get_prize_pc",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getPrizePeopleCount(){
        List<Levels> list = levelService.getALL();
        String[] levels = new String[list.size()];
        List<EchartData> data = new ArrayList<>();
        int index = 0;
        for (Levels l:list) {
            levels[index] = l.getLevelName();
            int count = totalService.getNumberOfPeopleByLevelID(l.getId());
            data.add(new EchartData(l.getId(),l.getLevelName(),count));
            //counts[index] = count;
            index++;
        }
        Map<String, Object> res = new HashMap<>();
        res.put("categories",levels);
        res.put("data",data);
        return Json.toJson(res);
    }


    /**
     * 赛事级别 获奖项目数
     * @return
     */
    @RequestMapping(value = "/get_prize_ic",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getPrizeItemCount(){
        List<Levels> list = levelService.getALL();
        String[] levels = new String[list.size()];
        Integer[] counts = new Integer[list.size()];
        int index = 0;
        for (Levels l:list) {
            levels[index] = l.getLevelName();
            int count = totalService.getNumberOfItemByLevelID(l.getId());
            counts[index] = count;
            index++;
        }
        Map<String, Object> res = new HashMap<>();
        res.put("categories",levels);
        res.put("data",counts);
        return Json.toJson(res);
    }

    /**
     * 根据赛事级别获取具体获奖
     * @return
     */
    @RequestMapping(value = "/get_prize_pc2",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getPrizePeopleCount2(Integer levelId){
        List<Prize> list = prizeService.getAll();
        String[] prize = new String[list.size()];
        List<EchartData> data = new ArrayList<>();
        int index = 0;
        for (Prize p:list) {
            prize[index] = p.getPrizeName();
            //根据获奖等级获取人数
            int count = totalService.getNumberOfPeopleByPrizeIDLevelID(p.getId(),levelId);
            data.add(new EchartData(p.getId(),p.getPrizeName(),count));
            //counts[index] = count;
            index++;
        }
        Map<String, Object> res = new HashMap<>();
        res.put("categories",prize);
        res.put("data",data);
        return Json.toJson(res);
    }
    /*-----------------------------------------------------------------------------------------------*/

    /**
     * 获取个人报名参赛次数
     */
    @RequestMapping("/get_count")
    @ResponseBody
    public ServerResponse<Integer> getCount(String sno){
       int count =  totalService.getCountBySno(sno);
       return ServerResponse.createBySuccess("成功查询",count);
    }

    /**
     * 获取每个赛事的报名人数
     */
    @RequestMapping("/get_p_count")
    @ResponseBody
    public ServerResponse<Integer> getPCount(Integer matchID){
        int count =  totalService.getMatchPCount(matchID);
        return ServerResponse.createBySuccess("成功查询",count);
    }

    @RequestMapping("/to_itemTotal_list")
    public String toItemTotalList(){
        return "Admin/itemTotal_list";
    }
}
