package com.cms4j.plant.recharge.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.*;
import com.cms4j.helper.entity.pay.UrlCallBack;
import com.cms4j.helper.exception.PayErrorException;
import com.cms4j.helper.WechatAppProxy;
import com.cms4j.helper.account.PayAccount;
import com.cms4j.helper.entity.pay.PrePayReSign;
import com.cms4j.helper.entity.pay.Status;
import com.cms4j.helper.entity.pay.Unifiedorder;
import com.cms4j.helper.util.SignUtil;
import com.cms4j.plant.recharge.service.RechargeService;
import com.cms4j.plant.util.PlantConst;
import com.cms4j.wechat.service.WechatUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/plant/wxrecharge")
public class WxRechargeApiController extends ApiBaseController{
    @Autowired
    private WechatAppProxy wechatAppProxy;
    @Autowired
    private RechargeService rechargeService;
    @Autowired
    private WechatUserService wechatUserService;

    @RequestMapping(value = "/notice")
    public synchronized void notice(@RequestBody String strXml) {
        strXml = strXml.replaceAll("\n", "");
        System.out.println("接到微信通知：" + strXml);

        try{
            Status status = new Status(strXml);
            String sign = status.getSign();

            if (SignUtil.validSign((PayAccount) wechatAppProxy.getWechatAppAccount(), sign, strXml)) {//签名验证
                String out_trade_no = status.getOut_trade_no();//商户订单号

                DataMap recharge_record = new DataMap();
                recharge_record.put("OUT_TRADE_NO", out_trade_no);
                //通过商户订单号获取订单信息(状态)
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
    //ls：数据库插入 订单未支付
    @RequestMapping(value = "/addUnPayOrder")
    public synchronized InvokeResult addUnPayOrder() throws  Exception{

        DataMap dataMap = this.getDataMap();

        DataMap curUser = SessionUtil.getCurUser();
        DataMap wechatUser = SessionUtil.getWechatFromSession();
        if(wechatUser == null) {
            String massage = "请君登录账号！";
            return  InvokeResult.failure(massage);
        }
        if(null == curUser){
            String massage = "请君登录账号！";
            return  InvokeResult.failure(massage);
        }else{
            Unifiedorder unifiedorder = rechargeService.makeUnifiedorder(dataMap, this.getRequestIpAddress(), curUser, wechatUser);
            // 生成预付单 统一支付
            try{
                PrePayReSign prePayReSign = wechatAppProxy.createPrePayInfo(unifiedorder);
                rechargeService.addRecharge(dataMap);

                return InvokeResult.success(prePayReSign);
            }
            catch (PayErrorException e) {
                dataMap.put("STATE", PlantConst.RECHARGE_STATE.ERROR.ordinal());
                rechargeService.updateTradeState(dataMap);
                return InvokeResult.failure("发起微信支付出错，请重试");
            }
        }
    }

    @RequestMapping(value = "/addUnpayOrderInWeb")
    public InvokeResult addUnpayOrderInWeb() throws Exception {
        DataMap dataMap = this.getDataMap();

        DataMap curUser = SessionUtil.getCurUser();
        DataMap wechatUser = SessionUtil.getWechatFromSession();

        if(null == curUser){
            String massage = "请君登录账号！";
            return  InvokeResult.failure(massage);
        }else{
            Unifiedorder unifiedorder = rechargeService.makeUnifiedorder(dataMap, this.getRequestIpAddress(), curUser, wechatUser);
            // 生成预付单 统一支付
            try{
                String code_url = wechatAppProxy.createQRCode(unifiedorder);
                rechargeService.addRecharge(dataMap);

                return InvokeResult.success(code_url);
            }
            catch (PayErrorException e) {
                dataMap.put("STATE", PlantConst.RECHARGE_STATE.ERROR.ordinal());
                rechargeService.updateTradeState(dataMap);
                return InvokeResult.failure("发起微信支付出错，请重试");
            }
        }
    }
}
