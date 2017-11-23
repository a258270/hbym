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

        Page page = new Page();
        if(StringUtils.isBlank(dataMap.getString("NAME"))) {
            dataMap.put("NAME", null);
        }
        if(StringUtils.isBlank(dataMap.getString("PROVINCE"))) {
            dataMap.put("PROVINCE", null);
        }
        else{
            dataMap.put("PROVINCE", Arrays.asList(dataMap.getString("PROVINCE").split(",")));
        }
        if(StringUtils.isBlank(dataMap.getString("ARRANGMENT"))) {
            dataMap.put("ARRANGMENT", null);
        }
        else{
            dataMap.put("ARRANGMENT", Arrays.asList(dataMap.getString("ARRANGMENT").split(",")));
        }
        if(StringUtils.isBlank(dataMap.getString("SUBJECTTYPE"))) {
            dataMap.put("SUBJECTTYPE", null);
        }
        else{
            dataMap.put("SUBJECTTYPE", Arrays.asList(dataMap.getString("SUBJECTTYPE").split(",")));
        }
        if(StringUtils.isBlank(dataMap.getString("PROPERTY"))) {
            dataMap.put("PROPERTY", null);
        }
        else{
            dataMap.put("PROPERTY", Arrays.asList(dataMap.getString("PROPERTY").split(",")));
        }

        page.setParams(dataMap);

        if(StringUtils.isBlank(dataMap.getString("currentPage"))) dataMap.put("currentPage", "0");
        else{
            try{
                Integer currentPage = Integer.valueOf(dataMap.getString("currentPage"));
                currentPage--;
                if(currentPage < 0) currentPage = 0;
                dataMap.put("currentPage", currentPage);
            }
            catch (Exception e) {
                dataMap.put("currentPage", "0");
            }
        }
        page.setPageNumber(Integer.valueOf(dataMap.getString("currentPage")));
        page.setPageSize(10);

        dataMap.put("pageBeginNumber", page.getPageNumber() * page.getPageSize());
        dataMap.put("pageSize", page.getPageSize());

        List<DataMap> schools = schoolService.getSchoolsHasTeacher(dataMap);
        Long totalCount = schoolService.getCountSchoolsHasTeacher(dataMap);
        if(schools != null && schools.size() > 0) {
            for(DataMap school : schools) {
                List<DataMap> properties = scpropertyService.getScpropertyByScId(school);
                if(properties == null) properties = new ArrayList<DataMap>();
                school.put("properties", properties);

                List<DataMap> subjecttypes = subjecttypeService.getSubjecttypeByScId(school);
                if(subjecttypes == null) subjecttypes = new ArrayList<DataMap>();
                school.put("subjecttypes", subjecttypes);

                List<DataMap> teachers = completeTeacherService.getCompleteTeacherByScId(school);
                if(teachers == null) teachers = new ArrayList<>();
                school.put("teachers", teachers);
            }
        }
        page.setResults(schools);
        page.setTotalRecord(totalCount);

        return InvokeResult.success(page);
    }

    @RequestMapping(value = "/getschool")
    public InvokeResult getSchool() throws Exception {
        DataMap dataMap = this.getDataMap();

        Page page = new Page();
        Map params = new HashMap();
        params.put("NAME", dataMap.getString("NAME"));
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser != null) {
            params.put("USER_ID", curUser.getString("USER_ID"));
        }

        if(!StringUtils.isBlank(dataMap.getString("provinces"))){
            String[] provinces = dataMap.getString("provinces").split(",");
            if(provinces.length > 0)
                params.put("provinces", Arrays.asList(provinces));
        }

        if(!StringUtils.isBlank(dataMap.getString("properties"))){
            String[] properties = dataMap.getString("properties").split(",");
            if(properties.length > 0)
                params.put("properties", Arrays.asList(properties));
        }

        if(!StringUtils.isBlank(dataMap.getString("arrangments"))){
            String[] arrangments = dataMap.getString("arrangments").split(",");
            if(arrangments.length > 0)
                params.put("arrangments", Arrays.asList(arrangments));
        }

        if(!StringUtils.isBlank(dataMap.getString("subjecttypes"))){
            String[] subjecttypes = dataMap.getString("subjecttypes").split(",");
            if(subjecttypes.length > 0)
                params.put("subjecttypes", Arrays.asList(subjecttypes));
        }

        page.setParams(params);

        if(StringUtils.isBlank(dataMap.getString("currentPage"))) dataMap.put("currentPage", "0");
        else{
            try{
                Integer currentPage = Integer.valueOf(dataMap.getString("currentPage"));
                currentPage--;
                if(currentPage < 0) currentPage = 0;
                dataMap.put("currentPage", currentPage);
            }
            catch (Exception e) {
                dataMap.put("currentPage", "0");
            }
        }
        page.setPageNumber(Integer.valueOf(dataMap.getString("currentPage")));
        page.setPageSize(10);

        params.put("pageBeginNumber", page.getPageNumber() * page.getPageSize());
        params.put("pageSize", page.getPageSize());

        List<DataMap> schools = schoolService.getSchoolsInLibrary(params);
        Long totalCount = schoolService.getCountSchoolsInLibrary(params);
        if(schools != null && schools.size() > 0) {
            for(DataMap school : schools) {
                List<DataMap> properties = scpropertyService.getScpropertyByScId(school);
                if(properties == null) properties = new ArrayList<DataMap>();
                school.put("properties", properties);

                List<DataMap> subjecttypes = subjecttypeService.getSubjecttypeByScId(school);
                if(subjecttypes == null) subjecttypes = new ArrayList<DataMap>();
                school.put("subjecttypes", subjecttypes);
            }
        }
        page.setResults(schools);
        page.setTotalRecord(totalCount);

        return InvokeResult.success(page);
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
