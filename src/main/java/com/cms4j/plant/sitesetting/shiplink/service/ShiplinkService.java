package com.cms4j.plant.sitesetting.shiplink.service;

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
* Description: ShiplinkService
* Created by zmj on 2017/08/15.
*/
@Service
public class ShiplinkService {

    @Autowired
    private DaoSupport daoSupport;

    /**
    * 根据SHIPLINK_ID获取数据
    * @param dataMap
    * @return
    * @throws Exception
    */
    public DataMap getShiplinkById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("ShiplinkMapper.getShiplinkById", dataMap);
    }

    /**
    * 获取友情链接分页数据
    * @param page
    * @return
    * @throws Exception
    */
    public List<DataMap> getShiplinks(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ShiplinkMapper.getShiplinks", page);
    }

    /**
    * 批量删除友情链接
    * @param objs
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void batchRemoves(String objs) throws Exception {
        String[] objArr = objs.split(",");
        List<String> objList = Arrays.asList(objArr);
        daoSupport.batchDelete("ShiplinkMapper.batchRemoves", objList);
    }

    /**
    * 新增友情链接
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void addShiplink(DataMap dataMap) throws Exception {
        dataMap.put("SHIPLINK_ID", ShortUUID.randomUUID());
        if(StringUtils.isBlank(dataMap.getString("MSORT"))){
            dataMap.put("MSORT", this.getShiplinkCount());
        }
        if(!dataMap.getString("LINKSITE").substring(0, 4).toLowerCase().equals("http")){
            dataMap.put("LINKSITE", "http://" + dataMap.getString("LINKSITE"));
        }
        daoSupport.save("ShiplinkMapper.addShiplink", dataMap);
    }

    /**
    * 编辑友情链接
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void editShiplink(DataMap dataMap) throws Exception {
        if(StringUtils.isBlank(dataMap.getString("LOGO"))){
            DataMap dataMapOld = this.getShiplinkById(dataMap);
            dataMap.put("LOGO", dataMapOld.getString("LOGO"));
        }
        if(StringUtils.isBlank(dataMap.getString("MSORT"))){
            dataMap.put("MSORT", this.getShiplinkCount());
        }
        if(!dataMap.getString("LINKSITE").substring(0, 4).toLowerCase().equals("http")){
            dataMap.put("LINKSITE", "http://" + dataMap.getString("LINKSITE"));
        }
        daoSupport.update("ShiplinkMapper.editShiplink", dataMap);
    }

    /**
    * 编辑友情链接中的非前台录入属性
    * @param dataMap
    * @throws Exception
    */
    @Transactional(rollbackFor = Exception.class)
    public void editNotFrontOfShiplink(DataMap dataMap) throws Exception {
        if(StringUtils.isBlank(dataMap.getString("MSORT")))
            dataMap.put("MSORT", null);
        daoSupport.update("ShiplinkMapper.editNotFrontOfShiplink", dataMap);
    }

    public Integer getShiplinkCount() throws Exception {
        return (Integer) daoSupport.findForObject("ShiplinkMapper.getShiplinkCount");
    }
}
