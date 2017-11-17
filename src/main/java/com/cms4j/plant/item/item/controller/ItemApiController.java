package com.cms4j.plant.item.item.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.plugin.BaseSetting;
import com.cms4j.plant.item.item.service.ItemService;
import com.cms4j.base.util.*;
import com.cms4j.plant.item.item.service.ItemStoreUpService;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

/**
* Description: ItemApiController
* Created by zmj on 2017/08/21.
*/
@RestController
@RequestMapping(value = "/admin/item/api")
public class ItemApiController extends ApiBaseController {
    public ItemApiController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "16";
    }

    @Autowired
    private ItemService itemService;

    @Autowired
    private BaseSetting baseSetting;

    @Autowired
    private ItemStoreUpService itemStoreUpService;

    /**
    * 获取商品分页数据
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/getitems", method = RequestMethod.POST)
    public PageDto getUsers() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.QUERY_QX))
        return new PageDto();
        logger.begin("获取商品分页数据");
        DataMap dataMap = this.getDataMap();
        if(StringUtils.isBlank(dataMap.getString("NAME")))
            dataMap.put("NAME", null);
        if(StringUtils.isBlank(dataMap.getString("PRICE")))
            dataMap.put("PRICE", null);
        if(StringUtils.isBlank(dataMap.getString("ISSALE")))
            dataMap.put("ISSALE", null);
        if(StringUtils.isBlank(dataMap.getString("ITEMTYPE")))
            dataMap.put("ITEMTYPE", null);
        if(StringUtils.isBlank(dataMap.getString("ITEMPROPERTY")))
            dataMap.put("ITEMPROPERTY", null);
        Page page = new Page();
        page.setParams(dataMap);
        page.setPageNumber(Integer.valueOf(dataMap.getString("iDisplayStart")) / Integer.valueOf(dataMap.getString("iDisplayLength")));
        page.setPageSize(Integer.valueOf(dataMap.getString("iDisplayLength")));
        List<DataMap> items = itemService.getItems(page);
        page.setResults(items);
        logger.end();

        return PageConverter.toPageDto(page, Integer.valueOf(dataMap.getString("sEcho")));
    }

    /**
    * 批量删除商品
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/batchremoves", method = RequestMethod.POST)
    public InvokeResult batchRemoves() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.DEL_QX))
        return this.interceptorJurisdiction();

        logger.begin("批量删除商品");
        DataMap dataMap = this.getDataMap();
        itemService.batchRemoves(dataMap.getString("batchremoves"));
        logger.end();
        return InvokeResult.success();
    }

    /**
    * 新增商品
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public InvokeResult add(@RequestParam(required = false, name = "IMGURL") MultipartFile file) throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.ADD_QX))
        return this.interceptorJurisdiction();

        logger.begin("新增商品");
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
        itemService.addItem(dataMap);
        logger.end();
        return InvokeResult.success();
    }

    /**
    * 编辑商品
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public InvokeResult edit(@RequestParam(required = false, name = "IMGURL") MultipartFile file) throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.EDIT_QX))
        return this.interceptorJurisdiction();

        logger.begin("编辑商品");
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
            DataMap item = itemService.getItemById(dataMap);
            dataMap.put("IMGURL", item.getString("IMGURL"));
        }

        itemService.editItem(dataMap);
        logger.end();
        return InvokeResult.success();
    }
}