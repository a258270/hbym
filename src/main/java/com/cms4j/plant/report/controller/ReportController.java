package com.cms4j.plant.report.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.DateUtil;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.major.major.service.MajorService;
import com.cms4j.plant.report.service.ReportService;
import com.cms4j.plant.school.mjscore.service.MjscoreService;
import com.cms4j.plant.school.service.ArrangmentService;
import com.cms4j.plant.school.service.HasmajorService;
import com.cms4j.plant.school.service.SchoolService;
import com.cms4j.plant.user.service.CompleteStudentService;
import com.cms4j.plant.user.service.ExamineeService;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
@RequestMapping(value = "/plant/report")
public class ReportController extends PageBaseController {

    @Autowired
    private DictionaryService dictionaryService;

    @Autowired
    private ExamineeService examineeService;

    @Autowired
    private MajorService majorService;

    @Autowired
    private SchoolService schoolService;

    @Autowired
    private HasmajorService hasmajorService;

    @Autowired
    private ReportService reportService;

    @Autowired
    private MjscoreService mjscoreService;
//智能推荐
    @RequestMapping(value = "/index")
    public ModelAndView index() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        //设定视图页面（freemarker静态页面动态取值）
        modelAndView.setViewName("/plant/ymplant/report/mendation/mendation");

        DataMap dataMap = this.getDataMap();
        if(!StringUtils.isBlank(dataMap.getString("province")))
            modelAndView.addObject("province", dataMap.getString("province"));

        if(!StringUtils.isBlank(dataMap.getString("arrangment")))
            modelAndView.addObject("arrangment", dataMap.getString("arrangment"));

