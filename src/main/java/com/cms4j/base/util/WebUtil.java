package com.cms4j.base.util;

import javax.servlet.http.HttpServletRequest;

public class WebUtil {

    public static boolean isAjax(HttpServletRequest request) {
        return request.getHeader("X-Requested-With") != null  && "XMLHttpRequest".equals( request.getHeader("X-Requested-With").toString());
    }
}
