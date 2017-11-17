package com.cms4j.plant.school.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.ShortUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ScProfessionService {

    @Autowired
    private DaoSupport daoSupport;

    @Transactional(rollbackFor = Exception.class)
    public void addScProfession(DataMap dataMap) throws Exception {
        dataMap.put("PROFESSION_ID", ShortUUID.randomUUID());

        daoSupport.save("ScProfessionMapper.addScProfession", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void editScProfession(DataMap dataMap) throws Exception {
        daoSupport.update("ScProfessionMapper.editScProfession", dataMap);
    }

    public DataMap getScProfessionByScId(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ScProfessionMapper.getScProfessionByScId", dataMap);
    }

    public DataMap getScProfessionById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ScProfessionMapper.getScProfessionById", dataMap);
    }
}
