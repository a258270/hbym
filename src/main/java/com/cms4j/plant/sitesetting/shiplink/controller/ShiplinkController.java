package com.cms4j.plant.sitesetting.shiplink.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.plant.sitesetting.shiplink.service.ShiplinkService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.JurisdictionUtil;
import com.cms4j.base.util.LoggerUtil;
import com.cms4j.base.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

/**
* Description: ShiplinkController
* Created by zmj on 2017/08/15.
*/
@Controller
@RequestMapping(value = "/admin/shiplink")
public class ShiplinkController extends PageBaseController {
    public ShiplinkController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "15";
    }

    @Autowired
    private ShiplinkService shiplinkService;

    @Autowired
    private DictionaryService dictionaryService;

    /**
    * 加载友情链接页面
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() throws Exception {
        logger.begin("加载友情链接页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/sitesetting/shiplink/index");


        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.QUERY_QX);
        logger.end();
        return modelAndView;
    }

    /**
    * 加载新增友情链接页面
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView add() throws Exception {
        logger.begin("加载新增友情链接页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/sitesetting/shiplink/add");


        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.ADD_QX);
        logger.end();
        return modelAndView;
    }

    /**
    * 加载编辑友情链接页面
    * @param id
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable String id) throws Exception {
        logger.begin("加载编辑友情链接页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/sitesetting/shiplink/edit");
        DataMap dataMap = new DataMap();
        dataMap.put("SHIPLINK_ID", id);
        dataMap = shiplinkService.getShiplinkById(dataMap);
        modelAndView.addObject("shiplink", dataMap);


        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.EDIT_QX);
        logger.end();
        return modelAndView;
    }
}
