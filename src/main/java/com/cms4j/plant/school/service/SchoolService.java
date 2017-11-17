package com.cms4j.plant.school.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.Page;
import com.cms4j.base.util.ShortUUID;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
* Description: SchoolService
* Created by zmj on 2017/07/24.
*/
@Service
public class SchoolService {

    @Autowired
    private DaoSupport daoSupport;
    @Autowired
    private ArrangmentService arrangmentService;
    @Autowired
    private HasmajorService hasmajorService;
    @Autowired
    private ScpropertyService scpropertyService;
    @Autowired
    private SubjecttypeService subjecttypeService;

    @Autowired
    private ScIntroductionService scIntroductionService;
    @Autowired
    private ScFacultyService scFacultyService;

    /**
    * 根据SCHOOL_ID获取数据
    * @param dataMap
    * @return
    * @throws Exception
    */
    public DataMap getSchoolById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("SchoolMapper.getSchoolById", dataMap);
    }

    /**
    * 获取院校信息分页数据
    * @param page
    * @return
    * @throws Exception
    */
    public List<DataMap> getSchools(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("SchoolMapper.getSchools", page);
    }

    public List<DataMap> getSchoolsInLibrary(Map params) throws Exception {
        return (List<DataMap>) daoSupport.findForList("SchoolMapper.getSchoolsInLibrary", params);
    }

    public Long getCountSchoolsInLibrary(Map params) throws Exception {
        return (Long) daoSupport.findForObject("SchoolMapper.getCountSchoolsInLibrary", params);
    }

    public List<DataMap> getSchoolsHasTeacher(DataMap params) throws Exception {
        return (List<DataMap>) daoSupport.findForList("SchoolMapper.getSchoolsHasTeacher", params);
    }

    public Long getCountSchoolsHasTeacher(DataMap params) throws Exception {
        return (Long) daoSupport.findForObject("SchoolMapper.getCountSchoolsHasTeacher", params);
    }

    /**
    * 批量删除院校信息
    * @param objs
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void batchRemoves(String objs) throws Exception {
        String[] objArr = objs.split(",");
        List<String> objList = Arrays.asList(objArr);
        for(String obj : objList) {
            DataMap school = new DataMap();
            school.put("SCHOOL_ID", obj);
            arrangmentService.removeArrangmentsByScId(school);
            hasmajorService.removeHasmajorsByScId(school);
            scpropertyService.removeScpropertysByScId(school);
            subjecttypeService.removeSubjecttypesByScId(school);
        }
        daoSupport.batchDelete("SchoolMapper.batchRemoves", objList);
    }

    /**
    * 新增院校信息
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void addSchool(DataMap dataMap) throws Exception {
        String school_id = ShortUUID.randomUUID();
        dataMap.put("SCHOOL_ID", school_id);
        if(StringUtils.isBlank(dataMap.getString("HEADURL")))
            dataMap.put("HEADURL", null);
        if(StringUtils.isBlank(dataMap.getString("CREATEDATE")))
            dataMap.put("CREATEDATE", null);
        if(StringUtils.isBlank(dataMap.getString("PHONE")))
            dataMap.put("PHONE", null);
        if(StringUtils.isBlank(dataMap.getString("EMAIL")))
            dataMap.put("EMAIL", null);
        if(StringUtils.isBlank(dataMap.getString("ADDRESS")))
            dataMap.put("ADDRESS", null);
        if(StringUtils.isBlank(dataMap.getString("WEBSITE")))
            dataMap.put("WEBSITE", null);
        if(StringUtils.isBlank(dataMap.getString("SCWEBSITE")))
            dataMap.put("SCWEBSITE", null);
        if(StringUtils.isBlank(dataMap.getString("SCCODE")))
            dataMap.put("SCCODE", null);
        if(StringUtils.isBlank(dataMap.getString("SUBJECTION")))
            dataMap.put("SUBJECTION", null);
        if(StringUtils.isBlank(dataMap.getString("LON")))
            dataMap.put("LON", null);
        if(StringUtils.isBlank(dataMap.getString("LAT")))
            dataMap.put("LAT", null);
        if(StringUtils.isBlank(dataMap.getString("LHEADURL")))
            dataMap.put("LHEADURL", null);
        if(StringUtils.isBlank(dataMap.getString("MSORT")))
            dataMap.put("MSORT", getCountSchools());
        if(!StringUtils.isBlank(dataMap.getString("WEBSITE"))) {
            if(dataMap.getString("WEBSITE").toLowerCase().indexOf("http://") >= 0 || dataMap.getString("WEBSITE").toLowerCase().indexOf("https://") >= 0)
                dataMap.put("WEBSITE", dataMap.getString("WEBSITE"));
            else
                dataMap.put("WEBSITE", "http://" + dataMap.getString("WEBSITE"));

            dataMap.put("WEBSITE", dataMap.getString("WEBSITE").trim());
        }

        if(!StringUtils.isBlank(dataMap.getString("SCWEBSITE"))) {
            if(dataMap.getString("SCWEBSITE").toLowerCase().indexOf("http://") >= 0 || dataMap.getString("SCWEBSITE").toLowerCase().indexOf("https://") >= 0)
                dataMap.put("SCWEBSITE", dataMap.getString("SCWEBSITE"));
            else
                dataMap.put("SCWEBSITE", "http://" + dataMap.getString("SCWEBSITE"));

            dataMap.put("SCWEBSITE", dataMap.getString("SCWEBSITE").trim());
        }

        if(!StringUtils.isBlank(dataMap.getString("SUBJECTTYPE"))){
            String[] tmps = dataMap.getString("SUBJECTTYPE").split(",");
            for(String tmp : tmps){
                if(StringUtils.isBlank(tmp)) continue;
                DataMap dTmp = new DataMap();
                dTmp.put("SUBJECTTYPE_ID", ShortUUID.randomUUID());
                dTmp.put("SCHOOL_ID", school_id);
                dTmp.put("DIC_ID", tmp);
                subjecttypeService.addSubjecttype(dTmp);
            }
        }
        if(!StringUtils.isBlank(dataMap.getString("ARRANGMENT"))){
            String[] tmps = dataMap.getString("ARRANGMENT").split(",");
            for(String tmp : tmps){
                if(StringUtils.isBlank(tmp)) continue;
                DataMap dTmp = new DataMap();
                dTmp.put("ARRANGMENT_ID", ShortUUID.randomUUID());
                dTmp.put("SCHOOL_ID", school_id);
                dTmp.put("DIC_ID", tmp);
                arrangmentService.addArrangment(dTmp);
            }
        }
        if(!StringUtils.isBlank(dataMap.getString("HASMAJOR"))){
            String[] tmps = dataMap.getString("HASMAJOR").split(",");
            for(String tmp : tmps){
                if(StringUtils.isBlank(tmp)) continue;
                DataMap dTmp = new DataMap();
                dTmp.put("HASMAJOR_ID", ShortUUID.randomUUID());
                dTmp.put("SCHOOL_ID", school_id);
                dTmp.put("DIC_ID", tmp);
                hasmajorService.addHasmajor(dTmp);
            }
        }
        if(!StringUtils.isBlank(dataMap.getString("SCPROPERTY"))){
            String[] tmps = dataMap.getString("SCPROPERTY").split(",");
            for(String tmp : tmps){
                if(StringUtils.isBlank(tmp)) continue;
                DataMap dTmp = new DataMap();
                dTmp.put("SCPROPERTY_ID", ShortUUID.randomUUID());
                dTmp.put("SCHOOL_ID", school_id);
                dTmp.put("DIC_ID", tmp);
                scpropertyService.addScproperty(dTmp);
            }
        }
        daoSupport.save("SchoolMapper.addSchool", dataMap);
    }

    /**
    * 编辑院校信息
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void editSchool(DataMap dataMap) throws Exception {
        if(StringUtils.isBlank(dataMap.getString("HEADURL")))
            dataMap.put("HEADURL", null);
        if(StringUtils.isBlank(dataMap.getString("CREATEDATE")))
            dataMap.put("CREATEDATE", null);
        if(StringUtils.isBlank(dataMap.getString("PHONE")))
            dataMap.put("PHONE", null);
        if(StringUtils.isBlank(dataMap.getString("EMAIL")))
            dataMap.put("EMAIL", null);
        if(StringUtils.isBlank(dataMap.getString("ADDRESS")))
            dataMap.put("ADDRESS", null);
        if(StringUtils.isBlank(dataMap.getString("WEBSITE")))
            dataMap.put("WEBSITE", null);
        if(StringUtils.isBlank(dataMap.getString("SCWEBSITE")))
            dataMap.put("SCWEBSITE", null);
        if(StringUtils.isBlank(dataMap.getString("SCCODE")))
            dataMap.put("SCCODE", null);
        if(StringUtils.isBlank(dataMap.getString("SUBJECTION")))
            dataMap.put("SUBJECTION", null);
        if(StringUtils.isBlank(dataMap.getString("LON")))
            dataMap.put("LON", null);
        if(StringUtils.isBlank(dataMap.getString("LAT")))
            dataMap.put("LAT", null);
        if(StringUtils.isBlank(dataMap.getString("LHEADURL")))
            dataMap.put("LHEADURL", null);
        if(StringUtils.isBlank(dataMap.getString("MSORT")))
            dataMap.put("MSORT", null);

        if(!StringUtils.isBlank(dataMap.getString("WEBSITE"))) {
            if(dataMap.getString("WEBSITE").toLowerCase().indexOf("http://") >= 0 || dataMap.getString("WEBSITE").toLowerCase().indexOf("https://") >= 0)
                dataMap.put("WEBSITE", dataMap.getString("WEBSITE"));
            else
                dataMap.put("WEBSITE", "http://" + dataMap.getString("WEBSITE"));

            dataMap.put("WEBSITE", dataMap.getString("WEBSITE").trim());
        }

        if(!StringUtils.isBlank(dataMap.getString("SCWEBSITE"))) {
            if(dataMap.getString("SCWEBSITE").toLowerCase().indexOf("http://") >= 0 || dataMap.getString("SCWEBSITE").toLowerCase().indexOf("https://") >= 0)
                dataMap.put("SCWEBSITE", dataMap.getString("SCWEBSITE"));
            else
                dataMap.put("SCWEBSITE", "http://" + dataMap.getString("SCWEBSITE"));

            dataMap.put("SCWEBSITE", dataMap.getString("SCWEBSITE").trim());
        }

        if(!StringUtils.isBlank(dataMap.getString("SUBJECTTYPE"))){
            subjecttypeService.removeSubjecttypesByScId(dataMap);
            String[] tmps = dataMap.getString("SUBJECTTYPE").split(",");
            for(String tmp : tmps){
                if(StringUtils.isBlank(tmp)) continue;
                DataMap dTmp = new DataMap();
                dTmp.put("SUBJECTTYPE_ID", ShortUUID.randomUUID());
                dTmp.put("SCHOOL_ID", dataMap.getString("SCHOOL_ID"));
                dTmp.put("DIC_ID", tmp);
                subjecttypeService.addSubjecttype(dTmp);
            }
        }
        if(!StringUtils.isBlank(dataMap.getString("ARRANGMENT"))){
            arrangmentService.removeArrangmentsByScId(dataMap);
            String[] tmps = dataMap.getString("ARRANGMENT").split(",");
            for(String tmp : tmps){
                if(StringUtils.isBlank(tmp)) continue;
                DataMap dTmp = new DataMap();
                dTmp.put("ARRANGMENT_ID", ShortUUID.randomUUID());
                dTmp.put("SCHOOL_ID", dataMap.getString("SCHOOL_ID"));
                dTmp.put("DIC_ID", tmp);
                arrangmentService.addArrangment(dTmp);
            }
        }
        if(!StringUtils.isBlank(dataMap.getString("HASMAJOR"))){
            hasmajorService.removeHasmajorsByScId(dataMap);
            String[] tmps = dataMap.getString("HASMAJOR").split(",");
            for(String tmp : tmps){
                if(StringUtils.isBlank(tmp)) continue;
                DataMap dTmp = new DataMap();
                dTmp.put("HASMAJOR_ID", ShortUUID.randomUUID());
                dTmp.put("SCHOOL_ID", dataMap.getString("SCHOOL_ID"));
                dTmp.put("DIC_ID", tmp);
                hasmajorService.addHasmajor(dTmp);
            }
        }
        if(!StringUtils.isBlank(dataMap.getString("SCPROPERTY"))){
            scpropertyService.removeScpropertysByScId(dataMap);
            String[] tmps = dataMap.getString("SCPROPERTY").split(",");
            for(String tmp : tmps){
                if(StringUtils.isBlank(tmp)) continue;
                DataMap dTmp = new DataMap();
                dTmp.put("SCPROPERTY_ID", ShortUUID.randomUUID());
                dTmp.put("SCHOOL_ID", dataMap.getString("SCHOOL_ID"));
                dTmp.put("DIC_ID", tmp);
                scpropertyService.addScproperty(dTmp);
            }
        }
        else{
            scpropertyService.removeScpropertysByScId(dataMap);
        }
        daoSupport.update("SchoolMapper.editSchool", dataMap);
    }

    /**
    * 编辑院校信息中的非前台录入属性
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void editNotFrontOfSchool(DataMap dataMap) throws Exception {
        daoSupport.update("SchoolMapper.editNotFrontOfSchool", dataMap);
    }

    /**
     * 获取所有院校信息
     * @return
     * @throws Exception
     */
    public List<DataMap> getAllSchools() throws Exception {
        return (List<DataMap>) daoSupport.findForList("SchoolMapper.getAllSchools");
    }

    public List<DataMap> getSchoolsByMajorType(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("SchoolMapper.getSchoolsByMajorType", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void editSchoolByTeacher(DataMap dataMap) throws Exception {
        DataMap school = this.getSchoolById(dataMap);

        if(!StringUtils.isBlank(dataMap.getString("SCCODE"))) {
            if(!dataMap.getString("SCCODE").equals(school.getString("SCCODE")))
                school.put("SCCODE", dataMap.getString("SCCODE"));
        }

        if(!StringUtils.isBlank(dataMap.getString("SCTYPE"))) {
            if(!dataMap.getString("SCTYPE").equals(school.getString("SCTYPE")))
                school.put("SCTYPE", dataMap.getString("SCTYPE"));
        }

        if(!StringUtils.isBlank(dataMap.getString("SUBJECTION"))) {
            if(!dataMap.getString("SUBJECTION").equals(school.getString("SUBJECTION")))
                school.put("SUBJECTION", dataMap.getString("SUBJECTION"));
        }

        if(!StringUtils.isBlank(dataMap.getString("ADDRESS"))) {
            if(!dataMap.getString("ADDRESS").equals(school.getString("ADDRESS")))
                school.put("ADDRESS", dataMap.getString("ADDRESS"));
        }

        if(!StringUtils.isBlank(dataMap.getString("LON"))) {
            if(!dataMap.getString("LON").equals(school.getString("LON")))
                school.put("LON", dataMap.getString("LON"));
        }

        if(!StringUtils.isBlank(dataMap.getString("LAT"))) {
            if(!dataMap.getString("LAT").equals(school.getString("LAT")))
                school.put("LAT", dataMap.getString("LAT"));
        }


        /*if(!StringUtils.isBlank(dataMap.getString("CREATEDATE"))) {
            if(!dataMap.getString("CREATEDATE").equals(school.getString("CREATEDATE")))
                school.put("CREATEDATE", dataMap.getString("CREATEDATE"));
        }*/

        if(!StringUtils.isBlank(dataMap.getString("WEBSITE"))) {
            if(!dataMap.getString("WEBSITE").equals(school.getString("WEBSITE"))) {
                if(dataMap.getString("WEBSITE").toLowerCase().indexOf("http://") >= 0 || dataMap.getString("WEBSITE").toLowerCase().indexOf("https://") >= 0)
                    school.put("WEBSITE", dataMap.getString("WEBSITE"));
                else
                    school.put("WEBSITE", "http://" + school.getString("WEBSITE"));

                dataMap.put("WEBSITE", dataMap.getString("WEBSITE").trim());
            }
        }

        if(!StringUtils.isBlank(dataMap.getString("SCWEBSITE"))) {
            if(!dataMap.getString("SCWEBSITE").equals(school.getString("SCWEBSITE"))) {
                if(dataMap.getString("SCWEBSITE").toLowerCase().indexOf("http://") >= 0 || dataMap.getString("WEBSITE").toLowerCase().indexOf("https://") >= 0)
                    school.put("SCWEBSITE", dataMap.getString("SCWEBSITE"));
                else
                    school.put("SCWEBSITE", "http://" + school.getString("SCWEBSITE"));

                dataMap.put("SCWEBSITE", dataMap.getString("SCWEBSITE").trim());
            }
        }

        school.put("SUBJECTTYPE", dataMap.getString("SUBJECTTYPE"));
        school.put("ARRANGMENT", dataMap.getString("ARRANGMENT"));
        school.put("SCPROPERTY", dataMap.getString("SCPROPERTY"));

        this.editSchool(school);

        if(!StringUtils.isBlank(dataMap.getString("INTRODUCTION"))) {
            DataMap introduction = scIntroductionService.getScIntroductionByScId(school);
            if(introduction == null){
                introduction = new DataMap();
                introduction.put("CONTENT", dataMap.getString("INTRODUCTION"));
                introduction.put("SCHOOL_ID", school.getString("SCHOOL_ID"));
                scIntroductionService.addScIntroduction(introduction);
            }
            else{
                if(!dataMap.getString("INTRODUCTION").equals(introduction.getString("CONTENT"))){
                    introduction.put("CONTENT", dataMap.getString("INTRODUCTION"));
                    scIntroductionService.editScIntroduction(introduction);
                }
            }
        }


        if(!StringUtils.isBlank(dataMap.getString("FACULTY"))) {
            DataMap faculty = scFacultyService.getScFacultyByScId(school);
            if(faculty == null){
                faculty = new DataMap();
                faculty.put("CONTENT", dataMap.getString("FACULTY"));
                faculty.put("SCHOOL_ID", school.getString("SCHOOL_ID"));
                scFacultyService.addScFaculty(faculty);
            }
            else{
                if(!dataMap.getString("FACULTY").equals(faculty.getString("CONTENT"))){
                    faculty.put("CONTENT", dataMap.getString("FACULTY"));
                    scFacultyService.editScFaculty(faculty);
                }
            }
        }
    }

    public List<DataMap> getHasAdvertisementSchools() throws Exception {
        return (List<DataMap>) daoSupport.findForList("SchoolMapper.getHasAdvertisementSchools");
    }

    public List<DataMap> getSchoolsOrderByViewcount(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("SchoolMapper.getSchoolsOrderByViewcount", page);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addViewCount(DataMap dataMap) throws Exception {
        daoSupport.update("SchoolMapper.addViewCount", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void editBasic(DataMap dataMap) throws Exception {
        DataMap school = this.getSchoolById(dataMap);

        if(!StringUtils.isBlank(dataMap.getString("INTRODUCTION"))) {
            DataMap introduction = scIntroductionService.getScIntroductionByScId(school);
            if(introduction == null){
                introduction = new DataMap();
                introduction.put("CONTENT", dataMap.getString("INTRODUCTION"));
                introduction.put("SCHOOL_ID", school.getString("SCHOOL_ID"));
                scIntroductionService.addScIntroduction(introduction);
            }
            else{
                if(!dataMap.getString("INTRODUCTION").equals(introduction.getString("CONTENT"))){
                    introduction.put("CONTENT", dataMap.getString("INTRODUCTION"));
                    scIntroductionService.editScIntroduction(introduction);
                }
            }
        }

        if(!StringUtils.isBlank(dataMap.getString("FACULTY"))) {
            DataMap faculty = scFacultyService.getScFacultyByScId(school);
            if(faculty == null){
                faculty = new DataMap();
                faculty.put("CONTENT", dataMap.getString("FACULTY"));
                faculty.put("SCHOOL_ID", school.getString("SCHOOL_ID"));
                scFacultyService.addScFaculty(faculty);
            }
            else{
                if(!dataMap.getString("FACULTY").equals(faculty.getString("CONTENT"))){
                    faculty.put("CONTENT", dataMap.getString("FACULTY"));
                    scFacultyService.editScFaculty(faculty);
                }
            }
        }
    }

    public List<DataMap> getSchoolsByArrangment(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("SchoolMapper.getSchoolsByArrangment", dataMap);
    }

    public Integer getCountSchools() throws Exception {
        return (Integer) daoSupport.findForObject("SchoolMapper.getCountSchools");
    }
}
