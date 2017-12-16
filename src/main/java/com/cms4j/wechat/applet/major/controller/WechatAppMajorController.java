package com.cms4j.wechat.applet.major.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.school.mjscore.service.MjscoreService;
import com.cms4j.plant.school.service.HasmajorService;
import com.cms4j.plant.user.service.ExamineeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/wechat/applet/major")
public class WechatAppMajorController extends ApiBaseController {

    @Autowired
    private HasmajorService hasmajorService;
    @Autowired
    private MjscoreService mjscoreService;
    @Autowired
    private ExamineeService examineeService;

    @RequestMapping(value = "/get")
    public InvokeResult get() throws Exception {
        DataMap dataMap = this.getDataMap();

        return InvokeResult.success(hasmajorService.getHasmajorByScId(dataMap));
    }

    @RequestMapping(value = "/getmajorbyschool")
    public InvokeResult getMajorBySchool() throws Exception {
        DataMap dataMap = this.getDataMap();
        DataMap curUser = SessionUtil.getCurUser();
        DataMap examinee = examineeService.getExamineeByUserId(curUser);
        if(examinee == null) return InvokeResult.failure("请完善考生信息");
        dataMap.put("MAJORTYPE_ID", examinee.getString("MAJORTYPE"));

        return InvokeResult.success(mjscoreService.getMjscoreBySchoolAndMajor(dataMap));
    }
}
