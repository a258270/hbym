package com.cms4j.wechat.applet.dictionary.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/wechat/applet/dictionary")
public class WechatAppDictionaryController extends ApiBaseController {

    @Autowired
    private DictionaryService dictionaryService;

    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public InvokeResult getDictionaries() throws Exception {
        DataMap dataMap = this.getDataMap();
        String[] params = {"code"};
        if(!this.validParams(params, dataMap))
            return this.validFailure();

        DataMap fatherDic = new DataMap();
        fatherDic.put("CODE", dataMap.getString("code"));
        fatherDic = dictionaryService.getDictionaryByCode(fatherDic);
        List<DataMap> results = dictionaryService.getDictionariesByFatherId(fatherDic);

        return InvokeResult.success(results);
    }
}