        /*DataMap PROVINCE = new DataMap();
        PROVINCE.put("CODE", "PROVINCE");
        PROVINCE = dictionaryService.getDictionaryByCode(PROVINCE);
        List<DataMap> PROVINCEs = dictionaryService.getDictionariesByFatherId(PROVINCE);
        modelAndView.addObject("PROVINCEs", PROVINCEs);*/
        List<DataMap> bmajors = majorService.getMajorsByLevel(PlantConst.MAJOR_BK, 4);
        List<DataMap> zmajors = majorService.getMajorsByLevel(PlantConst.MAJOR_ZK, 4);
        modelAndView.addObject("bmajors", bmajors);
        modelAndView.addObject("zmajors", zmajors);
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser != null) {
            DataMap examinee = examineeService.getExamineeByUserId(curUser);
            modelAndView.addObject("examinee", examinee);
            DataMap param = new DataMap();

            param.put("YEAR_ID", DateUtil.getLastYearByAdoptNumber(dictionaryService, 1));
            /*
            param.put("MAJORTYPE_ID", examinee.getString("MAJORTYPE"));
            List<DataMap> schools = schoolService.getSchoolsByMajorType(param);
            modelAndView.addObject("schools", schools);*/
        }

        modelAndView.addObject("curPage", "report");
        return modelAndView;
    }

    @RequestMapping(value = "/report")
    public ModelAndView report() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/report/mulation/mulation");

        /*DataMap PROVINCE = new DataMap();
        PROVINCE.put("CODE", "PROVINCE");
        PROVINCE = dictionaryService.getDictionaryByCode(PROVINCE);
        List<DataMap> PROVINCEs = dictionaryService.getDictionariesByFatherId(PROVINCE);
        modelAndView.addObject("PROVINCEs", PROVINCEs);*/
        /*List<DataMap> bmajors = majorService.getMajorsByLevel(PlantConst.MAJOR_BK, 4);
        List<DataMap> zmajors = majorService.getMajorsByLevel(PlantConst.MAJOR_ZK, 4);
        modelAndView.addObject("bmajors", bmajors);
        modelAndView.addObject("zmajors", zmajors);*/
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser != null) {
            DataMap examinee = examineeService.getExamineeByUserId(curUser);
            modelAndView.addObject("examinee", examinee);
            DataMap param = new DataMap();

            param.put("YEAR_ID", DateUtil.getLastYearByAdoptNumber(dictionaryService, 1));
            /*
            param.put("MAJORTYPE_ID", examinee.getString("MAJORTYPE"));
            */
            if(examinee != null){
                param.put("MAJORTYPE_ID", examinee.getString("MAJORTYPE"));
                param.put("ARRANGMENT_ID", PlantConst.ARRANGMENT_B1);
                List<DataMap> b1schools = schoolService.getSchoolsByMajorType(param);
                modelAndView.addObject("b1schools", b1schools);
                param.put("ARRANGMENT_ID", PlantConst.ARRANGMENT_B2);
                List<DataMap> b2schools = schoolService.getSchoolsByMajorType(param);
                modelAndView.addObject("b2schools", b2schools);
            }
        }

        modelAndView.addObject("curPage", "report");
        return modelAndView;
    }

    @RequestMapping(value = "/page")
    public ModelAndView page() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/reporting/reporting-page");

        return modelAndView;
    }

    /*@RequestMapping(value = "/reporting")
    public ModelAndView reporting() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null) {
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }
        DataMap dataMap = this.getDataMap();

        DataMap exam = examineeService.getExamineeByUserId(curUser);
        modelAndView.addObject("exam", exam);

        Double score = reportService.getScore(Double.valueOf(exam.getString("EXAMSCORE")), dataMap.getString("MAJORTYPE_ID"));

        Calendar a = Calendar.getInstance();
        String year = String.valueOf(a.get(Calendar.YEAR));
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
        dataMap.put("SCORE", score);

        List<DataMap> listChong = mjscoreService.getMjscoresChong(dataMap);
        List<DataMap> listWen = mjscoreService.getMjscoresWen(dataMap);
        List<DataMap> listBao = mjscoreService.getMjscoresBao(dataMap);
        List<DataMap> listDian = mjscoreService.getMjscoresDian(dataMap);

        List<DataMap> listChongOut = new ArrayList<DataMap>();
        List<DataMap> listWenOut = new ArrayList<DataMap>();
        List<DataMap> listBaoOut = new ArrayList<DataMap>();
        List<DataMap> listDianOut = new ArrayList<DataMap>();

        for(DataMap chong: listChong) {
            if(!isSchoolProvince(dataMap.getString("PROVINCE"), chong.getString("PROVINCE"))) continue;

            if(!StringUtils.isBlank(dataMap.getString("tbao1"))){
                if(chong.getString("MAJOR_ID").equals(dataMap.getString("tbao1"))){
                    listChongOut.add(chong);
                    continue;
                }
            }
            if(!StringUtils.isBlank(dataMap.getString("tbao2"))){
                if(chong.getString("MAJOR_ID").equals(dataMap.getString("tbao2"))){
                    listChongOut.add(chong);
                    continue;
                }
            }
            if(!StringUtils.isBlank(dataMap.getString("tbao3"))){
                if(chong.getString("MAJOR_ID").equals(dataMap.getString("tbao3"))){
                    listChongOut.add(chong);
                    continue;
                }
            }
            if(!StringUtils.isBlank(dataMap.getString("tbao4"))){
                if(chong.getString("MAJOR_ID").equals(dataMap.getString("tbao4"))){
                    listChongOut.add(chong);
                    continue;
                }
            }
            if(!StringUtils.isBlank(dataMap.getString("tbao5"))){
                if(chong.getString("MAJOR_ID").equals(dataMap.getString("tbao5"))){
                    listChongOut.add(chong);
                    continue;
                }
            }

            if(StringUtils.isBlank(dataMap.getString("tbao1"))
                    && StringUtils.isBlank(dataMap.getString("tbao2"))
                    && StringUtils.isBlank(dataMap.getString("tbao3"))
                    && StringUtils.isBlank(dataMap.getString("tbao4"))
                    && StringUtils.isBlank(dataMap.getString("tbao5"))){
                listChongOut.add(chong);
            }
        }

        for(DataMap wen: listWen) {
            if(!isSchoolProvince(dataMap.getString("PROVINCE"), wen.getString("PROVINCE"))) continue;

            if(!StringUtils.isBlank(dataMap.getString("tbao1"))){
                if(wen.getString("MAJOR_ID").equals(dataMap.getString("tbao1"))){
                    listWenOut.add(wen);
                    continue;
                }
            }
            if(!StringUtils.isBlank(dataMap.getString("tbao2"))){
                if(wen.getString("MAJOR_ID").equals(dataMap.getString("tbao2"))){
                    listWenOut.add(wen);
                    continue;
                }
            }
            if(!StringUtils.isBlank(dataMap.getString("tbao3"))){
                if(wen.getString("MAJOR_ID").equals(dataMap.getString("tbao3"))){
                    listWenOut.add(wen);
                    continue;
                }
            }
            if(!StringUtils.isBlank(dataMap.getString("tbao4"))){
                if(wen.getString("MAJOR_ID").equals(dataMap.getString("tbao4"))){
                    listWenOut.add(wen);
                    continue;
                }
            }
            if(!StringUtils.isBlank(dataMap.getString("tbao5"))){
                if(wen.getString("MAJOR_ID").equals(dataMap.getString("tbao5"))){
                    listWenOut.add(wen);
                    continue;
                }
            }

            if(StringUtils.isBlank(dataMap.getString("tbao1"))
                    && StringUtils.isBlank(dataMap.getString("tbao2"))
                    && StringUtils.isBlank(dataMap.getString("tbao3"))
                    && StringUtils.isBlank(dataMap.getString("tbao4"))
                    && StringUtils.isBlank(dataMap.getString("tbao5"))){
                listWenOut.add(wen);
            }
        }

        for(DataMap bao: listBao) {
            if(!isSchoolProvince(dataMap.getString("PROVINCE"), bao.getString("PROVINCE"))) continue;

            if(!StringUtils.isBlank(dataMap.getString("tbao1"))){
                if(bao.getString("MAJOR_ID").equals(dataMap.getString("tbao1"))){
                    listBaoOut.add(bao);
                    continue;
                }
            }
            if(!StringUtils.isBlank(dataMap.getString("tbao2"))){
                if(bao.getString("MAJOR_ID").equals(dataMap.getString("tbao2"))){
                    listBaoOut.add(bao);
                    continue;
                }
            }
            if(!StringUtils.isBlank(dataMap.getString("tbao3"))){
                if(bao.getString("MAJOR_ID").equals(dataMap.getString("tbao3"))){
                    listBaoOut.add(bao);
                    continue;
                }
            }
            if(!StringUtils.isBlank(dataMap.getString("tbao4"))){
                if(bao.getString("MAJOR_ID").equals(dataMap.getString("tbao4"))){
                    listBaoOut.add(bao);
                    continue;
                }
            }
            if(!StringUtils.isBlank(dataMap.getString("tbao5"))){
                if(bao.getString("MAJOR_ID").equals(dataMap.getString("tbao5"))){
                    listBaoOut.add(bao);
                    continue;
                }
            }
            if(StringUtils.isBlank(dataMap.getString("tbao1"))
                    && StringUtils.isBlank(dataMap.getString("tbao2"))
                    && StringUtils.isBlank(dataMap.getString("tbao3"))
                    && StringUtils.isBlank(dataMap.getString("tbao4"))
                    && StringUtils.isBlank(dataMap.getString("tbao5"))){
                listBaoOut.add(bao);
            }
        }

        for(DataMap dian: listDian) {
            if(!isSchoolProvince(dataMap.getString("PROVINCE"), dian.getString("PROVINCE"))) continue;

            if(!StringUtils.isBlank(dataMap.getString("tbao1"))){
                if(dian.getString("MAJOR_ID").equals(dataMap.getString("tbao1"))){
                    listDianOut.add(dian);
                    continue;
                }
            }
            if(!StringUtils.isBlank(dataMap.getString("tbao2"))){
                if(dian.getString("MAJOR_ID").equals(dataMap.getString("tbao2"))){
                    listDianOut.add(dian);
                    continue;
                }
            }
            if(!StringUtils.isBlank(dataMap.getString("tbao3"))){
                if(dian.getString("MAJOR_ID").equals(dataMap.getString("tbao3"))){
                    listDianOut.add(dian);
                    continue;
                }
            }
            if(!StringUtils.isBlank(dataMap.getString("tbao4"))){
                if(dian.getString("MAJOR_ID").equals(dataMap.getString("tbao4"))){
                    listDianOut.add(dian);
                    continue;
                }
            }
            if(!StringUtils.isBlank(dataMap.getString("tbao5"))){
                if(dian.getString("MAJOR_ID").equals(dataMap.getString("tbao5"))){
                    listDianOut.add(dian);
                    continue;
                }
            }

            if(StringUtils.isBlank(dataMap.getString("tbao1"))
                && StringUtils.isBlank(dataMap.getString("tbao2"))
                && StringUtils.isBlank(dataMap.getString("tbao3"))
                && StringUtils.isBlank(dataMap.getString("tbao4"))
                && StringUtils.isBlank(dataMap.getString("tbao5"))){
                listDianOut.add(dian);
            }
        }

        modelAndView.addObject("listChong", listChongOut);
        modelAndView.addObject("listWen", listWenOut);
        modelAndView.addObject("listBao", listBaoOut);
        modelAndView.addObject("listDian", listDianOut);

        modelAndView.setViewName("/plant/ymplant/reporting/reporting-page");
        return modelAndView;
    }*/

}
