package com.cms4j.plant.util;

/**
 * description:
 *
 * @author: zmj
 * @create: 2017/6/28
 */
public class PlantConst {

    public static final String ROLE_STUDENT = "sja4gc59bg";//学生
    public static final String ROLE_TEACHER = "m9bxdt9g36";//教师
    public static final String ROLE_EXPERT = "wophbzohkh";//专家

    public static final String ARRANGMENT_B1 = "hjj4e5vr0c";//本一
    public static final String ARRANGMENT_B2 = "bdhsl11qtb";//本二
    public static final String ARRANGMENT_B3 = "sq6ldxwuf1";//本三
    public static final String ARRANGMENT_Z1 = "8sqm1urq5w";//专科

    public static final String STATIC_IMG_NONE = "/static/ymplant/img/timg.png";
    public static final String STATIC_IMG_NOHEAD = "/static/ymplant/img/nohead.png";
    public static final String NEWSTYPE_XXHD = "23wtostpu8";//线下活动
    public static final String NEWSTYPE_GKDT = "opsmpn8psb";//高考动态
    public static final String NEWSTYPE_GG = "1es852a5gv";//公告
    public static final String NEWSTYPE_XWZX = "ivhvfswoqb";//新闻资讯
    public static final String NEWSTYPE_WJHD = "x8jfplc17d";//往届活动
    public static final String NEWSTYPE_RDXW = "scrp4btrv5";//热点新闻
    public static final String NEWSTYPE_JXSP = "621yynn9i8";//精选视频

    public static final String ITEMTYPE_HYK = "pbeq48e7ai";//会员卡
    public static final String ITEMTYPE_CZK = "80k65sf14b";//充值卡
    public static final String ITEMTYPE_ZXK = "rs4cu5jnkv";//院校咨询卡
    public static final String ITEMTYPE_ZJK = "wd94ptzvcy";//专家资讯卡
    public static final String ITEMTYPE_MNTBK = "itdis0m28e";//模拟填报卡
    public static final String ITEMTYPE_ZNTJK = "rkups02m6o";//智能推荐卡
    //ls:需求增加-->性格测试卡
    //ls：性格测试卡 分为 A/B卡
    public static final String ITEMTYPE_XGCSKA ="1qhdv6udj4";//性格测试A卡
    public static final  String ITEMTYPE_XGCSKB ="aavwpmo1t2";//性格测试B卡

    //12、28ls: 增加 -->改分卡
    public static final String ITEMTYPE_GFK = "71n37af5e5";//改分卡
    //ls:增加系列 定额金币消费 参数
    //单 购卡种 卡次  类比淘宝购物
    public  static  final int PRICE_MNTBK = 10;// 单张模拟填报卡 价值 10 个金币  （折合1元人民币）
    public  static  final int PRICE_ZNTJK = 10;// 单张智能推荐卡 价值 10 个金币  （折合1元人民币）
    public  static  final int PRICE_YXZXK = 5 ;// 单张院校咨询卡 价值 5 个金币   （折合0.5元人民币）
    public  static  final int PRICE_XGCSKA = 50;//单张性格测试A卡  价值50个金币  （折合5元人民币）
    public  static  final int PRICE_XGCSKB = 100;//单张性格测试B卡  价值100个金币  （折合10元人民币）


    public static final String URL_NOLOGIN = "redirect:/plant/index";

    public static final String MAJOR_BK = "BMAJOR";//本科专业
    public static final String MAJOR_ZK = "ZMAJOR";//专科专业

    public static final String MAJORTYPE_W = "gjv044girc";//专业类型  文科
    public static final String MAJORTYPE_L = "r6j4mh69be";//专业类型  理科

    public static final String MBTI_TYPE_PRO = "1tt3euq8ij";//专业版
    public static final String MBTI_TYPE_SIMPLE = "g57h70o2c8";//简易版

    public enum RECHARGE_STATE {
        UNPAID, PAID
    }
}
