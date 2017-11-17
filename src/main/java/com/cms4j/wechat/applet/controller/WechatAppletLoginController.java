package com.cms4j.wechat.applet.controller;

import com.alibaba.fastjson.JSONObject;
import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.ShortUUID;
import com.cms4j.wechat.applet.service.WechatAppletLoginService;
import com.cms4j.wechat.service.WechatUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/wechat/applet/api")
public class WechatAppletLoginController extends ApiBaseController {
    @Autowired
    private WechatAppletLoginService wechatAppletLoginService;

    @Autowired
    private WechatUserService wechatUserService;

    @RequestMapping(value = "/login")
    public InvokeResult login() throws Exception {
        DataMap dataMap = this.getDataMap();

        String code = dataMap.getString("code");
        JSONObject jsonObject = wechatAppletLoginService.login(code);
        if(jsonObject.containsKey("openid") && jsonObject.containsKey("session_key")) {
            //请求成功
            DataMap wechatUser = new DataMap();
            wechatUser.put("UNIONID", jsonObject.getString("unionid"));
            wechatUser = wechatUserService.getWechatUserByUnionId(wechatUser);

            //新用户
            if(wechatUser == null) {
                wechatUser = new DataMap();
                wechatUser.put("USER_ID", ShortUUID.randomUUID());
            }
        }
        else{
            return InvokeResult.failure("读取用户信息失败，请重试");
        }

        return InvokeResult.success();
    }
}
