package com.cms4j.helper.util;

import com.cms4j.base.util.MD5Util;
import com.cms4j.helper.account.PayAccount;
import com.cms4j.helper.entity.Entity;
import com.cms4j.helper.entity.UrlEntity;


public class SignUtil {
    public static final String SIGN_TYPE = "MD5";

    public static String makeSign(PayAccount payAccount, Entity entity) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(entity.toUrlString());
        stringBuilder.append("&");
        stringBuilder.append(payAccount.getApi_password());

        String str = stringBuilder.toString();

        return MD5Util.getMD5(str.substring(1, str.length() - 1));
    }
}
