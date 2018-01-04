package com.cms4j.plant.index.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.util.*;
import com.cms4j.plant.item.item.service.ItemService;
import com.cms4j.plant.major.major.service.MajorService;
import com.cms4j.plant.news.news.service.NewsService;
import com.cms4j.plant.news.news.service.NewsViewService;
import com.cms4j.plant.school.service.ArrangmentService;
import com.cms4j.plant.school.service.SchoolService;
import com.cms4j.plant.school.service.ScpropertyService;
import com.cms4j.plant.user.service.CompleteProService;
import com.cms4j.plant.user.service.CompleteTeacherService;
import com.cms4j.plant.user.service.ExamineeService;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * description:
 *
 * @author: zmj
 * @create: 2017/6/28
 */
@Controller
public class PlantIndexController extends PageBaseController {
    public PlantIndexController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
    }

    @Autowired
    private NewsService newsService;
    @Autowired
    private ItemService itemService;
    @Autowired
    private SchoolService schoolService;
    @Autowired
    private ArrangmentService arrangmentService;
    @Autowired
    private CompleteTeacherService completeTeacherService;
    @Autowired
    private ScpropertyService scpropertyService;
    @Autowired
    private CompleteProService completeProService;
    @Autowired
    private ExamineeService examineeService;
    @Autowired
    private DictionaryService dictionaryService;
    @Autowired
    private MajorService majorService;
    @Autowired
    private NewsViewService newsViewService;

    @RequestMapping(value = {"/plant/index", "/"}, method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        String agent = request.getHeader("user-agent");
        if(!agent.toLowerCase().contains("windows")) {//移动端用户
            modelAndView.setViewName("redirect:/plant/guide");
            return modelAndView;
        }
        Page page = new Page();
        page.setPageNumber(0);
        page.setPageSize(11);
        DataMap params = new DataMap();
        params.put("NEWSTYPE", PlantConst.NEWSTYPE_XXHD);
        page.setParams(params);
        List<DataMap> news = newsService.getNewss(page);
        modelAndView.setViewName("/plant/index");
        /*if(news != null && news.size() > 0){
            DataMap newTop1 = news.get(0);
            news.remove(0);
            modelAndView.addObject("newsTop1", newTop1);
        }
        else{
            modelAndView.addObject("newsTop1", null);
        }*/

        modelAndView.addObject("news", news);

        params.put("NEWSTYPE", PlantConst.NEWSTYPE_GKDT);
        page.setParams(params);
        page.setPageSize(15);
        List<DataMap> news2 = newsService.getNewss(page);
        /*if(news2 != null && news2.size() > 0){
            DataMap newTop1_2 = news2.get(0);
            news2.remove(0);
            modelAndView.addObject("newsTop1_2", newTop1_2);
        }
        else{
            modelAndView.addObject("newsTop1_2", null);
        }*/
        modelAndView.addObject("news2", news2);

        params.put("NEWSTYPE", PlantConst.NEWSTYPE_JXSP);
        page.setParams(params);
        page.setPageSize(9);
        List<DataMap> news3 = newsService.getNewss(page);
        modelAndView.addObject("news3", news3);

        params.put("NEWSTYPE", PlantConst.NEWSTYPE_GG);
        page.setParams(params);
        page.setPageSize(5);
        List<DataMap> news_gg = newsService.getNewss(page);

        //过滤已读的公告
        if(PlantConst.NEWSTYPE_GG.equals(params.getString("NEWSYPE")) && SessionUtil.getCurUser() != null && news_gg != null) {
            DataMap param = new DataMap();
            param.put("USER_ID", SessionUtil.getCurUser().getString("USER_ID"));
            List<DataMap> ggs = newsViewService.getNewsViewsByUserId(param);
            if(ggs != null) {
                for(DataMap gg : ggs) {
                    for(DataMap newsObj : news_gg) {
                        if(newsObj.getString("NEWS_ID").equals(gg.getString("NEWS_ID"))) {
                            news_gg.remove(newsObj);
                            break;
                        }
                    }
                }
            }
        }
        modelAndView.addObject("news_gg", news_gg);

        List<DataMap> advertisementSchools = schoolService.getHasAdvertisementSchools();
        if(advertisementSchools == null) advertisementSchools = new ArrayList<DataMap>();

        for(DataMap school : advertisementSchools) {
            List<DataMap> arrangments = arrangmentService.getArrangmentByScId(school);
            if(arrangments == null) arrangments = new ArrayList<DataMap>();

            if(arrangments.size() == 0) school.put("ARRANGMENT", "暂无");
            for(DataMap arrangment : arrangments) {
                if(PlantConst.ARRANGMENT_B1.equals(arrangment.getString("DIC_ID")) || PlantConst.ARRANGMENT_B2.equals(arrangment.getString("DIC_ID"))) {
                    school.put("ARRANGMENT", "本科");
                    break;
                }
                if(PlantConst.ARRANGMENT_Z1.equals(arrangment.getString("DIC_ID"))) {
                    school.put("ARRANGMENT", "专科");
                }
            }
            if(StringUtils.isBlank(school.getString("ARRANGMENT"))) school.put("ARRANGMENT", "本科");

            List<DataMap> teachers = completeTeacherService.getCompleteTeacherByScId(school);
            school.put("teachers", teachers);

            List<DataMap> properties = scpropertyService.getScpropertyByScId(school);
            school.put("properties", properties);
        }

        modelAndView.addObject("advertisementSchools", advertisementSchools);

        page.setPageSize(10);
        page.setParams(new DataMap());
        List<DataMap> experts = completeProService.getCompletePros(page);
        modelAndView.addObject("experts", experts);

        int distanceExam = DateUtil.getDaysDistanceExam();
        modelAndView.addObject("distanceExam", distanceExam);

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser != null && PlantConst.ROLE_STUDENT.equals(curUser.getString("ROLE_ID"))) {
            DataMap exam = examineeService.getExamineeByUserId(curUser);
            modelAndView.addObject("exam", exam);
        }

        DataMap province = new DataMap();
        province.put("CODE", "PROVINCE");
        province = dictionaryService.getDictionaryByCode(province);
        List<DataMap> provinces = dictionaryService.getDictionariesByFatherId(province);
        modelAndView.addObject("provinces", provinces);

        DataMap arrangment = new DataMap();
        arrangment.put("CODE", "ARRANGMENT");
        arrangment = dictionaryService.getDictionaryByCode(arrangment);
        List<DataMap> arrangments = dictionaryService.getDictionariesByFatherId(arrangment);
        modelAndView.addObject("arrangments", arrangments);

        /*DataMap scproperty = new DataMap();
        scproperty.put("CODE", "SCPROPERTY");
        scproperty = dictionaryService.getDictionaryByCode(scproperty);
        List<DataMap> scproperties = dictionaryService.getDictionariesByFatherId(scproperty);
        modelAndView.addObject("scproperties", scproperties);

        List<DataMap> bmajors = majorService.getMajorsByLevel(PlantConst.MAJOR_BK, 2);//一级分类
        if(bmajors == null) bmajors = new ArrayList<>();
        modelAndView.addObject("bmajors", bmajors);

        List<DataMap> zmajors = majorService.getMajorsByLevel(PlantConst.MAJOR_ZK, 2);//一级分类
        if(zmajors == null) zmajors = new ArrayList<>();

        modelAndView.addObject("zmajors", zmajors);*/


        //加载商品
        /*page.setParams(new HashMap());
        page.setPageNumber(0);
        page.setPageSize(8);
        List<DataMap> items = itemService.getAllSalingItems(page);
        modelAndView.addObject("items", items);*/

        modelAndView.addObject("curPage", "index");
        return modelAndView;
    }

    @RequestMapping(value = "/plant/clause")
    public ModelAndView clause() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/below/clause");

        return modelAndView;
    }

    @RequestMapping(value = "/plant/disclaimer")
    public ModelAndView disclaimer() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/below/disclaimer");

        return modelAndView;
    }

    @RequestMapping(value = "/plant/statement")
    public ModelAndView statement() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/below/statement");

        return modelAndView;
    }

    @RequestMapping(value = "/plant/guide")
    public ModelAndView guid() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/guide");

        return modelAndView;
    }
}
