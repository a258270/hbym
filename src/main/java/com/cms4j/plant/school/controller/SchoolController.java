package com.cms4j.plant.school.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.plant.major.major.service.MajorService;
import com.cms4j.plant.school.service.*;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.JurisdictionUtil;
import com.cms4j.base.util.LoggerUtil;
import com.cms4j.plant.user.service.ExamineeService;
import com.cms4j.plant.util.PlantConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

/**
* Description: SchoolController
* Created by zmj on 2017/07/24.
*/
@Controller
@RequestMapping(value = "/admin/school")
public class SchoolController extends PageBaseController {
    public SchoolController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "11";
    }

    @Autowired
    private SchoolService schoolService;

    @Autowired
    private DictionaryService dictionaryService;

    @Autowired
    private ArrangmentService arrangmentService;

    @Autowired
    private MajorService majorService;

    @Autowired
    private HasmajorService hasmajorService;

    @Autowired
    private ScpropertyService scpropertyService;

    @Autowired
    private SubjecttypeService subjecttypeService;

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

    /**
    * 加载院校信息页面
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() throws Exception {
        logger.begin("加载院校信息页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/school/index");

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

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.QUERY_QX);
        logger.end();
        return modelAndView;
    }

    /**
    * 加载新增院校信息页面
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView add() throws Exception {
        logger.begin("加载新增院校信息页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/school/add");

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

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.ADD_QX);
        logger.end();
        return modelAndView;
    }

    /**
    * 加载编辑院校信息页面
    * @param id
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable String id) throws Exception {
        logger.begin("加载编辑院校信息页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/school/edit");
        DataMap dataMap = new DataMap();
        dataMap.put("SCHOOL_ID", id);
        dataMap = schoolService.getSchoolById(dataMap);
        List<DataMap> subjecttypes = subjecttypeService.getSubjecttypeByScId(dataMap);
        dataMap.put("SUBJECTTYPE", subjecttypes);
        List<DataMap> arrangments = arrangmentService.getArrangmentByScId(dataMap);
        dataMap.put("ARRANGMENT", arrangments);
        List<DataMap> hasmajors = hasmajorService.getHasmajorByScId(dataMap);
        dataMap.put("HASMAJOR", hasmajors);
        List<DataMap> scpropertys = scpropertyService.getScpropertyByScId(dataMap);
        dataMap.put("SCPROPERTY", scpropertys);
        modelAndView.addObject("school", dataMap);

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

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.EDIT_QX);
        logger.end();
        return modelAndView;
    }

    @RequestMapping(value = "/edit/basic/{id}")
    public ModelAndView editBasic(@PathVariable String id) throws Exception {
        logger.begin("加载编辑院校信息页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/school/editbasic");

        DataMap school = new DataMap();
        school.put("SCHOOL_ID", id);
        school = schoolService.getSchoolById(school);
        modelAndView.addObject("school", school);

        DataMap introduction = scIntroductionService.getScIntroductionByScId(school);
        modelAndView.addObject("introduction", introduction);

        DataMap briefing = scBriefingService.getScBriefingByScId(school);
        modelAndView.addObject("briefing", briefing);

        DataMap faculty = scFacultyService.getScFacultyByScId(school);
        modelAndView.addObject("faculty", faculty);

        DataMap profession = scProfessionService.getScProfessionByScId(school);
        modelAndView.addObject("profession", profession);

        DataMap assets = scAssetsService.getScAssetsByScId(school);
        modelAndView.addObject("assets", assets);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.EDIT_QX);
        logger.end();
        return modelAndView;
    }

    @RequestMapping(value = "/addarticle")
    public ModelAndView addArticle() throws Exception {
        logger.begin("加载编辑院校信息页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/school/article/add");

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.ADD_QX);
        logger.end();
        return modelAndView;
    }
}
