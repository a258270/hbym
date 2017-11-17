package com.cms4j.wechat.applet.service;

import com.alibaba.fastjson.JSONObject;
import com.cms4j.helper.WechatAppProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WechatAppletLoginService {
    @Autowired
    private WechatAppProxy wechatAppProxy;

    public JSONObject login(String code) {
        return wechatAppProxy.getJsCode2Session(code);
    }
}
