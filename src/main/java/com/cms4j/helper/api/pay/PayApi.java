package com.cms4j.helper.api.pay;

import com.cms4j.base.util.ShortUUID;
import com.cms4j.helper.entity.pay.QRCode;
import com.cms4j.helper.exception.PayErrorException;
import com.cms4j.helper.account.PayAccount;
import com.cms4j.helper.account.WechatAppAccount;
import com.cms4j.helper.entity.pay.PrePay;
import com.cms4j.helper.entity.pay.PrePayReSign;
import com.cms4j.helper.entity.pay.Unifiedorder;
import com.cms4j.helper.util.HttpUtil;
import com.cms4j.helper.util.PrePayUtil;
import com.cms4j.helper.util.SignUtil;
import com.cms4j.helper.util.WechatAppConst;
import org.dom4j.DocumentException;

import java.lang.reflect.InvocationTargetException;


public class PayApi {
    private PrePay unifiedorder(WechatAppAccount wechatAppAccount, Unifiedorder unifiedorder) throws NoSuchMethodException, IllegalAccessException, DocumentException, InvocationTargetException {
        PayAccount payAccount = (PayAccount) wechatAppAccount;
        unifiedorder.setAppid(wechatAppAccount.getAppId());
        unifiedorder.setMch_id(payAccount.getMch_id());
        unifiedorder.setNonce_str(ShortUUID.randomUUID().toUpperCase());
        unifiedorder.setNotify_url(payAccount.getNotify_url());
        unifiedorder.setSign_type(SignUtil.SIGN_TYPE);
        String sign = SignUtil.makeSign(payAccount, unifiedorder);

        unifiedorder.setSign(sign);

        return PrePayUtil.parsePrePay(HttpUtil.sendPost(WechatAppConst.API_URL_UNIFIEDORDER, unifiedorder));
    }

    private PrePay unifiedorderForWeb(WechatAppAccount wechatAppAccount, Unifiedorder unifiedorder) throws NoSuchMethodException, IllegalAccessException, DocumentException, InvocationTargetException {
        PayAccount payAccount = (PayAccount) wechatAppAccount;
        unifiedorder.setAppid(wechatAppAccount.getWxAppId());
        unifiedorder.setMch_id(payAccount.getMch_id());
        unifiedorder.setNonce_str(ShortUUID.randomUUID().toUpperCase());
        unifiedorder.setNotify_url(payAccount.getNotify_url());
        unifiedorder.setSign_type(SignUtil.SIGN_TYPE);
        String sign = SignUtil.makeSign(payAccount, unifiedorder);

        unifiedorder.setSign(sign);

        return PrePayUtil.parsePrePay(HttpUtil.sendPost(WechatAppConst.API_URL_UNIFIEDORDER, unifiedorder));
    }

    public PrePayReSign createPrePayInfo(WechatAppAccount wechatAppAccount, Unifiedorder unifiedorder) throws PayErrorException {
        try{
            PrePay prePay = this.unifiedorder(wechatAppAccount, unifiedorder);

            if(PrePayUtil.UNIFIEDORDER_SUCCESS.equals(prePay.getReturn_code())
                    && PrePayUtil.UNIFIEDORDER_SUCCESS.equals(prePay.getResult_code())) {

                StringBuilder sb = new StringBuilder("prepay_id=");
                sb.append(prePay.getPrepay_id());

                PrePayReSign prePayReSign = new PrePayReSign();
                prePayReSign.setAppId(wechatAppAccount.getAppId());
                prePayReSign.setTimeStamp(String.valueOf(System.currentTimeMillis()));
                prePayReSign.setNonceStr(ShortUUID.randomUUID());
                prePayReSign.setPackageStr(sb.toString());
                prePayReSign.setSignType(SignUtil.SIGN_TYPE);

                String sign = SignUtil.makeSign((PayAccount) wechatAppAccount, prePayReSign);
                prePayReSign.setPaySign(sign);

                return prePayReSign;
            }
            else{
                throw new PayErrorException();
            }
        }
        catch (Exception e) {
            throw new PayErrorException();
        }
    }

    public String createQRCode(WechatAppAccount wechatAppAccount) {
        PayAccount payAccount = (PayAccount) wechatAppAccount;
        String appid = payAccount.getAppId();
        String mch_id = payAccount.getMch_id();
        String time_stamp = String.valueOf(System.currentTimeMillis());
        String nonce_str = ShortUUID.randomUUID();
        String product_id = ShortUUID.orderUUID();
        QRCode qrCode = new QRCode(appid, mch_id, time_stamp, nonce_str, product_id);

        String sign = SignUtil.makeSign(payAccount, qrCode);
        qrCode.setSign(sign);

        return new StringBuilder(WechatAppConst.API_URL_QRCODE).append(qrCode).toString();
    }

    public String createQRCode(WechatAppAccount wechatAppAccount, Unifiedorder unifiedorder) throws PayErrorException {
        try{
            unifiedorder.setTrade_type("NATIVE");
            PrePay prePay = this.unifiedorderForWeb(wechatAppAccount, unifiedorder);

            return prePay.getCode_url();
        }
        catch (Exception e) {
            throw new PayErrorException();
        }

    }
}
