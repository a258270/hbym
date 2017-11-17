package com.cms4j.plant.school.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.ShortUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ScViewService {

    @Autowired
    private DaoSupport daoSupport;

    @Transactional(rollbackFor = Exception.class)
    public void addScView(DataMap dataMap) throws Exception {
        dataMap.put("SCVIEW_ID", ShortUUID.randomUUID());
        dataMap.put("CREATETIME", DateUtil.getCurrentTime());

        daoSupport.save("ScViewMapper.addScView", dataMap);
    }

    public Integer getScViewCountByScId(DataMap dataMap) throws Exception {
        return (Integer) daoSupport.findForObject("ScViewMapper.getScViewCountByScId", dataMap);
    }
}
