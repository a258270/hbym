package com.cms4j.plant.card.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.util.*;
import com.cms4j.plant.card.service.CardService;
import com.cms4j.plant.util.CardExcelView;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/admin/card/api")
public class CardApiController extends ApiBaseController {
    public CardApiController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
        this.menuId = "24";
    }

    @Autowired
    private CardService cardService;
    @Autowired
    private DictionaryService dictionaryService;

    @RequestMapping(value = "/getcards")
    public PageDto getCards() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.QUERY_QX))
            return new PageDto();

        DataMap dataMap = this.getDataMap();
        logger.begin("获取商品卡分页数据");

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

        Page page = new Page();
        page.setParams(dataMap);
        page.setPageNumber(Integer.valueOf(dataMap.getString("iDisplayStart")) / Integer.valueOf(dataMap.getString("iDisplayLength")));
        page.setPageSize(Integer.valueOf(dataMap.getString("iDisplayLength")));

        List<DataMap> results = cardService.getCards(page);
        if(results != null) {
            for(DataMap result : results) {
                DataMap province = new DataMap();
                province.put("CODE", result.getString("PROVINCE_ID"));
                province = dictionaryService.getDictionaryByCode(province);
                result.put("PROVINCE_VALUE", province.getString("NAME"));

                DataMap type = new DataMap();
                type.put("CODE", result.getString("TYPE_ID"));
                type = dictionaryService.getDictionaryByCode(type);
                result.put("TYPE_VALUE", type.getString("NAME"));

                DataMap purpose = new DataMap();
                purpose.put("CODE", result.getString("PURPOSE_ID"));
                purpose = dictionaryService.getDictionaryByCode(purpose);
                result.put("PURPOSE_VALUE", purpose.getString("NAME"));
            }
        }
        page.setResults(results);
        logger.end();
        return PageConverter.toPageDto(page, Integer.valueOf(dataMap.getString("sEcho")));
    }

    @RequestMapping(value = "/add")
    public InvokeResult add() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.ADD_QX))
            return this.interceptorJurisdiction();

        DataMap dataMap = this.getDataMap();
        logger.begin("新增商品卡");

        try{
            Integer count = Integer.valueOf(dataMap.getString("COUNT"));
        }
        catch(Exception e) {
            return InvokeResult.failure("数量格式不正确！");
        }

        if(StringUtils.isBlank(dataMap.getString("PROVINCE_ID")))
            return InvokeResult.failure("地区不能为空！");

        if(StringUtils.isBlank(dataMap.getString("TYPE_ID")))
            return InvokeResult.failure("类型不能为空！");

        if(StringUtils.isBlank(dataMap.getString("PURPOSE_ID")))
            return InvokeResult.failure("用途不能为空！");

        cardService.batchAddCards(dataMap);

        logger.end();
        return InvokeResult.success();
    }

    @RequestMapping(value = "/batchremoves")
    public InvokeResult batchremoves() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.DEL_QX))
            return this.interceptorJurisdiction();

        logger.begin("批量删除商品卡");
        DataMap dataMap = this.getDataMap();

        cardService.batchRemoves(dataMap.getString("batchremoves"));
        logger.end();
        return InvokeResult.success();
    }

    @RequestMapping(value = "/batchedits")
    public InvokeResult batchedits() throws Exception {
        if(!this.validJurisdiction(JurisdictionUtil.EDIT_QX))
            return this.interceptorJurisdiction();

        logger.begin("批量标记商品卡");
        DataMap dataMap = this.getDataMap();

        cardService.batchEdits(dataMap.getString("batchedits"));
        logger.end();
        return InvokeResult.success();
    }
}
