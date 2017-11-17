package com.cms4j.plant.school.mjscore.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.JurisdictionUtil;
import com.cms4j.base.util.LoggerUtil;
import com.cms4j.plant.school.mjscore.service.MjscoreService;
import com.cms4j.plant.school.service.HasmajorService;
import com.cms4j.plant.school.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/admin/mjscore")
public class MjscoreController extends PageBaseController {
    public MjscoreController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "11";
    }

    @Autowired
    private MjscoreService mjscoreService;

    @Autowired
    private DictionaryService dictionaryService;

    @Autowired
    private SchoolService schoolService;

    @Autowired
    private HasmajorService hasmajorService;

    /**
     * 加载新增院校专业分页面
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/add/{id}", method = RequestMethod.GET)
    public ModelAndView add(@PathVariable String id) throws Exception {
        logger.begin("加载新增院校专业分页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/school/mjscore/add");

        DataMap school = new DataMap();
        school.put("SCHOOL_ID", id);
        school = schoolService.getSchoolById(school);
        modelAndView.addObject("school", school);
        List<DataMap> mjscores = mjscoreService.getMjscoresByScId(school);
        modelAndView.addObject("mjscores", mjscores);

        DataMap YEAR = new DataMap();
        YEAR.put("CODE", "YEAR");
        YEAR = dictionaryService.getDictionaryByCode(YEAR);
        List<DataMap> YEARs = (List<DataMap>) dictionaryService.getDictionariesByFatherId(YEAR);
        modelAndView.addObject("YEARs", YEARs);
        DataMap ARRANGMENT = new DataMap();
        ARRANGMENT.put("CODE", "ARRANGMENT");
        ARRANGMENT = dictionaryService.getDictionaryByCode(ARRANGMENT);
        List<DataMap> ARRANGMENTs = (List<DataMap>) dictionaryService.getDictionariesByFatherId(ARRANGMENT);
        modelAndView.addObject("ARRANGMENTs", ARRANGMENTs);
        DataMap MAJORTYPE = new DataMap();
        MAJORTYPE.put("CODE", "MAJORTYPE");
        MAJORTYPE = dictionaryService.getDictionaryByCode(MAJORTYPE);
        List<DataMap> MAJORTYPEs = dictionaryService.getDictionariesByFatherId(MAJORTYPE);
        modelAndView.addObject("MAJORTYPEs", MAJORTYPEs);
        List<DataMap> majors = hasmajorService.getHasmajorByScId(school);
        modelAndView.addObject("MAJORs", majors);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.ADD_QX);
        logger.end();
        return modelAndView;
    }
}
