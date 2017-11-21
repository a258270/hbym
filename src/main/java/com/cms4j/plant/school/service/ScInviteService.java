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

    @Transactional(rollbackFor = Exception.class)
    public void batchSend(DataMap dataMap) throws Exception {
        String[] sends = dataMap.getString("batchSend").split(",");
        for(String send: sends) {
            DataMap invite = new DataMap();
            invite.put("TEACHER_ID", dataMap.getString("TEACHER_ID"));
            invite.put("STUDENT_ID", send);
            invite.put("CONTENT", dataMap.getString("content"));
            if(this.getScInviteByStudentIdAndTeacherId(invite) == null)
                this.addScInvite(invite);
        }
    }

    public List<DataMap> getNoReadScInvites(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ScInviteMapper.getNoReadScInvites", dataMap);
    }

    public DataMap getScInviteByStudentIdAndTeacherId(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ScInviteMapper.getScInviteByStudentIdAndTeacherId", dataMap);
    }

    public DataMap getScInviteById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ScInviteMapper.getScInviteById", dataMap);
    }

    public Integer getCountNoReadScInvites(DataMap dataMap) throws Exception {
        return (Integer) daoSupport.findForObject("ScInviteMapper.getCountNoReadScInvites", dataMap);
    }
}
