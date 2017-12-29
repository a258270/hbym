package com.cms4j.helper.account;

public class PayAccount extends WechatAppAccount {
    //商户号
    private String mch_id;
    //商户密码
    private String mch_password;
    //api密码
    private String api_password;
    //通知地址
    private String notify_url;

    public PayAccount(String appId, String secret, String mch_id, String mch_password, String api_password, String notify_url) {
        super(appId, secret);
        this.mch_id = mch_id;
        this.mch_password = mch_password;
        this.api_password = api_password;
        this.notify_url = notify_url;
    }

    public String getMch_id() {
        return mch_id;
    }

    public void setMch_id(String mch_id) {
        this.mch_id = mch_id;
    }

    public String getMch_password() {
        return mch_password;
    }

    public void setMch_password(String mch_password) {
        this.mch_password = mch_password;
    }

    public String getApi_password() {
        return api_password;
    }

    public void setApi_password(String api_password) {
        this.api_password = api_password;
    }

    public String getNotify_url() {
        return notify_url;
    }

    public void setNotify_url(String notify_url) {
        this.notify_url = notify_url;
    }
}
