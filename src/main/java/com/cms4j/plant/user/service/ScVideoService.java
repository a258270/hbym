package com.cms4j.plant.user.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.Page;
import com.cms4j.base.util.ShortUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ScVideoService {

    @Autowired
    private DaoSupport daoSupport;

    @Transactional(rollbackFor = Exception.class)
    public void addScVideo(DataMap dataMap) throws Exception {
        dataMap.put("VIDEO_ID", ShortUUID.randomUUID());
        dataMap.put("CREATETIME", DateUtil.getCurrentTime());
        dataMap.put("VIEWCOUNT", 0);

        daoSupport.save("ScVideoMapper.addScVideo", dataMap);
    }

    public List<DataMap> getVideos(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ScVideoMapper.getVideos", page);
    }

    public DataMap getVideoById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ScVideoMapper.getVideoById", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void editVideo(DataMap dataMap) throws Exception {
        daoSupport.update("ScVideoMapper.editVideo", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void removeVideos(List list)  throws Exception {
        daoSupport.batchDelete("ScVideoMapper.removeVideos", list);
    }

    public List<DataMap> getVideosByScId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ScVideoMapper.getVideosByScId", dataMap);
    }
}
