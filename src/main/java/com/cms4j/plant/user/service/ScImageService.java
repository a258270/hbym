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
public class ScImageService {

    @Autowired
    private DaoSupport daoSupport;

    @Transactional(rollbackFor = Exception.class)
    public void addScImage(DataMap dataMap) throws Exception {
        dataMap.put("IMAGE_ID", ShortUUID.randomUUID());
        dataMap.put("CREATETIME", DateUtil.getCurrentTime());
        dataMap.put("VIEWCOUNT", 0);

        daoSupport.save("ScImageMapper.addScImage", dataMap);
    }

    public List<DataMap> getImages(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ScImageMapper.getImages", page);
    }

    public DataMap getImageById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ScImageMapper.getImageById", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void editImage(DataMap dataMap) throws Exception {
        daoSupport.update("ScImageMapper.editImage", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void removeImages(List list)  throws Exception {
        daoSupport.batchDelete("ScImageMapper.removeImages", list);
    }

    public List<DataMap> getImagesByScId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ScImageMapper.getImagesByScId", dataMap);
    }
}
