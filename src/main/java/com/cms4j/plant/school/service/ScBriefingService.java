package com.cms4j.plant.school.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.ShortUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ScBriefingService {

    @Autowired
    private DaoSupport daoSupport;

    @Transactional(rollbackFor = Exception.class)
    public void addScBriefing(DataMap dataMap) throws Exception {
        dataMap.put("BRIEFING_ID", ShortUUID.randomUUID());

        daoSupport.save("ScBriefingMapper.addScBriefing", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void editScBriefing(DataMap dataMap) throws Exception {
        daoSupport.update("ScBriefingMapper.editScBriefing", dataMap);
    }

    public DataMap getScBriefingByScId(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ScBriefingMapper.getScBriefingByScId", dataMap);
    }

    public DataMap getScBriefingById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ScBriefingMapper.getScBriefingById", dataMap);
    }
}
