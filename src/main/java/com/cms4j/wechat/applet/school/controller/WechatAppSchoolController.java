package com.cms4j.wechat.applet.school.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.plant.school.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/wechat/applet/school")
public class WechatAppSchoolController extends ApiBaseController {

    @Autowired
    private SchoolService schoolService;

    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public InvokeResult getSchools() throws Exception {
        DataMap dataMap = this.getDataMap();

        return InvokeResult.success(schoolService.getLibraryOfSchools(dataMap));
    }

    @RequestMapping(value = "/gethasteachers", method = RequestMethod.POST)
    public InvokeResult getHasTeachersSchools() throws Exception {
        DataMap dataMap = this.getDataMap();

        return InvokeResult.success(schoolService.getHasTeachersSchools(dataMap));
    }
}
