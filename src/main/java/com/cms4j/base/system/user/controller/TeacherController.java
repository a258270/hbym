package com.cms4j.base.system.user.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.JurisdictionUtil;
import com.cms4j.base.util.LoggerUtil;
import com.cms4j.plant.school.service.SchoolService;
import com.cms4j.plant.user.service.CompleteTeacherService;
import com.cms4j.plant.user.service.PlantUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/admin/teacher")
public class TeacherController extends PageBaseController {

    public TeacherController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "21";
    }

    @Autowired
    private DictionaryService dictionaryService;
    @Autowired
    private SchoolService schoolService;
    @Autowired
    private PlantUserService plantUserService;
    @Autowired
    private CompleteTeacherService completeTeacherService;

    @RequestMapping(value = "/index")
    public ModelAndView index() throws Exception {
        logger.begin("加载教师管理页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/base/system/user/teacher/index");

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.QUERY_QX);
        logger.end();
        return modelAndView;
    }

    @RequestMapping(value = "/add")
    public ModelAndView add() throws Exception {
        logger.begin("加载教师新增页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/base/system/user/teacher/add");

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

        List<DataMap> schoolObjs = schoolService.getAllSchools();
        modelAndView.addObject("schoolObjs", schoolObjs);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.ADD_QX);
        logger.end();
        return modelAndView;
    }

    @RequestMapping(value = "/edit/{id}")
    public ModelAndView edit(@PathVariable String id) throws Exception {

        logger.begin("加载教师编辑页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/base/system/user/teacher/edit");

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

        List<DataMap> schoolObjs = schoolService.getAllSchools();
        modelAndView.addObject("schoolObjs", schoolObjs);

        DataMap teacher = new DataMap();
        teacher.put("USER_ID", id);
        teacher = plantUserService.getUserByUserId(teacher);
        DataMap complete = completeTeacherService.getCompleteTeacherByUserId(teacher);

        modelAndView.addObject("teacher", teacher);
        modelAndView.addObject("complete", complete);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.ADD_QX);
        logger.end();
        return modelAndView;
    }
}
