package com.cms4j.plant.major.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.Page;
import com.cms4j.plant.major.major.service.MajorService;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/plant/major")
public class MajorPageController extends PageBaseController {

    @Autowired
    private DictionaryService dictionaryService;
    @Autowired
    private MajorService majorService;

    @RequestMapping(value = "/index")
    public ModelAndView index() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/major/library");
        List<DataMap> bmajors = majorService.getMajorsByLevel(PlantConst.MAJOR_BK, 2);//一级分类
        if(bmajors == null) bmajors = new ArrayList<>();
        List bmajorsOut = new ArrayList();
        List bmajorsTmp = new ArrayList();
        for(int i = 0; i < bmajors.size(); i++) {
            if(i % 4 == 0){
                if(bmajorsTmp.size() > 0){
                    bmajorsOut.add(bmajorsTmp);
                    bmajorsTmp = new ArrayList();
                }
            }

            bmajorsTmp.add(bmajors.get(i));
            if(i == bmajors.size() - 1)
                bmajorsOut.add(bmajorsTmp);
        }
        modelAndView.addObject("bmajors", bmajorsOut);

        List<DataMap> zmajors = majorService.getMajorsByLevel(PlantConst.MAJOR_ZK, 2);//一级分类
        if(zmajors == null) zmajors = new ArrayList<>();

        List zmajorsOut = new ArrayList();
        List zmajorsTmp = new ArrayList();
        for(int i = 0; i < zmajors.size(); i++) {
            if(i % 4 == 0){
                if(zmajorsTmp.size() > 0){
                    zmajorsOut.add(zmajorsTmp);
                    zmajorsTmp = new ArrayList();
                }
            }

            zmajorsTmp.add(zmajors.get(i));
            if(i == zmajors.size() - 1)
                zmajorsOut.add(zmajorsTmp);
        }
        modelAndView.addObject("zmajors", zmajorsOut);

        Page page = new Page();
        page.setPageNumber(0);
        page.setPageSize(10);
        Map params = new HashMap();
        params.put("CODE", PlantConst.MAJOR_BK);
        page.setParams(params);
        List<DataMap> btopMajors = majorService.getTopMajors(page);
        modelAndView.addObject("btopMajors", btopMajors);

        params.put("CODE", PlantConst.MAJOR_ZK);
        page.setParams(params);
        List<DataMap> ztopMajors = majorService.getTopMajors(page);
        modelAndView.addObject("ztopMajors", ztopMajors);
        return modelAndView;
    }

    @RequestMapping(value = "/details/{id}")
    public ModelAndView details(@PathVariable String id) throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/major/details");

        DataMap major = new DataMap();
        major.put("DIC_ID", id);

        major = majorService.getMajorByMajorId(major);
        if(major != null) {
            if(!StringUtils.isBlank(major.getString("CODE"))){
                DataMap classes = new DataMap();
                classes.put("CODE", major.getString("CODE").substring(0, major.getString("CODE").length() - 1));

                classes = dictionaryService.getDictionaryByCode(classes);
                List<DataMap> classesList = dictionaryService.getDictionariesByFatherId(classes);
                if(classesList != null && classesList.size() > 0)
                    major.put("hasClasses", classesList.get(0).getString("NAME"));
            }
        }

        modelAndView.addObject("major", major);
        return modelAndView;
    }
}
