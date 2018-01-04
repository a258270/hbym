package com.cms4j.plant.recharge.service;

import com.cms4j.base.dao.DAO;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.ShortUUID;
import com.cms4j.plant.user.pocket.service.PocketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RechargeService {

    @Autowired
    private DAO dao;
    @Autowired
    private PocketService pocketService;

    @Transactional(rollbackFor = Exception.class)
    public void addRecharge(DataMap dataMap) throws Exception {
        dataMap.put("RECHARGE_ID", ShortUUID.randomUUID());
        dataMap.put("CREATETIME",DateUtil.getCurrentTime());

        dao.save("RechargeMapper.addRecharge", dataMap);
    }

    public List<DataMap> orderShow(DataMap dataMap) throws Exception {
        return (List<DataMap>) dao.findForList("RechargeMapper.orderShow", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void updateTradeState(DataMap dataMap) throws Exception {
        dao.update("RechargeMapper.updateTradeState", dataMap);
    }

    public Integer querygGoldNumByOutTradeNo(DataMap dataMap) throws Exception {
        return (Integer) dao.findForObject("RechargeMapper.querygGoldNumByOutTradeNo", dataMap);
    }

    public Integer queryStateByOutTradeNo(DataMap dataMap) throws Exception {
        return (Integer) dao.findForObject("RechargeMapper.queryStateByOutTradeNo", dataMap);
    }

    public DataMap queryRechargeByOutTradeNo(DataMap dataMap) throws Exception {
        return (DataMap) dao.findForObject("RechargeMapper.queryRechargeByOutTradeNo", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void recharge(String out_trade_no) throws Exception {
        DataMap param = new DataMap();
        param.put("OUT_TRADE_NO", out_trade_no);
        DataMap rechargeResult = queryRechargeByOutTradeNo(param);
        if(rechargeResult != null) {
            //获取钱包
            DataMap pocket = pocketService.getPocketByUserId(rechargeResult);

            Integer gold_num = (Integer) rechargeResult.get("GOLD_NUM");
            param.put("PRICE", gold_num);
            param.put("POCKET_ID", pocket.getString("POCKET_ID"));

            pocketService.recharge(param);
            this.updateTradeState(param);
        }
    }
}
