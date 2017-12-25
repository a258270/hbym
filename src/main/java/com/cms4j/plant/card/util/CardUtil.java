package com.cms4j.plant.card.util;

import java.util.ArrayList;
import java.util.List;

public class CardUtil {

    public static String CARD_TYPE_VIP_G1 = "CA";
    public static String CARD_TYPE_VIP_G2 = "CB";
    public static String CARD_TYPE_VIP_G3 = "CC";
    //UA代表是 截取激活码的字段 白银会员
    public static String CARD_PURPOSE_VIP = "UA";
    //ls:加入CARD_PURPOSE_VIP2与CARD_PURPOSE_VIP3分别 代表 黄金 与 钻石  截取激活码的字段
    public static  String CARD_PURPOSE_VIP2 = "UB";
    public static  String CARD_PURPOSE_VIP3 = "UC";

    /**
     * 卡号是36进制递增
     * @param maxCode
     * @return
     */
    public static String getMaxPlusCode(String maxCode) {
        Long l = Long.valueOf(maxCode.toLowerCase(), 36);//36进制转10进制
        l++;
        String code = Long.toString(l, 36);
        if(code.length() < 6) {
            while(code.length() < 6){
                code = "0" + code;
            }
        }

        return code.toUpperCase();
    }

    public static List<String> getMaxPlusCode(String maxCode, Integer count) {
        List<String> outList = new ArrayList<String>();
        while(count > 0) {
            String code = getMaxPlusCode(maxCode);
            outList.add(code);
            maxCode = code;
            count--;
        }

        return outList;
    }
}
