package com.cms4j.plant.school.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.Page;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.school.scscore.service.ScscoreService;
import com.cms4j.plant.school.service.*;
import com.cms4j.plant.user.service.CompleteTeacherService;
import com.cms4j.plant.user.service.ScImageService;
import com.cms4j.plant.user.service.ScVideoService;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/plant/school")
public class SchoolPageController extends PageBaseController {

    @Autowired
    private SchoolService schoolService;
    @Autowired
    private CompleteTeacherService completeTeacherService;
    @Autowired
    private ScStoreupService scStoreupService;
    @Autowired
    private ScIntroductionService scIntroductionService;
    @Autowired
    private ScFacultyService scFacultyService;
    @Autowired
    private ScscoreService scscoreService;
    @Autowired
    private ScArticleService scArticleService;
    @Autowired
    private ScVideoService scVideoService;
    @Autowired
    private ScImageService scImageService;
    @Autowired
    private ScpropertyService scpropertyService;
    @Autowired
    private SubjecttypeService subjecttypeService;

    @RequestMapping(value = "/online")
    public ModelAndView index() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/school/online");

        Page page = new Page();
        page.setPageSize(10);
        page.setPageNumber(0);
        List<DataMap> schools = schoolService.getSchoolsOrderByViewcount(page);
        modelAndView.addObject("topSchools", schools);

        return modelAndView;
    }

    @RequestMapping(value = "/details/{id}")
    public ModelAndView details(@PathVariable String id) throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/school/details");

        DataMap school = new DataMap();
        school.put("SCHOOL_ID", id);
        school = schoolService.getSchoolById(school);

        Page page = new Page();
        page.setPageNumber(0);
        page.setPageSize(7);
        page.setParams(school);
        List<DataMap> articles = scArticleService.getArticlesByScId(page);
        modelAndView.addObject("articles", articles);

        List<DataMap> videos = scVideoService.getVideosByScId(school);
        modelAndView.addObject("videos", videos);

        List<DataMap> images = scImageService.getImagesByScId(school);
        modelAndView.addObject("images", images);

        List<DataMap> teachers = completeTeacherService.getCompleteTeacherByScId(school);
        modelAndView.addObject("teachers", teachers);

        if(school != null){
            List<DataMap> properties = scpropertyService.getScpropertyByScId(school);
            if(properties == null) properties = new ArrayList<DataMap>();
            school.put("properties", properties);

            List<DataMap> subjecttypes = subjecttypeService.getSubjecttypeByScId(school);
            if(subjecttypes == null) subjecttypes = new ArrayList<DataMap>();
            school.put("subjecttypes", subjecttypes);

            String province = school.getString("PROVINCE");
            DataMap param = new DataMap();
            param.put("PROVINCE", province);
            Page pageTmp = new Page();
            pageTmp.setPageSize(8);
            pageTmp.setParams(param);
            pageTmp.setPageNumber(0);
            List<DataMap> otherSchools = schoolService.getSchools(pageTmp);
            modelAndView.addObject("otherSchools", otherSchools);
        }
        modelAndView.addObject("school", school);

        DataMap param = new DataMap();
        param.put("SCHOOL_ID", school.getString("SCHOOL_ID"));
        param.put("MAJORTYPE_ID", PlantConst.MAJORTYPE_W);
        List<DataMap> wscores = scscoreService.getScscoresByYearAndMajortype(param);
        modelAndView.addObject("wscores", wscores);

        param.put("MAJORTYPE_ID", PlantConst.MAJORTYPE_L);
        List<DataMap> lscores = scscoreService.getScscoresByYearAndMajortype(param);
        modelAndView.addObject("lscores", lscores);

        DataMap introduction = scIntroductionService.getScIntroductionByScId(school);
        modelAndView.addObject("introduce", introduction);

        DataMap faculty = scFacultyService.getScFacultyByScId(school);
        modelAndView.addObject("faculty", faculty);

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser != null) {
            school.putAll(curUser);
            if(scStoreupService.getScStoreUpByScIdAndUserId(school)){
                modelAndView.addObject("isStoreUp", "true");
            }
        }

        return modelAndView;
    }

    @RequestMapping(value = "/library")
    public ModelAndView library() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/school/library");
        DataMap dataMap = this.getDataMap();

        String param = "";
        if(!StringUtils.isBlank(dataMap.getString("province"))){
            param += "provinces:'" + dataMap.getString("province") + "',";
        }
        if(!StringUtils.isBlank(dataMap.getString("property"))){
            param += "properties:'" + dataMap.getString("property") + "',";
        }
        if(!StringUtils.isBlank(dataMap.getString("arrangment"))){
            param += "arrangments:'" + dataMap.getString("arrangment") + "',";
        }
        if(!StringUtils.isBlank(dataMap.getString("name"))){
            param += "NAME:'" + dataMap.getString("name") + "',";
        }

        if(!param.isEmpty()) {
            modelAndView.addObject("param", param);
        }

        return modelAndView;
    }
}
