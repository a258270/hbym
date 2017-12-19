package com.cms4j.wechat.applet.major.controller;

import com.cms4j.base.controller.ApiBaseController;
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

    @RequestMapping(value = "/get")
    public InvokeResult get() throws Exception {
        DataMap dataMap = this.getDataMap();

        return InvokeResult.success(hasmajorService.getHasmajorByScId(dataMap));
    }

    @RequestMapping(value = "/getmajorbyschool")
    public InvokeResult getMajorBySchool() throws Exception {
        DataMap dataMap = this.getDataMap();
        DataMap curUser = SessionUtil.getCurUser();
        DataMap examinee = examineeService.getExamineeByUserId(curUser);
        if(examinee == null) return InvokeResult.failure("请完善考生信息");
        dataMap.put("MAJORTYPE_ID", examinee.getString("MAJORTYPE"));

        return InvokeResult.success(mjscoreService.getMjscoreBySchoolAndMajor(dataMap));
    }
    //专业库本科
    @RequestMapping(value = "/getbmajor")
    public InvokeResult getbmajor() throws Exception {
        //  ModelAndView modelAndView = this.getModelAndView();
        //  modelAndView.setViewName("/plant/ymplant/major/library");
        //majorService.getMajorsByLevel(PlantConst.MAJOR_BK, 2);//一级分类
        /*if(bmajors == null) bmajors = new ArrayList<>();
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
        modelAndView.addObject("bmajors", bmajorsOut);*/
        return InvokeResult.success(majorService.getMajorsByLevel(PlantConst.MAJOR_BK, 2));
     }
    //专业库专科
    public InvokeResult getzmajor() throws Exception {
       // List<DataMap> zmajors = majorService.getMajorsByLevel(PlantConst.MAJOR_ZK, 2);
        return InvokeResult.success(majorService.getMajorsByLevel(PlantConst.MAJOR_ZK, 2));
    }
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
