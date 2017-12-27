package com.cms4j.helper.api.user;

import com.alibaba.fastjson.JSONObject;
import com.cms4j.helper.account.WechatAppAccount;
import com.cms4j.helper.entity.user.LoginObject;
import com.cms4j.helper.util.HttpUtil;
import com.cms4j.helper.util.WechatAppConst;

public class UserApi {
    /**
     * code 换取 session_key
     * @param wechatAppAccount 账户信息
     * @param code 客户端提交的code
     * @return 用户信息
     */
    public JSONObject getJsCode2Session(WechatAppAccount wechatAppAccount, String code) {
        LoginObject loginObject = new LoginObject();
        loginObject.setAppid(wechatAppAccount.getAppId());
        loginObject.setSecret(wechatAppAccount.getSecret());
        loginObject.setJs_code(code);

        return HttpUtil.sendGetForJSONObject(WechatAppConst.API_URL_JSCODE2SESSION, loginObject);
    }
}
