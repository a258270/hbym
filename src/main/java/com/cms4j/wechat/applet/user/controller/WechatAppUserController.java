package com.cms4j.wechat.applet.user.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.user.pocket.service.PocketService;
import com.cms4j.plant.user.service.*;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
    private ExamineeService examineeService;
    @Autowired
    private PocketService pocketService;

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
}
