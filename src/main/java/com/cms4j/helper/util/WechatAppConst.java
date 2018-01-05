package com.cms4j.helper.util;

public class WechatAppConst {
    //code换取session_key
    public static final String API_URL_JSCODE2SESSION = "https://api.weixin.qq.com/sns/jscode2session";

    //统一下单
    public static final String API_URL_UNIFIEDORDER = "https://api.mch.weixin.qq.com/pay/unifiedorder";

    //扫码支付的二维码地址
    public static final String API_URL_QRCODE = "weixin//wxpay/bizpayurl";
}
