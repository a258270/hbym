package com.cms4j.plant.item.item.service;

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
* Description: ItemService
* Created by zmj on 2017/08/21.
*/
@Service
public class ItemService {

    @Autowired
    private DaoSupport daoSupport;

    /**
    * 根据ITEM_ID获取数据
    * @param dataMap
    * @return
    * @throws Exception
    */
    public DataMap getItemById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ItemMapper.getItemById", dataMap);
    }

    /**
    * 获取商品分页数据
    * @param page
    * @return
    * @throws Exception
    */
    public List<DataMap> getItems(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ItemMapper.getItems", page);
    }

    /**
    * 批量删除商品
    * @param objs
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void batchRemoves(String objs) throws Exception {
        String[] objArr = objs.split(",");
        List<String> objList = Arrays.asList(objArr);
        daoSupport.batchDelete("ItemMapper.batchRemoves", objList);
    }

    /**
    * 新增商品
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void addItem(DataMap dataMap) throws Exception {
        dataMap.put("ITEM_ID", ShortUUID.randomUUID());
        daoSupport.save("ItemMapper.addItem", dataMap);
    }

    /**
    * 编辑商品
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void editItem(DataMap dataMap) throws Exception {
        daoSupport.update("ItemMapper.editItem", dataMap);
    }

    /**
    * 编辑商品中的非前台录入属性
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void editNotFrontOfItem(DataMap dataMap) throws Exception {
        if(StringUtils.isBlank(dataMap.getString("IMGURL")))
            dataMap.put("IMGURL", null);
        daoSupport.update("ItemMapper.editNotFrontOfItem", dataMap);
    }

    public List<DataMap> getAllSalingItems(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ItemMapper.getAllSalingItems", page);
    }
}
