package com.cms4j.base.util;

import com.cms4j.base.system.dictionary.service.DictionaryService;
import org.apache.commons.lang3.StringUtils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Description:
 * Created by zmj on 2017/6/15.
 */
public class DateUtil {
    public static Timestamp getCurrentTime() {
        return new Timestamp(System.currentTimeMillis());
    }

    public static Date getCurrentDate() {
        return new Date(System.currentTimeMillis());
    }

    /**
     * 按照yyyy-MM-dd HH:mm:ss的格式，日期转字符串
     * @param date
     * @return yyyy-MM-dd HH:mm:ss
     */
    public static String date2Str(Date date){
        return date2Str(date,"yyyy-MM-dd HH:mm:ss");
    }

    /**
     * 按照yyyy-MM-dd HH:mm:ss的格式，字符串转日期
     * @param date
     * @return
     */
    public static Date str2Date(String date){
        if(!(date.isEmpty())){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                return sdf.parse(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            return new Date();
        }else{
            return null;
        }
    }

    /**
     * 按照参数format的格式，字符串转日期
     * @param date,format
     * @return
     */
    public static Date str2Date(String date, String format){
        if(!(date.isEmpty())){
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            try {
                return sdf.parse(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            return new Date();
        }else{
            return null;
        }
    }

    /**
     * 按照参数format的格式，日期转字符串
     * @param date
     * @param format
     * @return
     */
    public static String date2Str(Date date,String format){
        if(date!=null){
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            return sdf.format(date);
        }else{
            return "";
        }
    }

    /**
     * 把时间根据时、分、秒转换为时间段
     * @param StrDate
     */
    public static String getTimes(String StrDate){
        String resultTimes = "";

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.util.Date now;

        try {
            now = new Date();
            java.util.Date date=df.parse(StrDate);
            long times = now.getTime()-date.getTime();
            long day  =  times/(24*60*60*1000);
            long hour = (times/(60*60*1000)-day*24);
            long min  = ((times/(60*1000))-day*24*60-hour*60);
            long sec  = (times/1000-day*24*60*60-hour*60*60-min*60);

            StringBuffer sb = new StringBuffer();
            //sb.append("发表于：");
            if(hour>0 ){
                sb.append(hour+"小时前");
            } else if(min>0){
                sb.append(min+"分钟前");
            } else{
                sb.append(sec+"秒前");
            }

            resultTimes = sb.toString();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return resultTimes;
    }

    /**
     *
     * @return 0-正在高考 >0距离高考天数
     */
    public static int getDaysDistanceExam() {
        Timestamp tCurrent = getCurrentTime();

        Date dCurrent = getCurrentDate();
        Calendar c = Calendar.getInstance();
        c.setTime(dCurrent);
        if(c.get(Calendar.MONTH) == 5 && (c.get(Calendar.DAY_OF_MONTH) == 7 || c.get(Calendar.DAY_OF_MONTH) == 8))
            return 0;

        int curYear = c.get(Calendar.YEAR);

        //高考时间为6月7日-6月8日
        c.set(Calendar.YEAR, curYear);
        c.set(Calendar.MONTH, 5);
        c.set(Calendar.DAY_OF_MONTH, 7);

        Calendar cCurrent = Calendar.getInstance();
        cCurrent.setTime(dCurrent);
        if(cCurrent.after(c)) {
            c.set(Calendar.YEAR, curYear + 1);
        }

        return (int) ((c.getTimeInMillis() - cCurrent.getTimeInMillis()) / (24*60*60*1000));
    }

    public static boolean canUpdateExam(DataMap examinee) {
        if(examinee == null) return true;
        if(StringUtils.isBlank(examinee.getString("CREATEDATE")) && StringUtils.isBlank(examinee.getString("MODIFYDATE")))
            return true;

        Date current = getCurrentDate();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(current);
        calendar.set(Calendar.MONTH, 5);
        calendar.set(Calendar.DAY_OF_MONTH, 23);
        calendar.set(Calendar.HOUR, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date areaBefore = calendar.getTime();

        calendar.set(Calendar.MONTH, 8);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        Date areaAfter = calendar.getTime();
        if(current.after(areaBefore) && current.before(areaAfter)){
            Date curDate = null;
            if(!StringUtils.isBlank(examinee.getString("MODIFYDATE")))
                curDate = (Date) examinee.get("MODIFYDATE");
            else if(!StringUtils.isBlank(examinee.getString("CREATEDATE")))
                curDate = (Date) examinee.get("CREATEDATE");
            else
                return false;

            if(curDate.after(areaBefore) && curDate.before(areaAfter))
                return false;
            else
                return true;
        }
        else
            return true;
    }

    /**
     * 根据输入过去的年数获取年内码
     * @param dictionaryService
     * @param num 年数
     * @return
     */
    public static String getLastYearByAdoptNumber(DictionaryService dictionaryService, Integer num) throws Exception {
        Date current = getCurrentDate();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(current);
        calendar.set(Calendar.MONTH, 5);
        calendar.set(Calendar.DAY_OF_MONTH, 23);
        calendar.set(Calendar.HOUR, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date dateLine = calendar.getTime();//截止时间点

        Calendar currentTmp = Calendar.getInstance();
        if(current.before(dateLine)) {
            //当前时间早于6月23日
            return getLastYear(dictionaryService, num + 1);
        }
        else{
            //当前时间晚于6月23日
            return getLastYear(dictionaryService, num);
        }
    }

    public static String getLastYear(DictionaryService dictionaryService, Integer number) throws Exception {
        Calendar current = Calendar.getInstance();
        String lastYear = String.valueOf(current.get(Calendar.YEAR) - number);
        DataMap YEAR = new DataMap();
        YEAR.put("CODE", "YEAR");
        YEAR = dictionaryService.getDictionaryByCode(YEAR);
        List<DataMap> YEARs = dictionaryService.getDictionariesByFatherId(YEAR);
        for(DataMap YEARTmp : YEARs) {
            if(YEARTmp.getString("NAME").equals(lastYear)){
                return YEARTmp.getString("DIC_ID");
            }
        }

        return "";
    }
}
