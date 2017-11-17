package com.cms4j.plant.school.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.Page;
import com.cms4j.base.util.ShortUUID;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ScArticleService {

    @Autowired
    private DaoSupport daoSupport;

    public List<DataMap> getArticlesByUserId(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ScArticleMapper.getArticlesByUserId", page);
    }

    public List<DataMap> getArticlesByScId(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ScArticleMapper.getArticlesByScId", page);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addArticle(DataMap dataMap) throws Exception {
        dataMap.put("ARTICLE_ID", ShortUUID.randomUUID());
        if(StringUtils.isBlank(dataMap.getString("SUBTITLE")))
            dataMap.put("SUBTITLE", null);
        if(StringUtils.isBlank(dataMap.getString("IMGURL")))
            dataMap.put("IMGURL", PlantConst.STATIC_IMG_NONE);
        if(StringUtils.isBlank(dataMap.getString("MSORT")))
            dataMap.put("MSORT", 0);
        dataMap.put("CREATETIME", DateUtil.getCurrentTime());
        dataMap.put("MODIFYTIME", DateUtil.getCurrentTime());
        dataMap.put("VIEWCOUNT", 0);
        daoSupport.save("ScArticleMapper.addArticle", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void removeArticles(List list) throws Exception {
        daoSupport.batchDelete("ScArticleMapper.removeArticles", list);
    }

    public DataMap getArticleById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ScArticleMapper.getArticleById", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void editArticle(DataMap dataMap) throws Exception {
        DataMap article = this.getArticleById(dataMap);

        if(!StringUtils.isBlank(dataMap.getString("IMGURL"))) {
            article.put("IMGURL", dataMap.getString("IMGURL"));
        }

        article.put("TITLE", dataMap.getString("TITLE"));
        article.put("SUBTITLE", dataMap.getString("SUBTITLE"));
        article.put("MSORT", dataMap.getString("MSORT"));
        article.put("CONTENT", dataMap.getString("CONTENT"));
        article.put("MODIFYTIME", DateUtil.getCurrentTime());

        daoSupport.update("ScArticleMapper.editArticle", article);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addViewCount(DataMap dataMap) throws Exception {
        daoSupport.update("ScArticleMapper.addViewCount", dataMap);
    }
}
