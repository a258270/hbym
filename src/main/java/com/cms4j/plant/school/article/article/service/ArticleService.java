package com.cms4j.plant.school.article.article.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.Page;
import com.cms4j.base.util.ShortUUID;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cms4j.base.util.DateUtil;
import java.util.Arrays;
import java.util.List;

/**
* Description: ArticleService
* Created by zmj on 2017/12/25.
*/
@Service
public class ArticleService {

    @Autowired
    private DaoSupport daoSupport;

    /**
    * 根据ARTICLE_ID获取数据
    * @param dataMap
    * @return
    * @throws Exception
    */
    public DataMap getArticleById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ScArticleMapper.getArticleById", dataMap);
    }

    /**
    * 获取院校资料分页数据
    * @param page
    * @return
    * @throws Exception
    */
    public List<DataMap> getArticles(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ScArticleMapper.getArticles", page);
    }

    /**
    * 批量删除院校资料
    * @param objs
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void batchRemoves(String objs) throws Exception {
        String[] objArr = objs.split(",");
        List<String> objList = Arrays.asList(objArr);
        daoSupport.batchDelete("ScArticleMapper.batchRemoves", objList);
    }

    /**
    * 新增院校资料
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void addArticle(DataMap dataMap) throws Exception {
        dataMap.put("ARTICLE_ID", ShortUUID.randomUUID());
        if(StringUtils.isBlank(dataMap.getString("SUBTITLE")))
            dataMap.put("SUBTITLE", null);
        if(StringUtils.isBlank(dataMap.getString("IMGURL")))
            dataMap.put("IMGURL", null);
        if(StringUtils.isBlank(dataMap.getString("MSORT")))
            dataMap.put("MSORT", 1);
        dataMap.put("CREATETIME", DateUtil.getCurrentTime());
        dataMap.put("MODIFYTIME", DateUtil.getCurrentTime());
        dataMap.put("VIEWCOUNT", 0);
        daoSupport.save("ScArticleMapper.addArticle", dataMap);
    }

    /**
    * 编辑院校资料
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void editArticle(DataMap dataMap) throws Exception {
        if(StringUtils.isBlank(dataMap.getString("SUBTITLE")))
            dataMap.put("SUBTITLE", null);
        if(StringUtils.isBlank(dataMap.getString("IMGURL")))
            dataMap.put("IMGURL", null);
        if(StringUtils.isBlank(dataMap.getString("MSORT")))
            dataMap.put("MSORT", null);

        dataMap.put("MODIFYTIME", DateUtil.getCurrentTime());
        daoSupport.update("ScArticleMapper.editArticle", dataMap);
    }

    /**
    * 编辑院校资料中的非前台录入属性
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void editNotFrontOfArticle(DataMap dataMap) throws Exception {
        if(StringUtils.isBlank(dataMap.getString("CREATETIME")))
            dataMap.put("CREATETIME", null);
        if(StringUtils.isBlank(dataMap.getString("MODIFYTIME")))
            dataMap.put("MODIFYTIME", null);
        if(StringUtils.isBlank(dataMap.getString("VIEWCOUNT")))
            dataMap.put("VIEWCOUNT", null);
        daoSupport.update("ScArticleMapper.editNotFrontOfArticle", dataMap);
    }
}
