package com.cms4j.plant.chat.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.ShortUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ChatScoreService  {

    @Autowired
    private DaoSupport daoSupport;

    public List<DataMap> getChatScoreByStudentId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ChatScoreMapper.getChatScoreByStudentId", dataMap);
    }

    public List<DataMap> getChatScoreByTeacherId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ChatScoreMapper.getChatScoreByTeacherId", dataMap);
    }

    public DataMap getChatScoreByStudentIdAndTeacherId(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ChatScoreMapper.getChatScoreByStudentIdAndTeacherId", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addChatScore(DataMap dataMap) throws Exception {
        dataMap.put("EVALUATE_ID", ShortUUID.randomUUID());
        dataMap.put("CREATETIME", DateUtil.getCurrentTime());
        daoSupport.save("ChatScoreMapper.addChatScore", dataMap);
    }

    public Double getTeacherTotalScore(DataMap dataMap) throws Exception {
        return (Double) daoSupport.findForObject("ChatScoreMapper.getTeacherTotalScore", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void evaluateTeacher(DataMap dataMap) throws Exception {
        this.addChatScore(dataMap);
    }
}
