package com.cms4j.plant.user.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.base.util.ShortUUID;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * description:
 *
 * @author: zmj
 * @create: 2017/6/29
 */
@Service
public class CompleteStudentService {
    @Autowired
    private DaoSupport daoSupport;

    /**
     * 新增个人信息
     * @param dataMap
     * @throws Exception
     */
    @Transactional(rollbackFor = Exception.class)
    public void addCompleteStudent(DataMap dataMap) throws Exception {
        dataMap.put("COMPLETE_ID", ShortUUID.randomUUID());
        if(StringUtils.isBlank(dataMap.getString("USER_ID")))
            dataMap.put("USER_ID", SessionUtil.getCurUser().getString("USER_ID"));
        if(StringUtils.isBlank(dataMap.getString("NAMESECRET"))) dataMap.put("NAMESECRET", 0);
        if(StringUtils.isBlank(dataMap.getString("SEXSECRET"))) dataMap.put("SEXSECRET", 0);
        if(StringUtils.isBlank(dataMap.getString("BIRTHDAYSECRET"))) dataMap.put("BIRTHDAYSECRET", 0);
        daoSupport.save("CompleteStudentMapper.addCompleteStudent", dataMap);
    }

    /**
     * 编辑个人信息
     * @param dataMap
     * @throws Exception
     */
    @Transactional(rollbackFor = Exception.class)
    public void editCompleteStudent(DataMap dataMap) throws Exception {
        daoSupport.update("CompleteStudentMapper.editCompleteStudent", dataMap);
    }

    /**
     * 通过UserId获取个人信息
     * @param dataMap
     * @return
     * @throws Exception
     */
    public DataMap getCompleteStudentByUserId(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("CompleteStudentMapper.getCompleteStudentByUserId", dataMap);
    }

    /**
     * 通过Id获取个人信息
     * @param dataMap
     * @return
     * @throws Exception
     */
    public DataMap getCompleteStudentById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("CompleteStudentMapper.getCompleteStudentById", dataMap);
    }

    /**
     * 完善个人信息
     * @param dataMap
     * @throws Exception
     */
    @Transactional(rollbackFor = Exception.class)
    public void completeStudentInfo(DataMap dataMap) throws Exception {
        daoSupport.update("CompleteStudentMapper.completeStudentInfo", dataMap);
    }

    public Boolean isHasPhoneInCompleteStudent(DataMap dataMap) throws Exception {
        return (Boolean) daoSupport.findForObject("CompleteStudentMapper.isHasPhoneInCompleteStudent", dataMap);
    }
}
