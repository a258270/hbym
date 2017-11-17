package com.cms4j.plant.school.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.ShortUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ScStoreupService {

    @Autowired
    private DaoSupport daoSupport;

    @Transactional(rollbackFor = Exception.class)
    public void addScStoreup(DataMap dataMap) throws Exception {
        dataMap.put("STOREUP_ID", ShortUUID.randomUUID());
        dataMap.put("CREATETIME", DateUtil.getCurrentTime());

        daoSupport.save("ScStoreupMapper.addScStoreup", dataMap);
    }

    public List<DataMap> getScStoreUpByUserId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ScStoreupMapper.getScStoreUpByUserId", dataMap);
    }

    public List<DataMap> getScStoreUpByScId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ScStoreupMapper.getScStoreUpByScId", dataMap);
    }

    public Integer getScStoreUpCountByScId(DataMap dataMap) throws Exception {
        return (Integer) daoSupport.findForObject("ScStoreupMapper.getScStoreUpCountByScId", dataMap);
    }

    public Boolean getScStoreUpByScIdAndUserId(DataMap dataMap) throws Exception {
        return (Boolean) daoSupport.findForObject("ScStoreupMapper.getScStoreUpByScIdAndUserId", dataMap);
    }
}
