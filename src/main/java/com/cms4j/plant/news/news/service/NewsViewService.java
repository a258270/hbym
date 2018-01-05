package com.cms4j.plant.news.news.service;

import com.cms4j.base.dao.DAO;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.ShortUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class NewsViewService {
    @Autowired
    private DAO dao;


    public List<DataMap> getNewsViewsByUserId(DataMap dataMap) throws Exception {
        return (List<DataMap>) dao.findForList("NewsViewMapper.getNewsViewsByUserId", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addNewsView(DataMap dataMap) throws Exception {
        if(this.getCountNewsViewsByUserIdAndNewsId(dataMap).equals(0)) {
            dataMap.put("VIEW_ID", ShortUUID.randomUUID());
            dataMap.put("CREATETIME", DateUtil.getCurrentTime());
            dao.save("NewsViewMapper.addNewsView", dataMap);
        }
    }

    public Integer getCountNewsViewsByUserIdAndNewsId(DataMap dataMap) throws Exception {
        return (Integer) dao.findForObject("NewsViewMapper.getCountNewsViewsByUserIdAndNewsId", dataMap);
    }
}
