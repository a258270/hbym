package com.cms4j.helper.entity;

import com.alibaba.fastjson.JSON;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

public abstract class Entity {

    protected Method getGetMethod(String fieldName) {
        try{
            Class[] parameterTypes = new Class[1];
            Field field = getClass().getDeclaredField(fieldName);
            parameterTypes[0] = field.getType();
            StringBuffer sb = new StringBuffer();
            //暂时不考虑boolean类型
            sb.append("get");
            sb.append(fieldName.substring(0, 1).toUpperCase());
            sb.append(fieldName.substring(1));
            Method method = getClass().getMethod(sb.toString());

            return method;
        }
        catch (NoSuchFieldException e) {
            e.printStackTrace();
        }
        catch (NoSuchMethodException e) {
            e.printStackTrace();
        }

        return null;
    }

    public Map<String, String> getFieldsMap() {
        Map<String, String> map = new TreeMap();
        Class clazz = getClass();
        Field[] fields = clazz.getDeclaredFields();
        for(Field field : fields) {
            Method method = getGetMethod(field.getName());
            try {
                Object value = method.invoke(this);
                if(value != null)
                    map.put(field.getName(), value.toString());
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
        }

        return map;
    }

    public String toJsonString() {
        return JSON.toJSONString(this.getFieldsMap());
    }

    public String toUrlString() {
        StringBuilder stringBuilder = new StringBuilder();
        Map<String, String> map = this.getFieldsMap();
        for(Map.Entry entry : map.entrySet()) {
            //按照url的get方式拼接
            stringBuilder.append(entry.getKey());
            stringBuilder.append("=");
            stringBuilder.append(entry.getValue());
            stringBuilder.append("&");
        }

        if(stringBuilder.length() > 0) {
            //截取最后一位&字符
            stringBuilder.delete(stringBuilder.length() - 1, stringBuilder.length());

            //在首位添加?字符
            stringBuilder.insert(0, "?");
        }

        return stringBuilder.toString();
    }

    public String toXmlString() {
        StringBuilder stringBuilder = new StringBuilder();
        Map<String, String> map = this.getFieldsMap();
        for(Map.Entry entry : map.entrySet()) {
            stringBuilder.append("<");
            stringBuilder.append(entry.getKey());
            stringBuilder.append(">");

            stringBuilder.append("<![CDATA[");
            stringBuilder.append(entry.getValue());
            stringBuilder.append("]]>");

            stringBuilder.append("</");
            stringBuilder.append(entry.getKey());
            stringBuilder.append(">");
        }

        if(stringBuilder.length() > 0) {
            stringBuilder.insert(0, "<xml>");
            stringBuilder.append("</xml>");
        }

        return stringBuilder.toString();
    }
}
