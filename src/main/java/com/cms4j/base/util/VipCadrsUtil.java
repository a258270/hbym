package com.cms4j.base.util;
//ls:设计vip种类  方便处理后台扣卡逻辑
//设计原则：判定学生的会员具体身份：白户（普通会员）/CC UA(白银)/CC UB（黄金）/CC UC（黑钻）
//工具类暂时 不使用
public class VipCadrsUtil {
    public  static  boolean  IsCCUA(DataMap curtUser) {
        String cc = curtUser.getString("CARD_TYPE");
        String UU = curtUser.getString("CARD_PUOPSE");
        //ls:"CC"代表学生身份
        if (cc=="CC" && UU=="UC"){
            return true;
        }else {
            return  false;
        }
    }
    }