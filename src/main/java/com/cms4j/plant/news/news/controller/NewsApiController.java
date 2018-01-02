package com.cms4j.plant.news.news.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.plugin.BaseSetting;
import com.cms4j.plant.news.news.service.NewsService;
import com.cms4j.base.util.*;
import com.cms4j.plant.util.PlantConst;
import com.cms4j.plant.util.PlantValidUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

/**
* Description: NewsApiController
* Created by zmj on 2017/08/14.
*/
@RestController
@RequestMapping(value = "/admin/news/api")
public class NewsApiController extends ApiBaseController {
    public NewsApiController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "14";
    }

    @Autowired
    private NewsService newsService;

    @Autowired
    private BaseSetting baseSetting;

    /**
    * 获取新闻分页数据
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/getnewss", method = RequestMethod.POST)
    public PageDto getUsers() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.QUERY_QX))
        return new PageDto();
        logger.begin("获取新闻分页数据");
        DataMap dataMap = this.getDataMap();
        if(StringUtils.isBlank(dataMap.getString("TITLE"))){
            dataMap.put("TITLE", null);
        }
        if(StringUtils.isBlank(dataMap.getString("NEWSTYPE"))){
            dataMap.put("NEWSTYPE", null);
        }
        Page page = new Page();
        page.setParams(dataMap);
        page.setPageNumber(Integer.valueOf(dataMap.getString("iDisplayStart")) / Integer.valueOf(dataMap.getString("iDisplayLength")));
        page.setPageSize(Integer.valueOf(dataMap.getString("iDisplayLength")));
        List<DataMap> newss = newsService.getNewss(page);
        page.setResults(newss);
        logger.end();

        return PageConverter.toPageDto(page, Integer.valueOf(dataMap.getString("sEcho")));
    }

    /**
    * 批量删除新闻
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/batchremoves", method = RequestMethod.POST)
    public InvokeResult batchRemoves() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.DEL_QX))
        return this.interceptorJurisdiction();

        logger.begin("批量删除新闻");
        DataMap dataMap = this.getDataMap();
        newsService.batchRemoves(dataMap.getString("batchremoves"));
        logger.end();
        return InvokeResult.success();
    }

    /**
    * 新增新闻
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public InvokeResult add(@RequestParam(required = false, name = "IMGURL") MultipartFile file) throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.ADD_QX))
        return this.interceptorJurisdiction();

        logger.begin("新增新闻");
        DataMap dataMap = this.getDataMap();
        if(file != null){
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
            if(!PlantValidUtil.isImgSuffix(suffixName)){
                return InvokeResult.failure(PlantValidUtil.ERROR_MSG_IMGSUFFIX);
            }
            String s = ShortUUID.randomUUID() + suffixName;
            String path = baseSetting.getUpload_path() + "/" + s;
            File dest = new File(path);
            // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            file.transferTo(dest);
            dataMap.put("IMGURL", "/plant/file/download/" + s);
        }
        dataMap.put("AUTHOR", SessionUtil.getCurAdminUser().getString("USERNAME"));
        if(!StringUtils.isBlank(dataMap.getString("ABSTRACT"))) {
            if(dataMap.getString("ABSTRACT").length() > 230) {
                return InvokeResult.failure("摘要至多230个字符！");
            }
        }
        newsService.addNews(dataMap);
        logger.end();
        return InvokeResult.success();
    }

    /**
    * 编辑新闻
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public InvokeResult edit(@RequestParam(required = false, name = "IMGURL") MultipartFile file) throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.EDIT_QX))
        return this.interceptorJurisdiction();

        logger.begin("编辑新闻");
        DataMap dataMap = this.getDataMap();

        if(file != null){
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
            if(!PlantValidUtil.isImgSuffix(suffixName)){
                return InvokeResult.failure(PlantValidUtil.ERROR_MSG_IMGSUFFIX);
            }
            String s = ShortUUID.randomUUID() + suffixName;
            String path = baseSetting.getUpload_path() + "/" + s;
            File dest = new File(path);
            // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            file.transferTo(dest);
            dataMap.put("IMGURL", "/plant/file/download/" + s);
        }

        if(!StringUtils.isBlank(dataMap.getString("ABSTRACT"))) {
            if(dataMap.getString("ABSTRACT").length() > 230) {
                return InvokeResult.failure("摘要至多230个字符！");
            }
        }
        newsService.editNews(dataMap);
        logger.end();
        return InvokeResult.success();
    }
}