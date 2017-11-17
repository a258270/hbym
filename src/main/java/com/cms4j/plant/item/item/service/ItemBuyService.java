package com.cms4j.plant.item.item.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.Page;
import com.cms4j.base.util.ShortUUID;
import com.cms4j.plant.user.pocket.service.PocketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import javax.xml.crypto.Data;
import java.util.List;

@Service
public class ItemBuyService {

    @Autowired
    private DaoSupport daoSupport;
    @Autowired
    private PocketService pocketService;

    @Transactional(rollbackFor = Exception.class)
    public void addItemBuy(DataMap dataMap) throws Exception {
        Integer count = Integer.valueOf(dataMap.getString("COUNT"));
        for(int i = 0; i < count; i++){
            dataMap.put("BUY_ID", ShortUUID.randomUUID());
            pocketService.consume(dataMap);
            daoSupport.save("ItemBuyMapper.addItemBuy", dataMap);
        }
    }

    public List<DataMap> getItemBuyByUserId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ItemBuyMapper.getItemBuyByUserId", dataMap);
    }

    public List<DataMap> getItemBuyInNoUseByUserId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ItemBuyMapper.getItemBuyInNoUseByUserId", dataMap);
    }

    public List<DataMap> getItemBuyInUsedByUserId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ItemBuyMapper.getItemBuyInUsedByUserId", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void useItem(DataMap dataMap) throws Exception {
        daoSupport.update("ItemBuyMapper.useItem", dataMap);
    }

    public Integer getItemCountByType(DataMap dataMap) throws Exception {
        return (Integer) daoSupport.findForObject("ItemBuyMapper.getItemCountByType", dataMap);
    }

    public List<DataMap> getBuyRecs(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ItemBuyMapper.getBuyRecs", page);
    }
}
