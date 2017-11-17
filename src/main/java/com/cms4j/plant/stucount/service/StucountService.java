package com.cms4j.plant.stucount.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.ShortUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class StucountService {

    @Autowired
    private DaoSupport daoSupport;

    public DataMap getStuCountByYear(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("StucountMapper.getStuCountByYear", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addStuCount(DataMap dataMap) throws Exception {
        dataMap.put("STUCOUNT_ID", ShortUUID.randomUUID());

        daoSupport.save("StucountMapper.addStuCount", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void removeStucountByYearAndMajortype(DataMap dataMap) throws Exception {
        daoSupport.delete("StucountMapper.removeStucountByYearAndMajortype", dataMap);
    }
}
