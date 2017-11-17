package com.cms4j.plant.school.scscore.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.Page;
import com.cms4j.base.util.ShortUUID;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cms4j.base.util.DateUtil;

import javax.print.DocFlavor;
import java.util.Arrays;
import java.util.List;

/**
* Description: ScscoreService
* Created by zmj on 2017/08/03.
*/
@Service
public class ScscoreService {

    @Autowired
    private DaoSupport daoSupport;

    /**
    * 根据SCSCORE_ID获取数据
    * @param dataMap
    * @return
    * @throws Exception
    */
    public DataMap getScscoreById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ScscoreMapper.getScscoreById", dataMap);
    }

    /**
     * 根据SCHOOL_ID获取数据
     * @param dataMap
     * @return
     * @throws Exception
     */
    public List<DataMap> getScscoresByScId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ScscoreMapper.getScscoresByScId", dataMap);
    }

    /**
    * 获取院校录取分分页数据
    * @param page
    * @return
    * @throws Exception
    */
    public List<DataMap> getScscores(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ScscoreMapper.getScscores", page);
    }

    /**
    * 批量删除院校录取分
    * @param objs
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void batchRemoves(String objs) throws Exception {
        String[] objArr = objs.split(",");
        List<String> objList = Arrays.asList(objArr);
        daoSupport.batchDelete("ScscoreMapper.batchRemoves", objList);
    }

    @Transactional(rollbackFor = Exception.class)
    public void removeScscoresByScId(DataMap dataMap) throws Exception {
        daoSupport.delete("ScscoreMapper.removeScscoresByScId", dataMap);
    }

    /**
    * 新增院校录取分
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void addScscores(DataMap dataMap) throws Exception {
        this.removeScscoresByScId(dataMap);
        Integer count = Integer.valueOf(dataMap.getString("COUNTS"));
        for(int i = 0; i < count; i++){
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

            DataMap scscore = new DataMap();
            scscore.put("SCSCORE_ID", ShortUUID.randomUUID());
            scscore.put("SCHOOL_ID", dataMap.getString("SCHOOL_ID"));
            scscore.put("YEAR_ID", year);
            scscore.put("ARRANGMENT_ID", arrangment);
            scscore.put("MAJORTYPE_ID", majortype);
            scscore.put("MAXSCORE", maxscore);
            scscore.put("MINSCORE", minscore);
            scscore.put("ENTERCOUNT", entercount);
            scscore.put("MSORT", i);
            this.addScscore(scscore);
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public void addScscore(DataMap dataMap) throws Exception {
        daoSupport.save("ScscoreMapper.addScscore", dataMap);
    }

    /**
    * 编辑院校录取分
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void editScscore(DataMap dataMap) throws Exception {
        daoSupport.update("ScscoreMapper.editScscore", dataMap);
    }

    /**
    * 编辑院校录取分中的非前台录入属性
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void editNotFrontOfScscore(DataMap dataMap) throws Exception {
        daoSupport.update("ScscoreMapper.editNotFrontOfScscore", dataMap);
    }

    public List<DataMap> getScscoresByYear(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ScscoreMapper.getScscoresByYear", dataMap);
    }

    public List<DataMap> getScscoresByYearAndMajortype(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ScscoreMapper.getScscoresByYearAndMajortype", dataMap);
    }

    public List<DataMap> getScscoresByScIdAndMajortypeId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ScscoreMapper.getScscoresByScIdAndMajortypeId", dataMap);
    }
}
