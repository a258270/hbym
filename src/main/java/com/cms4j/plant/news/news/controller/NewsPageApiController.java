package com.cms4j.plant.news.news.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.Page;
import com.cms4j.base.util.PageDto;
import com.cms4j.plant.news.news.service.NewsService;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/plant/news/api")
public class NewsPageApiController extends ApiBaseController {

    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "/getnews")
    public InvokeResult getNews() throws Exception {
        DataMap dataMap = this.getDataMap();
        Page page = new Page();
        Map params = new HashMap();
        if(StringUtils.isBlank(dataMap.getString("TITLE"))) dataMap.put("TITLE", null);
        page.setParams(dataMap);

        if(StringUtils.isBlank(dataMap.getString("currentPage"))) dataMap.put("currentPage", "0");
        else{
            try{
                Integer currentPage = Integer.valueOf(dataMap.getString("currentPage"));
                currentPage--;
                if(currentPage < 0) currentPage = 0;
                dataMap.put("currentPage", currentPage);
            }
            catch (Exception e) {
                dataMap.put("currentPage", "0");
            }
        }
        page.setPageNumber(Integer.valueOf(dataMap.getString("currentPage")));
        page.setPageSize(10);

        List<DataMap> news = newsService.getNewss(page);
        page.setResults(news);
        return InvokeResult.success(page);
    }
}
