package com.cms4j.plant.yf.yf.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.plant.yf.yf.service.YfService;
import com.cms4j.base.util.*;
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
* Description: YfApiController
* Created by zmj on 2017/09/18.
*/
@RestController
@RequestMapping(value = "/admin/yf/api")
public class YfApiController extends ApiBaseController {
    public YfApiController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "19";
    }

    @Autowired
    private YfService yfService;

    /**
    * 获取一分一档分页数据
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/getyfs", method = RequestMethod.POST)
    public PageDto getUsers() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.QUERY_QX))
        return new PageDto();
        logger.begin("获取一分一档分页数据");
        DataMap dataMap = this.getDataMap();
        Page page = new Page();
        page.setParams(dataMap);
        page.setPageNumber(Integer.valueOf(dataMap.getString("iDisplayStart")) / Integer.valueOf(dataMap.getString("iDisplayLength")));
        page.setPageSize(Integer.valueOf(dataMap.getString("iDisplayLength")));
        List<DataMap> yfs = yfService.getYfs(page);
        page.setResults(yfs);
        logger.end();

        return PageConverter.toPageDto(page, Integer.valueOf(dataMap.getString("sEcho")));
    }

    /**
    * 批量删除一分一档
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/batchremoves", method = RequestMethod.POST)
    public InvokeResult batchRemoves() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.DEL_QX))
        return this.interceptorJurisdiction();

        logger.begin("批量删除一分一档");
        DataMap dataMap = this.getDataMap();
        yfService.batchRemoves(dataMap.getString("batchremoves"));
        logger.end();
        return InvokeResult.success();
    }

    /**
    * 新增一分一档
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public InvokeResult add(@RequestParam(required = false, name = "FILE") MultipartFile file) throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.ADD_QX))
        return this.interceptorJurisdiction();

        DataMap dataMap = this.getDataMap();
        if(file != null){
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
            if(!".xls".equals(suffixName)){
                return InvokeResult.failure("文件类型不正确！");
            }
        }
        if(yfService.addYf(dataMap, file))
            return InvokeResult.success();


        return InvokeResult.failure("保存失败！");
    }

    /**
    * 编辑一分一档
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public InvokeResult edit() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.EDIT_QX))
        return this.interceptorJurisdiction();

        logger.begin("编辑一分一档");
        DataMap dataMap = this.getDataMap();

        yfService.editYf(dataMap);
        logger.end();
        return InvokeResult.success();
    }
}