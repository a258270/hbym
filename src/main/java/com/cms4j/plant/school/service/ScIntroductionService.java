package com.cms4j.plant.school.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.ShortUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ScIntroductionService {

    @Autowired
    private DaoSupport daoSupport;

    @Transactional(rollbackFor = Exception.class)
    public void addScIntroduction(DataMap dataMap) throws Exception {
        dataMap.put("INTRODUCTION_ID", ShortUUID.randomUUID());

        daoSupport.save("ScIntroductionMapper.addScIntroduction", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void editScIntroduction(DataMap dataMap) throws Exception {
        daoSupport.update("ScIntroductionMapper.editScIntroduction", dataMap);
    }

    public DataMap getScIntroductionByScId(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ScIntroductionMapper.getScIntroductionByScId", dataMap);
    }

    public DataMap getScIntroductionById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ScIntroductionMapper.getScIntroductionById", dataMap);
    }
}
