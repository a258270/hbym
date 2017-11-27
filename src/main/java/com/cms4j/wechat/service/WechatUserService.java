package com.cms4j.wechat.service;

import com.alibaba.fastjson.JSONObject;
import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.ShortUUID;
import com.cms4j.helper.WechatAppProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class WechatUserService {

    @Autowired
    private DaoSupport daoSupport;

    @Autowired
    private WechatAppProxy wechatAppProxy;

    public JSONObject login(String code) {
        return wechatAppProxy.getJsCode2Session(code);
    }

    public DataMap getWechatUserByUnionId(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("WechatUserMapper.getWechatUserByUnionId", dataMap);
    }

    public DataMap getWechatUserByWxAppOpenId(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("WechatUserMapper.getWechatUserByWxAppOpenId", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addWechatUser(DataMap dataMap) throws Exception {
        dataMap.put("WECHAT_ID", ShortUUID.randomUUID());

        daoSupport.save("WechatUserMapper.addWechatUser", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void editWechatUser(DataMap dataMap) throws Exception {

        daoSupport.update("WechatUserMapper.editWechatUser", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void removeWechatUser(DataMap dataMap) throws Exception {
        daoSupport.delete("WechatUserMapper.removeWechatUser", dataMap);
    }
}
