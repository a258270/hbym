package com.cms4j.base.util;

import java.util.Date;
import java.util.UUID;

/**
 * description: 获取短位uuid
 *
 * @author: zmj
 * @create: 2017/5/31
 */
public class ShortUUID {
    public static String randomUUID() {
        return toShortString(UUID.randomUUID());
    }

    private static String toShortString(UUID u) {
        return UUIDtoString(u);
    }


    //生成唯一订单号   专用方法orderUUID  32位
    public static  String orderUUID(){
        //保证订单号 唯一
        String date = DateUtil.date2Str(new Date(), "yyMMddHHmmss");
        StringBuilder sb = new StringBuilder(date);
        String uuid = ShortUUID.randomUUID();
        //统一转化成大写字母，保证是订单长度统一  32 位
        String UpUuid = uuid.toUpperCase();
        char[] chars = UpUuid.toCharArray();
        for(int m :chars){sb.append(m);}
        return  sb.toString() ;
    };



    private static String UUIDtoString(UUID u) {
        long mostSigBits = u.getMostSignificantBits();
        long leastSigBits = u.getLeastSignificantBits();
        return digits(mostSigBits >> 32, 8) + digits(mostSigBits >> 16, 4) + digits(mostSigBits, 4) + digits(leastSigBits >> 48, 4) + digits(leastSigBits, 12);
    }

    private static String digits(long val, int digits) {
        long hi = 1L << digits * 2;
        return Long.toString(hi | val & hi - 1L, 36).substring(1);
    }
}
