package com.cms4j.helper.util;

import com.cms4j.helper.entity.pay.PrePay;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.regex.Pattern;

public class PrePayUtil {
    public static final String UNIFIEDORDER_SUCCESS = "SUCCESS";
    public static final String UNIFIEDORDER_FAIL = "FAIL";

    public static PrePay parsePrePay(String xmlStr) throws DocumentException, NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        return new PrePay(xmlStr);
    }
}
