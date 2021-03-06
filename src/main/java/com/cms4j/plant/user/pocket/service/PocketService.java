package com.cms4j.plant.user.pocket.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.ShortUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.xml.crypto.Data;

/**
 * description:
 *
 * @author: zmj
 * @create: 2017/6/29
 */
@Service
public class PocketService {

    @Autowired
    private DaoSupport daoSupport;

    /**
     * 通过钱包id获取钱包
     * @param dataMap
     * @return
     * @throws Exception
     */
    public DataMap getPocketById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("PocketMapper.getPocketById", dataMap);
    }

    /**
     * 通过用户id获取钱包
     * @param dataMap
     * @return
     * @throws Exception
     */
    public DataMap getPocketByUserId(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("PocketMapper.getPocketByUserId", dataMap);
    }

    /**
     * 新增钱包
     * @param dataMap
     * @throws Exception
     */
    @Transactional(rollbackFor = Exception.class)
    public void addPocket(DataMap dataMap) throws Exception {
        dataMap.put("POCKET_ID", ShortUUID.randomUUID());
        dataMap.put("CREATETIME", DateUtil.getCurrentTime());
        dataMap.put("UPDATETIME", dataMap.get("CREATETIME"));

        daoSupport.save("PocketMapper.addPocket", dataMap);
    }

    /**
     * 编辑钱包
     * @param dataMap
     * @throws Exception
     */
    public void editPocket(DataMap dataMap) throws Exception {
        daoSupport.update("PocketMapper.editPocket", dataMap);
    }

    /**
     * 消费
     * @param dataMap
     * @throws Exception
     */
    public boolean consume(DataMap dataMap) throws Exception {
        int i = (int) daoSupport.update("PocketMapper.consume", dataMap);
        if(i > 0)
            return true;

        return false;
    }

    /**
     * 充值
     * @param dataMap
     * @throws Exception
     */
    public boolean recharge(DataMap dataMap) throws Exception {
        int i = (int) daoSupport.update("PocketMapper.recharge", dataMap);
        if(i > 0)
            return true;

        return false;
    }

    /**
     * 充值转换
     * @param dataMap
     * @return
     * @throws Exception
     */

    //12.28 ls:充值需求更改  1元-->10金币
    //此方法 直接将 充值的 RMB 转换为 金币 再把金币 叠加 更新进 数据库中
    public boolean chongzhi(DataMap dataMap ) throws  Exception{
        int price = (int)dataMap.get("PRICE") * 10;
        dataMap.put("PRICE",price);
        int i= (int)daoSupport.update("PocketMapper.recharge",dataMap);
        if(i>0)
            return true;
        return  false;
    }


    /**
     * 禁用钱包
     * @param dataMap
     * @throws Exception
     */
    public void removePocket(DataMap dataMap) throws Exception {
        daoSupport.update("PocketMapper.removePocket", dataMap);
    }
}
