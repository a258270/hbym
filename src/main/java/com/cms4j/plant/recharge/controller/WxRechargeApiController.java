package com.cms4j.plant.recharge.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.*;
import com.cms4j.helper.WechatAppProxy;
import com.cms4j.helper.account.PayAccount;
import com.cms4j.helper.entity.pay.PrePayReSign;
import com.cms4j.helper.entity.pay.Status;
import com.cms4j.helper.entity.pay.Unifiedorder;
import com.cms4j.helper.util.SignUtil;
import com.cms4j.plant.recharge.service.RechargeService;
import com.cms4j.plant.util.PlantConst;
import com.cms4j.wechat.service.WechatUserService;
import jxl.write.DateTime;
import org.dom4j.DocumentException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.lang.reflect.InvocationTargetException;

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
    @RequestMapping(value = "addUnPayOrder")
    public synchronized InvokeResult addUnPayOrder()throws  Exception{

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
            String user_Id = curUser.getString("USER_ID");
            Integer total = Integer.valueOf(dataMap.getString("TOTAL"));
            //暂定前台传来的数据是 5元 10元 整数
            //折合的金币
            int balance = total / 10;
            //total_fee  以分为单位
            int total_fee = total;
            //生成订单号
            String out_trade_no = ShortUUID.orderUUID();

            dataMap.put("GOLD_NUM",balance);
            dataMap.put("TOTAL_FEE",total_fee);
            dataMap.put("OUT_TRADE_NO",out_trade_no);
            //继承ApiBaseController  用this.getRequestIpAddress() 获取IP
            dataMap.put("IP", this.getRequestIpAddress());
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
            unifiedorder.setSpbill_create_ip(this.getRequestIpAddress());

            //获取openid
            unifiedorder.setOpenid(wechatUser.getString("WXAPPOPENID"));
            // 生成预付单 统一支付
            PrePayReSign prePayReSign = wechatAppProxy.createPrePayInfo(unifiedorder);
            if(prePayReSign != null){
                rechargeService.addRecharge(dataMap);

            }else{
                String massage  ="网路繁忙,下单失败!请稍后重试";
                return InvokeResult.failure(massage);
            }
            return InvokeResult.success(prePayReSign);
        }
    }
}
