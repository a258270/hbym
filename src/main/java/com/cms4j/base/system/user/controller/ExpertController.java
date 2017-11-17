package com.cms4j.base.system.user.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.JurisdictionUtil;
import com.cms4j.base.util.LoggerUtil;
import com.cms4j.plant.user.service.CompleteProService;
import com.cms4j.plant.user.service.PlantUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/admin/expert")
public class ExpertController extends PageBaseController {

    public ExpertController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "22";
    }

    @Autowired
    private DictionaryService dictionaryService;
    @Autowired
    private PlantUserService plantUserService;
    @Autowired
    private CompleteProService completeProService;

    @RequestMapping(value = "/index")
    public ModelAndView index() throws Exception {
        logger.begin("加载专家管理页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/base/system/user/expert/index");

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.QUERY_QX);
        logger.end();
        return modelAndView;
    }

    @RequestMapping(value = "/add")
    public ModelAndView add() throws Exception {
        logger.begin("加载专家新增页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/base/system/user/expert/add");

        DataMap sexObj = new DataMap();
        sexObj.put("CODE", "SEX");
        sexObj = dictionaryService.getDictionaryByCode(sexObj);
        List<DataMap> sexObjs = dictionaryService.getDictionariesByFatherId(sexObj);
        modelAndView.addObject("sexObjs", sexObjs);

        DataMap joblifeObj = new DataMap();
        joblifeObj.put("CODE", "JOBLIFE");
        joblifeObj = dictionaryService.getDictionaryByCode(joblifeObj);
        List<DataMap> joblifeObjs = dictionaryService.getDictionariesByFatherId(joblifeObj);
        modelAndView.addObject("joblifeObjs", joblifeObjs);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.ADD_QX);
        logger.end();
        return modelAndView;
    }

    @RequestMapping(value = "/edit/{id}")
    public ModelAndView edit(@PathVariable String id) throws Exception {
        logger.begin("加载专家编辑页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/base/system/user/expert/edit");

        DataMap sexObj = new DataMap();
        sexObj.put("CODE", "SEX");
        sexObj = dictionaryService.getDictionaryByCode(sexObj);
        List<DataMap> sexObjs = dictionaryService.getDictionariesByFatherId(sexObj);
        modelAndView.addObject("sexObjs", sexObjs);

        DataMap joblifeObj = new DataMap();
        joblifeObj.put("CODE", "JOBLIFE");
        joblifeObj = dictionaryService.getDictionaryByCode(joblifeObj);
        List<DataMap> joblifeObjs = dictionaryService.getDictionariesByFatherId(joblifeObj);
        modelAndView.addObject("joblifeObjs", joblifeObjs);

        DataMap expert = new DataMap();
        expert.put("USER_ID", id);
        expert = plantUserService.getUserByUserId(expert);
        DataMap complete = completeProService.getCompleteProByUserId(expert);

        modelAndView.addObject("expert", expert);
        modelAndView.addObject("complete", complete);
        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.ADD_QX);
        logger.end();
        return modelAndView;
    }
}
