package com.cms4j.helper.api.pay;

import com.alibaba.fastjson.JSON;
import com.cms4j.helper.account.PayAccount;
import com.cms4j.helper.account.WechatAppAccount;
import com.cms4j.helper.entity.pay.Unifiedorder;
import com.cms4j.helper.util.HttpUtil;
import com.cms4j.helper.util.WechatAppConst;

import java.util.ArrayList;
import java.util.List;

public class PayApi {
    private PayAccount payAccount;

    public PayApi(PayAccount payAccount) {
        this.payAccount = payAccount;
    }

    /*public String unifiedorder(Unifiedorder unifiedorder) {
        return HttpUtil.sendGetForJSONObject(new StringBuilder(WechatAppConst.API_URL_UNIFIEDORDER).append(loginObject).toString());
    }*/

    public PayAccount getPayAccount() {
        return payAccount;
    }

    public void setPayAccount(PayAccount payAccount) {
        this.payAccount = payAccount;
    }
}
