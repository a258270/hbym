package com.cms4j.plant.user.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.Page;
import com.cms4j.base.util.ShortUUID;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * description:
 *
 * @author: zmj
 * @create: 2017/7/3
 */
@Service
public class CompleteProService {
    @Autowired
    private DaoSupport daoSupport;

    @Transactional(rollbackFor = Exception.class)
    public void addCompletePro(DataMap dataMap) throws Exception {
        dataMap.put("COMPLETE_ID", ShortUUID.randomUUID());
        if(StringUtils.isBlank(dataMap.getString("NAMESECRET"))) dataMap.put("NAMESECRET", 0);
        if(StringUtils.isBlank(dataMap.getString("SEXSECRET"))) dataMap.put("SEXSECRET", 0);
        if(StringUtils.isBlank(dataMap.getString("BIRTHDAYSECRET"))) dataMap.put("BIRTHDAYSECRET", 0);
        daoSupport.save("CompleteProMapper.addCompletePro", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void editCompletePro(DataMap dataMap) throws Exception {
        daoSupport.update("CompleteProMapper.editCompletePro", dataMap);
    }

    public DataMap getCompleteProByUserId(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("CompleteProMapper.getCompleteProByUserId", dataMap);
    }

    public DataMap getCompleteProById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("CompleteProMapper.getCompleteProById", dataMap);
    }

    public List<DataMap> getCompletePros(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("CompleteProMapper.getCompletePros", page);
    }

    public Boolean isHasPhoneInCompletePro(DataMap dataMap) throws Exception {
        return (Boolean) daoSupport.findForObject("CompleteProMapper.isHasPhoneInCompletePro", dataMap);
    }
}
