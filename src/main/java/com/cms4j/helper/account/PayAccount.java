package com.cms4j.helper.account;

public class PayAccount {
    //商户号
    private String mch_id;
    //商户密码
    private String mch_password;

    public PayAccount(String mch_id, String mch_password) {
        this.mch_id = mch_id;
        this.mch_password = mch_password;
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
}
