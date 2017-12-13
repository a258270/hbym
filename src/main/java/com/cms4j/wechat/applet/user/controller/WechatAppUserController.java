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

    @RequestMapping(value = "/getstudentcomplete")
    public InvokeResult getStudentComplete() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();

        DataMap complete = completeStudentService.getCompleteStudentByUserId(curUser);
        return InvokeResult.success(complete);
    }

    @RequestMapping(value = "/getstudentexaminee")
    public InvokeResult getStudentExaminee() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();

        DataMap examinee = examineeService.getExamineeByUserId(curUser);
        return InvokeResult.success(examinee);
    }

    @RequestMapping(value = "/getbelongitems")
    public InvokeResult getBelongItems() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();

        DataMap pocket = pocketService.getPocketByUserId(curUser);
        if(pocket == null) pocket = new DataMap();

        DataMap result = itemBelongService.getAllValItemsByUser(curUser);
        result.putAll(pocket);

        return InvokeResult.success(result);
    }

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
}
