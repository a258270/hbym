package com.cms4j.wechat.applet.news.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.Page;
import com.cms4j.plant.news.news.service.NewsService;
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
}
