package com.cms4j.plant.school.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.ShortUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ScInviteService {

    @Autowired
    private DaoSupport daoSupport;

    @Transactional(rollbackFor = Exception.class)
    public void addScInvite(DataMap dataMap) throws Exception {
        dataMap.put("INVITE_ID", ShortUUID.randomUUID());
        dataMap.put("CREATETIME", DateUtil.getCurrentTime());
        daoSupport.save("ScInviteMapper.addScInvite", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void setRead(DataMap dataMap) throws Exception {
        daoSupport.update("ScInviteMapper.setRead", dataMap);
    }
}
