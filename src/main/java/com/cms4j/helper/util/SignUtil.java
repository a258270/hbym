package com.cms4j.helper.util;

import com.cms4j.base.util.MD5Util;
import com.cms4j.helper.account.PayAccount;
import com.cms4j.helper.entity.Entity;
import com.cms4j.helper.entity.UrlEntity;
import com.cms4j.helper.entity.pay.PrePayReSign;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.tree.DefaultText;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;


public class SignUtil {
    public static final String SIGN_TYPE = "MD5";

    public static String makeSign(PayAccount payAccount, Entity entity) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(entity.toUrlString());
        stringBuilder.append("&key=");
        stringBuilder.append(payAccount.getApi_password());

        String str = stringBuilder.toString();
        if(entity instanceof PrePayReSign)
            str = str.replace("&packageStr", "&package");

        return MD5Util.getMD5(str.substring(1, str.length())).toUpperCase();
    }

    public static boolean validSign(PayAccount payAccount, String rec_sign, String strXml) throws DocumentException {
        TreeMap<String, String> treeMap = new TreeMap<>();

        Document document = DocumentHelper.parseText(strXml);
        Element rootElement = document.getRootElement();
        List<Element> contents = rootElement.content();
        for(Element element : contents) {
            String key = element.getName();//返回结果的key
            String value = element.getStringValue();//返回结果的value
            if(key.equals("sign")) continue;
            treeMap.put(key, value);
        }

        StringBuilder stringBuilder = new StringBuilder();
        for(Map.Entry entry : treeMap.entrySet()) {
            //按照url的get方式拼接
            stringBuilder.append(entry.getKey());
            stringBuilder.append("=");
            stringBuilder.append(entry.getValue());
            stringBuilder.append("&");
        }

        stringBuilder.append("key=");
        stringBuilder.append(payAccount.getApi_password());

        return rec_sign.equals(MD5Util.getMD5(stringBuilder.toString()).toUpperCase());
    }
}
