package com.cms4j.helper.entity;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

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

    public Map<String, String> getFieldsMap() {
        Map<String, String> map = new HashMap<String, String>();
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
}
