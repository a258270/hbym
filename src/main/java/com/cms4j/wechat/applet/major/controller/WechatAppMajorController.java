package com.cms4j.wechat.applet.major.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.Page;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.major.major.service.MajorService;
import com.cms4j.plant.school.mjscore.service.MjscoreService;
import com.cms4j.plant.school.service.HasmajorService;
import com.cms4j.plant.user.service.ExamineeService;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@RestController
@RequestMapping(value = "/wechat/applet/major")
public class WechatAppMajorController extends ApiBaseController {

    @Autowired
    private HasmajorService hasmajorService;
    @Autowired
    private MjscoreService mjscoreService;
    @Autowired
    private ExamineeService examineeService;
    @Autowired
    private MajorService majorService;
    @Autowired
    private DictionaryService dictionaryService;

    @RequestMapping(value = "/get")
    public InvokeResult get() throws Exception {
        DataMap dataMap = this.getDataMap();

        return InvokeResult.success(hasmajorService.getHasmajorByScId(dataMap));
    }

    /**
     * 按照院校和专业id获取历史分数
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getmajorbyschool")
    public InvokeResult getMajorBySchool() throws Exception {
        DataMap dataMap = this.getDataMap();
        DataMap curUser = SessionUtil.getCurUser();
        DataMap examinee = examineeService.getExamineeByUserId(curUser);
        if(examinee == null) return InvokeResult.failure("请完善考生信息");
        dataMap.put("MAJORTYPE_ID", examinee.getString("MAJORTYPE"));

        return InvokeResult.success(mjscoreService.getMjscoreBySchoolAndMajor(dataMap));
    }

    /**
     * 获取专业库所有2级专业信息
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getmajorlibrary")
    public InvokeResult getMajorLibrary() throws Exception {
        DataMap dataMap = this.getDataMap();
        String[] param = {"CODE"};
        if(!this.validParams(param)) {
            return this.validFailure();
        }

        //level为2，由于1级专业信息有标志父节点，所以在字典表中1级专业信息属第2级
        List<DataMap> majors = majorService.getMajorsByLevel(dataMap.getString("CODE"), 2);
        if(majors == null) majors = new ArrayList<DataMap>();
        for(DataMap major : majors) {
            List<DataMap> childs = dictionaryService.getDictionariesByFatherId(major);
            if(childs == null) childs = new ArrayList<DataMap>();
            major.put("childs", childs);
        }

        return InvokeResult.success(majors);
    }

    /**
     * 根据父级专业节点获取子节点
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getmajorbyfatherid")
    public InvokeResult getMajorByFatherId() throws Exception {
        DataMap dataMap = this.getDataMap();

        String[] param = {"MAJOR_ID"};
        if(!this.validParams(param)) {
            return this.validFailure();
        }

        dataMap.put("DIC_ID", dataMap.getString("MAJOR_ID"));
        List<DataMap> majors = dictionaryService.getDictionariesByFatherId(dataMap);
        return InvokeResult.success(majors);
    }

    /**
     * 获取专业详细信息
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getmajordetails")
    public InvokeResult getMajorDetails() throws Exception {
        DataMap dataMap = this.getDataMap();

        String[] param = {"MAJOR_ID"};
        if(!this.validParams(param)) {
            return this.validFailure();
        }

        dataMap.put("DIC_ID", dataMap.getString("MAJOR_ID"));
        majorService.viewMajor(dataMap);
        dataMap = majorService.getMajorByMajorId(dataMap);

        if(dataMap != null) {
            if(!StringUtils.isBlank(dataMap.getString("CODE"))){
                DataMap classes = new DataMap();
                classes.put("CODE", dataMap.getString("CODE").substring(0, dataMap.getString("CODE").length() - 1));

                classes = dictionaryService.getDictionaryByCode(classes);
                List<DataMap> classesList = dictionaryService.getDictionariesByFatherId(classes);
                if(classesList != null && classesList.size() > 0)
                    dataMap.put("hasClasses", classesList.get(0).getString("NAME"));
            }
        }

        return InvokeResult.success(dataMap);
    }
    //专业库本科
   /* @RequestMapping(value = "/getbmajor")
    public InvokeResult getbmajor() throws Exception {
        //  ModelAndView modelAndView = this.getModelAndView();
        //  modelAndView.setViewName("/plant/ymplant/major/library");
        //majorService.getMajorsByLevel(PlantConst.MAJOR_BK, 2);//一级分类
        *//*if(bmajors == null) bmajors = new ArrayList<>();
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
        modelAndView.addObject("bmajors", bmajorsOut);*//*
        return InvokeResult.success(majorService.getMajorsByLevel(PlantConst.MAJOR_BK, 2));
     }
    //专业库专科
    public InvokeResult getzmajor() throws Exception {
       // List<DataMap> zmajors = majorService.getMajorsByLevel(PlantConst.MAJOR_ZK, 2);
        return InvokeResult.success(majorService.getMajorsByLevel(PlantConst.MAJOR_ZK, 2));
    }*/
       /* List<DataMap> zmajors = majorService.getMajorsByLevel(PlantConst.MAJOR_ZK, 2);//一级分类
        if(zmajors == null) zmajors = new ArrayList<>();

        for(int i = 0; i < zmajors.size(); i++) {
            Collections.sort(zmajors, new Comparator<DataMap>() {
                @Override
                public int compare(DataMap o1, DataMap o2) {
                    if(StringUtils.isBlank(o1.getString("NAME")) || StringUtils.isBlank(o2.getString("NAME")))
                        return 0;
                    return o1.getString("NAME").length() - o2.getString("NAME").length();
                }
            });
        }

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

        modelAndView.addObject("curPage", "library");
        return modelAndView;*/
}
