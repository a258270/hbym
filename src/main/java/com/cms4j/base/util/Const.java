package com.cms4j.base.util;

/**
 * description:
 *
 * @author: zmj
 * @create: 2017/5/30
 */
public class Const {
    public static final String LOGIN = "/login";//登录页面路径
    public static final String REG_NOTERCEPTOR_URL = ".*/((login)|(logout)|(tologin)|(getcode)|(404)|(401)|(500)|(kindfile)|(getsmscode)|(wxrecharge)|(guide)).*";//logininterceptor不拦截url规则
    public static final String REG_MANAGE_URL = ".*/((admin)).*";
    public static final String REG_PLANT_URL = ".*/((plant)).*";//平台路径
    public static final String REG_PLANT_TERCEPTOR_URL = ".*/((tocomplete)|(upload)|(center)).*";//平台需拦截路径
    public static final String REG_WECHAT_URL = ".*/((wechat)).*";//微信端url
    public static final String REG_WECHAT_NOTERCEPTOR_URL = ".*/((login)|(complete)|(relation)|(toregist)|(news)|(school)|(major)|(dictionary)).*";//微信端无需拦截url
    public static final String PROFILE_DEV = "dev";//开发环境
    public static final String PROFILE_PRO = "pro";//生产环境

    public static final String SUADMIN = "suadmin";//超级管理员

    public static final String NOLOGIN_CODE = "-1";//用户没有登陆的状态码
    public static final String NOPLANTUSER_CODE = "-2";//微信用户没有绑定平台账户的状态码
}
