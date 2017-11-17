package com.cms4j.plant.report.service;

import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.plant.stucount.service.StucountService;
import com.cms4j.plant.util.PlantConst;
import com.cms4j.plant.yf.yf.service.YfService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.List;

@Service
public class ReportService {
    @Autowired
    private YfService yfService;
    @Autowired
    private DictionaryService dictionaryService;
    @Autowired
    private StucountService stucountService;
    @Autowired
    private ScorelineService scorelineService;

    public DataMap getScore(Double score, String majortype_id) throws Exception {
        DataMap info = new DataMap();
        getPlace(score, majortype_id, info);

        info.put("MAJORTYPE_ID", majortype_id);
        if(StringUtils.isBlank(info.getString("place"))) {
            info.put("chongMax", 0);
            info.put("chongMin", 0);
            info.put("wenMax", 0);
            info.put("wenMin", 0);
            info.put("baoMax", 0);
            info.put("baoMin", 0);
            info.put("dianMax", 0);
            info.put("dianMin", 0);
            return info;
        }
        Integer place = Double.valueOf(info.getString("place")).intValue();
        if(place.equals(0)) {
            info.put("chongMax", 750);
            info.put("chongMin", 750);
            info.put("wenMax", 750);
            info.put("wenMin", 750);
            info.put("baoMax", 750);
            info.put("baoMin", 750);
            info.put("dianMax", 750);
            info.put("dianMin", 750);
            return info;
        }
        info.put("curScore", getScoreByPlace(yfService.getYfs(info), place));
        Integer chongMax = 0;
        Integer chongMin = 0;
        Integer wenMax = 0;
        Integer wenMin = 0;
        Integer baoMax = 0;
        Integer baoMin = 0;
        Integer dianMax = 0;
        Integer dianMin = 0;
        if(!StringUtils.isBlank(info.getString("ARRANGMENT_ID"))) {
            if(PlantConst.MAJORTYPE_W.equals(majortype_id)) {
                if(PlantConst.ARRANGMENT_B1.equals(info.getString("ARRANGMENT_ID"))) {
                    //冲 减1000 至 减200
                    chongMax = place - 3200;
                    chongMin = place - 800;

                    //稳 减200 至 减0
                    wenMax = place - 800;
                    wenMin = place + 0;

                    //保 减0 至 加200
                    baoMax = place - 0;
                    baoMin = place + 800;

                    //垫 加200 至 加500
                    dianMax = place + 800;
                    dianMin = place + 1600;
                }

                if(PlantConst.ARRANGMENT_B2.equals(info.getString("ARRANGMENT_ID"))) {

                    //冲 减1000 至 减200
                    chongMax = place - 4800;
                    chongMin = place - 1200;

                    //稳 减200 至 减0
                    wenMax = place - 1200;
                    wenMin = place - 0;

                    //保 减0 至 加200
                    baoMax = place - 0;
                    baoMin = place + 1200;

                    //垫 加200 至 加500
                    dianMax = place + 1200;
                    dianMin = place + 2400;
                }

                if(PlantConst.ARRANGMENT_B3.equals(info.getString("ARRANGMENT_ID"))) {
                    //冲 减1000 至 减200
                    chongMax = place - 4800;
                    chongMin = place - 1200;

                    //稳 减200 至 减0
                    wenMax = place - 1200;
                    wenMin = place - 0;

                    //保 减0 至 加200
                    baoMax = place - 0;
                    baoMin = place + 1200;

                    //垫 加200 至 加500
                    dianMax = place + 1200;
                    dianMin = place + 2400;
                }
            }

            if(PlantConst.MAJORTYPE_L.equals(majortype_id)) {
                if(PlantConst.ARRANGMENT_B1.equals(info.getString("ARRANGMENT_ID"))) {
                    //冲 减1000 至 减200
                    chongMax = place - 8000;
                    chongMin = place - 2000;

                    //稳 减200 至 减0
                    wenMax = place - 2000;
                    wenMin = place - 0;

                    //保 减0 至 加200
                    baoMax = place - 0;
                    baoMin = place + 2000;

                    //垫 加200 至 加500
                    dianMax = place + 2000;
                    dianMin = place + 4000;
                }

                if(PlantConst.ARRANGMENT_B2.equals(info.getString("ARRANGMENT_ID"))) {
                    //冲 减1000 至 减200
                    chongMax = place - 14000;
                    chongMin = place - 2800;

                    //稳 减200 至 减0
                    wenMax = place - 2800;
                    wenMin = place - 0;

                    //保 减0 至 加200
                    baoMax = place - 0;
                    baoMin = place + 2800;

                    //垫 加200 至 加500
                    dianMax = place + 2800;
                    dianMin = place + 7000;
                }

                if(PlantConst.ARRANGMENT_B3.equals(info.getString("ARRANGMENT_ID"))) {
                    //冲 减1000 至 减200
                    chongMax = place - 14000;
                    chongMin = place - 2800;

                    //稳 减200 至 减0
                    wenMax = place - 2800;
                    wenMin = place - 0;

                    //保 减0 至 加200
                    baoMax = place - 0;
                    baoMin = place + 2800;

                    //垫 加200 至 加500
                    dianMax = place + 2800;
                    dianMin = place + 7000;
                }
            }
        }

        Double getScored = getScoreByPlace(yfService.getYfs(info), chongMax);
        if(!getScored.equals(Double.valueOf(-2)) && !getScored.equals(Double.valueOf(-1)))
            info.put("chongMax", getScored);

        getScored = getScoreByPlace(yfService.getYfs(info), chongMin);
        if(!getScored.equals(Double.valueOf(-2)) && !getScored.equals(Double.valueOf(-1)))
            info.put("chongMin", getScored);

        getScored = getScoreByPlace(yfService.getYfs(info), wenMax);
        if(!getScored.equals(Double.valueOf(-2)) && !getScored.equals(Double.valueOf(-1)))
            info.put("wenMax", getScored);

        getScored = getScoreByPlace(yfService.getYfs(info), wenMin);
        if(!getScored.equals(Double.valueOf(-2)) && !getScored.equals(Double.valueOf(-1)))
            info.put("wenMin", getScored);

        getScored = getScoreByPlace(yfService.getYfs(info), baoMax);
        if(!getScored.equals(Double.valueOf(-2)) && !getScored.equals(Double.valueOf(-1)))
            info.put("baoMax", getScored);

        getScored = getScoreByPlace(yfService.getYfs(info), baoMin);
        if(!getScored.equals(Double.valueOf(-2)) && !getScored.equals(Double.valueOf(-1)))
            info.put("baoMin", getScored);

        getScored = getScoreByPlace(yfService.getYfs(info), dianMax);
        if(!getScored.equals(Double.valueOf(-2)) && !getScored.equals(Double.valueOf(-1)))
            info.put("dianMax", getScored);

        getScored = getScoreByPlace(yfService.getYfs(info), dianMin);
        if(!getScored.equals(Double.valueOf(-2)) && !getScored.equals(Double.valueOf(-1)))
            info.put("dianMin", getScored);

        return info;
    }

