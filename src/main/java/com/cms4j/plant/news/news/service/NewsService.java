package com.cms4j.plant.news.news.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.*;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* Description: NewsService
* Created by zmj on 2017/08/14.
*/
@Service
public class NewsService {

    @Autowired
    private DaoSupport daoSupport;
    @Autowired
    private NewsViewService newsViewService;

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
        if(StringUtils.isBlank(dataMap.getString("ABSTRACT"))) {
            dataMap.put("ABSTRACT", null);
        }
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

        if(StringUtils.isBlank(dataMap.getString("ABSTRACT"))) {
            dataMap.put("ABSTRACT", null);
        }
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

    @Transactional(rollbackFor = Exception.class)
    public void addViewCount(DataMap dataMap) throws Exception {
        daoSupport.update("NewsMapper.addViewCount", dataMap);

        //增加公告新闻的阅读记录
        if(SessionUtil.getCurUser() != null && dataMap.get("NEWSTYPE") != null && PlantConst.NEWSTYPE_GG.equals(dataMap.getString("NEWSTYPE"))) {
            DataMap param = new DataMap();
            param.put("USER_ID", SessionUtil.getCurUser().getString("USER_ID"));
            param.put("NEWS_ID", dataMap.getString("NEWS_ID"));
            newsViewService.addNewsView(param);
        }
    }

    public Page getNewssForWechatApp(DataMap dataMap) throws Exception {
        Page page = new Page();
        Map params = new HashMap();
        if(StringUtils.isBlank(dataMap.getString("TITLE"))) dataMap.put("TITLE", null);
        page.setParams(dataMap);

        if(StringUtils.isBlank(dataMap.getString("currentPage"))) dataMap.put("currentPage", "0");
        else{
            try{
                Integer currentPage = Integer.valueOf(dataMap.getString("currentPage"));
                currentPage--;
                if(currentPage < 0) currentPage = 0;
                dataMap.put("currentPage", currentPage);
            }
            catch (Exception e) {
                dataMap.put("currentPage", "0");
            }
        }
        page.setPageNumber(Integer.valueOf(dataMap.getString("currentPage")));
        if(StringUtils.isBlank(dataMap.getString("pageSize")))
            page.setPageSize(10);
        else
            page.setPageSize(Integer.valueOf(dataMap.getString("pageSize")));

        List<DataMap> news = this.getNewss(page);
        //过滤已读的公告
        if(PlantConst.NEWSTYPE_GG.equals(dataMap.getString("NEWSTYPE")) && SessionUtil.getCurUser() != null && news != null) {
            DataMap param = new DataMap();
            param.put("USER_ID", SessionUtil.getCurUser().getString("USER_ID"));
            List<DataMap> ggs = newsViewService.getNewsViewsByUserId(param);
            if(ggs != null) {
                for(DataMap gg : ggs) {
                    for(DataMap newsObj : news) {
                        if(newsObj.getString("NEWS_ID").equals(gg.getString("NEWS_ID"))) {
                            news.remove(newsObj);
                            break;
                        }
                    }
                }
            }
        }
        page.setResults(news);
        return page;
    }

    public List<DataMap> getNewsByType(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("NewsMapper.getNewsByType", dataMap);
    }
}
