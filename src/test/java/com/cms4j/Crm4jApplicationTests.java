package com.cms4j;

import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.ShortUUID;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.UUID;



public class Crm4jApplicationTests {

	@Test
	public void contextLoads() {
	}
	@Test
	public  void orderNum(){
		String uuid = ShortUUID.randomUUID();
		String date = DateUtil.date2Str(new Date(), "yyMMddHHmmss");

		String orderNumber =date + uuid;
		System.out.println(orderNumber);

	}
	@Test
	public void orderNum2(){
		//保证订单号 唯一
		StringBuilder sb = new StringBuilder();
		String date = DateUtil.date2Str(new Date(), "yyMMddHHmmss");
		String uuid = ShortUUID.randomUUID();
		//统一转化成大写字母，保证是订单长度统一  32 位
		String UpUuid = uuid.toUpperCase();
		char[] chars = UpUuid.toCharArray();
		for(int m :chars){sb.append(m);}
		String order = sb + date;


	}

}
