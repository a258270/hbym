package com.cms4j.wechat.applet.news.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.Page;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.news.news.service.NewsService;
import com.cms4j.plant.news.news.service.NewsViewService;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.xml.crypto.Data;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/wechat/applet/news")
public class WechatAppNewsController extends ApiBaseController {

    @Autowired
    private NewsService newsService;
    @Autowired
    private NewsViewService newsViewService;

    @RequestMapping(value = "/get")
    public InvokeResult getNews() throws Exception {
        DataMap dataMap = this.getDataMap();


        return InvokeResult.success(newsService.getNewssForWechatApp(dataMap));
    }

    @RequestMapping(value = "/getnewsbyid")
    public InvokeResult getNewsById() throws Exception {
        DataMap dataMap = this.getDataMap();
        dataMap = newsService.getNewsById(dataMap);
        newsService.addViewCount(dataMap);
        return InvokeResult.success(dataMap);
    }

    @RequestMapping(value = "/addggnewsview")
    public InvokeResult addGGNewsView() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser != null) {
            DataMap param = new DataMap();
            param.put("NEWSTYPE", PlantConst.NEWSTYPE_GG);
            List<DataMap> ggs = newsService.getNewsByType(param);
            if(ggs != null) {
                for(DataMap gg : ggs) {
                    gg.put("USER_ID", curUser.getString("USER_ID"));

                    newsViewService.addNewsView(gg);
                }
            }
        }
        return InvokeResult.success();
    }
}
