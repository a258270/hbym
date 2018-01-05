package com.cms4j.plant.recharge.service;

import com.cms4j.base.dao.DAO;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.ShortUUID;
import com.cms4j.helper.entity.pay.Unifiedorder;
import com.cms4j.plant.user.pocket.service.PocketService;
import com.cms4j.plant.util.PlantConst;
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
            param.put("STATE", PlantConst.RECHARGE_STATE.UNPAID.ordinal());
            pocketService.recharge(param);
            this.updateTradeState(param);
        }
    }

    /**
     * 生成订单
     * @param dataMap 需包含购买金额（单位：分）
     * @param ip
     * @param curUser
     * @param wechatUser
     * @return
     */
    public Unifiedorder makeUnifiedorder(DataMap dataMap, String ip, DataMap curUser, DataMap wechatUser) {
        String user_Id = curUser.getString("USER_ID");
        Integer total = Integer.valueOf(dataMap.getString("TOTAL"));
        //暂定前台传来的数据是 5元 10元 整数
        //折合的金币
       // int balance = total / 10;
        //ls:修改兑换   倍率（常量值）
        int balance = (total / 100) * PlantConst.RATE_N;

        //total_fee  以分为单位
        int total_fee = total;
        //生成订单号
        String out_trade_no = ShortUUID.orderUUID();

        dataMap.put("GOLD_NUM",balance);
        dataMap.put("TOTAL_FEE",total_fee);
        dataMap.put("OUT_TRADE_NO",out_trade_no);
        //继承ApiBaseController  用this.getRequestIpAddress() 获取IP
        dataMap.put("IP", ip);
        dataMap.put("USER_ID", user_Id);
        dataMap.put("STATE", PlantConst.RECHARGE_STATE.UNPAID.ordinal());

        //unifiedorder 中需要设置的5个参数  body  out_trade_no   total_fee   spbill_create_ip
        Unifiedorder unifiedorder = new Unifiedorder();
        //1:body
        StringBuilder sb = new StringBuilder();
        //比如 “充值5元折合50金币”
        String strBody = "充值"+ (total / 100) + "元折合"+balance +"金币";
        //拼接Body
        sb.append(strBody);
        String sbBody = sb.toString();

        dataMap.put("BODY", sbBody);
        //2:out_trade_no   已经生成的订单号
        //3:total_fee   以分记得充值 金额总数
        //4:spbill_create_ip  获取用户IP 放入参数中
        unifiedorder.setBody(sbBody);
        unifiedorder.setOut_trade_no(out_trade_no);
        unifiedorder.setTotal_fee(total_fee);
        unifiedorder.setSpbill_create_ip(ip);

        //获取openid
        if(wechatUser != null)
            unifiedorder.setOpenid(wechatUser.getString("WXAPPOPENID"));

        return unifiedorder;
    }

    public Unifiedorder makeUnifiedorder(DataMap dataMap, String ip, DataMap curUser) {
        return makeUnifiedorder(dataMap, ip, curUser, null);
    }
}
