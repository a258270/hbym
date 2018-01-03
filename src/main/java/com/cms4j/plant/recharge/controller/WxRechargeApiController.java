package com.cms4j.plant.recharge.controller;

import com.cms4j.base.util.DataMap;
import com.cms4j.helper.WechatAppProxy;
import com.cms4j.helper.account.PayAccount;
import com.cms4j.helper.entity.pay.Status;
import com.cms4j.helper.util.SignUtil;
import com.cms4j.plant.recharge.service.RechargeService;
import com.cms4j.plant.util.PlantConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/plant/wxrecharge")
public class WxRechargeApiController {
    @Autowired
    private WechatAppProxy wechatAppProxy;
    @Autowired
    private RechargeService rechargeService;

    @RequestMapping(value = "/notice")
    public synchronized void notice(@RequestBody String strXml) {
        System.out.println("接到微信通知：" + strXml);

        try{
            Status status = new Status(strXml);
            String sign = status.getSign();
            status.setSign(null);
            String sign_receive = SignUtil.makeSign((PayAccount) wechatAppProxy.getWechatAppAccount(), status);

            if (sign.equals(sign_receive)) {//签名验证
                String out_trade_no = status.getOut_trade_no();//商户订单号

                DataMap recharge_record = new DataMap();
                recharge_record.put("OUT_TRADE_NO", out_trade_no);
                //通过商户订单号获取订单信息
                Integer state = rechargeService.queryStateByOutTradeNo(recharge_record);
                if(state != null) {
                    if(state.equals(PlantConst.RECHARGE_STATE.UNPAID.ordinal())) {
                        //订单为未支付状态
                        rechargeService.recharge(out_trade_no);
                    }
                }
            }
            else{
                throw new Exception("签名非法");
            }
        }
        catch(Exception e) {
            System.out.println("通知处理异常");
            e.printStackTrace();
        }
    }

}
