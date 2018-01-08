package com.cms4j.plant.item.item.service;

import com.cms4j.base.dao.DaoSupport;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.ShortUUID;
import com.cms4j.plant.util.PlantConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ItemBelongService {
    @Autowired
    private DaoSupport daoSupport;

    @Transactional(rollbackFor = Exception.class)
    public void addItemBelong(DataMap dataMap) throws Exception {
        //ls:此时的 dataMap 中已经有了 升级后的 对应类型的 商品卡的总可用数
        dataMap.put("BELONG_ID", ShortUUID.randomUUID());
        dataMap.put("CREATETIME", DateUtil.getCurrentTime());

       /* //ls isval 字段已经更改为 count dataMap 中 put  的值 需要重新定义
       // dataMap.put("isval", true);
        dataMap.getString("count");*/
      //ls: 调用 dao层 保存进数据库。
        daoSupport.save("ItemBelongMapper.addItemBelong", dataMap);
    }

    //ls：添加减法的 方法  专门为使用了 商品卡以后 再将数据库更新
    @Transactional(rollbackFor = Exception.class)
    public  void reduceItemBelong(DataMap dataMap)throws Exception{
        //此时的dataMap需要有 user_id 和 对应的 ItemType 还有剩余的 商品卡的 可用次数
            daoSupport.update("ItemBelongMapper.updatItemBelong",dataMap);

    }



    public List<DataMap> getValItemBelongByUserId(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ItemBelongMapper.getValItemBelongByUserId", dataMap);
    }
    //ls：将原来获取使用卡的次数 返回值为list集合的方法   变更为返回值为 int 类型的 count (使用次数的)的方法
    //ls: 注掉 旧方法
   /* public List<DataMap> getValItemBelongByUserIdAndItemType(DataMap dataMap) throws Exception {
        return (List<DataMap>) daoSupport.findForList("ItemBelongMapper.getValItemBelongByUserIdAndItemType", dataMap);
    }*/
    //ls: 新方法 返回值为 int 类型  count
    public  Integer  getValItemBelongCountByUserIdAndItemType(DataMap dataMap)throws Exception {
        Integer count = (Integer) daoSupport.findForObject("ItemBelongMapper.getItmeBelongCountByUserIdAndItemType",dataMap);
        return  count == null ? 0 : count;

    }

    /*public Integer getValItemBelongCountByUserIdAndItemType(DataMap dataMap) throws Exception {
        return (Integer) daoSupport.findForObject("ItemBelongMapper.getValItemBelongCountByUserIdAndItemType", dataMap);
    }*/
    //LS:注掉 id= useitem  mapper
   /* @Transactional(rollbackFor = Exception.class)
    public void useItem(DataMap dataMap) throws Exception {
        dataMap.put("USETIME", DateUtil.getCurrentTime());
        daoSupport.update("ItemBelongMapper.useItem", dataMap);
    }*/

    //ls：此方法是会员升级后将卡 一张一张添加进数据库。
    // 注掉 上述原方法 修改为 商品 品种卡 count总次数 的逻辑
    //ls: 修改 addItemBelong 方法
    /*@Transactional(rollbackFor = Exception.class)
    public void reChargeItemBelong(Integer count, DataMap dataMap) throws Exception {
        for(int i = 0; i < count; i++) {
            this.addItemBelong(dataMap);
        }
    }*/
     //ls：更新后的方法
    @Transactional( rollbackFor = Exception.class)
    public  void  reChargeItemBelong(Integer count, DataMap dataMap)throws Exception {
        //ls:取出升级会员之前 对应的 商品卡的 可用次数

        //zmj:将sum_before提出来，减少一次库的交互
        Integer sum_before = (Integer) daoSupport.findForInt("ItemBelongMapper.getItmeBelongCountByUserIdAndItemType",dataMap);
        //:ls 007 此处有问题 如果count 为null 需要判断 并插入进数据库
        if(sum_before == null ){
            //insert 进数据库

            dataMap.put("COUNT", count);

            this.addItemBelong(dataMap);

        }else {
            // 升级黑卡会员：判断count 是否为-1 如果为-1 则说明是升级为 黑卡会员 直接将原来的 count 值 更新为-1
            if(count == -1){
                dataMap.put("COUNT",count);
                daoSupport.update("ItemBelongMapper.updatItemBelong",dataMap);

            }else{
                //ls:如果不为空值 说明 有值。无论是不是 0  运算后  更新进数据库
                //ls:升级后的次数就是 sum_after  ，把sum_after 放到 dataMap 中 键 “COUNT”对应的位置上
                Integer sum_after = count + sum_before;
                dataMap.put("COUNT",sum_after);
                daoSupport.update("ItemBelongMapper.updatItemBelong",dataMap);}
        }
    }

    public DataMap getAllValItemsByUser(DataMap user) throws Exception {
        DataMap dataMap = new DataMap();

        DataMap params = new DataMap();
        params.put("USER_ID", user.getString("USER_ID"));
        params.put("ITEMTYPE", PlantConst.ITEMTYPE_ZXK);
        Integer yxzxk = this.getValItemBelongCountByUserIdAndItemType(params);
        dataMap.put("yxzxk", yxzxk);

        params.put("ITEMTYPE", PlantConst.ITEMTYPE_MNTBK);
        Integer mntbk = this.getValItemBelongCountByUserIdAndItemType(params);
        dataMap.put("mntbk", mntbk);

        params.put("ITEMTYPE", PlantConst.ITEMTYPE_ZNTJK);
        Integer zntjk = this.getValItemBelongCountByUserIdAndItemType(params);
        dataMap.put("zntjk", zntjk);
        //12.28 ls：性格测试卡 A卡 （简单版）
        params.put("ITEMTYPE",PlantConst.ITEMTYPE_XGCSKA);
        Integer xgcska = this.getValItemBelongCountByUserIdAndItemType(params);
        dataMap.put("xgcska",xgcska);
        //12.28 ls: 性格测试卡 B 卡  （专业版）
        params.put("ITEMTYPE",PlantConst.ITEMTYPE_XGCSKB);
        Integer xgcskb = this.getValItemBelongCountByUserIdAndItemType(params);
        dataMap.put("xgcskb",xgcskb);
       /* //12.28 ls:改分卡  (注：目前只有黑钻有 1 张改分卡  商城可充值购买  后台暂无扣卡逻辑)
        params.put("ITEMTYPE",PlantConst.ITEMTYPE_GFK);
        Integer gfk = this.getValItemBelongCountByUserIdAndItemType(params);
        dataMap.put("gfk",gfk);*/


        return dataMap;
    }
}