    /**
     * 根据公式算出去年名次
     * @param score
     * @param majortype_id
     * @return -2无查询结果 -1为今年最低分 0位今年最高分
     * @throws Exception
     */
    private void getPlace(Double score, String majortype_id, DataMap info) throws Exception {
        score = Double.valueOf(score.intValue());
        Calendar a = Calendar.getInstance();
        String year = String.valueOf(a.get(Calendar.YEAR));
        String lastYear = String.valueOf(a.get(Calendar.YEAR) - 1);
        String last2Year = String.valueOf(a.get(Calendar.YEAR) - 2);
        DataMap YEAR = new DataMap();
        YEAR.put("CODE", "YEAR");
        YEAR = dictionaryService.getDictionaryByCode(YEAR);
        List<DataMap> YEARs = dictionaryService.getDictionariesByFatherId(YEAR);
        DataMap dataMap = new DataMap();
        DataMap lastDataMap = new DataMap();
        DataMap last2DataMap = new DataMap();
        for(DataMap YEARTmp : YEARs) {
            if(YEARTmp.getString("NAME").equals(lastYear)){
                lastDataMap.put("YEAR_ID", YEARTmp.getString("DIC_ID"));
            }

            if(YEARTmp.getString("NAME").equals(year)){
                dataMap.put("YEAR_ID", YEARTmp.getString("DIC_ID"));
            }

            if(YEARTmp.getString("NAME").equals(last2Year)) {
                last2DataMap.put("YEAR_ID", YEARTmp.getString("DIC_ID"));
            }
        }

        dataMap.put("MAJORTYPE_ID", majortype_id);
        lastDataMap.put("MAJORTYPE_ID", majortype_id);
        last2DataMap.put("MAJORTYPE_ID", majortype_id);

        DataMap curYearMap = dataMap;
        DataMap lastYearMap = lastDataMap;

        DataMap curStucountData = stucountService.getStuCountByYear(curYearMap);
        DataMap lastStucountData = stucountService.getStuCountByYear(lastYearMap);
        if(curStucountData == null) {//没有当年一分一档
            curYearMap = lastDataMap;//所有数据往前推1年
            lastYearMap = last2DataMap;
            curStucountData = stucountService.getStuCountByYear(curYearMap);
            lastStucountData = stucountService.getStuCountByYear(lastYearMap);
        }

        info.put("YEAR_ID", lastYearMap.getString("YEAR_ID"));

        //当年总人数
        Integer curStucount = Integer.valueOf(curStucountData.getString("STUCOUNT"));
        //去年总人数
        Integer lastStuCount = Integer.valueOf(lastStucountData.getString("STUCOUNT"));

        List<DataMap> lastYfs = yfService.getYfs(lastYearMap);
        List<DataMap> yfs = yfService.getYfs(curYearMap);

        //按照今年分数划分批次
        List<DataMap> curScorelines = scorelineService.getScorelineByYear(curYearMap);
        List<DataMap> lastScorelines = scorelineService.getScorelineByYear(lastYearMap);

        String curArrangment = "";
        if(curArrangment.isEmpty()) {
            for(DataMap scoreline : curScorelines) {
                if(PlantConst.ARRANGMENT_B1.equals(scoreline.getString("ARRANGMENT_ID"))) {
                    if(score >= Double.valueOf(scoreline.getString("SCORE"))) {
                        curArrangment = scoreline.getString("ARRANGMENT_ID");
                        break;
                    }
                }
            }
        }

        if(curArrangment.isEmpty()) {
            for(DataMap scoreline : curScorelines) {
                if(PlantConst.ARRANGMENT_B2.equals(scoreline.getString("ARRANGMENT_ID"))) {
                    if(score >= Double.valueOf(scoreline.getString("SCORE"))) {
                        curArrangment = scoreline.getString("ARRANGMENT_ID");
                        break;
                    }
                }
            }
        }

        if(curArrangment.isEmpty()) {
            for(DataMap scoreline : curScorelines) {
                if(PlantConst.ARRANGMENT_B3.equals(scoreline.getString("ARRANGMENT_ID"))) {
                    if(score >= Double.valueOf(scoreline.getString("SCORE"))) {
                        curArrangment = scoreline.getString("ARRANGMENT_ID");
                        break;
                    }
                }
            }
        }

        //curArrangment为今年考生批次
        info.put("ARRANGMENT_ID", curArrangment);

        //按照批次选取公式
        if(curArrangment.equals(PlantConst.ARRANGMENT_B1) || curArrangment.equals(PlantConst.ARRANGMENT_B3) || curArrangment.equals(PlantConst.ARRANGMENT_B2)) {
            Double curPlace = getPlaceByScore(yfs, score);//当年成绩排名
            Double lastPlace = getPlaceByScore(lastYfs, score);//当年成绩在去年的排名
            if(curPlace.equals(0)) {
                info.put("place", 0);
            }

            if(!curPlace.equals(Double.valueOf(-2)) && !lastPlace.equals(Double.valueOf(-2)) && !curPlace.equals(Double.valueOf(-1)) && !lastPlace.equals(Double.valueOf(-1)))
                info.put("place", (curPlace - (curPlace * ((curPlace - lastPlace) / curStucount))));
        }

        /*if(curArrangment.equals(PlantConst.ARRANGMENT_B2)) {
            Double curPlace = getPlaceByScore(yfs, score);//当年成绩排名
            if(!curPlace.equals(-2)){
                Double lastScoreline = 0d;
                Double curScoreline = 0d;
                for(DataMap scoreline : lastScorelines) {
                    if(PlantConst.ARRANGMENT_B2.equals(scoreline.getString("ARRANGMENT_ID"))) {
                        lastScoreline = Double.valueOf(scoreline.getString("SCORE"));
                        break;
                    }
                }
                for(DataMap scoreline : curScorelines) {
                    if(PlantConst.ARRANGMENT_B2.equals(scoreline.getString("ARRANGMENT_ID"))) {
                        curScoreline = Double.valueOf(scoreline.getString("SCORE"));
                        break;
                    }
                }

                if(!lastScoreline.equals(0d) && !curScoreline.equals(0d)) {
                    Double curB2Place = getPlaceByScore(yfs, curScoreline);//当年本二排名
                    Double lastB2Place = getPlaceByScore(lastYfs, lastScoreline);//去年本一排名

                    if(!curB2Place.equals(Double.valueOf(-2)) && !lastB2Place.equals(Double.valueOf(-2)) && !curB2Place.equals(Double.valueOf(-1)) && !lastB2Place.equals(Double.valueOf(-1)))
                        info.put("place", (curPlace * lastB2Place / curB2Place));
                }
            }

        }*/
    }

