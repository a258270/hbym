package com.cms4j.wechat.applet.complete_tea.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.plant.user.service.CompleteTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = "wechat/applet/complete_tea")
public class WeAppComplete_teaController extends ApiBaseController {


    @Autowired
    private CompleteTeacherService completeTeacherService;

    @RequestMapping(value = "/get" ,method = RequestMethod.POST)
    public InvokeResult getCompletTeacher()throws  Exception {
        DataMap dataMap= this.getDataMap();
        List<DataMap> list = completeTeacherService.getCompleteTeacherByScId(dataMap);

        return InvokeResult.success(list);
    }
}
