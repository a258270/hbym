package com.cms4j.helper.account;

public class WechatAppAccount {

    private String appId;
    private String secret;

    public WechatAppAccount(String appId, String secret) {
        this.appId = appId;
        this.secret = secret;
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
}
