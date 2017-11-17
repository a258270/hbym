package com.cms4j.plant.news.news.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.system.user.service.UserService;
import com.cms4j.base.util.*;
import com.cms4j.plant.news.news.service.NewsService;
import com.cms4j.plant.util.PlantConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* Description: NewsController
* Created by zmj on 2017/08/14.
*/
@Controller
@RequestMapping(value = "/admin/news")
public class NewsController extends PageBaseController {
    public NewsController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "14";
    }

    @Autowired
    private NewsService newsService;

    @Autowired
    private DictionaryService dictionaryService;

    @Autowired
    private UserService userService;



    /**
    * 加载新闻页面
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() throws Exception {
        logger.begin("加载新闻页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/news/news/index");

        DataMap NEWSTYPE = new DataMap();
        NEWSTYPE.put("CODE", "NEWSTYPE");
        NEWSTYPE = dictionaryService.getDictionaryByCode(NEWSTYPE);
        List<DataMap> NEWSTYPEs = (List<DataMap>) dictionaryService.getDictionariesByFatherId(NEWSTYPE);
        modelAndView.addObject("NEWSTYPEs", NEWSTYPEs);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.QUERY_QX);
        logger.end();
        return modelAndView;
    }

    /**
    * 加载新增新闻页面
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView add() throws Exception {
        logger.begin("加载新增新闻页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/news/news/add");

        DataMap NEWSTYPE = new DataMap();
        NEWSTYPE.put("CODE", "NEWSTYPE");
        NEWSTYPE = dictionaryService.getDictionaryByCode(NEWSTYPE);
        List<DataMap> NEWSTYPEs = (List<DataMap>) dictionaryService.getDictionariesByFatherId(NEWSTYPE);
        modelAndView.addObject("NEWSTYPEs", NEWSTYPEs);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.ADD_QX);
        logger.end();
        return modelAndView;
    }

    /**
    * 加载编辑新闻页面
    * @param id
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable String id) throws Exception {
        logger.begin("加载编辑新闻页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/news/news/edit");
        DataMap dataMap = new DataMap();
        dataMap.put("NEWS_ID", id);
        dataMap = newsService.getNewsById(dataMap);
        modelAndView.addObject("news", dataMap);

        DataMap NEWSTYPE = new DataMap();
        NEWSTYPE.put("CODE", "NEWSTYPE");
        NEWSTYPE = dictionaryService.getDictionaryByCode(NEWSTYPE);
        List<DataMap> NEWSTYPEs = (List<DataMap>) dictionaryService.getDictionariesByFatherId(NEWSTYPE);
        modelAndView.addObject("NEWSTYPEs", NEWSTYPEs);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.EDIT_QX);
        logger.end();
        return modelAndView;
    }
}
