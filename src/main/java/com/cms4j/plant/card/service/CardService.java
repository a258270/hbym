package com.cms4j.plant.card.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.*;
import com.cms4j.plant.card.util.CardUtil;
import com.cms4j.plant.item.item.service.ItemBelongService;
import com.cms4j.plant.user.pocket.service.PocketService;
import com.cms4j.plant.user.service.PlantUserService;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.*;

@Service
public class CardService {

    @Autowired
    private DaoSupport daoSupport;

    @Autowired
    private PlantUserService plantUserService;
    @Autowired
    private ItemBelongService itemBelongService;
    @Autowired
    private PocketService pocketService;

    public String getMaxCodeByParams(DataMap dataMap) throws Exception {
        String maxCode = (String) daoSupport.findForObject("CardMapper.getMaxCodeByParams", dataMap);
        if(StringUtils.isBlank(maxCode))
            maxCode = "000001";

        return maxCode;
    }

    @Transactional(rollbackFor = Exception.class)
    public void setCardSaled(DataMap dataMap) throws Exception {
        daoSupport.update("CardMapper.setCardSaled", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void setCardUsed(DataMap dataMap) throws Exception {
        daoSupport.update("CardMapper.setCardUsed", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addCard(DataMap dataMap) throws Exception {
        daoSupport.save("CardMapper.addCard", dataMap);
    }

    public List<DataMap> getCards(Page page) throws Exception {
        return (List<DataMap>) daoSupport.findForList("CardMapper.getCards", page);
    }

    public DataMap getCardByParams(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("CardMapper.getCardByParams", dataMap);
    }

    public DataMap getCardById(DataMap dataMap) throws Exception {
        return (DataMap) daoSupport.findForObject("CardMapper.getCardById", dataMap);
    }

    @Transactional(rollbackFor = Exception.class)
    public void batchAddCards(DataMap dataMap) throws Exception {
        Integer count = Integer.valueOf(dataMap.getString("COUNT"));

        String maxCode = this.getMaxCodeByParams(dataMap);
        List<String> numbers = CardUtil.getMaxPlusCode(maxCode, count);

        for(int i = 0; i < numbers.size(); i++) {
            String number = numbers.get(i);

            DataMap card = new DataMap();
            card.put("CARD_ID", ShortUUID.randomUUID());
            card.put("PROVINCE_ID", dataMap.getString("PROVINCE_ID"));
            card.put("TYPE_ID", dataMap.getString("TYPE_ID"));
            card.put("PURPOSE_ID", dataMap.getString("PURPOSE_ID"));
            card.put("NUMBER", number);
            Date curDate = DateUtil.getCurrentDate();
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(curDate);
            if(CardUtil.CARD_PURPOSE_VIP.equals(dataMap.getString("PURPOSE_ID"))) {
                if(CardUtil.CARD_TYPE_VIP_G1.equals(dataMap.getString("TYPE_ID"))){
                    calendar.add(Calendar.YEAR, 3);
                    calendar.set(Calendar.MONTH, 8);
                    calendar.set(Calendar.DAY_OF_MONTH, 1);
                    calendar.set(Calendar.HOUR_OF_DAY, 0);
                    calendar.set(Calendar.MINUTE, 0);
                    calendar.set(Calendar.SECOND, 0);
                    Date lastDate = calendar.getTime();
                    Timestamp timestamp = new Timestamp(lastDate.getTime());
                    card.put("OVERDUETIME", timestamp);
                }

                if(CardUtil.CARD_TYPE_VIP_G2.equals(dataMap.getString("TYPE_ID"))){
                    calendar.add(Calendar.YEAR, 2);
                    calendar.set(Calendar.MONTH, 8);
                    calendar.set(Calendar.DAY_OF_MONTH, 1);
                    calendar.set(Calendar.HOUR_OF_DAY, 0);
                    calendar.set(Calendar.MINUTE, 0);
                    calendar.set(Calendar.SECOND, 0);
                    Date lastDate = calendar.getTime();
                    Timestamp timestamp = new Timestamp(lastDate.getTime());
                    card.put("OVERDUETIME", timestamp);
                }

                if(CardUtil.CARD_TYPE_VIP_G3.equals(dataMap.getString("TYPE_ID"))){
                    calendar.add(Calendar.YEAR, 1);
                    calendar.set(Calendar.MONTH, 8);
                    calendar.set(Calendar.DAY_OF_MONTH, 1);
                    calendar.set(Calendar.HOUR_OF_DAY, 0);
                    calendar.set(Calendar.MINUTE, 0);
                    calendar.set(Calendar.SECOND, 0);

                    Date lastDate = calendar.getTime();
                    Timestamp timestamp = new Timestamp(lastDate.getTime());
                    card.put("OVERDUETIME", timestamp);
                }
            }
            card.put("CREATETIME", new Timestamp(curDate.getTime()));
            card.put("PASSWORD", ShortUUID.randomUUID());
            this.addCard(card);
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public void batchRemoves(String objs) throws Exception {
        String[] objArr = objs.split(",");
        List<String> objList = Arrays.asList(objArr);
        daoSupport.batchDelete("CardMapper.batchRemoves", objList);
    }

    @Transactional(rollbackFor = Exception.class)
    public void batchEdits(String objs) throws Exception {
        String[] objArr = objs.split(",");
        List<String> objList = Arrays.asList(objArr);
        daoSupport.batchUpdate("CardMapper.setCardSaled", objList);
    }

    /**
     *
     * @param dataMap
     * @return -1卡号不存在 -2密码不正确 -3卡号已使用
     * @throws Exception
     */
    @Transactional(rollbackFor = Exception.class)
    public synchronized Integer activeVip(DataMap dataMap) throws Exception {
        String number = dataMap.getString("NUMBER");
        String password = dataMap.getString("PASSWORD");

        String province = number.substring(0, 5);//地区标志
        String type = number.substring(5,7);//类型标志
        String purpose = number.substring(7, 9);
        number = number.substring(9, 15);//卡号

        dataMap.put("PROVINCE_ID", province);
        dataMap.put("TYPE_ID", type);
        dataMap.put("PURPOSE_ID", purpose);
        dataMap.put("NUMBER", number);

        DataMap curUser = SessionUtil.getCurUser();

        DataMap card = this.getCardByParams(dataMap);

        if(card == null)
            return -1;

        if(!dataMap.getString("PASSWORD").equals(card.getString("PASSWORD")))
            return -2;

        if(Boolean.valueOf(card.getString("ISUSED")))
            return -3;

        curUser.put("CARD_ID", card.getString("CARD_ID"));
        plantUserService.setUserVip(curUser);
        this.setCardUsed(card);


        DataMap pocket = pocketService.getPocketByUserId(curUser);

        DataMap pocketParam = new DataMap();
        pocketParam.put("PRICE", 500);
        pocketParam.put("POCKET_ID", pocket.getString("POCKET_ID"));
        pocketService.recharge(pocketParam);

        pocketParam.put("USER_ID", SessionUtil.getCurUser().getString("USER_ID"));

        pocketParam.put("ITEMTYPE", PlantConst.ITEMTYPE_ZNTJK);
        itemBelongService.reChargeItemBelong(2000, pocketParam);

        pocketParam.put("ITEMTYPE", PlantConst.ITEMTYPE_MNTBK);
        itemBelongService.reChargeItemBelong(2000, pocketParam);

        pocketParam.put("ITEMTYPE", PlantConst.ITEMTYPE_ZXK);
        itemBelongService.reChargeItemBelong(20, pocketParam);

        return 1;
    }

    public List<DataMap> getCardsByBeginTimeAndEndTime(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("CardMapper.getCardsByBeginTimeAndEndTime", dataMap);
    }
}
