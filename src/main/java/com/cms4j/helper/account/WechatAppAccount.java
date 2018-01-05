package com.cms4j.helper.account;

public class WechatAppAccount {

    //小程序appid
    private String appId;
    //小程序secret
    private String secret;
    //微信公众号appid
    private String wxAppId;
    //微信公众号secret
    private String wxSecret;

    public WechatAppAccount() {
    }

    public WechatAppAccount(String appId, String secret) {
        this.appId = appId;
        this.secret = secret;
    }

    public WechatAppAccount(String appId, String secret, String wxAppId, String wxSecret) {
        this.appId = appId;
        this.secret = secret;
        this.wxAppId = wxAppId;
        this.wxSecret = wxSecret;
    }

    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getSecret() {
        return secret;
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }

    public String getWxAppId() {
        return wxAppId;
    }

    public void setWxAppId(String wxAppId) {
        this.wxAppId = wxAppId;
    }

    public String getWxSecret() {
        return wxSecret;
    }

    public void setWxSecret(String wxSecret) {
        this.wxSecret = wxSecret;
    }
}
