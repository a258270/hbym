package com.cms4j.helper.api.user;

import com.alibaba.fastjson.JSONObject;
import com.cms4j.helper.account.WechatAppAccount;
import com.cms4j.helper.entity.user.LoginObject;
import com.cms4j.helper.util.HttpUtil;
import com.cms4j.helper.util.WechatAppConst;

public class UserApi {

    /**
     * code 换取 session_key
     * @param appId 小程序appId
     * @param secret 小程序secretId
     * @param code 客户端提交的code
     * @return 用户信息
     */
    public JSONObject getJsCode2Session(String appId, String secret, String code) {
        LoginObject loginObject = new LoginObject();
        loginObject.setAppid(appId);
        loginObject.setSecret(secret);
        loginObject.setJs_code(code);

        return HttpUtil.sendGetForJSONObject(new StringBuilder(WechatAppConst.API_URL_JSCODE2SESSION).append(loginObject).toString());
    }
}
