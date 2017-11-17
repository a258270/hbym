package com.cms4j.plant.school.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.ShortUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ScFacultyService {

    @Autowired
    private DaoSupport daoSupport;

    @Transactional(rollbackFor = Exception.class)
    public void addScFaculty(DataMap dataMap) throws Exception {
        dataMap.put("FACULTY_ID", ShortUUID.randomUUID());

        daoSupport.save("ScFacultyMapper.addScFaculty", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void editScFaculty(DataMap dataMap) throws Exception {
        daoSupport.update("ScFacultyMapper.editScFaculty", dataMap);
    }

    public DataMap getScFacultyByScId(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ScFacultyMapper.getScFacultyByScId", dataMap);
    }

    public DataMap getScFacultyById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ScFacultyMapper.getScFacultyById", dataMap);
    }
}
