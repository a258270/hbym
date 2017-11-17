package com.cms4j.helper;

import com.alibaba.fastjson.JSONObject;
import com.cms4j.helper.account.WechatAppAccount;
import com.cms4j.helper.api.user.UserApi;

public class WechatAppProxy {
    public WechatAppProxy(WechatAppAccount wechatAppAccount) {
        this.wechatAppAccount = wechatAppAccount;
        this.initProxy(this.wechatAppAccount);
    }

    public WechatAppProxy(String appId, String secret) {
        this.wechatAppAccount = new WechatAppAccount(appId, secret);
        this.initProxy(this.wechatAppAccount);
    }

    private void initProxy(WechatAppAccount wechatAppAccount) {
        this.userApi = new UserApi();
    }

    /**
     * 小程序账户信息（包含appId和appSecret）
     */
    private WechatAppAccount wechatAppAccount;

    public WechatAppAccount getWechatAppAccount() {
        return wechatAppAccount;
    }

    public void setWechatAppAccount(WechatAppAccount wechatAppAccount) {
        this.wechatAppAccount = wechatAppAccount;
    }

    /**
     * 关于用户的相关api操作
     */
    private UserApi userApi;

    public UserApi getUserApi() {
        return userApi;
    }

    public void setUserApi(UserApi userApi) {
        this.userApi = userApi;
    }

    /**
     * code 换取 session_key
     * https://api.weixin.qq.com/sns/jscode2session?appid=APPID&secret=SECRET&js_code=JSCODE&grant_type=authorization_code
     * @param code
     * @return
     */
    public JSONObject getJsCode2Session(String code) {
        return userApi.getJsCode2Session(this.getWechatAppAccount().getAppId(), this.getWechatAppAccount().getSecret(), code);
    }

}
