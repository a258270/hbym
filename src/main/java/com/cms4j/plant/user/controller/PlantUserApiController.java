package com.cms4j.plant.user.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.plugin.BaseSetting;
import com.cms4j.base.system.user.service.UserService;
import com.cms4j.base.util.*;
import com.cms4j.plant.card.service.CardService;
import com.cms4j.plant.item.item.service.ItemBuyService;
import com.cms4j.plant.user.service.*;
import com.cms4j.plant.util.PlantConst;
import com.cms4j.plant.util.PlantValidUtil;
import com.cms4j.plant.util.SMSUtil;
import net.coobird.thumbnailator.Thumbnails;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * description:
 *
 * @author: zmj
 * @create: 2017/7/5
 */
@RestController
@RequestMapping(value = {"/plant/user/api", "/wechat/applet/user"})
public class PlantUserApiController extends ApiBaseController {
    @Autowired
    private CompleteStudentService completeStudentService;

    @Autowired
    private BaseSetting baseSetting;

    @Autowired
    private ExamineeService examineeService;

    @Autowired
    private PlantUserService plantUserService;

    @Autowired
    private CompleteTeacherService completeTeacherService;

    @Autowired
    private ItemBuyService itemBuyService;

    @Autowired
    private CardService cardService;

    @Autowired
    private CompleteProService completeProService;

    @RequestMapping(value = "/tocomplete")
    public InvokeResult toComplete(@RequestParam(required = false, name = "HEADURL") MultipartFile file) throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return InvokeResult.failure("请登录您的账号！");

        DataMap dataMap = this.getDataMap();
        if(StringUtils.isBlank(dataMap.getString("NICKNAME"))) return InvokeResult.failure("昵称不能为空！");
        if(!PlantValidUtil.isNickname(dataMap.getString("NICKNAME"))) return InvokeResult.failure(PlantValidUtil.ERROR_MSG_NICKNAME);
        if(StringUtils.isBlank(dataMap.getString("SEX"))) return InvokeResult.failure("性别不能为空！");
        if(StringUtils.isBlank(dataMap.getString("BIRTHDAY"))) return InvokeResult.failure("出生日期不能为空！");
        if(file != null){
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
            if(!PlantValidUtil.isImgSuffix(suffixName)){
                return InvokeResult.failure(PlantValidUtil.ERROR_MSG_IMGSUFFIX);
            }
            String s = ShortUUID.randomUUID() + suffixName;
            String path = baseSetting.getUpload_path() + "/" + s;
            File dest = new File(path);
            // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }

            file.transferTo(dest);

            dataMap.put("HEADURL", "/plant/file/download/" + s);
        }
        else{
            DataMap complete = completeStudentService.getCompleteStudentByUserId(curUser);
            if(complete == null){
                dataMap.put("HEADURL", PlantConst.STATIC_IMG_NONE);
            }
            else{
                dataMap.put("HEADURL", complete.getString("HEADURL"));
            }
        }

        if(!StringUtils.isBlank(dataMap.getString("NAMESECRET"))) dataMap.put("NAMESECRET", false); else dataMap.put("NAMESECRET", true);
        if(!StringUtils.isBlank(dataMap.getString("BIRTHDAYSECRET"))) dataMap.put("BIRTHDAYSECRET", false); else dataMap.put("BIRTHDAYSECRET", true);
        if(!StringUtils.isBlank(dataMap.getString("SEXSECRET"))) dataMap.put("SEXSECRET", false); else dataMap.put("SEXSECRET", true);
        dataMap.put("USER_ID", curUser.getString("USER_ID"));

        DataMap complete = completeStudentService.getCompleteStudentByUserId(curUser);
        if(complete == null){
            completeStudentService.addCompleteStudent(new DataMap());
        }
        completeStudentService.completeStudentInfo(dataMap);

        SessionUtil.addComplete2Session(completeStudentService.getCompleteStudentByUserId(curUser));


