package com.cms4j.plant.school.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.Page;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.school.scscore.service.ScscoreService;
import com.cms4j.plant.school.service.ScStoreupService;
import com.cms4j.plant.school.service.SchoolService;
import com.cms4j.plant.school.service.ScpropertyService;
import com.cms4j.plant.school.service.SubjecttypeService;
import com.cms4j.plant.user.service.CompleteTeacherService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RestController
@RequestMapping(value = "/plant/school/api")
public class SchoolPageApiController extends ApiBaseController {

    @Autowired
    private SchoolService schoolService;
    @Autowired
    private ScStoreupService scStoreupService;
    @Autowired
    private ScpropertyService scpropertyService;
    @Autowired
    private SubjecttypeService subjecttypeService;
    @Autowired
    private ScscoreService scscoreService;
    @Autowired
    private CompleteTeacherService completeTeacherService;

    @RequestMapping(value = "/getschools")
    public InvokeResult getSchools() throws Exception {
        DataMap dataMap = this.getDataMap();

        return InvokeResult.success(schoolService.getHasTeachersSchools(dataMap));
    }

    @RequestMapping(value = "/getschool")
    public InvokeResult getSchool() throws Exception {
        DataMap dataMap = this.getDataMap();

        return InvokeResult.success(schoolService.getLibraryOfSchools(dataMap));
    }

    @RequestMapping(value = "/storeup")
    public InvokeResult storeUp() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return InvokeResult.failure("请登录您的账号！");

        DataMap dataMap = this.getDataMap();
        if(StringUtils.isBlank(dataMap.getString("SCHOOL_ID"))) return InvokeResult.failure("请选择院校！");

        dataMap.put("USER_ID", curUser.getString("USER_ID"));

        if(scStoreupService.getScStoreUpByScIdAndUserId(dataMap)) return InvokeResult.failure("您已收藏过该院校！");

        scStoreupService.addScStoreup(dataMap);

        return InvokeResult.success();
    }

    @RequestMapping(value = "/addview")
    public InvokeResult addView() throws Exception {
        DataMap dataMap = this.getDataMap();

        schoolService.addViewCount(dataMap);
        return InvokeResult.success();
    }

    /*@RequestMapping(value = "/getscscores")
    public InvokeResult getScScores() throws Exception {
        DataMap dataMap = this.getDataMap();
        List<DataMap> result = scscoreService.getScscoresByScIdAndMajortypeId(dataMap);
        if(result == null) result = new ArrayList<DataMap>();
        return InvokeResult.success(result);
    }*/
}
