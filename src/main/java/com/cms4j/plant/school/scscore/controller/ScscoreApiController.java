package com.cms4j.plant.school.scscore.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.plant.school.scscore.service.ScscoreService;
import com.cms4j.base.util.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

/**
* Description: ScscoreApiController
* Created by zmj on 2017/08/03.
*/
@RestController
@RequestMapping(value = "/admin/scscore/api")
public class ScscoreApiController extends ApiBaseController {
    public ScscoreApiController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "11";
    }

    @Autowired
    private ScscoreService scscoreService;

    /**
    * 新增院校录取分
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public InvokeResult add() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.ADD_QX))
        return this.interceptorJurisdiction();

        logger.begin("新增院校录取分");
        DataMap dataMap = this.getDataMap();
        scscoreService.addScscores(dataMap);
        logger.end();
        return InvokeResult.success();
    }

    @RequestMapping(value = "/batchremoves", method = RequestMethod.POST)
    public InvokeResult batchRemoves() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.DEL_QX))
            return this.interceptorJurisdiction();
        logger.begin("批量删除院校录取分");
        DataMap dataMap = this.getDataMap();
        scscoreService.batchRemoves(dataMap.getString("batchremoves"));
        logger.end();
        return InvokeResult.success();
    }
}