package com.cms4j.plant.item.item.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.item.item.service.ItemBuyService;
import com.cms4j.plant.item.item.service.ItemService;
import com.cms4j.plant.item.item.service.ItemStoreUpService;
import com.cms4j.plant.user.pocket.service.PocketService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/plant/item/api")
public class ItemPageApiController extends ApiBaseController {

    @Autowired
    private ItemStoreUpService itemStoreUpService;
    @Autowired
    private ItemService itemService;
    @Autowired
    private ItemBuyService itemBuyService;
    @Autowired
    private PocketService pocketService;

    @RequestMapping(value = "/storeup/{id}", method = RequestMethod.POST)
    public InvokeResult storeUp(@PathVariable String id) throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return InvokeResult.failure("请先登录账号！");

        List<DataMap> stores = itemStoreUpService.getItemStoreupsByUserId(curUser);
        if(stores != null) {
            for(DataMap store : stores){
                if(store.getString("ITEM_ID").equals(id))
                    return InvokeResult.failure("您已经收藏该商品！");
            }
        }
        if(StringUtils.isBlank(id)){
            return InvokeResult.failure("该商品不存在！");
        }

        DataMap item = new DataMap();
        item.put("ITEM_ID", id);
        item = itemService.getItemById(item);

        if(item == null)
            return InvokeResult.failure("该商品不存在！");

        DataMap storeup = new DataMap();
        storeup.put("USER_ID", curUser.getString("USER_ID"));
        storeup.put("ITEM_ID", item.getString("ITEM_ID"));
        storeup.put("CREATETIME", DateUtil.getCurrentTime());

        itemStoreUpService.addItemStoreup(storeup);

        return InvokeResult.success();
    }

    @RequestMapping(value = "/buy", method = RequestMethod.POST)
    public InvokeResult buy() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return InvokeResult.failure("请先登录账号！");

        DataMap dataMap = this.getDataMap();
        DataMap item = itemService.getItemById(dataMap);
        if(item == null)
            return InvokeResult.failure("该商品不存在！");

        if(!Boolean.valueOf(item.getString("ISSALE"))){
            return InvokeResult.failure("该商品已下架！");
        }

        try{
            Integer.valueOf(dataMap.getString("COUNT"));
        }
        catch(Exception e){
            return InvokeResult.failure("数据非法，请稍后重试！");
        }
        Double price = Double.valueOf(item.getString("PRICE"));
        Integer count = Integer.valueOf(dataMap.getString("COUNT"));
        DataMap pocket = pocketService.getPocketByUserId(curUser);
        if(Double.valueOf(pocket.getString("BALANCE")) < (price * count)) return InvokeResult.failure("账户余额不足，请充值！");

        DataMap buyInfo = new DataMap();
        buyInfo.put("USER_ID", curUser.getString("USER_ID"));
        buyInfo.put("ITEM_ID", item.getString("ITEM_ID"));
        buyInfo.put("CREATETIME", DateUtil.getCurrentTime());
        buyInfo.put("POCKET_ID", pocket.getString("POCKET_ID"));
        buyInfo.put("PRICE", item.getString("PRICE"));
        buyInfo.put("COUNT", count);
        itemBuyService.addItemBuy(buyInfo);

        return InvokeResult.success();
    }
}
