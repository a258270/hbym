package com.cms4j.plant.user.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.major.major.service.MajorService;
import com.cms4j.plant.school.service.*;
import com.cms4j.plant.user.service.CompleteTeacherService;
import com.cms4j.plant.user.service.ScVideoService;
import com.cms4j.plant.util.PlantConst;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/plant/teacher")
public class PlantTeacherController extends PageBaseController {

    @Autowired
    private CompleteTeacherService completeTeacherService;
    @Autowired
    private ScVideoService scVideoService;
    @Autowired
    private SchoolService schoolService;
    @Autowired
    private DictionaryService dictionaryService;
    @Autowired
    private MajorService majorService;
    @Autowired
    private SubjecttypeService subjecttypeService;
    @Autowired
    private ScpropertyService scpropertyService;
    @Autowired
    private ArrangmentService arrangmentService;

    @Autowired
    private ScIntroductionService scIntroductionService;
    @Autowired
    private ScAssetsService scAssetsService;
    @Autowired
    private ScBriefingService scBriefingService;
    @Autowired
    private ScFacultyService scFacultyService;
    @Autowired
    private ScProfessionService scProfessionService;

    @Autowired
    private ScArticleService scArticleService;

    @RequestMapping(value = "/basic")
    public ModelAndView basic() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))){
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        DataMap complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
        if(complete == null) {
            completeTeacherService.addCompleteTeacher(new DataMap());
            complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
        }
        modelAndView.addObject("complete", complete);

        Integer completeCount = 0;
        String completeLevel = "低";
        String isRealName = "false";
        String isPhone = "false";
        String isEmail = "false";
        String isTrade = "false";
        if(complete != null){
            if (!StringUtils.isBlank(complete.getString("IDCARD"))){
                completeCount += 25;
                isRealName = "true";
            }

            if (!StringUtils.isBlank(complete.getString("PHONE"))){
                completeCount += 25;
                isPhone = "true";
            }

            if (!StringUtils.isBlank(complete.getString("EMAIL"))){
                completeCount += 25;
                isEmail = "true";
            }

            if (!StringUtils.isBlank(complete.getString("TRADEPASSWORD"))){
                completeCount += 25;
                isTrade = "true";
            }
        }

        if(completeCount >= 75){
            completeLevel = "高";
        }
        else if(completeCount >= 50){
            completeLevel = "中";
        }
        modelAndView.addObject("completeLevel", completeLevel);
        modelAndView.addObject("completeCount", completeCount);
        modelAndView.addObject("isRealName", isRealName);
        modelAndView.addObject("isPhone", isPhone);
        modelAndView.addObject("isEmail", isEmail);
        modelAndView.addObject("isTrade", isTrade);

        modelAndView.setViewName("/plant/ymplant/center/teacher/basic");

        return modelAndView;
    }

    @RequestMapping(value = "/center")
    public ModelAndView center() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/center/teacher/center");

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))){
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        DataMap complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
        if(complete == null) {
            completeTeacherService.addCompleteTeacher(new DataMap());
            complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
        }
        modelAndView.addObject("complete", complete);
        return modelAndView;
    }

    @RequestMapping(value = "/person")
    public ModelAndView person() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/center/teacher/person");
        return modelAndView;
    }

    @RequestMapping(value = "/record")
    public ModelAndView record() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/center/teacher/record");
        return modelAndView;
    }

    @RequestMapping(value = "/review")
    public ModelAndView review() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/center/teacher/review");
        return modelAndView;
    }

    @RequestMapping(value = "/video")
    public ModelAndView video() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))){
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        modelAndView.setViewName("/plant/ymplant/center/teacher/video/video");
        return modelAndView;
    }

    @RequestMapping(value = "/upload_video")
    public ModelAndView uploadVideo() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))){
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        modelAndView.setViewName("/plant/ymplant/center/teacher/video/video-two");
        return modelAndView;
    }

    @RequestMapping(value = "/edit_video/{id}")
    public ModelAndView editVideo(@PathVariable String id) throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))){
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        DataMap video = new DataMap();
        video.put("VIDEO_ID", id);
        video = scVideoService.getVideoById(video);

        modelAndView.addObject("video", video);

        modelAndView.setViewName("/plant/ymplant/center/teacher/video/video-edit");
        return modelAndView;
    }

    @RequestMapping(value = "/management")
    public ModelAndView management() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))){
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        DataMap complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
        DataMap school = schoolService.getSchoolById(complete);
        modelAndView.addObject("school", school);

        List<DataMap> subjecttypes = subjecttypeService.getSubjecttypeByScId(school);
        modelAndView.addObject("subjecttypes", subjecttypes);

        List<DataMap> properties = scpropertyService.getScpropertyByScId(school);
        modelAndView.addObject("properties", properties);

        List<DataMap> arrangments = arrangmentService.getArrangmentByScId(school);
        modelAndView.addObject("arrangments", arrangments);

        DataMap introduction = scIntroductionService.getScIntroductionByScId(school);
        modelAndView.addObject("introduction", introduction);

        DataMap assets = scAssetsService.getScAssetsByScId(school);
        modelAndView.addObject("assets", assets);

        DataMap briefing = scBriefingService.getScBriefingByScId(school);
        modelAndView.addObject("briefing", briefing);

        DataMap faculty = scFacultyService.getScFacultyByScId(school);
        modelAndView.addObject("faculty", faculty);

        DataMap profession = scProfessionService.getScProfessionByScId(school);
        modelAndView.addObject("profession", profession);

        DataMap PROVINCE = new DataMap();
        PROVINCE.put("CODE", "PROVINCE");
        PROVINCE = dictionaryService.getDictionaryByCode(PROVINCE);
        List<DataMap> PROVINCEs = (List<DataMap>) dictionaryService.getDictionariesByFatherId(PROVINCE);
        modelAndView.addObject("PROVINCEs", PROVINCEs);
        DataMap SCTYPE = new DataMap();
        SCTYPE.put("CODE", "SCTYPE");
        SCTYPE = dictionaryService.getDictionaryByCode(SCTYPE);
        List<DataMap> SCTYPEs = (List<DataMap>) dictionaryService.getDictionariesByFatherId(SCTYPE);
        modelAndView.addObject("SCTYPEs", SCTYPEs);
        DataMap SUBJECTTYPE = new DataMap();
        SUBJECTTYPE.put("CODE", "SUBJECTTYPE");
        SUBJECTTYPE = dictionaryService.getDictionaryByCode(SUBJECTTYPE);
        List<DataMap> SUBJECTTYPEs = (List<DataMap>) dictionaryService.getDictionariesByFatherId(SUBJECTTYPE);
        modelAndView.addObject("SUBJECTTYPEs", SUBJECTTYPEs);
        DataMap ARRANGMENT = new DataMap();
        ARRANGMENT.put("CODE", "ARRANGMENT");
        ARRANGMENT = dictionaryService.getDictionaryByCode(ARRANGMENT);
        List<DataMap> ARRANGMENTs = (List<DataMap>) dictionaryService.getDictionariesByFatherId(ARRANGMENT);
        modelAndView.addObject("ARRANGMENTs", ARRANGMENTs);

        List<DataMap> HASMAJORs = majorService.getLeafMajors(PlantConst.MAJOR_BK);
        modelAndView.addObject("HASMAJORs", HASMAJORs);

        DataMap SCPROPERTY = new DataMap();
        SCPROPERTY.put("CODE", "SCPROPERTY");
        SCPROPERTY = dictionaryService.getDictionaryByCode(SCPROPERTY);
        List<DataMap> SCPROPERTYs = (List<DataMap>) dictionaryService.getDictionariesByFatherId(SCPROPERTY);
        modelAndView.addObject("SCPROPERTYs", SCPROPERTYs);

        modelAndView.setViewName("/plant/ymplant/center/teacher/scbasic");
        return modelAndView;
    }

    @RequestMapping(value = "/picture")
    public ModelAndView picture() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))){
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        modelAndView.setViewName("/plant/ymplant/center/teacher/picture/picture");
        return modelAndView;
    }

    @RequestMapping(value = "/upload_image")
    public ModelAndView uploadImage() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))){
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        modelAndView.setViewName("/plant/ymplant/center/teacher/picture/picture-two");
        return modelAndView;
    }

    @RequestMapping(value = "/article")
    public ModelAndView article() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))){
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        modelAndView.setViewName("/plant/ymplant/center/teacher/article/article");
        return modelAndView;
    }

    @RequestMapping(value = "/addarticle")
    public ModelAndView addArticle() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))){
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        modelAndView.setViewName("/plant/ymplant/center/teacher/article/article-add");
        return modelAndView;
    }

    @RequestMapping(value = "/edit_article/{id}")
    public ModelAndView editArticle(@PathVariable String id) throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))){
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        DataMap article = new DataMap();
        article.put("ARTICLE_ID", id);
        article = scArticleService.getArticleById(article);

        modelAndView.addObject("article", article);

        modelAndView.setViewName("/plant/ymplant/center/teacher/article/article-edit");
        return modelAndView;
    }
}
