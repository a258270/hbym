package com.cms4j.plant.report.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.item.item.service.ItemBelongService;
import com.cms4j.plant.report.service.ReportService;
import com.cms4j.plant.report.service.ScorelineService;
import com.cms4j.plant.school.mjscore.service.MjscoreService;
import com.cms4j.plant.school.service.HasmajorService;
import com.cms4j.plant.school.service.ScpropertyService;
import com.cms4j.plant.school.service.SubjecttypeService;
import com.cms4j.plant.user.service.ExamineeService;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@RestController
@RequestMapping(value = {"/plant/report/api", "/wechat/applet/report"})
public class ReportApiController extends ApiBaseController {

    /*@RequestMapping(value = "/reporting")
    public InvokeResult reporting() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return InvokeResult.failure("请先登录账号！");

        DataMap
    }*/

    @Autowired
    private HasmajorService hasmajorService;
    @Autowired
    private ExamineeService examineeService;
    @Autowired
    private MjscoreService mjscoreService;
    @Autowired
    private ReportService reportService;
    @Autowired
    private ItemBelongService itemBelongService;
    @Autowired
    private DictionaryService dictionaryService;
    @Autowired
    private ScpropertyService scpropertyService;
    @Autowired
    private SubjecttypeService subjecttypeService;
    @Autowired
    private ScorelineService scorelineService;
    @RequestMapping(value = "/getmajors", method = RequestMethod.POST)
    public InvokeResult getMajor() throws Exception {
        DataMap dataMap = this.getDataMap();

        Calendar a = Calendar.getInstance();
        String lastYear = String.valueOf(a.get(Calendar.YEAR) - 1);
        DataMap YEAR = new DataMap();
        YEAR.put("CODE", "YEAR");
        YEAR = dictionaryService.getDictionaryByCode(YEAR);
        List<DataMap> YEARs = dictionaryService.getDictionariesByFatherId(YEAR);
        for(DataMap YEARTmp : YEARs) {
            if(YEARTmp.getString("NAME").equals(lastYear)){
                dataMap.put("YEAR_ID", YEARTmp.getString("DIC_ID"));
            }
        }

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser != null) {
            DataMap exam = examineeService.getExamineeByUserId(curUser);
            if(exam != null) {
                dataMap.put("MAJORTYPE_ID", exam.getString("MAJORTYPE"));
            }
        }