    /**
     * 根据分数查名次
     * @param yfs 一分一档表
     * @param score 分数
     * @return -2无查询结果 -1为今年最低分 0位今年最高分
     */
    public Double getPlaceByScore(List<DataMap> yfs, Double score) {
        if(yfs == null || score == null) Double.valueOf(-2);
        try{
            if(score > Double.valueOf(yfs.get(0).getString("SCORE"))) {
                return Double.valueOf(0);
            }
            for(int i = 0; i < yfs.size(); i++) {
                DataMap yf = yfs.get(i);
                DataMap yfAfter = yfs.get(i + 1);
                if(Double.valueOf(yf.getString("SCORE")).equals(score))
                    return Double.valueOf(yf.getString("TOTALCOUNT"));

                if(i < yfs.size() - 1) {
                    if(Double.valueOf(yf.getString("SCORE")) > score && score >= Double.valueOf(yfAfter.getString("SCORE"))) {
                        return Double.valueOf(yfAfter.getString("TOTALCOUNT"));
                    }
                }
            }
            return Double.valueOf(-1);
        }
        catch(Exception e) {

        }
        return Double.valueOf(-2);
    }

    /**
     * 根据名次查分数
     * @param yfs 一分一档表
     * @param place 名次
     * @return -2无查询结果 -1为今年最低分 750为今年最高分
     */
    public Double getScoreByPlace(List<DataMap> yfs, Integer place) {
        if(yfs == null || place == null) Double.valueOf(-2);
        try{
            if(place < Integer.valueOf(yfs.get(0).getString("TOTALCOUNT"))) {
                return Double.valueOf(yfs.get(0).getString("SCORE"));
            }
            for(int i = 0; i < yfs.size(); i++) {
                DataMap yf = yfs.get(i);
                DataMap yfAfter = yfs.get(i + 1);
                if(Integer.valueOf(yf.getString("TOTALCOUNT")).equals(place))
                    return Double.valueOf(yf.getString("SCORE"));
                if(i < yfs.size() - 1) {
                    if(Integer.valueOf(yf.getString("TOTALCOUNT")) < place && place <= Integer.valueOf(yfAfter.getString("TOTALCOUNT"))) {
                        return Double.valueOf(yfAfter.getString("SCORE"));
                    }
                }
            }

            return Double.valueOf(-1);
        }
        catch(Exception e) {

        }
        return Double.valueOf(-2);
    }
}
