package com.cms4j.plant.major.major.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.plant.major.major.service.MajorService;
import com.cms4j.base.util.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

/**
* Description: MajorApiController
* Created by zmj on 2017/09/13.
*/
@RestController
@RequestMapping(value = "/admin/major/api")
public class MajorApiController extends ApiBaseController {
    public MajorApiController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "18";
    }

    @Autowired
    private MajorService majorService;
    @Autowired
    private DictionaryService dictionaryService;

    /**
    * 获取专业分页数据
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/getmajors", method = RequestMethod.POST)
    public PageDto getUsers() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.QUERY_QX))
        return new PageDto();
        logger.begin("获取专业分页数据");
        DataMap dataMap = this.getDataMap();
        Page page = new Page();
        page.setParams(dataMap);
        page.setPageNumber(Integer.valueOf(dataMap.getString("iDisplayStart")) / Integer.valueOf(dataMap.getString("iDisplayLength")));
        page.setPageSize(Integer.valueOf(dataMap.getString("iDisplayLength")));
        List<DataMap> majors = majorService.getMajors(page);
        page.setResults(majors);
        logger.end();

        return PageConverter.toPageDto(page, Integer.valueOf(dataMap.getString("sEcho")));
    }

    /**
    * 批量删除专业
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/batchremoves", method = RequestMethod.POST)
    public InvokeResult batchRemoves() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.DEL_QX))
        return this.interceptorJurisdiction();

        logger.begin("批量删除专业");
        DataMap dataMap = this.getDataMap();
        majorService.batchRemoves(dataMap.getString("batchremoves"));
        logger.end();
        return InvokeResult.success();
    }

    /**
    * 新增专业
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public InvokeResult add() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.ADD_QX))
        return this.interceptorJurisdiction();

        logger.begin("新增专业");
        DataMap dataMap = this.getDataMap();
        if(StringUtils.isBlank(dataMap.getString("DIC_ID"))) return InvokeResult.failure("专业名称不能为空！");
        DataMap major = dictionaryService.getDictionaryById(dataMap);
        if(major == null) return InvokeResult.failure("该专业不存在！");
        major = majorService.getMajorByMajorId(dataMap);
        if(major != null) return InvokeResult.failure("该专业已存在！");
        majorService.addMajor(dataMap);
        logger.end();
        return InvokeResult.success();
    }

    /**
    * 编辑专业
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public InvokeResult edit() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.EDIT_QX))
        return this.interceptorJurisdiction();

        logger.begin("编辑专业");
        DataMap dataMap = this.getDataMap();

        majorService.editMajor(dataMap);
        logger.end();
        return InvokeResult.success();
    }
}