        List<DataMap> majors = hasmajorService.getHasmajorByYear(dataMap);
        return InvokeResult.success("majors", majors);
    }

    /**
     * 智能推荐
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/reporting")
    public InvokeResult reporting() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return InvokeResult.failure("请登录账号！");
        DataMap dataMap = this.getDataMap();

        if (StringUtils.isBlank(dataMap.getString("MAJOR")) || dataMap.getString("MAJOR").equals(","))
            dataMap.put("MAJOR", null);
        else{
            dataMap.put("MAJOR", Arrays.asList(dataMap.getString("MAJOR").split(",")));
        }

        if (StringUtils.isBlank(dataMap.getString("PROVINCE")) || dataMap.getString("PROVINCE").equals(","))
            dataMap.put("PROVINCE", null);
        else{
            dataMap.put("PROVINCE", Arrays.asList(dataMap.getString("PROVINCE").split(",")));
        }

        if (StringUtils.isBlank(dataMap.getString("SUBJECTTYPE")) || dataMap.getString("SUBJECTTYPE").equals(","))
            dataMap.put("SUBJECTTYPE", null);
        else{
            dataMap.put("SUBJECTTYPE", Arrays.asList(dataMap.getString("SUBJECTTYPE").split(",")));
        }

        if (StringUtils.isBlank(dataMap.getString("SCPROPERTY")) || dataMap.getString("SCPROPERTY").equals(","))
            dataMap.put("SCPROPERTY", null);
        else{
            dataMap.put("SCPROPERTY", Arrays.asList(dataMap.getString("SCPROPERTY").split(",")));
        }

        DataMap exam = examineeService.getExamineeByUserId(curUser);
        if(exam == null || StringUtils.isBlank(exam.getString("MAJORTYPE")) || StringUtils.isBlank(exam.getString("EXAMSCORE")))
            return InvokeResult.failure("请完善考生信息！");

        DataMap param = new DataMap();
        param.put("USER_ID", curUser.getString("USER_ID"));
        param.put("ITEMTYPE", PlantConst.ITEMTYPE_ZNTJK);
        //ls：经过商议 item_belong表 修改字段 isval 为 count 或者sum  后台 逻辑修改
        //源代码：通过itemBelongService.getValItemBelongByUserIdAndItemType 方法查询出 智能推荐卡是否还有可用
            //次数
        int cards =  itemBelongService.getValItemBelongCountByUserIdAndItemType(param);
       //ls：因黑钻会员使用次数为无限 ，并设置count 的初始值为-1    做反向判断： 因cards =0为分界线， cards >0 和 cards <0 都能使用
       if(curUser.getString("CARD_PUOPSE")!="UC"){

            if( cards > 0) {
               //ls: 使用一次 智能推荐 减一次
                int cards_used = cards - 1;
                param.put("COUNT",cards_used);

                itemBelongService.reduceItemBelong(param);

            }else{
                return InvokeResult.failure("智能推荐卡数量不足，无法进行智能推荐！");}



            //注掉原方法： itemBelongService.useItem(cards.get(0));

            Calendar a = Calendar.getInstance();
            String year = String.valueOf(a.get(Calendar.YEAR));
            String lastYear = String.valueOf(a.get(Calendar.YEAR) - 1);
            String last2Year = String.valueOf(a.get(Calendar.YEAR) - 2);
            DataMap YEAR = new DataMap();
            YEAR.put("CODE", "YEAR");
            YEAR = dictionaryService.getDictionaryByCode(YEAR);
            List<DataMap> YEARs = dictionaryService.getDictionariesByFatherId(YEAR);
            DataMap curDataMap = new DataMap();
            DataMap lastDataMap = new DataMap();
            DataMap last2DataMap = new DataMap();
            for(DataMap YEARTmp : YEARs) {
                if(YEARTmp.getString("NAME").equals(lastYear)){
                    lastDataMap.put("YEAR_ID", YEARTmp.getString("DIC_ID"));
                }

                if(YEARTmp.getString("NAME").equals(year)){
                    curDataMap.put("YEAR_ID", YEARTmp.getString("DIC_ID"));
                }

                if(YEARTmp.getString("NAME").equals(last2Year)) {
                    last2DataMap.put("YEAR_ID", YEARTmp.getString("DIC_ID"));
                }
            }
            curDataMap.put("MAJORTYPE_ID", exam.getString("MAJORTYPE"));
            lastDataMap.put("MAJORTYPE_ID", exam.getString("MAJORTYPE"));
            last2DataMap.put("MAJORTYPE_ID", exam.getString("MAJORTYPE"));
            //获取分数线
            List<DataMap> lines = scorelineService.getScorelineByYear(curDataMap);
            if(lines == null) {
                scorelineService.getScorelineByYear(lastDataMap);
            }

            for(DataMap line : lines) {
                if(PlantConst.ARRANGMENT_B1.equals(dataMap.getString("ARRANGMENT_ID")) && PlantConst.ARRANGMENT_B1.equals(line.getString("ARRANGMENT_ID"))) {
                    if(Double.valueOf(line.getString("SCORE")) > Double.valueOf(exam.getString("EXAMSCORE"))) {
                        return InvokeResult.failure("高考分数与批次不符合");
                    }
                    break;
                }
                if(PlantConst.ARRANGMENT_B2.equals(dataMap.getString("ARRANGMENT_ID")) && PlantConst.ARRANGMENT_B3.equals(line.getString("ARRANGMENT_ID"))) {
                    if(Double.valueOf(line.getString("SCORE")) > Double.valueOf(exam.getString("EXAMSCORE"))) {
                        return InvokeResult.failure("高考分数与批次不符合");
                    }
                    break;
                }
            }
        }else {
           return InvokeResult.success();
       }

       /* else
            return InvokeResult.failure("智能推荐卡数量不足，无法进行智能推荐！");*/
        /*modelAndView.addObject("exam", exam);*/
        dataMap.put("MAJORTYPE_ID", exam.getString("MAJORTYPE"));

        DataMap score = reportService.getScore(Double.valueOf(exam.getString("EXAMSCORE")), dataMap.getString("MAJORTYPE_ID"));

        Calendar a = Calendar.getInstance();
        String year = String.valueOf(a.get(Calendar.YEAR));
        String lastYear = String.valueOf(a.get(Calendar.YEAR) - 1);
        /*DataMap YEAR = new DataMap();
        YEAR.put("CODE", "YEAR");
        YEAR = dictionaryService.getDictionaryByCode(YEAR);
        List<DataMap> YEARs = dictionaryService.getDictionariesByFatherId(YEAR);
        for(DataMap YEARTmp : YEARs) {
            if(YEARTmp.getString("NAME").equals(lastYear)){
                dataMap.put("YEAR_ID", YEARTmp.getString("DIC_ID"));
            }
        }*/

        dataMap.put("YEAR_ID", score.getString("YEAR_ID"));

        dataMap.put("chongMax", score.getString("chongMax"));
        dataMap.put("chongMin", score.getString("chongMin"));
        dataMap.put("wenMax", score.getString("wenMax"));
        dataMap.put("wenMin", score.getString("wenMin"));
        dataMap.put("baoMax", score.getString("baoMax"));
        dataMap.put("baoMin", score.getString("baoMin"));
        dataMap.put("dianMax", score.getString("dianMax"));
        dataMap.put("dianMin", score.getString("dianMin"));

        if(score.getString("chongMax").equals("750") &&
           score.getString("chongMin").equals("750") &&
            score.getString("wenMax").equals("750") &&
            score.getString("wenMin").equals("750") &&
            score.getString("baoMax").equals("750") &&
            score.getString("baoMin").equals("750") &&
            score.getString("dianMax").equals("750") &&
            score.getString("dianMin").equals("750")) {
            return InvokeResult.success("750");
        }

        List<DataMap> listChong = mjscoreService.getMjscoresChong(dataMap);
        List<DataMap> listWen = mjscoreService.getMjscoresWen(dataMap);
        List<DataMap> listBao = mjscoreService.getMjscoresBao(dataMap);
        List<DataMap> listDian = mjscoreService.getMjscoresDian(dataMap);

        DataMap dataMapOut = new DataMap();
        if(listChong == null) listChong = new ArrayList<>();
        if(listWen == null) listChong = new ArrayList<>();
        if(listBao == null) listChong = new ArrayList<>();
        if(listDian == null) listChong = new ArrayList<>();

        for(DataMap chong : listChong) {
            List<DataMap> scores = mjscoreService.getMjscoreBySchoolAndMajor(chong);
            if(scores == null) scores = new ArrayList<>();
            chong.put("scores", scores);

            List<DataMap> properties = scpropertyService.getScpropertyByScId(chong);
            if(properties == null) properties = new ArrayList<DataMap>();
            chong.put("properties", properties);

            List<DataMap> subjecttypes = subjecttypeService.getSubjecttypeByScId(chong);
            if(subjecttypes == null) subjecttypes = new ArrayList<DataMap>();
            chong.put("subjecttypes", subjecttypes);
        }
        for(DataMap wen : listWen) {
            List<DataMap> scores = mjscoreService.getMjscoreBySchoolAndMajor(wen);
            if(scores == null) scores = new ArrayList<>();
            wen.put("scores", scores);

            List<DataMap> properties = scpropertyService.getScpropertyByScId(wen);
            if(properties == null) properties = new ArrayList<DataMap>();
            wen.put("properties", properties);

            List<DataMap> subjecttypes = subjecttypeService.getSubjecttypeByScId(wen);
            if(subjecttypes == null) subjecttypes = new ArrayList<DataMap>();
            wen.put("subjecttypes", subjecttypes);
        }
        for(DataMap bao : listBao) {
            List<DataMap> scores = mjscoreService.getMjscoreBySchoolAndMajor(bao);
            if(scores == null) scores = new ArrayList<>();
            bao.put("scores", scores);

            List<DataMap> properties = scpropertyService.getScpropertyByScId(bao);
            if(properties == null) properties = new ArrayList<DataMap>();
            bao.put("properties", properties);

            List<DataMap> subjecttypes = subjecttypeService.getSubjecttypeByScId(bao);
            if(subjecttypes == null) subjecttypes = new ArrayList<DataMap>();
            bao.put("subjecttypes", subjecttypes);
        }
        for(DataMap dian : listDian) {
            List<DataMap> scores = mjscoreService.getMjscoreBySchoolAndMajor(dian);
            if(scores == null) scores = new ArrayList<>();
            dian.put("scores", scores);

            List<DataMap> properties = scpropertyService.getScpropertyByScId(dian);
            if(properties == null) properties = new ArrayList<DataMap>();
            dian.put("properties", properties);

            List<DataMap> subjecttypes = subjecttypeService.getSubjecttypeByScId(dian);
            if(subjecttypes == null) subjecttypes = new ArrayList<DataMap>();
            dian.put("subjecttypes", subjecttypes);
        }


        dataMapOut.put("listChong", listChong);
        dataMapOut.put("listWen", listWen);
        dataMapOut.put("listBao", listBao);
        dataMapOut.put("listDian", listDian);

        return InvokeResult.success(dataMapOut);
    }

    private boolean isSchoolProvince(String total, String sObj) {
        if(StringUtils.isBlank(total)) return true;

        if(StringUtils.isBlank(total.replace(",", ""))) return true;

        try{
            String[] totals = total.split(",");
            for(String tmp : totals) {
                if(tmp.toUpperCase().equals(sObj.toUpperCase())) return true;
            }
        }
        catch (Exception e) {

        }

        return false;
    }

    /**
     * 模拟填报
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/zy")
    public InvokeResult zy() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return InvokeResult.failure("请登录账号！");

        DataMap exam = examineeService.getExamineeByUserId(curUser);
        if(exam == null || StringUtils.isBlank(exam.getString("MAJORTYPE")) || StringUtils.isBlank(exam.getString("EXAMSCORE")))
            return InvokeResult.failure("请完善考生信息！");

        DataMap dataMap = this.getDataMap();

        String flag = dataMap.getString("flag");
        if(StringUtils.isBlank(flag)) {
            return InvokeResult.failure("数值非法，请重试！");
        }
        if( !flag.equals("1") && !flag.equals("2")){
            return InvokeResult.failure("数值非法，请重试！");
        }

        Calendar a = Calendar.getInstance();
        String year = String.valueOf(a.get(Calendar.YEAR));
        String lastYear = String.valueOf(a.get(Calendar.YEAR) - 1);
        String last2Year = String.valueOf(a.get(Calendar.YEAR) - 2);
        DataMap YEAR = new DataMap();
        YEAR.put("CODE", "YEAR");
        YEAR = dictionaryService.getDictionaryByCode(YEAR);
        List<DataMap> YEARs = dictionaryService.getDictionariesByFatherId(YEAR);
        DataMap curDataMap = new DataMap();
        DataMap lastDataMap = new DataMap();
        DataMap last2DataMap = new DataMap();
        for(DataMap YEARTmp : YEARs) {
            if(YEARTmp.getString("NAME").equals(lastYear)){
                lastDataMap.put("YEAR_ID", YEARTmp.getString("DIC_ID"));
            }

            if(YEARTmp.getString("NAME").equals(year)){
                curDataMap.put("YEAR_ID", YEARTmp.getString("DIC_ID"));
            }

            if(YEARTmp.getString("NAME").equals(last2Year)) {
                last2DataMap.put("YEAR_ID", YEARTmp.getString("DIC_ID"));
            }
        }
        curDataMap.put("MAJORTYPE_ID", exam.getString("MAJORTYPE"));
        lastDataMap.put("MAJORTYPE_ID", exam.getString("MAJORTYPE"));
        last2DataMap.put("MAJORTYPE_ID", exam.getString("MAJORTYPE"));
        List<DataMap> lines = scorelineService.getScorelineByYear(curDataMap);
        if(lines == null) {
            scorelineService.getScorelineByYear(lastDataMap);
        }

        for(DataMap line : lines) {
            if(flag.equals("1") && PlantConst.ARRANGMENT_B1.equals(line.getString("ARRANGMENT_ID"))) {
                if(Double.valueOf(line.getString("SCORE")) > Double.valueOf(exam.getString("EXAMSCORE"))) {
                    return InvokeResult.failure("高考分数与批次不符合");
                }
                break;
            }
            if(flag.equals("2") && PlantConst.ARRANGMENT_B3.equals(line.getString("ARRANGMENT_ID"))) {
                if(Double.valueOf(line.getString("SCORE")) > Double.valueOf(exam.getString("EXAMSCORE"))) {
                    return InvokeResult.failure("高考分数与批次不符合");
                }
                break;
            }
        }

        Integer iFlag = Integer.valueOf(flag);


        Set<String> setSchools = new HashSet<String>();
        for(int i = 1; i < (iFlag * 5 + 1); i++) {
            Set<String> set = new HashSet<String>();
            String s_key = "school" + i;
            String zy_key = "zye" + i;
            if(StringUtils.isBlank(dataMap.getString(s_key))){
                return InvokeResult.failure("志愿院校有未填项，请检查！");
            }
            String zy_info = dataMap.getString(zy_key);
            if(zy_info == null) zy_info = "";
            if(zy_info.isEmpty()) return InvokeResult.failure("志愿院校所选专业不能全部为空，请检查！");
            if(!zy_info.isEmpty()){
                String[] zy_infos = zy_info.split(",");
                if(zy_infos.length <= 0){
                    return InvokeResult.failure("志愿院校所选专业不能全部为空，请检查！");
                }
            }

            setSchools.add(dataMap.getString(s_key));
        }


        if(setSchools.size() < (iFlag * 5)){
            return InvokeResult.failure("志愿院校有重复项，请检查！");
        }
        //ls:此处是模拟填报  卡次数 逻辑   修改item_belong表需要 修改此处代码 及 sevice层 代码
        //ls：数据库 取值  设计到 mapper.xml  的改动。
        //ls：后台代码修改 完毕后需要检查  对应的.ftl 文件代码
        DataMap param = new DataMap();
        param.put("USER_ID", curUser.getString("USER_ID"));
        param.put("ITEMTYPE", PlantConst.ITEMTYPE_MNTBK);

      //原方法：  List<DataMap> cards = itemBelongService.getValItemBelongByUserIdAndItemType(param);
       //使用 模拟填报卡
        int cards = itemBelongService.getValItemBelongCountByUserIdAndItemType(param);

        //ls：因黑钻会员使用次数为无限 ， 做反向判断 如果是黑钻会员直接放行
        if(curUser.getString("CARD_PUOPSE")!= "UC"){
            if( cards>0 ){ //使用一次 减一次
                int cards_used= cards - 1;
                param.put("COUNT",cards_used);
                itemBelongService.reduceItemBelong(param);
            }
                    //注掉原 卡 list 集合 的 判断
                /*if(cards != null && cards.size() > 0){
                    itemBelongService.useItem(cards.get(0));
                }*/
            else
                return InvokeResult.failure("模拟填报卡数量不足，无法进行模拟填报！");
            }else
                return InvokeResult.success();




        dataMap.put("MAJORTYPE_ID", exam.getString("MAJORTYPE"));
        DataMap score = reportService.getScore(Double.valueOf(exam.getString("EXAMSCORE")), exam.getString("MAJORTYPE"));
        if(score.getString("chongMax").equals("750") &&
                score.getString("chongMin").equals("750") &&
                score.getString("wenMax").equals("750") &&
                score.getString("wenMin").equals("750") &&
                score.getString("baoMax").equals("750") &&
                score.getString("baoMin").equals("750") &&
                score.getString("dianMax").equals("750") &&
                score.getString("dianMin").equals("750")) {
            return InvokeResult.success("750");
        }
        dataMap.put("score", score.getString("curScore"));
        dataMap.put("YEAR_ID", score.getString("YEAR_ID"));
        List<DataMap> result = mjscoreService.getTbInfo(dataMap);
        if(result == null) result = new ArrayList<DataMap>();

        for(DataMap resultObj : result) {
            List<DataMap> properties = scpropertyService.getScpropertyByScId(resultObj);
            if(properties == null) properties = new ArrayList<DataMap>();
            resultObj.put("properties", properties);

            List<DataMap> subjecttypes = subjecttypeService.getSubjecttypeByScId(resultObj);
            if(subjecttypes == null) subjecttypes = new ArrayList<DataMap>();
            resultObj.put("subjecttypes", subjecttypes);
        }

        Set<String> setSchoolsTmp = new HashSet<String>();
        for(DataMap mjscore : result) {
            setSchoolsTmp.add(mjscore.getString("SCHOOL_ID"));
        }

        List<List<DataMap>> listOut2 = new ArrayList<List<DataMap>>();
        for(int i = 1; i < (iFlag * 5 + 1); i++) {
            String s_key = "school" + i;
            String school_id = dataMap.getString(s_key);
            for (String setSchool : setSchoolsTmp) {
                if(StringUtils.isBlank(school_id)) continue;
                if(school_id.equals(setSchool)){
                    List<DataMap> tmp = new ArrayList<DataMap>();
                    for (DataMap mjscore : result) {
                        if (setSchool.equals(mjscore.getString("SCHOOL_ID"))) {
                            tmp.add(mjscore);
                        }
                    }
                    if (tmp.size() > 0) {
                        listOut2.add(tmp);
                    }
                }
            }
        }


        return InvokeResult.success(listOut2);
    }
}
