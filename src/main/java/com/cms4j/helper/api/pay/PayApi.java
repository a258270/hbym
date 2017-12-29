package com.cms4j.helper.api.pay;

import com.cms4j.base.util.ShortUUID;
import com.cms4j.helper.account.PayAccount;
import com.cms4j.helper.account.WechatAppAccount;
import com.cms4j.helper.entity.pay.Unifiedorder;
import com.cms4j.helper.util.HttpUtil;
import com.cms4j.helper.util.SignUtil;
import com.cms4j.helper.util.WechatAppConst;

import java.util.Map;


public class PayApi {
    public String unifiedorder(WechatAppAccount wechatAppAccount, Unifiedorder unifiedorder) {
        PayAccount payAccount = (PayAccount) wechatAppAccount;
        unifiedorder.setAppid(wechatAppAccount.getAppId());
        unifiedorder.setMch_id(payAccount.getMch_id());
        unifiedorder.setNonce_str(ShortUUID.randomUUID().toUpperCase());
        unifiedorder.setNotify_url(payAccount.getNotify_url());
        String sign = SignUtil.makeSign(payAccount, unifiedorder);
        unifiedorder.setSign(sign);
        unifiedorder.setSign_type(SignUtil.SIGN_TYPE);

        return HttpUtil.sendPost(WechatAppConst.API_URL_UNIFIEDORDER, unifiedorder);
    }
}
