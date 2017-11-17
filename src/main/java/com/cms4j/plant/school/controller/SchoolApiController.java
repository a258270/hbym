package com.cms4j.plant.school.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.plugin.BaseSetting;
import com.cms4j.plant.school.service.SchoolService;
import com.cms4j.base.util.*;
import com.cms4j.plant.util.PlantConst;
import com.cms4j.plant.util.PlantValidUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

/**
* Description: SchoolApiController
* Created by zmj on 2017/07/24.
*/
@RestController
@RequestMapping(value = "/admin/school/api")
public class SchoolApiController extends ApiBaseController {
    public SchoolApiController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "11";
    }

    @Autowired
    private SchoolService schoolService;

    @Autowired
    private BaseSetting baseSetting;
    /**
    * 获取院校信息分页数据
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/getschools", method = RequestMethod.POST)
    public PageDto getUsers() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.QUERY_QX))
        return new PageDto();
        logger.begin("获取院校信息分页数据");
        DataMap dataMap = this.getDataMap();
        if(StringUtils.isBlank(dataMap.getString("NAME")))
            dataMap.put("NAME", null);
        if(StringUtils.isBlank(dataMap.getString("PROVINCE")))
            dataMap.put("PROVINCE", null);
        if(StringUtils.isBlank(dataMap.getString("SCTYPE")))
            dataMap.put("SCTYPE", null);
        Page page = new Page();
        page.setParams(dataMap);
        page.setPageNumber(Integer.valueOf(dataMap.getString("iDisplayStart")) / Integer.valueOf(dataMap.getString("iDisplayLength")));
        page.setPageSize(Integer.valueOf(dataMap.getString("iDisplayLength")));
        List<DataMap> schools = schoolService.getSchools(page);
        page.setResults(schools);
        logger.end();

        return PageConverter.toPageDto(page, Integer.valueOf(dataMap.getString("sEcho")));
    }

    /**
    * 批量删除院校信息
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/batchremoves", method = RequestMethod.POST)
    public InvokeResult batchRemoves() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.DEL_QX))
        return this.interceptorJurisdiction();

        logger.begin("批量删除院校信息");
        DataMap dataMap = this.getDataMap();
        schoolService.batchRemoves(dataMap.getString("batchremoves"));
        logger.end();
        return InvokeResult.success();
    }

    /**
    * 新增院校信息
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public InvokeResult add(@RequestParam(required = false, name = "HEADURL") MultipartFile file, @RequestParam(required = false, name = "LHEADURL") MultipartFile file2) throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.ADD_QX))
        return this.interceptorJurisdiction();

        logger.begin("新增院校信息");
        DataMap dataMap = this.getDataMap();
        if(file != null){
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
            if(!PlantValidUtil.isImgSuffix(suffixName)){
                return InvokeResult.failure(PlantValidUtil.ERROR_MSG_IMGSUFFIX);
            }
            String s = ShortUUID.randomUUID() + suffixName;
            String path = baseSetting.getSc_head() + "/" + s;
            File dest = new File(path);
            // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            file.transferTo(dest);
            dataMap.put("HEADURL", "/plant/schead/download/" + s);
        }
        else{
            dataMap.put("HEADURL", PlantConst.STATIC_IMG_NONE);
        }

        if(file2 != null) {
            String fileName = file2.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
            String s = ShortUUID.randomUUID() + suffixName;
            String path = baseSetting.getSc_head() + "/" + s;
            File dest = new File(path);
            // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            file2.transferTo(dest);
            dataMap.put("LHEADURL", "/plant/schead/download/" + s);
        }
        else{
            dataMap.put("LHEADURL", PlantConst.STATIC_IMG_NONE);
        }
        schoolService.addSchool(dataMap);
        logger.end();
        return InvokeResult.success();
    }

    /**
    * 编辑院校信息
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public InvokeResult edit(@RequestParam(required = false, name = "HEADURL") MultipartFile file, @RequestParam(required = false, name = "LHEADURL") MultipartFile file2) throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.EDIT_QX))
        return this.interceptorJurisdiction();

        logger.begin("编辑院校信息");
        DataMap dataMap = this.getDataMap();

        if(file != null){
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
            if(!PlantValidUtil.isImgSuffix(suffixName)){
                return InvokeResult.failure(PlantValidUtil.ERROR_MSG_IMGSUFFIX);
            }
            String s = ShortUUID.randomUUID() + suffixName;
            String path = baseSetting.getSc_head() + "/" + s;
            File dest = new File(path);
            // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            file.transferTo(dest);
            dataMap.put("HEADURL", "/plant/schead/download/" + s);
        }
        else{
            DataMap scTmp = schoolService.getSchoolById(dataMap);
            dataMap.put("HEADURL", scTmp.getString("HEADURL"));
        }

        if(file2 != null){
            String fileName = file2.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
            String s = ShortUUID.randomUUID() + suffixName;
            String path = baseSetting.getSc_head() + "/" + s;
            File dest = new File(path);
            // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            file2.transferTo(dest);
            dataMap.put("LHEADURL", "/plant/schead/download/" + s);
        }
        else{
            DataMap scTmp = schoolService.getSchoolById(dataMap);
            dataMap.put("LHEADURL", scTmp.getString("LHEADURL"));
        }
        schoolService.editSchool(dataMap);
        logger.end();
        return InvokeResult.success();
    }

    @RequestMapping(value = "/editbasic")
    public InvokeResult editBasic() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.EDIT_QX))
            return this.interceptorJurisdiction();

        logger.begin("编辑院校基础信息");
        DataMap dataMap = this.getDataMap();

        schoolService.editBasic(dataMap);

        logger.end();
        return InvokeResult.success();
    }
}