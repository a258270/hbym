package com.cms4j.helper.util;

import com.cms4j.base.util.MD5Util;
import com.cms4j.helper.account.PayAccount;
import com.cms4j.helper.entity.Entity;
import com.cms4j.helper.entity.UrlEntity;
import com.cms4j.helper.entity.pay.PrePayReSign;
import org.apache.commons.lang3.StringUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.tree.DefaultText;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
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

    public static boolean validSign(PayAccount payAccount, Entity entity, Class<? extends Entity> clazz) {
        if(entity == null) return false;

        try {
            Field[] fields = clazz.getDeclaredFields();
            if(fields.length == 0) return false;
            for (Field field : fields) {
                String filedName = field.getName();
                if (filedName.equals("sign")) {
                    StringBuilder sb = new StringBuilder("get").append(filedName.substring(0, 1).toUpperCase()).append(filedName.substring(1, filedName.length()));
                    String methodName = sb.toString();
                    Method method = clazz.getMethod(methodName);
                    String sign = (String) method.invoke(entity);
                    if(sign == null) throw new NullPointerException();

                    String setMethodName = new StringBuilder("set").append(filedName.substring(0, 1).toUpperCase()).append(filedName.substring(1, filedName.length())).toString();
                    Method setMethod = clazz.getMethod(setMethodName, String.class);

                    setMethod.invoke(entity, null);

                    String validSign = makeSign(payAccount, entity);
                    if(validSign.equals(sign)) return true;

                    break;
                }
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }

        return false;
    }
}
