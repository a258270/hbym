package com.cms4j.plant.item.item.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.ShortUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ItemBelongService {
    @Autowired
    private DaoSupport daoSupport;

    @Transactional(rollbackFor = Exception.class)
    public void addItemBelong(DataMap dataMap) throws Exception {
        dataMap.put("BELONG_ID", ShortUUID.randomUUID());
        dataMap.put("CREATETIME", DateUtil.getCurrentTime());
        dataMap.put("ISVAL", true);
        daoSupport.save("ItemBelongMapper.addItemBelong", dataMap);
    }

    public List<DataMap> getValItemBelongByUserId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ItemBelongMapper.getValItemBelongByUserId", dataMap);
    }

    public List<DataMap> getValItemBelongByUserIdAndItemType(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ItemBelongMapper.getValItemBelongByUserIdAndItemType", dataMap);
    }

    public Integer getValItemBelongCountByUserIdAndItemType(DataMap dataMap) throws Exception {
        return (Integer) daoSupport.findForObject("ItemBelongMapper.getValItemBelongCountByUserIdAndItemType", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void useItem(DataMap dataMap) throws Exception {
        dataMap.put("USETIME", DateUtil.getCurrentTime());
        daoSupport.update("ItemBelongMapper.useItem", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void reChargeItemBelong(Integer count, DataMap dataMap) throws Exception {
        for(int i = 0; i < count; i++) {
            this.addItemBelong(dataMap);
        }
    }
}
