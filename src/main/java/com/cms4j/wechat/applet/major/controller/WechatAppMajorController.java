package com.cms4j.wechat.applet.major.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.plant.school.service.HasmajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/wechat/applet/major")
public class WechatAppMajorController extends ApiBaseController {

    @Autowired
    private HasmajorService hasmajorService;
    @RequestMapping(value = "/get")
    public InvokeResult get() throws Exception {
        DataMap dataMap = this.getDataMap();

        return InvokeResult.success(hasmajorService.getHasmajorByScId(dataMap));
    }
}
