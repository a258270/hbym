package com.cms4j.helper.entity;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class Entity {

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
}
