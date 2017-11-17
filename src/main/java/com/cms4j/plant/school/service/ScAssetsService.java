package com.cms4j.plant.school.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.ShortUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ScAssetsService {

    @Autowired
    private DaoSupport daoSupport;

    @Transactional(rollbackFor = Exception.class)
    public void addScAssets(DataMap dataMap) throws Exception {
        dataMap.put("ASSETS_ID", ShortUUID.randomUUID());

        daoSupport.save("ScAssetsMapper.addScAssets", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void editScAssets(DataMap dataMap) throws Exception {
        daoSupport.update("ScAssetsMapper.editScAssets", dataMap);
    }

    public DataMap getScAssetsByScId(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ScAssetsMapper.getScAssetsByScId", dataMap);
    }

    public DataMap getScAssetsById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ScAssetsMapper.getScAssetsById", dataMap);
    }
}
