package com.cms4j.plant.recharge.service;

import com.cms4j.base.util.DateUtil;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Timer {
    @Scheduled(cron = "0 0/1 * * * ?")
    public  void  timers(){
        int i = 0 ;
        i++;
        System.out.println(i);
        System.out.println(DateUtil.getCurrentTime());

    }

}
