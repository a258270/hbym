package com.cms4j.plant.school.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.ShortUUID;
import org.apache.commons.collections.functors.ExceptionClosure;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ScInviteTemplateService {

    @Autowired
    private DaoSupport daoSupport;

    @Transactional(rollbackFor = Exception.class)
    public void addScInviteTemplate(DataMap dataMap) throws Exception {
        dataMap.put("TEMPLATE_ID", ShortUUID.randomUUID());
        daoSupport.save("ScInviteTemplateMapper.addScInviteTemplate", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void removeScInviteTemplate(DataMap dataMap) throws Exception {
        daoSupport.delete("ScInviteTemplateMapper.removeScInviteTemplate", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void editScInviteTemplate(DataMap dataMap) throws Exception {
        daoSupport.update("ScInviteTemplateMapper.editScInviteTemplate", dataMap);
    }

    public Integer getCountByUserId(DataMap dataMap) throws Exception {
        return (Integer) daoSupport.findForObject("ScInviteTemplateMapper.getCountByUserId", dataMap);
    }

    public List<DataMap> getScInviteTemplatesByUserId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ScInviteTemplateMapper.getScInviteTemplatesByUserId", dataMap);
    }

    public DataMap getScInviteTemplateById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ScInviteTemplateMapper.getScInviteTemplateById", dataMap);
    }
}
