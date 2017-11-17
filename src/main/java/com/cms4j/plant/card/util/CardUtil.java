package com.cms4j.plant.card.util;

import java.util.ArrayList;
import java.util.List;

public class CardUtil {

    public static String CARD_TYPE_VIP_G1 = "CA";
    public static String CARD_TYPE_VIP_G2 = "CB";
    public static String CARD_TYPE_VIP_G3 = "CC";

    public static String CARD_PURPOSE_VIP = "UA";

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
