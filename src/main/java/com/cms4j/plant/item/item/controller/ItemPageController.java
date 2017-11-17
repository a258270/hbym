package com.cms4j.plant.item.item.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.Page;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.item.item.service.ItemBuyService;
import com.cms4j.plant.item.item.service.ItemService;
import com.cms4j.plant.item.item.service.ItemStoreUpService;
import com.cms4j.plant.util.PlantConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/plant/item")
public class ItemPageController extends PageBaseController {
    @Autowired
    private ItemService itemService;

    @Autowired
    private ItemStoreUpService itemStoreUpService;

    @Autowired
    private ItemBuyService itemBuyService;

    @RequestMapping(value = "/mall", method = RequestMethod.GET)
    public ModelAndView mall() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        Page page = new Page();
        page.setPageNumber(0);
        page.setPageSize(12);
        Map params = new HashMap();

        /**
         * 新增开始
         */
        page.setParams(params);
        List<DataMap> items = itemService.getAllSalingItems(page);
        modelAndView.addObject("items", items);
        /**
         * 新增结束
         */


        /*params.put("ITEMTYPE", PlantConst.ITEMTYPE_HYK);
        page.setParams(params);
        List<DataMap> items_hyk = itemService.getAllSalingItems(page);

        params.put("ITEMTYPE", PlantConst.ITEMTYPE_CZK);
        page.setParams(params);
        List<DataMap> items_czk = itemService.getAllSalingItems(page);

        params.put("ITEMTYPE", PlantConst.ITEMTYPE_ZJK);
        page.setParams(params);
        List<DataMap> items_zjk = itemService.getAllSalingItems(page);

        params.put("ITEMTYPE", PlantConst.ITEMTYPE_ZXK);
        page.setParams(params);
        List<DataMap> items_zxk = itemService.getAllSalingItems(page);*/

        /*DataMap curUser = SessionUtil.getCurUser();
        if(curUser != null){
            List<DataMap> stores = itemStoreUpService.getItemStoreupsByUserId(curUser);
            modelAndView.addObject("stores", stores);
            for(DataMap store : stores){
                if(items_hyk != null){
                    for(DataMap item_hyk : items_hyk){
                        if(store.getString("ITEM_ID").equals(item_hyk.getString("ITEM_ID"))){
                            item_hyk.put("STORED", "true");
                            break;
                        }
                    }
                }

                if(items_czk != null){
                    for(DataMap item_czk : items_czk){
                        if(store.getString("ITEM_ID").equals(item_czk.getString("ITEM_ID"))){
                            item_czk.put("STORED", "true");
                            break;
                        }
                    }
                }

                if(items_zjk != null){
                    for(DataMap item_zjk : items_zjk){
                        if(store.getString("ITEM_ID").equals(item_zjk.getString("ITEM_ID"))){
                            item_zjk.put("STORED", "true");
                            break;
                        }
                    }
                }

                if(items_zxk != null){
                    for(DataMap item_zxk : items_zxk){
                        if(store.getString("ITEM_ID").equals(item_zxk.getString("ITEM_ID"))){
                            item_zxk.put("STORED", "true");
                            break;
                        }
                    }
                }
            }
        }

        modelAndView.addObject("hyks", items_hyk);
        modelAndView.addObject("czks", items_czk);
        modelAndView.addObject("zjks", items_zjk);
        modelAndView.addObject("zxks", items_zxk);*/

        modelAndView.setViewName("/plant/ymplant/malls/mall");
        return modelAndView;
    }

    /**
     * 加载商品详情页
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public ModelAndView details(@PathVariable String id) throws Exception {
        DataMap item = new DataMap();
        item.put("ITEM_ID", id);
        item = itemService.getItemById(item);
        ModelAndView modelAndView = this.getModelAndView();

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser != null){
            List<DataMap> stores = itemStoreUpService.getItemStoreupsByUserId(curUser);
            modelAndView.addObject("stores", stores);
            for(DataMap store : stores){
                if(store.getString("ITEM_ID").equals(item.getString("ITEM_ID")))
                    item.put("STORED", "true");
            }
        }

        modelAndView.addObject("item", item);

        //加载商品
        Page page = new Page();
        page.setParams(new HashMap());
        page.setPageNumber(0);
        page.setPageSize(4);
        List<DataMap> items = itemService.getAllSalingItems(page);
        modelAndView.addObject("items", items);

        Integer hykBuyNumber = 0;
        Integer zxkBuyNumber = 0;
        Integer zjkBuyNumber = 0;
        Integer czkBuyNumber = 0;

        Integer hykInterNumber = 0;
        Integer zxkInterNumber = 0;
        Integer zjkInterNumber = 0;
        Integer czkInterNumber = 0;

        if(curUser != null){
            List<DataMap> buys = itemBuyService.getItemBuyInNoUseByUserId(curUser);
            if(buys != null){
                for(DataMap buy : buys) {
                    if (buy.getString("ITEMTYPE").equals(PlantConst.ITEMTYPE_CZK)) {
                        czkBuyNumber++;
                    }
                    if (buy.getString("ITEMTYPE").equals(PlantConst.ITEMTYPE_HYK)) {
                        hykBuyNumber++;
                    }
                    if (buy.getString("ITEMTYPE").equals(PlantConst.ITEMTYPE_ZJK)) {
                        zjkBuyNumber++;
                    }
                    if (buy.getString("ITEMTYPE").equals(PlantConst.ITEMTYPE_ZXK)) {
                        zxkBuyNumber++;
                    }
                }
            }
            List<DataMap> stores = itemStoreUpService.getItemStoreupsByUserId(curUser);
            if(stores != null){
                for(DataMap store : stores) {
                    if(store.getString("ITEMTYPE").equals(PlantConst.ITEMTYPE_CZK)){
                        czkInterNumber++;
                    }
                    if(store.getString("ITEMTYPE").equals(PlantConst.ITEMTYPE_HYK)){
                        hykInterNumber++;
                    }
                    if(store.getString("ITEMTYPE").equals(PlantConst.ITEMTYPE_ZJK)){
                        zjkInterNumber++;
                    }
                    if(store.getString("ITEMTYPE").equals(PlantConst.ITEMTYPE_ZXK)){
                        zxkInterNumber++;
                    }
                }
            }
        }

        modelAndView.addObject("hykBuyNumber", hykBuyNumber);
        modelAndView.addObject("czkBuyNumber", czkBuyNumber);
        modelAndView.addObject("zjkBuyNumber", zjkBuyNumber);
        modelAndView.addObject("zxkBuyNumber", zxkBuyNumber);
        modelAndView.addObject("hykInterNumber", hykInterNumber);
        modelAndView.addObject("czkInterNumber", czkInterNumber);
        modelAndView.addObject("zjkInterNumber", zjkInterNumber);
        modelAndView.addObject("zxkInterNumber", zxkInterNumber);

        modelAndView.setViewName("/plant/ymplant/malls/mall-page");
        return modelAndView;
    }

    @RequestMapping(value = "/order")
    public ModelAndView order() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null) {
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        modelAndView.setViewName("/plant/ymplant/center/paging/order");
        return modelAndView;
    }
}
