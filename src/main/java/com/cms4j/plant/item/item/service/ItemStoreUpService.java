package com.cms4j.plant.item.item.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.ShortUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ItemStoreUpService {

    @Autowired
    private DaoSupport daoSupport;

    @Transactional(rollbackFor = Exception.class)
    public void addItemStoreup(DataMap dataMap) throws Exception {
        dataMap.put("STOREUP_ID", ShortUUID.randomUUID());
        daoSupport.save("ItemStoreupMapper.addItemStoreup", dataMap);
    }

    public List<DataMap> getItemStoreupsByUserId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ItemStoreupMapper.getItemStoreupsByUserId", dataMap);
    }
}
