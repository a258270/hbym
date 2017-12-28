package com.cms4j.plant.user.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.dictionary.service.DictionaryService;
import com.cms4j.base.util.*;
import com.cms4j.plant.item.item.service.ItemBelongService;
import com.cms4j.plant.item.item.service.ItemBuyService;
import com.cms4j.plant.user.pocket.service.PocketService;
import com.cms4j.plant.user.service.*;
import com.cms4j.plant.util.PlantConst;
import com.cms4j.plant.util.PlantValidUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * description:
 *
 * @author: zmj
 * @create: 2017/6/29
 */
@Controller
@RequestMapping(value = "/plant/user")
public class PlantUserController extends PageBaseController {

    @Autowired
    private PlantUserService plantUserService;
    @Autowired
    private PocketService pocketService;
    @Autowired
    private CompleteStudentService completeStudentService;
    @Autowired
    private CompleteTeacherService completeTeacherService;
    @Autowired
    private CompleteProService completeProService;
    @Autowired
    private DictionaryService dictionaryService;
    @Autowired
    private ExamineeService examineeService;
    @Autowired
    private ItemBelongService itemBelongService;
    /**
     * 个人中心
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/center")
    public ModelAndView center() throws Exception {
        DataMap param = this.getDataMap();
        ModelAndView modelAndView = this.getModelAndView();
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_STUDENT.equals(curUser.getString("ROLE_ID"))){
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }
        DataMap dataMap = completeStudentService.getCompleteStudentByUserId(curUser);
        modelAndView.addObject("completeInfo", dataMap);
        modelAndView.setViewName("/plant/ymplant/center/student/center");
        if(!StringUtils.isBlank(param.getString("p"))) {
            modelAndView.addObject("url", param.getString("p"));
        }
        return modelAndView;
    }

    /*@RequestMapping(value = "/tocomplete")
    public String toComplete(Model model) throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return "redirect:" + Const.LOGIN;
        
        DataMap SEX = new DataMap();
        SEX.put("CODE", "SEX");
        SEX = dictionaryService.getDictionaryByCode(SEX);
        List<DataMap> SEXs = dictionaryService.getDictionariesByFatherId(SEX);
        model.addAttribute("SEXs", SEXs);

        DataMap MAJORTYPE = new DataMap();
        MAJORTYPE.put("CODE", "MAJORTYPE");
        MAJORTYPE = dictionaryService.getDictionaryByCode(MAJORTYPE);
        List<DataMap> MAJORTYPEs = dictionaryService.getDictionariesByFatherId(MAJORTYPE);
        model.addAttribute("MAJORTYPEs", MAJORTYPEs);

        DataMap CITY = new DataMap();
        CITY.put("CODE", "CITY");
        CITY = dictionaryService.getDictionaryByCode(CITY);
        List<DataMap> CITYs = dictionaryService.getDictionariesByFatherId(CITY);
        model.addAttribute("CITYs", CITYs);

        //专家
        if(PlantConst.ROLE_EXPERT.equals(curUser.getString("ROLE_ID"))) {
            DataMap completeInfo = completeProService.getCompleteProByUserId(curUser);
            model.addAttribute("completeInfo", completeInfo);
            return "plant/user/userinfo_pro";
        }
        //教师
        else if(PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))) {
            DataMap completeInfo = completeTeacherService.getCompleteTeacherByUserId(curUser);
            model.addAttribute("completeInfo", completeInfo);
            return "plant/user/userinfo_tea";
        }
        //学生
        else{
            DataMap completeInfo = completeStudentService.getCompleteStudentByUserId(curUser);
            model.addAttribute("completeInfo", completeInfo);
            return "plant/ymplant/center/paging/binding/certification";
        }
    }*/

