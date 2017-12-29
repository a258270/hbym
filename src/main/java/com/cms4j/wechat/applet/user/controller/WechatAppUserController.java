package com.cms4j.wechat.applet.user.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.plugin.BaseSetting;
import com.cms4j.base.util.*;
import com.cms4j.plant.item.item.service.ItemBelongService;
import com.cms4j.plant.user.pocket.service.PocketService;
import com.cms4j.plant.user.service.*;
import com.cms4j.plant.util.PlantConst;
import com.cms4j.plant.util.PlantValidUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@RestController
@RequestMapping(value = "/wechat/applet/user")
public class WechatAppUserController extends ApiBaseController {

    @Autowired
    private PlantUserService plantUserService;
    @Autowired
    private CompleteTeacherService completeTeacherService;
    @Autowired
    private CompleteStudentService completeStudentService;
    @Autowired
    private CompleteProService completeProService;

    @Autowired
    private BaseSetting baseSetting;
    @Autowired
    private ExamineeService examineeService;
    @Autowired
    private PocketService pocketService;
    @Autowired
    private ItemBelongService itemBelongService;

    /**
     * 获取学生基本信息（个人中心展示）
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/basic_student", method = RequestMethod.POST)
    public InvokeResult basic() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();

        if(!PlantConst.ROLE_STUDENT.equals(curUser.getString("ROLE_ID")))
            return InvokeResult.failure("获取用户信息失败！");

        DataMap complete = completeStudentService.getCompleteStudentByUserId(curUser);

        Integer completeCount = 0;
        /*String isRealName = "false";
        String isPhone = "false";
        String isEmail = "false";
        String isTrade = "false";*/
        if(complete != null){
            if (!StringUtils.isBlank(complete.getString("IDCARD"))){
                completeCount += 25;
            }

            if (!StringUtils.isBlank(complete.getString("PHONE"))){
                completeCount += 25;
            }

            if (!StringUtils.isBlank(complete.getString("EMAIL"))){
                completeCount += 25;
            }

            if (!StringUtils.isBlank(complete.getString("TRADEPASSWORD"))){
                completeCount += 25;
            }
        }

        DataMap dataMapOut = new DataMap();
        dataMapOut.put("completeCount", completeCount);
        dataMapOut.put("complete", complete);

        DataMap exam = examineeService.getExamineeByUserId(curUser);
        dataMapOut.put("examinee", exam);

        DataMap pocket = pocketService.getPocketByUserId(curUser);
        dataMapOut.put("pocket", pocket);

