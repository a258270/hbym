package com.cms4j.plant.util;

import com.aliyun.mns.client.CloudAccount;
import com.aliyun.mns.client.CloudTopic;
import com.aliyun.mns.client.MNSClient;
import com.aliyun.mns.common.ServiceException;
import com.aliyun.mns.model.BatchSmsAttributes;
import com.aliyun.mns.model.MessageAttributes;
import com.aliyun.mns.model.RawTopicMessage;
import com.aliyun.mns.model.TopicMessage;

public class SMSUtil {
    public static String ACCESS_KEY_ID = "LTAIxpxTwrvMMjoT";
    public static String ACCESS_KEY_SECRET = "cC2Qum6DsJuA54110JEWzm2CzWjMrz";
    public static String END_POINT = "http://1629688947633769.mns.cn-beijing.aliyuncs.com/";
    public static String TOPIC_REF = "sms.topic-cn-beijing";
    public static String SIGN_NAME = "铭邦高考志愿网";
    public static String TEMPLATE_CODE = "SMS_107030003";

    public static void sendMessages(String phone, String code) {
        /**
         * Step 1. 获取主题引用
         */
        CloudAccount account = new CloudAccount(ACCESS_KEY_ID, ACCESS_KEY_SECRET, END_POINT);
        MNSClient client = account.getMNSClient();
        CloudTopic topic = client.getTopicRef(TOPIC_REF);
        /**
         * Step 2. 设置SMS消息体（必须）
         *
         * 注：目前暂时不支持消息内容为空，需要指定消息内容，不为空即可。
         */
        RawTopicMessage msg = new RawTopicMessage();
        msg.setMessageBody("sms-message");
        /**
         * Step 3. 生成SMS消息属性
         */
        MessageAttributes messageAttributes = new MessageAttributes();
        BatchSmsAttributes batchSmsAttributes = new BatchSmsAttributes();
        // 3.1 设置发送短信的签名（SMSSignName）
        batchSmsAttributes.setFreeSignName(SIGN_NAME);
        // 3.2 设置发送短信使用的模板（SMSTempateCode）
        batchSmsAttributes.setTemplateCode(TEMPLATE_CODE);
        // 3.3 设置发送短信所使用的模板中参数对应的值（在短信模板中定义的，没有可以不用设置）
        BatchSmsAttributes.SmsReceiverParams smsReceiverParams = new BatchSmsAttributes.SmsReceiverParams();
        smsReceiverParams.setParam("code", code);
        // 3.4 增加接收短信的号码
        batchSmsAttributes.addSmsReceiver(phone, smsReceiverParams);
        messageAttributes.setBatchSmsAttributes(batchSmsAttributes);
        try {
            /**
             * Step 4. 发布SMS消息
             */
            TopicMessage ret = topic.publishMessage(msg, messageAttributes);
            System.out.println("MessageId: " + ret.getMessageId());
            System.out.println("MessageMD5: " + ret.getMessageBodyMD5());
        } catch (ServiceException se) {
            System.out.println(se.getErrorCode() + se.getRequestId());
            System.out.println(se.getMessage());
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        client.close();
    }
}
