package com.cms4j.plant.yf.yf.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.plant.yf.yf.service.YfService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.JurisdictionUtil;
import com.cms4j.base.util.LoggerUtil;
import com.cms4j.base.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

/**
* Description: YfController
* Created by zmj on 2017/09/18.
*/
@Controller
@RequestMapping(value = "/admin/yf")
public class YfController extends PageBaseController {
    public YfController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "19";
    }

    @Autowired
    private YfService yfService;

    @Autowired
    private DictionaryService dictionaryService;

    /**
    * 加载一分一档页面
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() throws Exception {
        logger.begin("加载一分一档页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/yf/yf/index");


        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.QUERY_QX);
        logger.end();
        return modelAndView;
    }

    /**
    * 加载新增一分一档页面
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView add() throws Exception {
        logger.begin("加载新增一分一档页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/yf/yf/add");

        DataMap dataMap = new DataMap();
        dataMap.put("CODE", "YEAR");
        dataMap = dictionaryService.getDictionaryByCode(dataMap);
        List<DataMap> YEARs = dictionaryService.getDictionariesByFatherId(dataMap);
        modelAndView.addObject("YEARs", YEARs);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.ADD_QX);
        logger.end();
        return modelAndView;
    }

    /**
    * 加载编辑一分一档页面
    * @param id
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable String id) throws Exception {
        logger.begin("加载编辑一分一档页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/yf/yf/edit");
        DataMap dataMap = new DataMap();
        dataMap.put("YF_ID", id);
        dataMap = yfService.getYfById(dataMap);
        modelAndView.addObject("yf", dataMap);


        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.EDIT_QX);
        logger.end();
        return modelAndView;
    }
}
