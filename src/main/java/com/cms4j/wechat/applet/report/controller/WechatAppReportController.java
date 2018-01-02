package com.cms4j.wechat.applet.report.controller;

import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.major.major.service.MajorService;
import com.cms4j.plant.school.service.SchoolService;
import com.cms4j.plant.user.service.ExamineeService;
import com.cms4j.plant.util.PlantConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Calendar;
import java.util.List;

@RestController
@RequestMapping(value = "/wechat/applet/report")
public class WechatAppReportController {

    @Autowired
    private MajorService majorService;
    @Autowired
    private ExamineeService examineeService;
    @Autowired
    private DictionaryService dictionaryService;
    @Autowired
    private SchoolService schoolService;

    @RequestMapping(value = "/getschools")
    public InvokeResult getSchools() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();

        DataMap examinee = examineeService.getExamineeByUserId(curUser);

        DataMap param = new DataMap();

        /*Calendar a = Calendar.getInstance();*/
        String lastYear = DateUtil.getLastYearByAdoptNumber(dictionaryService, 1);
        param.put("YEAR_ID", lastYear);
        /*DataMap YEAR = new DataMap();
        YEAR.put("CODE", "YEAR");
        YEAR = dictionaryService.getDictionaryByCode(YEAR);
        List<DataMap> YEARs = dictionaryService.getDictionariesByFatherId(YEAR);
        for(DataMap YEARTmp : YEARs) {
            if(YEARTmp.getString("NAME").equals(lastYear)){
                param.put("YEAR_ID", YEARTmp.getString("DIC_ID"));
            }
        }*/

        DataMap dataMapOut = new DataMap();
        if(examinee != null){
            param.put("MAJORTYPE_ID", examinee.getString("MAJORTYPE"));
            param.put("ARRANGMENT_ID", PlantConst.ARRANGMENT_B1);
            List<DataMap> b1schools = schoolService.getSchoolsByMajorType(param);
            dataMapOut.put("b1schools", b1schools);
            param.put("ARRANGMENT_ID", PlantConst.ARRANGMENT_B2);
            List<DataMap> b2schools = schoolService.getSchoolsByMajorType(param);
            dataMapOut.put("b2schools", b2schools);
        }

        return InvokeResult.success(dataMapOut);
    }
}
