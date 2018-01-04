package com.cms4j.helper.entity;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.tree.DefaultText;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

public abstract class XmlEntity extends Entity {

    @Override
    public String toString() {
        return toXmlString();
    }

    public XmlEntity() {
    }

    public XmlEntity(String xmlStr) throws DocumentException, NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        System.out.println(xmlStr);
        Class clazz = this.getClass();
        Field[] fields = clazz.getDeclaredFields();
        Document document = DocumentHelper.parseText(xmlStr);
        Element rootElement = document.getRootElement();
        List<Element> contents = rootElement.content();
        for(Element element : contents) {
            String key = element.getName();//返回结果的key
            String value = element.getStringValue();//返回结果的value
            for(Field field : fields) {
                if(field.getName().equals(key)) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("set");
                    sb.append(field.getName().substring(0, 1).toUpperCase());
                    sb.append(field.getName().substring(1, field.getName().length()));
                    String methodName = sb.toString();

                    Method method = clazz.getMethod(methodName, String.class);
                    method.invoke(this, value);
                    break;
                }
            }
        }
    }
}
