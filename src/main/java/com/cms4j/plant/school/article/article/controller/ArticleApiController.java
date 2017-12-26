package com.cms4j.plant.school.article.article.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.plugin.BaseSetting;
import com.cms4j.plant.school.article.article.service.ArticleService;
import com.cms4j.base.util.*;
import com.cms4j.plant.util.PlantConst;
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
* Description: ArticleApiController
* Created by zmj on 2017/12/25.
*/
@RestController
@RequestMapping(value = "/admin/article/api")
public class ArticleApiController extends ApiBaseController {
    public ArticleApiController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "25";
    }

    @Autowired
    private ArticleService articleService;

    @Autowired
    private BaseSetting baseSetting;

    /**
    * 获取院校资料分页数据
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/getarticles", method = RequestMethod.POST)
    public PageDto getUsers() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.QUERY_QX))
        return new PageDto();
        logger.begin("获取院校资料分页数据");
        DataMap dataMap = this.getDataMap();
        if(StringUtils.isBlank(dataMap.getString("SCHOOL_ID")))
            dataMap.put("SCHOOL_ID", null);
        Page page = new Page();
        page.setParams(dataMap);
        page.setPageNumber(Integer.valueOf(dataMap.getString("iDisplayStart")) / Integer.valueOf(dataMap.getString("iDisplayLength")));
        page.setPageSize(Integer.valueOf(dataMap.getString("iDisplayLength")));
        List<DataMap> articles = articleService.getArticles(page);
        page.setResults(articles);
        logger.end();

        return PageConverter.toPageDto(page, Integer.valueOf(dataMap.getString("sEcho")));
    }

    /**
    * 批量删除院校资料
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/batchremoves", method = RequestMethod.POST)
    public InvokeResult batchRemoves() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.DEL_QX))
        return this.interceptorJurisdiction();

        logger.begin("批量删除院校资料");
        DataMap dataMap = this.getDataMap();
        articleService.batchRemoves(dataMap.getString("batchremoves"));
        logger.end();
        return InvokeResult.success();
    }

    /**
    * 新增院校资料
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public InvokeResult add(@RequestParam(required = false, name = "IMGURL") MultipartFile file) throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.ADD_QX))
        return this.interceptorJurisdiction();

        logger.begin("新增院校资料");
        DataMap dataMap = this.getDataMap();

        if(file != null){
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
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
        else{
            dataMap.put("IMGURL", PlantConst.STATIC_IMG_NONE);
        }

        articleService.addArticle(dataMap);
        logger.end();
        return InvokeResult.success();
    }

    /**
    * 编辑院校资料
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public InvokeResult edit(@RequestParam(required = false, name = "IMGURL") MultipartFile file) throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.EDIT_QX))
        return this.interceptorJurisdiction();

        logger.begin("编辑院校资料");
        DataMap dataMap = this.getDataMap();

        if(file != null){
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
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
        else{
            DataMap item = articleService.getArticleById(dataMap);
            dataMap.put("IMGURL", item.getString("IMGURL"));
        }

        articleService.editArticle(dataMap);
        logger.end();
        return InvokeResult.success();
    }
}