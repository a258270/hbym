package com.cms4j.helper.entity;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class UrlEntity extends Entity {

    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        Class clazz = getClass();
        Field[] fields = clazz.getDeclaredFields();
        for(Field field : fields) {
            //获取get方法
            Method method = getGetMethod(field.getName());
            if(method == null) continue;
            try {
                //通过get方法获取值
                Object value = method.invoke(this);
                if(value != null) {
                    //按照url的get方式拼接
                    stringBuilder.append(field.getName());
                    stringBuilder.append("=");
                    stringBuilder.append(value);
                    stringBuilder.append("&");
                }
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
        }

        if(stringBuilder.length() > 0) {
            //截取最后一位&字符
            stringBuilder.delete(stringBuilder.length() - 1, stringBuilder.length());

            //在首位添加?字符
            stringBuilder.insert(0, "?");
        }

        return stringBuilder.toString();
    }
}
