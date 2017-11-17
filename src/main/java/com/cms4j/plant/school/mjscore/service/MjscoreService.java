package com.cms4j.plant.school.mjscore.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.base.util.ShortUUID;
import com.cms4j.plant.user.service.ExamineeService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

@Service
public class MjscoreService {
    @Autowired
    private DaoSupport daoSupport;

    @Autowired
    private ExamineeService examineeService;

    @Autowired
    private DictionaryService dictionaryService;

    public List<DataMap> getMjscoresByScId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("MjscoreMapper.getMjscoresByScId", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addMjscores(DataMap dataMap) throws Exception {
        this.removeMjscoresByScId(dataMap);
        Integer count = Integer.valueOf(dataMap.getString("COUNTS"));
        for(int i = 0; i < count; i++){
            String major = dataMap.getString("MAJOR" + i);
            if(StringUtils.isBlank(major))
                continue;
            String year = dataMap.getString("YEAR" + i);
            if(StringUtils.isBlank(year))
                continue;
            String arrangment = dataMap.getString("ARRANGMENT" + i);
            if(StringUtils.isBlank(arrangment))
                continue;
            String majortype = dataMap.getString("MAJORTYPE" + i);
            if(StringUtils.isBlank(majortype))
                continue;
            String maxscore = dataMap.getString("MAXSCORE" + i);
            if(StringUtils.isBlank(maxscore))
                maxscore = "0";
            String minscore = dataMap.getString("MINSCORE" + i);
            if(StringUtils.isBlank(minscore))
                minscore = "0";
            String entercount = dataMap.getString("ENTERCOUNT" + i);
            if(StringUtils.isBlank(entercount))
                entercount = "0";

            DataMap mjscore = new DataMap();
            mjscore.put("MJSCORE_ID", ShortUUID.randomUUID());
            mjscore.put("MAJOR_ID", major);
            mjscore.put("SCHOOL_ID", dataMap.getString("SCHOOL_ID"));
            mjscore.put("YEAR_ID", year);
            mjscore.put("ARRANGMENT_ID", arrangment);
            mjscore.put("MAJORTYPE_ID", majortype);
            mjscore.put("MAXSCORE", maxscore);
            mjscore.put("MINSCORE", minscore);
            mjscore.put("ENTERCOUNT", entercount);
            mjscore.put("MSORT", i);
            this.addMjscore(mjscore);
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public void removeMjscoresByScId(DataMap dataMap) throws Exception {
        daoSupport.delete("MjscoreMapper.removeMjscoresByScId", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addMjscore(DataMap dataMap) throws Exception {
        daoSupport.save("MjscoreMapper.addMjscore", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void removeMjscore(DataMap dataMap) throws Exception {
        daoSupport.delete("MjscoreMapper.removeMjscore", dataMap);
    }

    public List<DataMap> getMjscores(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("MjscoreMapper.getMjscores", dataMap);
    }

    public List<DataMap> getMjscoresChong(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("MjscoreMapper.getMjscoresChong", dataMap);
    }

    public List<DataMap> getMjscoresWen(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("MjscoreMapper.getMjscoresWen", dataMap);
    }

    public List<DataMap> getMjscoresBao(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("MjscoreMapper.getMjscoresBao", dataMap);
    }

    public List<DataMap> getMjscoresDian(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("MjscoreMapper.getMjscoresDian", dataMap);
    }

    public List<DataMap> getMjscoreBySchool(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("MjscoreMapper.getMjscoreBySchool", dataMap);
    }

    public List<DataMap> getTbInfo(DataMap dataMap) throws Exception {
        List<DataMap> listOut = new ArrayList<>();
        Double score = Double.valueOf(dataMap.getString("score"));
        Integer iFlag = Integer.valueOf(dataMap.getString("flag"));
        iFlag = iFlag * 5 + 1;
        for(int i = 1; i < iFlag; i++){
            String s_key = "school" + i;
            String zy_key = "zye" + i;

            if(StringUtils.isBlank(dataMap.getString(s_key)) || StringUtils.isBlank(dataMap.getString(zy_key))){
                continue;
            }

            DataMap params = new DataMap();
            params.put("SCHOOL_ID", dataMap.getString(s_key));
            params.put("MAJOR_ID", dataMap.getString(zy_key));
            params.put("MAJORTYPE_ID", dataMap.getString("MAJORTYPE_ID"));
            /*Calendar a = Calendar.getInstance();
            String lastYear = String.valueOf(a.get(Calendar.YEAR) - 1);
            *//*DataMap YEAR = new DataMap();
            YEAR.put("CODE", "YEAR");
            YEAR = dictionaryService.getDictionaryByCode(YEAR);
            List<DataMap> YEARs = dictionaryService.getDictionariesByFatherId(YEAR);
            for(DataMap YEARTmp : YEARs) {
                if(YEARTmp.getString("NAME").equals(lastYear)){
                    params.put("YEAR_ID", YEARTmp.getString("DIC_ID"));
                }
            }*/
            params.put("YEAR_ID", dataMap.getString("YEAR_ID"));
            List<DataMap> mjscores = this.getMjscoreBySchool(params);

            if(mjscores != null) {
                for(DataMap mjscore: mjscores) {
                    Double minscore = Double.valueOf(mjscore.getString("MINSCORE"));
                    if(minscore > score + 2) {
                        mjscore.put("level", "冲");
                        mjscore.put("chance", "10%");
                    }
                    else if((minscore >= score + 1) && score + 2 >= minscore){
                        mjscore.put("level", "冲");
                        mjscore.put("chance", "30%");
                    }
                    else if((minscore <= score) && (minscore >= score - 1)){
                        mjscore.put("level", "稳");
                        mjscore.put("chance", "50%");
                    }
                    else if((minscore <= score - 1) && (minscore >= score - 2)){
                        mjscore.put("level", "保");
                        mjscore.put("chance", "70%");
                    }
                    else if((minscore <= score - 2) && (minscore >= score - 5)){
                        mjscore.put("level", "垫");
                        mjscore.put("chance", "90%");
                    }
                    else if(minscore <= score - 5) {
                        mjscore.put("level", "垫");
                        mjscore.put("chance", "90%");
                    }

                    boolean flag = false;
                    for(DataMap listOutObj: listOut) {
                        if(listOutObj.getString("SCHOOL_ID").equals(mjscore.getString("SCHOOL_ID")) && listOutObj.getString("MAJOR_ID").equals(mjscore.getString("MAJOR_ID"))) {flag = true;break;}
                    }

                    if(!flag){
                        List<DataMap> scores = this.getMjscoreBySchoolAndMajor(mjscore);
                        if(scores == null) scores = new ArrayList<>();
                        mjscore.put("scores", scores);
                        listOut.add(mjscore);
                    }

                }
            }
        }

        return listOut;
    }

    public List<DataMap> getMjscoreBySchoolAndMajor(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("MjscoreMapper.getMjscoreBySchoolAndMajor", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void batchRemoves(String objs) throws Exception {
        String[] objArr = objs.split(",");
        List<String> objList = Arrays.asList(objArr);
        daoSupport.batchDelete("MjscoreMapper.batchRemoves", objList);
    }
}
