package com.cms4j.plant.card.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.JurisdictionUtil;
import com.cms4j.base.util.LoggerUtil;
import com.cms4j.plant.card.service.CardService;
import com.cms4j.plant.util.CardExcelView;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping(value = "/admin/card")
public class CardController extends PageBaseController {
    public CardController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "24";
    }

    @Autowired
    private CardService cardService;

    @Autowired
    private DictionaryService dictionaryService;

    @RequestMapping(value = "/index")
    public ModelAndView index() throws Exception {
        logger.begin("加载商品卡页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/card/index");

        DataMap province = new DataMap();
        province.put("CODE", "CARD_PROVINCE");
        province = dictionaryService.getDictionaryByCode(province);
        List<DataMap> provinces = dictionaryService.getDictionariesByFatherId(province);
        modelAndView.addObject("provinces", provinces);

        DataMap type = new DataMap();
        type.put("CODE", "CARD_TYPE");
        type = dictionaryService.getDictionaryByCode(type);
        List<DataMap> types = dictionaryService.getDictionariesByFatherId(type);
        modelAndView.addObject("types", types);

        DataMap purpose = new DataMap();
        purpose.put("CODE", "CARD_PURPOSE");
        purpose = dictionaryService.getDictionaryByCode(purpose);
        List<DataMap> purposes = dictionaryService.getDictionariesByFatherId(purpose);
        modelAndView.addObject("purposes", purposes);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.QUERY_QX);
        logger.end();
        return modelAndView;
    }

    @RequestMapping(value = "/add")
    public ModelAndView add() throws Exception {
        logger.begin("加载新增库存卡页面");

        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/card/add");

        DataMap province = new DataMap();
        province.put("CODE", "CARD_PROVINCE");
        province = dictionaryService.getDictionaryByCode(province);
        List<DataMap> provinces = dictionaryService.getDictionariesByFatherId(province);
        modelAndView.addObject("provinces", provinces);

        DataMap type = new DataMap();
        type.put("CODE", "CARD_TYPE");
        type = dictionaryService.getDictionaryByCode(type);
        List<DataMap> types = dictionaryService.getDictionariesByFatherId(type);
        modelAndView.addObject("types", types);

        DataMap purpose = new DataMap();
        purpose.put("CODE", "CARD_PURPOSE");
        purpose = dictionaryService.getDictionaryByCode(purpose);
        List<DataMap> purposes = dictionaryService.getDictionariesByFatherId(purpose);
        modelAndView.addObject("purposes", purposes);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.ADD_QX);
        logger.end();
        return modelAndView;
    }

    @RequestMapping(value = "/excel")
    public ModelAndView excel() throws Exception {
        logger.begin("加载商品卡导出页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/card/excel");

        DataMap province = new DataMap();
        province.put("CODE", "CARD_PROVINCE");
        province = dictionaryService.getDictionaryByCode(province);
        List<DataMap> provinces = dictionaryService.getDictionariesByFatherId(province);
        modelAndView.addObject("provinces", provinces);

        DataMap type = new DataMap();
        type.put("CODE", "CARD_TYPE");
        type = dictionaryService.getDictionaryByCode(type);
        List<DataMap> types = dictionaryService.getDictionariesByFatherId(type);
        modelAndView.addObject("types", types);

        DataMap purpose = new DataMap();
        purpose.put("CODE", "CARD_PURPOSE");
        purpose = dictionaryService.getDictionaryByCode(purpose);
        List<DataMap> purposes = dictionaryService.getDictionariesByFatherId(purpose);
        modelAndView.addObject("purposes", purposes);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.QUERY_QX);
        logger.end();
        return modelAndView;
    }

    @RequestMapping(value = "/toexcel")
    public ModelAndView toExcel() throws Exception {
        logger.begin("导出商品卡Excel");
        DataMap dataMap = this.getDataMap();

        if(StringUtils.isBlank(dataMap.getString("BEGINTIME")))
            dataMap.put("BEGINTIME", null);
        else
            dataMap.put("BEGINTIME", new Timestamp(DateUtil.str2Date(dataMap.getString("BEGINTIME"), "yyyy-MM-dd HH:mm:ss").getTime()));
        if(StringUtils.isBlank(dataMap.getString("ENDTIME")))
            dataMap.put("ENDTIME", null);
        else
            dataMap.put("ENDTIME", new Timestamp(DateUtil.str2Date(dataMap.getString("ENDTIME"), "yyyy-MM-dd HH:mm:ss").getTime()));
        if(StringUtils.isBlank(dataMap.getString("PROVINCE_ID")))
            dataMap.put("PROVINCE_ID", null);
        if(StringUtils.isBlank(dataMap.getString("TYPE_ID")))
            dataMap.put("TYPE_ID", null);
        if(StringUtils.isBlank(dataMap.getString("PURPOSE_ID")))
            dataMap.put("PURPOSE_ID", null);
        if(StringUtils.isBlank(dataMap.getString("ISSALED")))
            dataMap.put("ISSALED", null);
        if(StringUtils.isBlank(dataMap.getString("ISUSED")))
            dataMap.put("ISUSED", null);

        List<DataMap> cards = cardService.getCardsByBeginTimeAndEndTime(dataMap);

        CardExcelView cardExcelView = new CardExcelView();
        DataMap excelParam = new DataMap();
        excelParam.put("datas", cards);

        return new ModelAndView(cardExcelView, excelParam);
    }
}
