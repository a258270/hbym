package com.cms4j.plant.sitesetting.shiplink.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.plugin.BaseSetting;
import com.cms4j.plant.sitesetting.shiplink.service.ShiplinkService;
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
* Description: ShiplinkApiController
* Created by zmj on 2017/08/15.
*/
@RestController
@RequestMapping(value = "/admin/shiplink/api")
public class ShiplinkApiController extends ApiBaseController {
    public ShiplinkApiController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "15";
    }

    @Autowired
    private ShiplinkService shiplinkService;

    @Autowired
    private BaseSetting baseSetting;

    /**
    * 获取友情链接分页数据
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/getshiplinks", method = RequestMethod.POST)
    public PageDto getUsers() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.QUERY_QX))
        return new PageDto();
        logger.begin("获取友情链接分页数据");
        DataMap dataMap = this.getDataMap();
        if(StringUtils.isBlank(dataMap.getString("NAME")))
            dataMap.put("NAME", null);
        Page page = new Page();
        page.setParams(dataMap);
        page.setPageNumber(Integer.valueOf(dataMap.getString("iDisplayStart")) / Integer.valueOf(dataMap.getString("iDisplayLength")));
        page.setPageSize(Integer.valueOf(dataMap.getString("iDisplayLength")));
        List<DataMap> shiplinks = shiplinkService.getShiplinks(page);
        page.setResults(shiplinks);
        logger.end();

        return PageConverter.toPageDto(page, Integer.valueOf(dataMap.getString("sEcho")));
    }

    /**
    * 批量删除友情链接
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/batchremoves", method = RequestMethod.POST)
    public InvokeResult batchRemoves() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.DEL_QX))
        return this.interceptorJurisdiction();

        logger.begin("批量删除友情链接");
        DataMap dataMap = this.getDataMap();
        shiplinkService.batchRemoves(dataMap.getString("batchremoves"));
        logger.end();
        return InvokeResult.success();
    }

    /**
    * 新增友情链接
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public InvokeResult add(@RequestParam(required = false, name = "LOGO") MultipartFile file) throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.ADD_QX))
        return this.interceptorJurisdiction();

        logger.begin("新增友情链接");
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
            dataMap.put("LOGO", "/plant/file/download/" + s);
        }
        else{
            dataMap.put("LOGO", PlantConst.STATIC_IMG_NONE);
        }
        shiplinkService.addShiplink(dataMap);
        logger.end();
        return InvokeResult.success();
    }

    /**
    * 编辑友情链接
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public InvokeResult edit() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.EDIT_QX))
        return this.interceptorJurisdiction();

        logger.begin("编辑友情链接");
        DataMap dataMap = this.getDataMap();

        shiplinkService.editShiplink(dataMap);
        logger.end();
        return InvokeResult.success();
    }
}