package com.cms4j.base.system.user.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.system.user.service.UserService;
import com.cms4j.base.util.*;
import com.cms4j.plant.user.service.CompleteTeacherService;
import com.cms4j.plant.user.service.PlantUserService;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/admin/teacher/api")
public class TeacherApiController extends ApiBaseController {

    @Autowired
    private PlantUserService plantUserService;
    @Autowired
    private CompleteTeacherService completeTeacherService;

    public TeacherApiController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "21";
    }

    @RequestMapping(value = "/getteachers")
    public PageDto getteachers() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.QUERY_QX))
            return new PageDto();
        logger.begin("获取用户分页数据");
        DataMap dataMap = this.getDataMap();

        Page page = new Page();
        page.setParams(dataMap);
        page.setPageNumber(Integer.valueOf(dataMap.getString("iDisplayStart")) / Integer.valueOf(dataMap.getString("iDisplayLength")));
        page.setPageSize(Integer.valueOf(dataMap.getString("iDisplayLength")));
        List<DataMap> users = plantUserService.getTeachers(page);
        page.setResults(users);
        logger.end();

        return PageConverter.toPageDto(page, Integer.valueOf(dataMap.getString("sEcho")));
    }

    @RequestMapping(value = "/add")
    public InvokeResult add() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.ADD_QX))
            return this.interceptorJurisdiction();

        DataMap dataMap = this.getDataMap();

        if(plantUserService.getUserByUsername(dataMap) != null)
            return InvokeResult.failure("该用户名已存在！");

        if(StringUtils.isBlank(dataMap.getString("PASSWORD")))
            return InvokeResult.failure("密码不能为空！");

        if(StringUtils.isBlank(dataMap.getString("REPASSWORD")))
            return InvokeResult.failure("确认密码不能为空！");

        if(!dataMap.getString("PASSWORD").equals(dataMap.getString("REPASSWORD")))
            return InvokeResult.failure("两次密码输入不一致！");

        plantUserService.addTeacher(dataMap);
        return InvokeResult.success();
    }

    /**
     * 批量冻结用户
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/batchremoves", method = RequestMethod.POST)
    public InvokeResult batchRemoves() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.DEL_QX))
            return this.interceptorJurisdiction();

        logger.begin("批量冻结用户");
        DataMap dataMap = this.getDataMap();
        plantUserService.batchRemoves(dataMap.getString("batchremoves"));
        logger.end();
        return InvokeResult.success();
    }

    /**
     * 解冻用户
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/unremove", method = RequestMethod.POST)
    public InvokeResult unRemove() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.DEL_QX))
            return this.interceptorJurisdiction();

        logger.begin("解冻用户");
        DataMap dataMap = this.getDataMap();
        plantUserService.unRemove(dataMap);
        logger.end();
        return InvokeResult.success();
    }

    @RequestMapping(value = "/edit/{id}")
    public InvokeResult edit(@PathVariable String id) throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.DEL_QX))
            return this.interceptorJurisdiction();

        logger.begin("编辑教师信息");

        DataMap dataMap = this.getDataMap();
        dataMap.put("USER_ID", id);

        if(StringUtils.isBlank(dataMap.getString("PASSWORD")) && !StringUtils.isBlank(dataMap.getString("REPASSWORD")))
            return InvokeResult.failure("密码不能为空！");

        if(!StringUtils.isBlank(dataMap.getString("PASSWORD")) && StringUtils.isBlank(dataMap.getString("REPASSWORD")))
            return InvokeResult.failure("确认密码不能为空！");

        if(!StringUtils.isBlank(dataMap.getString("PASSWORD")) && !StringUtils.isBlank(dataMap.getString("REPASSWORD"))){
            if(!dataMap.getString("PASSWORD").equals(dataMap.getString("REPASSWORD"))) return InvokeResult.failure("两次密码输入不一致！");
            dataMap.put("PASSWORD", MD5Util.getMD5(dataMap.getString("PASSWORD")));
            plantUserService.updatePassword(dataMap);
        }

        completeTeacherService.editCompleteTeacher(dataMap);

        logger.end();
        return InvokeResult.success();
    }
}
