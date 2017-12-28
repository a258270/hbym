package com.cms4j.wechat.applet.school.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.plant.school.scscore.service.ScscoreService;
import com.cms4j.plant.school.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = "/wechat/applet/school")
public class WechatAppSchoolController extends ApiBaseController {

    @Autowired
    private SchoolService schoolService;
    @Autowired
    private ScscoreService scscoreService;
    @Autowired
    private ScFacultyService scFacultyService;
    @Autowired
    private ScIntroductionService scIntroductionService;
    @Autowired
    private ScpropertyService scpropertyService;
    @Autowired
    private SubjecttypeService subjecttypeService;

    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public InvokeResult getSchools() throws Exception {
        DataMap dataMap = this.getDataMap();

        return InvokeResult.success(schoolService.getLibraryOfSchools(dataMap));
    }

    @RequestMapping(value = "/gethasteachers", method = RequestMethod.POST)
    public InvokeResult getHasTeachersSchools() throws Exception {
        DataMap dataMap = this.getDataMap();

        return InvokeResult.success(schoolService.getHasTeachersSchools(dataMap));
    }
    /*
     *根据school_id获取院校库中对应单条数据
     */
    @RequestMapping(value = "/getschoolinfo",method = RequestMethod.POST)
    public InvokeResult getSchoolInformationsById() throws Exception {
        DataMap dataMap =this.getDataMap();
        dataMap = schoolService.getSchoolById(dataMap);
        if(dataMap != null) {
            List<DataMap> properties = scpropertyService.getScpropertyByScId(dataMap);
            if(properties == null) properties = new ArrayList<DataMap>();
            dataMap.put("properties", properties);

            List<DataMap> subjecttypes = subjecttypeService.getSubjecttypeByScId(dataMap);
            if(subjecttypes == null) subjecttypes = new ArrayList<DataMap>();
            dataMap.put("subjecttypes", subjecttypes);
        }

        return  InvokeResult.success(dataMap);
    }

    /**
     * 获取院校分
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getschoolscore", method = RequestMethod.POST)
    public InvokeResult getSchoolScore() throws Exception {
        DataMap dataMap = this.getDataMap();

        return InvokeResult.success(scscoreService.getScscoresByScIdAndMajortypeId(dataMap));
    }

    /**
     * 获取院校与专业
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getfaculty")
    public InvokeResult getFaculty() throws Exception {
        DataMap dataMap = this.getDataMap();

        return InvokeResult.success(scFacultyService.getScFacultyByScId(dataMap));
    }

    /**
     * 获取院校介绍
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getintroduction")
    public InvokeResult getIntroduction() throws Exception {
        DataMap dataMap = this.getDataMap();

        return InvokeResult.success(scIntroductionService.getScIntroductionByScId(dataMap));
    }
}
