package com.cms4j.plant.item.item.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.plant.item.item.service.ItemService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.JurisdictionUtil;
import com.cms4j.base.util.LoggerUtil;
import com.cms4j.base.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

/**
* Description: ItemController
* Created by zmj on 2017/08/21.
*/
@Controller
@RequestMapping(value = "/admin/item")
public class ItemController extends PageBaseController {
    public ItemController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "16";
    }

    @Autowired
    private ItemService itemService;

    @Autowired
    private DictionaryService dictionaryService;

    /**
    * 加载商品页面
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() throws Exception {
        logger.begin("加载商品页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/item/item/index");

        DataMap ITEMTYPE = new DataMap();
        ITEMTYPE.put("CODE", "ITEMTYPE");
        ITEMTYPE = dictionaryService.getDictionaryByCode(ITEMTYPE);
        List<DataMap> ITEMTYPEs = (List<DataMap>) dictionaryService.getDictionariesByFatherId(ITEMTYPE);
        modelAndView.addObject("ITEMTYPEs", ITEMTYPEs);
        DataMap ITEMPROPERTY = new DataMap();
        ITEMPROPERTY.put("CODE", "ITEMPROPERTY");
        ITEMPROPERTY = dictionaryService.getDictionaryByCode(ITEMPROPERTY);
        List<DataMap> ITEMPROPERTYs = (List<DataMap>) dictionaryService.getDictionariesByFatherId(ITEMPROPERTY);
        modelAndView.addObject("ITEMPROPERTYs", ITEMPROPERTYs);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.QUERY_QX);
        logger.end();
        return modelAndView;
    }

    /**
    * 加载新增商品页面
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView add() throws Exception {
        logger.begin("加载新增商品页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/item/item/add");

        DataMap ITEMTYPE = new DataMap();
        ITEMTYPE.put("CODE", "ITEMTYPE");
        ITEMTYPE = dictionaryService.getDictionaryByCode(ITEMTYPE);
        List<DataMap> ITEMTYPEs = (List<DataMap>) dictionaryService.getDictionariesByFatherId(ITEMTYPE);
        modelAndView.addObject("ITEMTYPEs", ITEMTYPEs);
        DataMap ITEMPROPERTY = new DataMap();
        ITEMPROPERTY.put("CODE", "ITEMPROPERTY");
        ITEMPROPERTY = dictionaryService.getDictionaryByCode(ITEMPROPERTY);
        List<DataMap> ITEMPROPERTYs = (List<DataMap>) dictionaryService.getDictionariesByFatherId(ITEMPROPERTY);
        modelAndView.addObject("ITEMPROPERTYs", ITEMPROPERTYs);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.ADD_QX);
        logger.end();
        return modelAndView;
    }

    /**
    * 加载编辑商品页面
    * @param id
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable String id) throws Exception {
        logger.begin("加载编辑商品页面");
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("plant/item/item/edit");
        DataMap dataMap = new DataMap();
        dataMap.put("ITEM_ID", id);
        dataMap = itemService.getItemById(dataMap);
        modelAndView.addObject("item", dataMap);

        DataMap ITEMTYPE = new DataMap();
        ITEMTYPE.put("CODE", "ITEMTYPE");
        ITEMTYPE = dictionaryService.getDictionaryByCode(ITEMTYPE);
        List<DataMap> ITEMTYPEs = (List<DataMap>) dictionaryService.getDictionariesByFatherId(ITEMTYPE);
        modelAndView.addObject("ITEMTYPEs", ITEMTYPEs);
        DataMap ITEMPROPERTY = new DataMap();
        ITEMPROPERTY.put("CODE", "ITEMPROPERTY");
        ITEMPROPERTY = dictionaryService.getDictionaryByCode(ITEMPROPERTY);
        List<DataMap> ITEMPROPERTYs = (List<DataMap>) dictionaryService.getDictionariesByFatherId(ITEMPROPERTY);
        modelAndView.addObject("ITEMPROPERTYs", ITEMPROPERTYs);

        this.setJurisdictionInfo(modelAndView, JurisdictionUtil.EDIT_QX);
        logger.end();
        return modelAndView;
    }
}
