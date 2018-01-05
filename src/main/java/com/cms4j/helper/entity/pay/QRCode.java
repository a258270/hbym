package com.cms4j.helper.entity.pay;

import com.cms4j.helper.entity.UrlEntity;

/**
 * pc端扫二维码的地址信息
 */
public class QRCode extends UrlEntity {

    private String appid;
    private String mch_id;
    private String time_stamp;
    private String nonce_str;
    private String product_id;
    private String sign;

    public QRCode() {
    }

    public QRCode(String appid, String mch_id, String time_stamp, String nonce_str, String product_id, String sign) {
        this.appid = appid;
        this.mch_id = mch_id;
        this.time_stamp = time_stamp;
        this.nonce_str = nonce_str;
        this.product_id = product_id;
        this.sign = sign;
    }

    public QRCode(String appid, String mch_id, String time_stamp, String nonce_str, String product_id) {
        this.appid = appid;
        this.mch_id = mch_id;
        this.time_stamp = time_stamp;
        this.nonce_str = nonce_str;
        this.product_id = product_id;
    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getMch_id() {
        return mch_id;
    }

    public void setMch_id(String mch_id) {
        this.mch_id = mch_id;
    }

    public String getTime_stamp() {
        return time_stamp;
    }

    public void setTime_stamp(String time_stamp) {
        this.time_stamp = time_stamp;
    }

    public String getNonce_str() {
        return nonce_str;
    }

    public void setNonce_str(String nonce_str) {
        this.nonce_str = nonce_str;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }
}