        /*if(PlantConst.ROLE_EXPERT.equals(curUser.getString("ROLE_ID"))) {

        }
        else if(PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))) {

        }
        else{
            dataMap.put("USER_ID", curUser.getString("USER_ID"));
            DataMap completeInfo = completeStudentService.getCompleteStudentByUserId(dataMap);
            if(completeInfo == null)
                completeStudentService.addCompleteStudent(dataMap);
            else{
                dataMap.put("COMPLETE_ID", completeInfo.getString("COMPLETE_ID"));
                completeStudentService.editCompleteStudent(dataMap);
            }
        }*/

        return InvokeResult.success();
    }

    @RequestMapping(value = "/examinee", method = RequestMethod.POST)
    public InvokeResult examinee() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return InvokeResult.failure("请登录您的账号！");

        DataMap examinee = examineeService.getExamineeByUserId(curUser);
        if(examinee != null && !DateUtil.canUpdateExam(examinee)){
            return InvokeResult.failure("当前为正式填报时期，仅允许修改一次考生信息！");
        }

        DataMap dataMap = this.getDataMap();
        if(StringUtils.isBlank(dataMap.getString("MAJORTYPE"))) return InvokeResult.failure("考试类型不能为空！");
        if(StringUtils.isBlank(dataMap.getString("EXAMAREA"))) return InvokeResult.failure("考试所在地不能为空！");
        if(StringUtils.isBlank(dataMap.getString("EXAMSCORE"))) return InvokeResult.failure("考试分数不能为空！");
        if(StringUtils.isBlank(dataMap.getString("GRADE"))) return InvokeResult.failure("年级不能为空！");
        if(StringUtils.isBlank(dataMap.getString("FIRSTMOCK"))) dataMap.put("FIRSTMOCK", null);
        if(StringUtils.isBlank(dataMap.getString("SECONDMOCK"))) dataMap.put("SECONDMOCK", null);
        if(StringUtils.isBlank(dataMap.getString("THIRDMOCK"))) dataMap.put("THIRDMOCK", null);
        try{
            Double score = Double.valueOf(dataMap.getString("EXAMSCORE"));
            if(score > 750 || score < 0)
                return InvokeResult.failure("考试分数范围不正确！");
        }
        catch(Exception e) {
            return InvokeResult.failure("考试分数格式不正确！");
        }

        try{
            if(!StringUtils.isBlank(dataMap.getString("FIRSTMOCK"))){
                Double firstMock = Double.valueOf(dataMap.getString("FIRSTMOCK"));
                if(firstMock > 750 || firstMock < 0)
                    return InvokeResult.failure("一模成绩分数范围不正确！");
            }
        }
        catch (Exception e) {
            return InvokeResult.failure("一模成绩分数格式不正确！");
        }

        try{
            if(!StringUtils.isBlank(dataMap.getString("SECONDMOCK"))){
                Double secondMock = Double.valueOf(dataMap.getString("SECONDMOCK"));
                if(secondMock > 750 || secondMock < 0)
                    return InvokeResult.failure("二模成绩分数范围不正确！");
            }
        }
        catch (Exception e) {
            return InvokeResult.failure("二模成绩分数格式不正确！");
        }

        try{
            if(!StringUtils.isBlank(dataMap.getString("THIRDMOCK"))){
                Double thirdMock = Double.valueOf(dataMap.getString("THIRDMOCK"));
                if(thirdMock > 750 || thirdMock < 0)
                    return InvokeResult.failure("三模成绩分数范围不正确！");
            }
        }
        catch (Exception e) {
            return InvokeResult.failure("三模成绩分数格式不正确！");
        }

        if(examinee == null) {
            examinee = new DataMap();
            examinee.put("EXAMINEE_ID", ShortUUID.randomUUID());
            examinee.put("USER_ID", curUser.getString("USER_ID"));
            examinee.put("CREATEDATE", DateUtil.getCurrentDate());
            examinee.put("MODIFYDATE", DateUtil.getCurrentDate());
            examineeService.addExaminee(examinee);
        }

        examinee.put("MAJORTYPE", dataMap.getString("MAJORTYPE"));
        examinee.put("EXAMAREA", dataMap.getString("EXAMAREA"));
        examinee.put("EXAMSCORE", dataMap.getString("EXAMSCORE"));
        examinee.put("GRADE", dataMap.getString("GRADE"));
        examinee.put("FIRSTMOCK", dataMap.getString("FIRSTMOCK"));
        examinee.put("SECONDMOCK", dataMap.getString("SECONDMOCK"));
        examinee.put("THIRDMOCK", dataMap.getString("THIRDMOCK"));
        examinee.put("MODIFYDATE", DateUtil.getCurrentDate());
        examineeService.editExaminee(examinee);

        return InvokeResult.success();
    }

    @RequestMapping(value = "/getsmscode/forget", method = RequestMethod.POST)
    public InvokeResult getSMSCodeForget() throws Exception {
        DataMap dataMap = this.getDataMap();
        if(StringUtils.isBlank("USERNAME"))
            return InvokeResult.failure("用户名不能为空！");

        DataMap user = plantUserService.getUserByUsername(dataMap);
        if(user == null)
            return InvokeResult.failure("用户名不存在！");

        DataMap complete = null;
        if(PlantConst.ROLE_STUDENT.equals(user.getString("ROLE_ID")))
            complete = completeStudentService.getCompleteStudentByUserId(user);
        else if(PlantConst.ROLE_TEACHER.equals(user.getString("ROLE_ID")))
            complete = completeTeacherService.getCompleteTeacherByUserId(user);
        else if(PlantConst.ROLE_EXPERT.equals(user.getString("ROLE_ID")))
            complete = completeProService.getCompleteProByUserId(user);

        if(complete == null) return InvokeResult.failure("您还没有绑定手机号，无法获取！");
        if(StringUtils.isBlank(complete.getString("PHONE"))) return InvokeResult.failure("您还没有绑定手机号，无法获取！");
        String phone = complete.getString("PHONE");

        String strCode = VerifyCodeUtil.getCode(4);
        //发送验证码
        if(!PlantValidUtil.isPhone(phone))
            return InvokeResult.failure(PlantValidUtil.ERROR_MSG_PHONE);

        SMSUtil.sendMessages(phone, strCode);

        SessionUtil.addSMSCode2Session(strCode);
        return InvokeResult.success();
    }

    @RequestMapping(value = "/getsmscode", method = RequestMethod.POST)
    public InvokeResult getSMSCode() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        DataMap dataMap = this.getDataMap();
        String phone = dataMap.getString("PHONE");

        if(curUser == null && StringUtils.isBlank(phone))
            return InvokeResult.failure("请填写手机号码");

        if(StringUtils.isBlank(phone)){
            //if(StringUtils.isBlank(dataMap.getString("SELF"))) return InvokeResult.failure("手机号码不能为空！");
            DataMap complete = null;
            if(PlantConst.ROLE_STUDENT.equals(curUser.getString("ROLE_ID")))
                complete = completeStudentService.getCompleteStudentByUserId(curUser);
            else if(PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID")))
                complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
            else if(PlantConst.ROLE_EXPERT.equals(curUser.getString("ROLE_ID")))
                complete = completeProService.getCompleteProByUserId(curUser);

            if(complete == null) return InvokeResult.failure("您还没有绑定手机号，无法获取！");
            if(StringUtils.isBlank(complete.getString("PHONE"))) return InvokeResult.failure("您还没有绑定手机号，无法获取！");
            phone = complete.getString("PHONE");
        }
        String strCode = VerifyCodeUtil.getCode(4);
        //发送验证码
        if(!PlantValidUtil.isPhone(phone))
            return InvokeResult.failure(PlantValidUtil.ERROR_MSG_PHONE);

        SMSUtil.sendMessages(phone, strCode);

        SessionUtil.addSMSCode2Session(strCode);
        return InvokeResult.success();
    }

    @RequestMapping(value = "/getemailcode", method = RequestMethod.POST)
    public InvokeResult getEmailCode() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return InvokeResult.failure("请登录您的账号！");

        DataMap dataMap = this.getDataMap();
        String email = dataMap.getString("EMAIL");
        String strCode = VerifyCodeUtil.getCode(4);
        //发送验证码
        if(!PlantValidUtil.isMail(email))
            return InvokeResult.failure(PlantValidUtil.ERROR_MSG_MAIL);

        SessionUtil.addEMAILCode2Session(strCode);
        return InvokeResult.success();
    }

    @RequestMapping(value = "/binding/phone", method = RequestMethod.POST)
    public InvokeResult bindingPhone() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return InvokeResult.failure("请登录您的账号！");

        if (PlantConst.ROLE_STUDENT.equals(curUser.getString("ROLE_ID"))) {

            DataMap complete = completeStudentService.getCompleteStudentByUserId(curUser);
            if(complete == null){
                completeStudentService.addCompleteStudent(new DataMap());
                complete = completeStudentService.getCompleteStudentByUserId(curUser);
            }

            DataMap dataMap = this.getDataMap();
            if(StringUtils.isBlank(dataMap.getString("PHONE"))) return InvokeResult.failure("请填写手机号！");
            //if(StringUtils.isBlank(dataMap.getString("CODE"))) return InvokeResult.failure("请填写验证码！");
            if(StringUtils.isBlank(dataMap.getString("SMSCODE"))) return InvokeResult.failure("请填写短信验证码！");

            //验证手机号
            if(!PlantValidUtil.isPhone(dataMap.getString("PHONE")))
                return InvokeResult.failure(PlantValidUtil.ERROR_MSG_PHONE);
            //if(!dataMap.getString("CODE").equals(SessionUtil.getCodeFromSession())) return InvokeResult.failure("验证码不正确！");
            if(!dataMap.getString("SMSCODE").equals(SessionUtil.getSMSCodeFromSession())) return InvokeResult.failure("短信验证码不正确！");

            //SessionUtil.removeCodeFromSession();
            SessionUtil.removeSMSCodeFromSession();

            if(completeStudentService.isHasPhoneInCompleteStudent(dataMap) || completeTeacherService.isHasPhoneInCompleteTeacher(dataMap) || completeProService.isHasPhoneInCompletePro(dataMap))
                return InvokeResult.failure("该手机号已经绑定账户，请更换！");

            complete.put("PHONE", dataMap.getString("PHONE"));
            completeStudentService.editCompleteStudent(complete);

            return InvokeResult.success();
        }

        else if (PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))) {
            DataMap complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
            if(complete == null){
                completeTeacherService.addCompleteTeacher(new DataMap());
                complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
            }

            DataMap dataMap = this.getDataMap();
            if(StringUtils.isBlank(dataMap.getString("PHONE"))) return InvokeResult.failure("请填写手机号！");
            //if(StringUtils.isBlank(dataMap.getString("CODE"))) return InvokeResult.failure("请填写验证码！");
            if(StringUtils.isBlank(dataMap.getString("SMSCODE"))) return InvokeResult.failure("请填写短信验证码！");

            if(!PlantValidUtil.isPhone(dataMap.getString("PHONE")))
                return InvokeResult.failure(PlantValidUtil.ERROR_MSG_PHONE);

            //验证手机号
            //if(!dataMap.getString("CODE").equals(SessionUtil.getCodeFromSession())) return InvokeResult.failure("验证码不正确！");
            if(!dataMap.getString("SMSCODE").equals(SessionUtil.getSMSCodeFromSession())) return InvokeResult.failure("短信验证码不正确！");

            //SessionUtil.removeCodeFromSession();
            SessionUtil.removeSMSCodeFromSession();

            if(completeStudentService.isHasPhoneInCompleteStudent(dataMap) || completeTeacherService.isHasPhoneInCompleteTeacher(dataMap) || completeProService.isHasPhoneInCompletePro(dataMap))
                return InvokeResult.failure("该手机号已经绑定账户，请更换！");

            complete.put("PHONE", dataMap.getString("PHONE"));
            completeTeacherService.editCompleteTeacher(complete);

            return InvokeResult.success();
        }

        return InvokeResult.failure("身份验证失败！");
    }

    @RequestMapping(value = "/binding/email", method = RequestMethod.POST)
    public InvokeResult bindingEmail() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return InvokeResult.failure("请登录您的账号！");

        if (PlantConst.ROLE_STUDENT.equals(curUser.getString("ROLE_ID"))) {
            DataMap complete = completeStudentService.getCompleteStudentByUserId(curUser);
            if (complete == null) {
                completeStudentService.addCompleteStudent(new DataMap());
                complete = completeStudentService.getCompleteStudentByUserId(curUser);
            }

            if (!StringUtils.isBlank(complete.getString("EMAIL"))) return InvokeResult.failure("您已绑定邮箱，不能重复绑定！");

            DataMap dataMap = this.getDataMap();
            if (StringUtils.isBlank(dataMap.getString("EMAIL"))) return InvokeResult.failure("请填写邮箱地址！");
            if (StringUtils.isBlank(dataMap.getString("CODE"))) return InvokeResult.failure("请填写验证码！");
            if(!dataMap.getString("CODE").equals(SessionUtil.getSMSCodeFromSession())) return InvokeResult.failure("短信验证码不正确！");

            if(!PlantValidUtil.isMail(dataMap.getString("EMAIL")))
                return InvokeResult.failure(PlantValidUtil.ERROR_MSG_MAIL);

            SessionUtil.removeSMSCodeFromSession();
            complete.put("EMAIL", dataMap.getString("EMAIL"));
            completeStudentService.editCompleteStudent(complete);

            return InvokeResult.success();
        }
        else if (PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))) {
            DataMap complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
            if (complete == null) {
                completeTeacherService.addCompleteTeacher(new DataMap());
                complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
            }

            if (!StringUtils.isBlank(complete.getString("EMAIL"))) return InvokeResult.failure("您已绑定邮箱，不能重复绑定！");

            DataMap dataMap = this.getDataMap();
            if (StringUtils.isBlank(dataMap.getString("EMAIL"))) return InvokeResult.failure("请填写邮箱地址！");
            if (StringUtils.isBlank(dataMap.getString("CODE"))) return InvokeResult.failure("请填写验证码！");
            if(!dataMap.getString("CODE").equals(SessionUtil.getSMSCodeFromSession())) return InvokeResult.failure("短信验证码不正确！");

            if(!PlantValidUtil.isMail(dataMap.getString("EMAIL")))
                return InvokeResult.failure(PlantValidUtil.ERROR_MSG_MAIL);

            SessionUtil.removeSMSCodeFromSession();
            complete.put("EMAIL", dataMap.getString("EMAIL"));
            completeTeacherService.editCompleteTeacher(complete);

            return InvokeResult.success();
        }

        return InvokeResult.failure("身份验证失败！");
    }

    @RequestMapping(value = "/binding/idcard")
    public InvokeResult bindingIdcard() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return InvokeResult.failure("请登录您的账号！");

        if (PlantConst.ROLE_STUDENT.equals(curUser.getString("ROLE_ID"))) {

            DataMap complete = completeStudentService.getCompleteStudentByUserId(curUser);
            if (complete == null) {
                completeStudentService.addCompleteStudent(new DataMap());
                complete = completeStudentService.getCompleteStudentByUserId(curUser);
            }
            if (!StringUtils.isBlank(complete.getString("NAME")) && !StringUtils.isBlank(complete.getString("IDCARD")))
                return InvokeResult.failure("账号已实名认证，不可重复操作！");

            DataMap dataMap = this.getDataMap();

            if (StringUtils.isBlank(dataMap.getString("NAME"))) return InvokeResult.failure("请填写真实姓名！");
            if (StringUtils.isBlank(dataMap.getString("IDCARD"))) return InvokeResult.failure("请填写身份证号！");

            if(!PlantValidUtil.isIdCard(dataMap.getString("IDCARD"))) {
                return InvokeResult.failure(PlantValidUtil.ERROR_MSG_IDCARD);
            }
            /*Date curDate = DateUtil.getCurrentDate();
            Calendar c = Calendar.getInstance();
            c.setTime(curDate);
            String birthday = dataMap.getString("IDCARD").substring(6, 14);
            c.set(Calendar.YEAR, Integer.valueOf(birthday.substring(0, 4)));
            c.set(Calendar.MONTH, Integer.valueOf(birthday.substring(4, 6)) - 1);
            c.set(Calendar.DAY_OF_MONTH, Integer.valueOf(birthday.substring(6, 8)));
            curDate = c.getTime();*/
            complete.put("NAME", dataMap.getString("NAME"));
            complete.put("IDCARD", dataMap.getString("IDCARD"));
            //complete.put("BIRTHDAY", curDate);
            completeStudentService.editCompleteStudent(complete);
            return InvokeResult.success();
        }

        else if (PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))) {

            DataMap complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
            if (complete == null) {
                completeTeacherService.addCompleteTeacher(new DataMap());
                complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
            }
            if (!StringUtils.isBlank(complete.getString("NAME")) && !StringUtils.isBlank(complete.getString("IDCARD")))
                return InvokeResult.failure("账号已实名认证，不可重复操作！");

            DataMap dataMap = this.getDataMap();

            if (StringUtils.isBlank(dataMap.getString("NAME"))) return InvokeResult.failure("请填写真实姓名！");
            if (StringUtils.isBlank(dataMap.getString("IDCARD"))) return InvokeResult.failure("请填写身份证号！");

            if(!PlantValidUtil.isIdCard(dataMap.getString("IDCARD"))) {
                return InvokeResult.failure(PlantValidUtil.ERROR_MSG_IDCARD);
            }
            complete.put("NAME", dataMap.getString("NAME"));
            complete.put("IDCARD", dataMap.getString("IDCARD"));
            completeTeacherService.editCompleteTeacher(complete);
            return InvokeResult.success();
        }

        return InvokeResult.failure("身份验证失败！");
    }

    @RequestMapping(value = "/updatepass")
    public InvokeResult updatepass() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return InvokeResult.failure("请登录您的账号！");

        DataMap dataMap = this.getDataMap();
        if(StringUtils.isBlank(dataMap.getString("PASSWORD"))) return InvokeResult.failure("原密码不能为空！");
        if(StringUtils.isBlank(dataMap.getString("NEWPASSWORD"))) return InvokeResult.failure("新密码不能为空！");
        if(StringUtils.isBlank(dataMap.getString("RENEWPASSWORD"))) return InvokeResult.failure("确认密码不能为空！");
        if(StringUtils.isBlank(dataMap.getString("CODE"))) return InvokeResult.failure("验证码不能为空！");
        if(!dataMap.getString("CODE").equals(SessionUtil.getSMSCodeFromSession())) return InvokeResult.failure("验证码不正确！");
        SessionUtil.removeSMSCodeFromSession();
        if(!dataMap.getString("NEWPASSWORD").equals(dataMap.getString("RENEWPASSWORD"))) return InvokeResult.failure("新密码和确认密码不一致！");

        if(!MD5Util.getMD5(dataMap.getString("PASSWORD")).equals(curUser.getString("PASSWORD"))) return InvokeResult.failure("原密码输入不正确！");

        if(!PlantValidUtil.isPwd(dataMap.getString("NEWPASSWORD")))
            return InvokeResult.failure(PlantValidUtil.ERROR_MSG_PWD);

        curUser.put("PASSWORD", MD5Util.getMD5(dataMap.getString("NEWPASSWORD")));
        plantUserService.updatePassword(curUser);

        return InvokeResult.success();
    }

    @RequestMapping(value = "/updatetpass")
    public InvokeResult updatetpass() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return InvokeResult.failure("请登录您的账号！");

        DataMap complete = null;
        if(PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))){
            complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
        }
        else if(PlantConst.ROLE_STUDENT.equals(curUser.getString("ROLE_ID"))) {
            complete = completeStudentService.getCompleteStudentByUserId(curUser);
        }
        else if(PlantConst.ROLE_EXPERT.equals(curUser.getString("ROLE_ID"))) {
            complete = completeProService.getCompleteProByUserId(curUser);
        }
        if(complete == null){
            completeStudentService.addCompleteStudent(new DataMap());
            complete = completeStudentService.getCompleteStudentByUserId(curUser);
        }

        DataMap dataMap = this.getDataMap();

        if(!StringUtils.isBlank(complete.getString("TRADEPASSWORD"))) {
            if(StringUtils.isBlank(dataMap.getString("PASSWORD"))) return InvokeResult.failure("原密码不能为空！");
        }
        else{
            if(!StringUtils.isBlank(dataMap.getString("PASSWORD"))) return InvokeResult.failure("原密码输入不正确！");
        }
        if(StringUtils.isBlank(dataMap.getString("NEWPASSWORD"))) return InvokeResult.failure("新密码不能为空！");
        if(StringUtils.isBlank(dataMap.getString("RENEWPASSWORD"))) return InvokeResult.failure("确认密码不能为空！");
        if(StringUtils.isBlank(dataMap.getString("CODE"))) return InvokeResult.failure("验证码不能为空！");
        if(!dataMap.getString("CODE").equals(SessionUtil.getSMSCodeFromSession())) return InvokeResult.failure("验证码不正确！");
        SessionUtil.removeSMSCodeFromSession();
        if(!MD5Util.getMD5(dataMap.getString("PASSWORD")).equals(complete.getString("TRADEPASSWORD"))) return InvokeResult.failure("原密码输入不正确！");
        if(!dataMap.getString("NEWPASSWORD").equals(dataMap.getString("RENEWPASSWORD"))) return InvokeResult.failure("两次密码输入不一致！");

        if(!PlantValidUtil.isPwd(dataMap.getString("NEWPASSWORD")))
            return InvokeResult.failure(PlantValidUtil.ERROR_MSG_PWD);

        complete.put("TRADEPASSWORD", MD5Util.getMD5(dataMap.getString("NEWPASSWORD")));
        completeStudentService.editCompleteStudent(complete);
        return InvokeResult.success();
    }

    @RequestMapping(value = "/getbuyrecs")
    public Page getBuyRecs() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return new Page();

        DataMap dataMap = this.getDataMap();
        Page page = new Page();
        DataMap params = new DataMap();
        params.put("USER_ID", curUser.getString("USER_ID"));
        page.setParams(params);

        if(StringUtils.isBlank(dataMap.getString("currentPage"))) dataMap.put("currentPage", "0");
        else{
            try{
                Integer currentPage = Integer.valueOf(dataMap.getString("currentPage"));
                currentPage--;
                if(currentPage < 0) currentPage = 0;
                dataMap.put("currentPage", currentPage);
            }
            catch (Exception e) {
                dataMap.put("currentPage", "0");
            }
        }
        page.setPageNumber(Integer.valueOf(dataMap.getString("currentPage")));
        page.setPageSize(10);

        List<DataMap> recs = itemBuyService.getBuyRecs(page);
        page.setResults(recs);
        return page;
    }

    @RequestMapping(value = "/vip")
    public InvokeResult vip() throws Exception {
        

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return InvokeResult.failure("请登录账号！");

        DataMap dataMap = this.getDataMap();

        if(StringUtils.isBlank(dataMap.getString("NUMBER"))) {
            return InvokeResult.failure("请输入激活码！");
        }

        if(StringUtils.isBlank(dataMap.getString("PASSWORD"))) {
            return InvokeResult.failure("请输入密码！");
        }

        if(dataMap.getString("NUMBER").length() != 15) {
            return InvokeResult.failure("激活码长度不正确！");
        }

        dataMap.put("NUMBER", dataMap.getString("NUMBER").trim().toUpperCase());
        dataMap.put("PASSWORD", dataMap.getString("PASSWORD").trim().toLowerCase());

        Integer flag = cardService.activeVip(dataMap);

        if(flag.equals(-1))
            return InvokeResult.failure("卡号不存在！");

        if(flag.equals(-2))
            return InvokeResult.failure("密码不正确！");

        if(flag.equals(-3))
            return InvokeResult.failure("卡号已使用！");


        DataMap user = plantUserService.getUserByUserId(curUser);
        SessionUtil.addUser2Session(user);

        return InvokeResult.success();
    }

    @RequestMapping(value = "/chkused")
    public InvokeResult chkUsed() throws Exception {
        DataMap dataMap = this.getDataMap();
        if(plantUserService.getUserByUsername(dataMap) == null)
            return InvokeResult.success(false);
        else
            return InvokeResult.success(true);
    }
}
