package com.cms4j.plant.major.major.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.plant.major.major.service.MajorService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.JurisdictionUtil;
import com.cms4j.base.util.LoggerUtil;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.util.PlantConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

/**
* Description: MajorController
* Created by zmj on 2017/09/13.
*/
@Controller
@RequestMapping(value = "/admin/major")
public class MajorController extends PageBaseController {
    public MajorController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "18";
    }

    @Autowired
    private MajorService majorService;

    @Autowired
    private DictionaryService dictionaryService;

    /**
    * 加载专业页面
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() throws Exception {
        logger.begin("加载专业页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/major/major/index");


        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.QUERY_QX);
        logger.end();
        return modelAndView;
    }

    /**
    * 加载新增专业页面
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/add/{flag}", method = RequestMethod.GET)
    public ModelAndView add(@PathVariable String flag) throws Exception {
        logger.begin("加载新增专业页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/major/major/add");

        List<DataMap> majors = majorService.getMajorsByLevel(flag, 4);
        modelAndView.addObject("majors", majors);

        modelAndView.addObject("flag", flag);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.ADD_QX);
        logger.end();
        return modelAndView;
    }

    /**
    * 加载编辑专业页面
    * @param id
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable String id) throws Exception {
        logger.begin("加载编辑专业页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/major/major/edit");
        DataMap dataMap = new DataMap();
        dataMap.put("MAJOR_ID", id);
        dataMap = majorService.getMajorById(dataMap);
        modelAndView.addObject("major", dataMap);

        /*List<DataMap> majors = majorService.getLeafMajors();
        modelAndView.addObject("majors", majors);*/

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.EDIT_QX);
        logger.end();
        return modelAndView;
    }
}
