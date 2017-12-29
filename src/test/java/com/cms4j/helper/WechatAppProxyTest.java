package com.cms4j.helper;

import com.cms4j.Cms4jApplication;
import com.cms4j.helper.account.PayAccount;
import com.cms4j.helper.account.WechatAppAccount;
import com.cms4j.helper.api.pay.PayApi;
import com.cms4j.helper.entity.pay.Unifiedorder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import java.io.StringReader;

import static org.junit.Assert.*;


public class WechatAppProxyTest {

    @Autowired
    private WechatAppProxy wechatAppProxy;

    @Test
    public void unifiedorder() throws Exception {


        Unifiedorder unifiedorder = new Unifiedorder();
        unifiedorder.setBody("测试body");
        unifiedorder.setOut_trade_no("1234");
        unifiedorder.setTotal_fee(123);
        unifiedorder.setSpbill_create_ip("192.168.1.1");
        unifiedorder.setOpenid("oO2X10MItAI65ZkTiay6TFo0Nors");

        PayApi payApi = new PayApi();
        PayAccount payAccount = new PayAccount("wx1b06cc20dbfe8314", "e574eaddbafe863e6b6325aa25a49042", "1480092162", "839012", "mingbanggk12345678901234567890mb", "https://www.gaokgh.com.cn");

        System.out.println(payApi.createPrePayInfo((WechatAppAccount) payAccount, unifiedorder));

        //unifiedorder.set
        System.out.println("ok");
    }

}