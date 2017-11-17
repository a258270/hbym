package com.cms4j.plant.news.news.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.Page;
import com.cms4j.base.util.ShortUUID;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cms4j.base.util.DateUtil;
import java.util.Arrays;
import java.util.List;

/**
* Description: NewsService
* Created by zmj on 2017/08/14.
*/
@Service
public class NewsService {

    @Autowired
    private DaoSupport daoSupport;

    /**
    * 根据NEWS_ID获取数据
    * @param dataMap
    * @return
    * @throws Exception
    */
    public DataMap getNewsById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("NewsMapper.getNewsById", dataMap);
    }

    /**
    * 获取新闻分页数据
    * @param page
    * @return
    * @throws Exception
    */
    public List<DataMap> getNewss(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("NewsMapper.getNewss", page);
    }

    /**
    * 批量删除新闻
    * @param objs
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void batchRemoves(String objs) throws Exception {
        String[] objArr = objs.split(",");
        List<String> objList = Arrays.asList(objArr);
        daoSupport.batchDelete("NewsMapper.batchRemoves", objList);
    }

    /**
    * 新增新闻
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void addNews(DataMap dataMap) throws Exception {
        dataMap.put("NEWS_ID", ShortUUID.randomUUID());
        if(StringUtils.isBlank(dataMap.getString("SUBTITLE")))
            dataMap.put("SUBTITLE", null);
        if(StringUtils.isBlank(dataMap.getString("IMGURL")))
            dataMap.put("IMGURL", PlantConst.STATIC_IMG_NONE);
        if(StringUtils.isBlank(dataMap.getString("MSORT")))
            dataMap.put("MSORT", this.getNewsCount());
        dataMap.put("CREATETIME", DateUtil.getCurrentTime());
        dataMap.put("MODIFYTIME", DateUtil.getCurrentTime());
        dataMap.put("VIEWCOUNT", 0);
        daoSupport.save("NewsMapper.addNews", dataMap);
    }

    /**
    * 编辑新闻
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void editNews(DataMap dataMap) throws Exception {
        DataMap news = this.getNewsById(dataMap);
        if(StringUtils.isBlank(dataMap.getString("IMGURL"))){
            dataMap.put("IMGURL", news.getString("IMGURL"));
            dataMap.put("MODIFYTIME", DateUtil.getCurrentTime());
            dataMap.put("AUTHOR", news.getString("AUTHOR"));
            dataMap.put("CREATETIME", news.get("CREATETIME"));
            dataMap.put("VIEWCOUNT", news.get("VIEWCOUNT"));
            this.editNotFrontOfNews(dataMap);
        }
        if(StringUtils.isBlank(dataMap.getString("SUBTITLE")))
            dataMap.put("SUBTITLE", null);
        if(StringUtils.isBlank(dataMap.getString("MSORT")))
            dataMap.put("MSORT", 0);
        daoSupport.update("NewsMapper.editNews", dataMap);
    }

    /**
    * 编辑新闻中的非前台录入属性
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void editNotFrontOfNews(DataMap dataMap) throws Exception {
        if(StringUtils.isBlank(dataMap.getString("AUTHOR")))
            dataMap.put("AUTHOR", null);
        if(StringUtils.isBlank(dataMap.getString("CREATETIME")))
            dataMap.put("CREATETIME", null);
        if(StringUtils.isBlank(dataMap.getString("MODIFYTIME")))
            dataMap.put("MODIFYTIME", null);
        if(StringUtils.isBlank(dataMap.getString("VIEWCOUNT")))
            dataMap.put("VIEWCOUNT", null);
        daoSupport.update("NewsMapper.editNotFrontOfNews", dataMap);
    }

    public Integer getNewsCount() throws Exception {
        return (Integer) daoSupport.findForObject("NewsMapper.getNewsCount");
    }

    public void addViewCount(DataMap dataMap) throws Exception {
        daoSupport.update("NewsMapper.addViewCount", dataMap);
    }
}