    //基本信息
    @RequestMapping(value = "/basicinfo")
    public ModelAndView basicInfo() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null){
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        DataMap basicinfo = completeStudentService.getCompleteStudentByUserId(curUser);

        Integer completeCount = 0;
        String isRealName = "false";
        String isPhone = "false";
        String isEmail = "false";
        String isTrade = "false";
        if(basicinfo != null){
            if (!StringUtils.isBlank(basicinfo.getString("IDCARD"))){
                completeCount += 25;
                isRealName = "true";
            }

            if (!StringUtils.isBlank(basicinfo.getString("PHONE"))){
                completeCount += 25;
                isPhone = "true";
            }

            if (!StringUtils.isBlank(basicinfo.getString("EMAIL"))){
                completeCount += 25;
                isEmail = "true";
            }

            if (!StringUtils.isBlank(basicinfo.getString("TRADEPASSWORD"))){
                completeCount += 25;
                isTrade = "true";
            }
        }

        modelAndView.addObject("basicInfo", basicinfo);

        modelAndView.addObject("completeCount", completeCount);
        modelAndView.addObject("isRealName", isRealName);
        modelAndView.addObject("isPhone", isPhone);
        modelAndView.addObject("isEmail", isEmail);
        modelAndView.addObject("isTrade", isTrade);

        modelAndView.setViewName("/plant/ymplant/center/student/paging/basis");
        return modelAndView;
    }

    /**
     * 绑定手机
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/binding/phone")
    public ModelAndView bindingPhone() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null) {
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        modelAndView.setViewName("/plant/ymplant/center/student/paging/binding/mobile");
        return modelAndView;
    }

    @RequestMapping(value = "/getcode", method = RequestMethod.GET)
    public void getCode(HttpServletResponse response) throws IOException {
        //设置response头信息
        //禁止缓存
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        String strCode = VerifyCodeUtil.getCode(4);

        ImageIO.write(VerifyCodeUtil.createImage(strCode), "JPEG", response.getOutputStream());

        SessionUtil.addCode2Session(strCode);
        while(SessionUtil.getCodeFromSession() == null){
            SessionUtil.addCode2Session(strCode);
        }

        response.getOutputStream().flush();
    }

    //考生信息
    @RequestMapping(value = "/examinee")
    public ModelAndView examinee() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null) {
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        DataMap examinee = examineeService.getExamineeByUserId(curUser);
        modelAndView.addObject("examinee", examinee);

        DataMap MAJORTYPE = new DataMap();
        MAJORTYPE.put("CODE", "MAJORTYPE");
        MAJORTYPE = dictionaryService.getDictionaryByCode(MAJORTYPE);
        List<DataMap> MAJORTYPEs = dictionaryService.getDictionariesByFatherId(MAJORTYPE);
        modelAndView.addObject("MAJORTYPEs", MAJORTYPEs);

        DataMap PROVINCE = new DataMap();
        PROVINCE.put("CODE", "PROVINCE");
        PROVINCE = dictionaryService.getDictionaryByCode(PROVINCE);
        List<DataMap> PROVINCEs = dictionaryService.getDictionariesByFatherId(PROVINCE);
        modelAndView.addObject("PROVINCEs", PROVINCEs);

        DataMap GRADE = new DataMap();
        GRADE.put("CODE", "GRADE");
        GRADE = dictionaryService.getDictionaryByCode(GRADE);
        List<DataMap> GRADEs = dictionaryService.getDictionariesByFatherId(GRADE);
        modelAndView.addObject("GRADEs", GRADEs);

        modelAndView.addObject("canupdatescore", DateUtil.canUpdateExam(examinee));

        modelAndView.setViewName("/plant/ymplant/center/student/paging/examinee");
        return modelAndView;
    }

    /**
     * 绑定邮箱
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/binding/email")
    public ModelAndView bindingEmail() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null) {
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }
        modelAndView.setViewName("/plant/ymplant/center/student/paging/binding/email");
        return modelAndView;
    }

    @RequestMapping(value = "/binding/idcard")
    public ModelAndView bindingIdcard() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null) {
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }
        modelAndView.setViewName("/plant/ymplant/center/student/paging/binding/certification");
        return modelAndView;
    }

    @RequestMapping(value = "/account")
    public ModelAndView account() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null) {
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        DataMap complete = new DataMap();
        if(PlantConst.ROLE_STUDENT.equals(curUser.getString("ROLE_ID")))
             complete = completeStudentService.getCompleteStudentByUserId(curUser);
        else if(PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID")))
            complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
        modelAndView.addObject("complete", complete);

        Integer completeCount = 0;
        String completeLevel = "低";
        String isRealName = "false";
        String isPhone = "false";
        String isEmail = "false";
        String isTrade = "false";
        if(complete != null){
            if (!StringUtils.isBlank(complete.getString("IDCARD"))){
                completeCount += 25;
                isRealName = "true";
            }

            if (!StringUtils.isBlank(complete.getString("PHONE"))){
                completeCount += 25;
                isPhone = "true";
            }

            if (!StringUtils.isBlank(complete.getString("EMAIL"))){
                completeCount += 25;
                isEmail = "true";
            }

            if (!StringUtils.isBlank(complete.getString("TRADEPASSWORD"))){
                completeCount += 25;
                isTrade = "true";
            }
        }

        if(completeCount >= 75){
            completeLevel = "高";
        }
        else if(completeCount >= 50){
            completeLevel = "中";
        }
        modelAndView.addObject("completeLevel", completeLevel);
        modelAndView.addObject("isRealName", isRealName);
        modelAndView.addObject("isPhone", isPhone);
        modelAndView.addObject("isEmail", isEmail);
        modelAndView.addObject("isTrade", isTrade);

        modelAndView.setViewName("/plant/ymplant/center/student/paging/account");
        return modelAndView;
    }

    @RequestMapping(value = "/updatepass")
    public ModelAndView updatepass() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null) {
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        modelAndView.setViewName("/plant/ymplant/center/student/paging/binding/cipher");
        return modelAndView;
    }

    @RequestMapping(value = "/updatetpass")
    public ModelAndView updatetpass() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null) {
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        modelAndView.setViewName("/plant/ymplant/center/student/paging/binding/transact");
        return modelAndView;
    }
    //ls:获取数据库中 院校咨询卡和 智能推荐 模拟填报的 次数
    @RequestMapping(value = "/pocket")
    public ModelAndView pocket() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null) {
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        DataMap pocket = pocketService.getPocketByUserId(curUser);
        modelAndView.addObject("pocket", pocket);

        DataMap result = itemBelongService.getAllValItemsByUser(curUser);

        modelAndView.addObject("yxzxk", result.get("yxzxk"));

        modelAndView.addObject("mntbk", result.get("mntbk"));

        modelAndView.addObject("zntjk", result.get("zntjk"));
        //12.28 ls:获取 性格测试A卡(简单版)数据  返回给前台
        modelAndView.addObject("xgcska",result.get("xgcska"));
        //12.28 ls:获取 性格测试B卡(专业版)数据  返回给前台
        modelAndView.addObject("xgcskb",result.get("xgcskb"));

        modelAndView.setViewName("/plant/ymplant/center/student/belongings");
        return modelAndView;
    }

    @RequestMapping(value = "/activecard")
    public ModelAndView activeCard() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_STUDENT.equals(curUser.getString("ROLE_ID"))) {
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        modelAndView.setViewName("/plant/ymplant/center/student/authority");
        return modelAndView;
    }

    /**
     * 用户权限页面
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/authority")
    public ModelAndView authority() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null) {
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        if(StringUtils.isBlank(curUser.getString("OVERDUETIME")))
            modelAndView.setViewName("/plant/ymplant/center/student/authority");
        else
            modelAndView.setViewName("/plant/ymplant/center/student/authority-three");

        return modelAndView;
    }

    @RequestMapping(value = "/forget")
    public ModelAndView forget() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        modelAndView.setViewName("/plant/ymplant/forgot/forgot");

        return modelAndView;
    }

    @RequestMapping(value = "/forget2", method = RequestMethod.POST)
    public ModelAndView forget2() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        DataMap dataMap = this.getDataMap();
        if(StringUtils.isBlank(dataMap.getString("USERNAME"))){
            modelAndView.addObject("error", "用户名不能为空！");
            modelAndView.setViewName("/plant/ymplant/forgot/forgot");
            return modelAndView;
        }
        if(!PlantValidUtil.isUsername(dataMap.getString("USERNAME"))){
            modelAndView.addObject("error", PlantValidUtil.ERROR_MSG_USERNAME);
            modelAndView.setViewName("/plant/ymplant/forgot/forgot");
            return modelAndView;
        }

        DataMap user = plantUserService.getUserByUsername(dataMap);
        if(user == null){
            modelAndView.addObject("error", "该用户不存在！");
            modelAndView.setViewName("/plant/ymplant/forgot/forgot");
            return modelAndView;
        }

        modelAndView.addObject("USERNAME", dataMap.getString("USERNAME"));
        modelAndView.setViewName("/plant/ymplant/forgot/forgot-two");
        return modelAndView;
    }

    @RequestMapping(value = "/forget3", method = RequestMethod.POST)
    public ModelAndView forget3() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        DataMap dataMap = this.getDataMap();
        if(StringUtils.isBlank(dataMap.getString("USERNAME"))){
            modelAndView.addObject("error", "用户名不能为空！");
            modelAndView.addObject("USERNAME", dataMap.getString("USERNAME"));
            modelAndView.setViewName("/plant/ymplant/forgot/forgot-two");
            return modelAndView;
        }
        if(!PlantValidUtil.isUsername(dataMap.getString("USERNAME"))){
            modelAndView.addObject("error", PlantValidUtil.ERROR_MSG_PHONE);
            modelAndView.addObject("USERNAME", dataMap.getString("USERNAME"));
            modelAndView.setViewName("/plant/ymplant/forgot/forgot-two");
            return modelAndView;
        }

        if(StringUtils.isBlank(dataMap.getString("CODE"))) {
            modelAndView.addObject("error", "验证码不能为空！");
            modelAndView.addObject("USERNAME", dataMap.getString("USERNAME"));
            modelAndView.setViewName("/plant/ymplant/forgot/forgot-two");
            return modelAndView;
        }

        DataMap user = plantUserService.getUserByUsername(dataMap);
        if(user == null){
            modelAndView.addObject("error", "该用户不存在！");
            modelAndView.addObject("USERNAME", dataMap.getString("USERNAME"));
            modelAndView.setViewName("/plant/ymplant/forgot/forgot-two");
            return modelAndView;
        }

        if(StringUtils.isBlank(dataMap.getString("PASSWORD"))){
            modelAndView.addObject("error", "密码不能为空！");
            modelAndView.addObject("USERNAME", dataMap.getString("USERNAME"));
            modelAndView.setViewName("/plant/ymplant/forgot/forgot-two");
            return modelAndView;
        }

        if(StringUtils.isBlank(dataMap.getString("REPASSWORD"))){
            modelAndView.addObject("error", "确认密码不能为空！");
            modelAndView.addObject("USERNAME", dataMap.getString("USERNAME"));
            modelAndView.setViewName("/plant/ymplant/forgot/forgot-two");
            return modelAndView;
        }

        if(!dataMap.getString("PASSWORD").equals(dataMap.getString("REPASSWORD"))){
            modelAndView.addObject("error", "两次密码输入不一致！");
            modelAndView.addObject("USERNAME", dataMap.getString("USERNAME"));
            modelAndView.setViewName("/plant/ymplant/forgot/forgot-two");
            return modelAndView;
        }

        if(!PlantValidUtil.isPwd(dataMap.getString("PASSWORD"))){
            modelAndView.addObject("error", PlantValidUtil.ERROR_MSG_PWD);
            modelAndView.addObject("USERNAME", dataMap.getString("USERNAME"));
            modelAndView.setViewName("/plant/ymplant/forgot/forgot-two");
            return modelAndView;
        }

        if(!dataMap.getString("CODE").equals(SessionUtil.getSMSCodeFromSession())) {
            modelAndView.addObject("error", "验证码不正确！");
            modelAndView.addObject("USERNAME", dataMap.getString("USERNAME"));
            modelAndView.setViewName("/plant/ymplant/forgot/forgot-two");
            return modelAndView;
        }

        user.put("PASSWORD", MD5Util.getMD5(dataMap.getString("PASSWORD")));
        plantUserService.updatePassword(user);

        //验证短信验证码

        modelAndView.addObject("USERNAME", dataMap.getString("USERNAME"));
        modelAndView.setViewName("/plant/ymplant/forgot/forgot-three");
        return modelAndView;
    }
}
