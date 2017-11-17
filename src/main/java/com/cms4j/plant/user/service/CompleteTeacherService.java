package com.cms4j.plant.user.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.SessionUtil;
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
public class CompleteTeacherService {

    @Autowired
    private DaoSupport daoSupport;

    @Transactional(rollbackFor = Exception.class)
    public void addCompleteTeacher(DataMap dataMap) throws Exception {
        dataMap.put("USER_ID", SessionUtil.getCurUser().getString("USER_ID"));
        addBaseCompleteTeacher(dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addBaseCompleteTeacher(DataMap dataMap) throws Exception {
        dataMap.put("COMPLETE_ID", ShortUUID.randomUUID());
        if(StringUtils.isBlank(dataMap.getString("NAMESECRET"))) dataMap.put("NAMESECRET", 0);
        if(StringUtils.isBlank(dataMap.getString("SEXSECRET"))) dataMap.put("SEXSECRET", 0);
        if(StringUtils.isBlank(dataMap.getString("BIRTHDAYSECRET"))) dataMap.put("BIRTHDAYSECRET", 0);
        daoSupport.save("CompleteTeacherMapper.addCompleteTeacher", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void editCompleteTeacher(DataMap dataMap) throws Exception {
        daoSupport.update("CompleteTeacherMapper.editCompleteTeacher", dataMap);
    }

    public DataMap getCompleteTeacherByUserId(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("CompleteTeacherMapper.getCompleteTeacherByUserId", dataMap);
    }

    public DataMap getCompleteTeacherById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("CompleteTeacherMapper.getCompleteTeacherById", dataMap);
    }

    public List<DataMap> getCompleteTeacherByScId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("CompleteTeacherMapper.getCompleteTeacherByScId", dataMap);
    }

    public Boolean isHasPhoneInCompleteTeacher(DataMap dataMap) throws Exception {
        return (Boolean) daoSupport.findForObject("CompleteTeacherMapper.isHasPhoneInCompleteTeacher", dataMap);
    }
}
