package com.cms4j.plant.report.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.ShortUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ScorelineService {

    @Autowired
    private DaoSupport daoSupport;

    @Transactional(rollbackFor = Exception.class)
    public void addScoreline(DataMap dataMap) throws Exception {
        dataMap.put("SCORELINE_ID", ShortUUID.randomUUID());
        daoSupport.save("ScorelineMapper.addScoreline", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void editScoreline(DataMap dataMap) throws Exception {
        daoSupport.update("ScorelineMapper.editScoreline", dataMap);
    }

    public List<DataMap> getScorelineByYear(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ScorelineMapper.getScorelineByYear", dataMap);
    }
}