        return InvokeResult.success(dataMapOut);
    }

    @RequestMapping(value = "/basic_teacher")
    public InvokeResult base_teacher() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();

        if(!PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID")))
            return InvokeResult.failure("获取用户信息失败！");

        DataMap complete = completeTeacherService.getCompleteTeacherByUserId(curUser);

        Integer completeCount = 0;
        /*String isRealName = "false";
        String isPhone = "false";
        String isEmail = "false";
        String isTrade = "false";*/
        if(complete != null){
            if (!StringUtils.isBlank(complete.getString("IDCARD"))){
                completeCount += 25;
            }

            if (!StringUtils.isBlank(complete.getString("PHONE"))){
                completeCount += 25;
            }

            if (!StringUtils.isBlank(complete.getString("EMAIL"))){
                completeCount += 25;
            }

            if (!StringUtils.isBlank(complete.getString("TRADEPASSWORD"))){
                completeCount += 25;
            }
        }

        DataMap dataMapOut = new DataMap();
        dataMapOut.put("completeCount", completeCount);
        dataMapOut.put("complete", complete);

        return InvokeResult.success(dataMapOut);
    }

    /**
     * 获取账户安全信息的是否设置
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getsecurityinfo")
    public InvokeResult getSecurityInfo() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();

        boolean isRealName = false;
        boolean isPhone = false;
        boolean isEmail = false;
        boolean isTrade = false;

        DataMap complete = null;
        if(PlantConst.ROLE_STUDENT.equals(curUser.getString("ROLE_ID"))){
            complete = completeStudentService.getCompleteStudentByUserId(curUser);
        }
        else if(PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))) {
            complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
        }
        else if(PlantConst.ROLE_EXPERT.equals(curUser.getString("ROLE_ID"))) {
            complete = completeProService.getCompleteProByUserId(curUser);
        }

        if(complete != null){
            if (!StringUtils.isBlank(complete.getString("IDCARD"))){
                isRealName = true;
            }

            if (!StringUtils.isBlank(complete.getString("PHONE"))){
                isPhone = true;
            }

            if (!StringUtils.isBlank(complete.getString("EMAIL"))){
                isEmail = true;
            }

            if (!StringUtils.isBlank(complete.getString("TRADEPASSWORD"))){
                isTrade = true;
            }
        }

        DataMap outDataMap = new DataMap();
        outDataMap.put("isRealName", isRealName);
        outDataMap.put("isPhone", isPhone);
        outDataMap.put("isEmail", isEmail);
        outDataMap.put("isTrade", isTrade);

        return InvokeResult.success(outDataMap);
    }

    /**
     * 获取学生基本信息
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getstudentcomplete")
    public InvokeResult getStudentComplete() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();

        DataMap complete = completeStudentService.getCompleteStudentByUserId(curUser);
        return InvokeResult.success(complete);
    }

    /**
     * 获取老师基本信息
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getteachercomplete")
    public InvokeResult getTeacherComplete() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();

        DataMap complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
        return InvokeResult.success(complete);
    }

    /**
     * 获取学生考生信息
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getstudentexaminee")
    public InvokeResult getStudentExaminee() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();

        DataMap examinee = examineeService.getExamineeByUserId(curUser);
        return InvokeResult.success(examinee);
    }

    /**
     * 我的物品
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getbelongitems")
    public InvokeResult getBelongItems() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();

        DataMap pocket = pocketService.getPocketByUserId(curUser);
        if(pocket == null) pocket = new DataMap();

        DataMap result = itemBelongService.getAllValItemsByUser(curUser);
        result.putAll(pocket);

        return InvokeResult.success(result);
    }

    /**
     * 上传头像
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/uploadhead")
    public InvokeResult uploadHead(@RequestParam(name = "HEADURL") MultipartFile file) throws Exception {
        DataMap curUser = SessionUtil.getCurUser();

        DataMap dataMap = null;
        if(PlantConst.ROLE_STUDENT.equals(curUser.getString("ROLE_ID"))) {
            dataMap = completeStudentService.getCompleteStudentByUserId(curUser);
        }
        else if(PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))) {
            dataMap = completeTeacherService.getCompleteTeacherByUserId(curUser);
        }
        else{
            dataMap = completeProService.getCompleteProByUserId(curUser);
        }

        if(dataMap == null) return InvokeResult.failure(Const.NOLOGIN_CODE, "please relogin");
        if(file != null) {
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
            if (!PlantValidUtil.isImgSuffix(suffixName)) {
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
            if(PlantConst.ROLE_STUDENT.equals(curUser.getString("ROLE_ID"))) {
                completeStudentService.editCompleteStudent(dataMap);
            }
            else if(PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))) {
                completeTeacherService.editCompleteTeacher(curUser);
            }
            else{
                completeProService.editCompletePro(curUser);
            }
        }

        return InvokeResult.success();
    }

    /**
     * 获取是否登录
     */
    @RequestMapping(value = "/checklogin")
    public InvokeResult checkLogin() throws Exception {
        return InvokeResult.success(SessionUtil.getCurUser() != null);
    }

    /**
     * 获取学生考生信息
     */
    @RequestMapping(value = "/isexamed")
    public InvokeResult isExamed() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        DataMap examinee = examineeService.getExamineeByUserId(curUser);

        return InvokeResult.success((examinee != null) && (!StringUtils.isBlank(examinee.getString("EXAMSCORE"))));
    }

    @RequestMapping(value = "/isvip")
    public InvokeResult isVip() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();

        return InvokeResult.success(PlantConst.ROLE_STUDENT.equals(curUser.getString("ROLE_ID")) && !StringUtils.isBlank(curUser.getString("VIP")));
    }

    @RequestMapping(value = "/getvip")
    public InvokeResult getVip() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();

        return InvokeResult.success(curUser.getString("CARD_PURPOSE") == null ? "" : curUser.getString("CARD_PURPOSE"));
    }

    /**
     * 获取角色标志
     * @return 1学生 2老师 3专家 0暂无信息
     * @throws Exception
     */
    @RequestMapping(value = "/getrole")
    public InvokeResult isStudent() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        switch (curUser.getString("ROLE_ID")) {
            case PlantConst.ROLE_STUDENT : {
                return InvokeResult.success(1);
            }
            case PlantConst.ROLE_TEACHER : {
                return InvokeResult.success(2);
            }
            case PlantConst.ROLE_EXPERT : {
                return InvokeResult.success(3);
            }
            default : {
                return InvokeResult.success(0);
            }
        }
    }

    @RequestMapping(value = "/getuserfromsession")
    public InvokeResult getUserFromSession() throws Exception {
        DataMap dataMap = new DataMap();
        dataMap.put("user_id", SessionUtil.getCurUser().getString("USER_ID"));
        //dataMap.put("complete", SessionUtil.getCompleteFromSession());

        return InvokeResult.success(dataMap);
    }
}
