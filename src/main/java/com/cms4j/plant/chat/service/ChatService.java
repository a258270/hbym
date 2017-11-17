package com.cms4j.plant.chat.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.Page;
import com.cms4j.base.util.ShortUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.xml.crypto.Data;
import java.util.List;

@Service
public class ChatService {

    @Autowired
    private DaoSupport daoSupport;

    /**
     * 增加双向映射关系
     * @param sUserId 发送id
     * @param rUserId 接收id
     * @throws Exception
     */
    @Transactional(rollbackFor = Exception.class)
    public void addChatMapping(String sUserId, String rUserId) throws Exception {

        DataMap dataMap = new DataMap();
        dataMap.put("REC_ID", ShortUUID.randomUUID());
        dataMap.put("SUSER_ID", sUserId);
        dataMap.put("RUSER_ID", rUserId);
        dataMap.put("CREATETIME", DateUtil.getCurrentTime());
        dataMap.put("ISVALIABLE", true);
        daoSupport.save("ChatMappingMapper.addChatMapping", dataMap);

        dataMap.put("REC_ID", ShortUUID.randomUUID());
        dataMap.put("RUSER_ID", sUserId);
        dataMap.put("SUSER_ID", rUserId);
        daoSupport.save("ChatMappingMapper.addChatMapping", dataMap);
    }

    /**
     * 根据发送者id获取所有映射
     * @param dataMap
     * @return
     * @throws Exception
     */
    public List<DataMap> getChatRecBySendUserId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ChatMappingMapper.getChatRecBySendUserId", dataMap);
    }

    public Integer getChatMappingBySRUserId(DataMap dataMap) throws Exception {
        return (Integer) daoSupport.findForObject("ChatMappingMapper.getChatMappingBySRUserId", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void deleteChatMappingBySRUserId(DataMap dataMap) throws Exception {
        daoSupport.delete("ChatMappingMapper.deleteChatMappingBySRUserId", dataMap);
    }

    /**
     *
     * 根据接收者id获取所有映射
     * @param dataMap
     * @return
     * @throws Exception
     */
    public List<DataMap> getChatRecByRecUserId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ChatMappingMapper.getChatRecByRecUserId", dataMap);
    }

    /**
     * 删除映射
     * @param dataMap
     * @throws Exception
     */
    @Transactional(rollbackFor = Exception.class)
    public void deleteChatMapping(DataMap dataMap) throws Exception {
        daoSupport.delete("ChatMappingMapper.deleteChatMapping", dataMap);
    }

    /**
     * 新增聊天记录
     * @param dataMap
     * @throws Exception
     */
    @Transactional(rollbackFor = Exception.class)
    public void addChatRec(DataMap dataMap) throws Exception {
        dataMap.put("REC_ID", ShortUUID.randomUUID());
        dataMap.put("CREATETIME", DateUtil.getCurrentTime());
        daoSupport.save("ChatMapper.addChatRec", dataMap);
    }

    /**
     * 获取聊天记录
     * @param dataMap
     * @return
     * @throws Exception
     */
    public List<DataMap> getChatRecBySRUserId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ChatMapper.getChatRecBySRUserId", dataMap);
    }

    public List<DataMap> getChatRecBySendTeacherId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ChatMappingMapper.getChatRecBySendTeacherId", dataMap);
    }

    public List<DataMap> getChatRecBySendStudentId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ChatMappingMapper.getChatRecBySendStudentId", dataMap);
    }

    public List<DataMap> getStudentChatInfos(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ChatMappingMapper.getStudentChatInfos", dataMap);
    }

    public List<DataMap> getStudentChatInfos(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ChatMappingMapper.getStudentChatInfos", page);
    }

    @Transactional(rollbackFor = Exception.class)
    public void deleteUserChatMapping(DataMap dataMap) throws Exception {
        daoSupport.delete("ChatMappingMapper.deleteUserChatMapping", dataMap);
    }

    public void setChatMappingValiable(DataMap dataMap) throws Exception {
        daoSupport.update("ChatMappingMapper.setChatMappingValiable", dataMap);
    }

    public List<DataMap> listChatRecords(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ChatMapper.listChatRecords", page);
    }

    @Transactional(rollbackFor = Exception.class)
    public void setRead(DataMap dataMap) throws Exception {
        daoSupport.update("ChatMapper.setRead", dataMap);
    }

    public Boolean isHasMsg(DataMap dataMap) throws Exception {
        return (Boolean) daoSupport.findForObject("ChatMapper.isHasMsg", dataMap);
    }

    public Integer getCountMsg(DataMap dataMap) throws Exception {
        return (Integer) daoSupport.findForObject("ChatMapper.getMsgCount", dataMap);
    }

    public Integer getNoReadMsgCount(DataMap dataMap) throws Exception {
        return (Integer) daoSupport.findForObject("ChatMapper.getNoReadMsgCount", dataMap);
    }

    public Integer getCountTeacherChatMapping(DataMap dataMap) throws Exception {
        return (Integer) daoSupport.findForObject("ChatMappingMapper.getCountTeacherChatMapping", dataMap);
    }
}
