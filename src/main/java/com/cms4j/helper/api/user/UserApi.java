package com.cms4j.helper.api.user;

import com.alibaba.fastjson.JSONObject;
import com.cms4j.helper.account.WechatAppAccount;
import com.cms4j.helper.util.HttpUtil;
import com.cms4j.helper.util.WechatAppConst;

public class UserApi {

    public JSONObject getJsCode2Session(String appId, String secret, String code) {
        return HttpUtil.sendGetForJSONObject(String.format(WechatAppConst.API_URL_JSCODE2SESSION, appId, secret, code));
    }
}
