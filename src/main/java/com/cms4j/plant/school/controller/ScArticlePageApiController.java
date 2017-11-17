package com.cms4j.plant.school.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.Page;
import com.cms4j.plant.school.service.ScArticleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/plant/article/api")
public class ScArticlePageApiController extends ApiBaseController {

    @Autowired
    private ScArticleService scArticleService;

    @RequestMapping(value = "/getarticles")
    public InvokeResult getArticles() throws Exception {
        DataMap dataMap = this.getDataMap();
        Page page = new Page();
        Map params = new HashMap();
        if(StringUtils.isBlank(dataMap.getString("SCHOOL_ID"))) dataMap.put("SCHOOL_ID", null);
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

        List<DataMap> articles = scArticleService.getArticlesByScId(page);
        page.setResults(articles);
        return InvokeResult.success(page);
    }
}
