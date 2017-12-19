package com.cms4j.plant.major.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.Page;
import com.cms4j.plant.major.major.service.MajorService;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = {"/plant/major/api", "/wechat/applet/major"})
public class MajorPageApiController extends ApiBaseController {

    @Autowired
    private MajorService majorService;

    @RequestMapping(value = "/getmajors", method = RequestMethod.POST)
    public Page getmajors() throws Exception {
        DataMap dataMap = this.getDataMap();
        Page page = new Page();
        if(StringUtils.isBlank(dataMap.getString("CODE"))) dataMap.put("CODE", PlantConst.MAJOR_BK);
        if(StringUtils.isBlank(dataMap.getString("PARENT_ID")))
            dataMap.put("PARENT_ID", null);
            if(StringUtils.isBlank(dataMap.getString("NAME")))
            dataMap.put("NAME", null);

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
        page.setPageSize(2);

        List<DataMap> majors = majorService.getPageMajors(page);
        page.setResults(majors);
        return page;
    }

    @RequestMapping(value = "/addview", method = RequestMethod.POST)
    public InvokeResult addView() throws Exception {
        DataMap dataMap = this.getDataMap();

        majorService.viewMajor(dataMap);

        return InvokeResult.success();
    }
}
