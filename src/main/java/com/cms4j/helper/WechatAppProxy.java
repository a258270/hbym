package com.cms4j.helper;

import com.alibaba.fastjson.JSONObject;
import com.cms4j.helper.account.WechatAppAccount;
import com.cms4j.helper.api.pay.PayApi;
import com.cms4j.helper.api.user.UserApi;
import com.cms4j.helper.entity.pay.PrePayReSign;
import com.cms4j.helper.entity.pay.Unifiedorder;
import com.cms4j.helper.exception.PayErrorException;
import org.dom4j.DocumentException;

import java.lang.reflect.InvocationTargetException;

public class WechatAppProxy {
    public WechatAppProxy(WechatAppAccount wechatAppAccount) {
        this.wechatAppAccount = wechatAppAccount;
        this.initProxy();
    }

    /*public WechatAppProxy(String appId, String secret) {
        this.wechatAppAccount = new WechatAppAccount(appId, secret);
        this.initProxy();
    }*/

    private void initProxy() {
        this.userApi = new UserApi();
        this.payApi = new PayApi();
    }

    /**
     * 小程序账户信息（包含appId和appSecret）
     */
    private WechatAppAccount wechatAppAccount;

    public WechatAppAccount getWechatAppAccount() {
        return wechatAppAccount;
    }

    public void setWechatAppAccount(WechatAppAccount wechatAppAccount) {
        this.wechatAppAccount = wechatAppAccount;
    }

    /**
     * 关于用户的相关api操作
     */
    private UserApi userApi;

    public UserApi getUserApi() {
        return userApi;
    }

    public void setUserApi(UserApi userApi) {
        this.userApi = userApi;
    }

    /**
     * code 换取 session_key
     * https://api.weixin.qq.com/sns/jscode2session?appid=APPID&secret=SECRET&js_code=JSCODE&grant_type=authorization_code
     * @param code
     * @return
     */
    public JSONObject getJsCode2Session(String code) {
        return userApi.getJsCode2Session(this.wechatAppAccount, code);
    }

    /**
     * 关于微信支付的相关api操作
     */
    private PayApi payApi;

    public PayApi getPayApi() {
        return payApi;
    }

    public void setPayApi(PayApi payApi) {
        this.payApi = payApi;
    }

    /**
     * 统一下单，生成预付单
     * @param unifiedorder 统一下单信息
     * @return 预付单
     * @throws InvocationTargetException
     * @throws NoSuchMethodException
     * @throws DocumentException
     * @throws IllegalAccessException
     */
    public PrePayReSign createPrePayInfo(Unifiedorder unifiedorder) throws InvocationTargetException, NoSuchMethodException, DocumentException, IllegalAccessException, PayErrorException {
        return payApi.createPrePayInfo(wechatAppAccount, unifiedorder);
    }
}
