package com.cms4j.plant.index.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.system.role.service.RoleService;
import com.cms4j.base.system.user.online.service.SessionService;
import com.cms4j.base.util.*;
import com.cms4j.plant.user.pocket.service.PocketService;
import com.cms4j.plant.user.service.CompleteProService;
import com.cms4j.plant.user.service.CompleteStudentService;
import com.cms4j.plant.user.service.CompleteTeacherService;
import com.cms4j.plant.user.service.PlantUserService;
import com.cms4j.plant.util.PlantConst;
import com.cms4j.plant.util.PlantValidUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * description:
 *
 * @author: zmj
 * @create: 2017/6/28
 */
@RestController
@RequestMapping(value = "/plant/api")
public class PlantIndexApiController extends ApiBaseController {

    @Autowired
    private PlantUserService plantUserService;
    @Autowired
    private SessionService sessionService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private CompleteTeacherService completeTeacherService;
    @Autowired
    private CompleteStudentService completeStudentService;
    @Autowired
    private CompleteProService completeProService;

    public PlantIndexApiController() {
        this.logger = LoggerUtil.getLogger(this.getClass());
    }
    //ls:登录
    @RequestMapping(value = "/tologin", method = RequestMethod.POST)
    public InvokeResult toLogin() throws Exception {
        DataMap dataMap = this.getDataMap();
        if(StringUtils.isBlank(dataMap.getString("USERNAME")))
            return InvokeResult.failure("用户名不能为空！");
        if(StringUtils.isBlank(dataMap.getString("PASSWORD")))
            return InvokeResult.failure("密码不能为空！");
        if(!PlantValidUtil.isUsername(dataMap.getString("USERNAME")))
            return InvokeResult.failure(PlantValidUtil.ERROR_MSG_USERNAME);
        if(!PlantValidUtil.isPwd(dataMap.getString("PASSWORD")))
            return InvokeResult.failure(PlantValidUtil.ERROR_MSG_PWD);

        dataMap.put("PASSWORD", MD5Util.getMD5(dataMap.getString("PASSWORD")));
        dataMap = plantUserService.validUser(dataMap);
        if(dataMap == null)
            return InvokeResult.failure("用户名或密码错误");

        if(!Boolean.valueOf(dataMap.getString("STATUS")))
            return InvokeResult.failure("该用户不可用");

        sessionService.kickPlantUser(dataMap.getString("USER_ID"));
        dataMap.put("LAST_LOGIN", DateUtil.getCurrentTime());
        dataMap.put("IP", this.getRequestIpAddress());
        plantUserService.editUserLoginInfo(dataMap);

        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(dataMap.getString("USERNAME"), dataMap.getString("PASSWORD"));
        subject.login(token);

        SessionUtil.addUser2Session(dataMap);

        DataMap role = roleService.getRoleById(dataMap);
        SessionUtil.addRole2Session(role);

        if(PlantConst.ROLE_STUDENT.equals(dataMap.getString("ROLE_ID")))
            SessionUtil.addComplete2Session(completeStudentService.getCompleteStudentByUserId(dataMap));

        if(PlantConst.ROLE_TEACHER.equals(dataMap.getString("ROLE_ID")))
            SessionUtil.addComplete2Session(completeTeacherService.getCompleteTeacherByUserId(dataMap));

        if(PlantConst.ROLE_EXPERT.equals(dataMap.getString("ROLE_ID")))
            SessionUtil.addComplete2Session(completeProService.getCompleteProByUserId(dataMap));

        return InvokeResult.success();
    }
    //注册
    @RequestMapping(value = "/toregist", method = RequestMethod.POST)
    public InvokeResult toRegist() throws Exception {
        DataMap dataMap = this.getDataMap();
        if(StringUtils.isBlank(dataMap.getString("USERNAME")))
            return InvokeResult.failure("用户名不能为空！");
        if(StringUtils.isBlank(dataMap.getString("PHONE")))
            return InvokeResult.failure("手机号不能为空！");
        if(StringUtils.isBlank(dataMap.getString("PASSWORD")))
            return InvokeResult.failure("密码不能为空！");
        if(StringUtils.isBlank(dataMap.getString("REPASSWORD")))
            return InvokeResult.failure("确认密码不能为空！");
        if(StringUtils.isBlank(dataMap.getString("CODE")))
            return InvokeResult.failure("验证码不能为空！");

        if(!dataMap.getString("PASSWORD").equals(dataMap.getString("REPASSWORD")))
            return InvokeResult.failure("两次密码输入不一致");

        if(!PlantValidUtil.isUsername(dataMap.getString("USERNAME")))
            return InvokeResult.failure(PlantValidUtil.ERROR_MSG_USERNAME);

        if(!PlantValidUtil.isPwd(dataMap.getString("PASSWORD")))
            return InvokeResult.failure(PlantValidUtil.ERROR_MSG_PWD);

        //暂时对 验证码 不校验
        if(!dataMap.getString("CODE").equals(SessionUtil.getSMSCodeFromSession())) return InvokeResult.failure("验证码不正确！");

        if(plantUserService.getUserByUsername(dataMap) != null)
            return InvokeResult.failure("该用户名已经注册，请更换！");
        if(completeStudentService.isHasPhoneInCompleteStudent(dataMap) || completeTeacherService.isHasPhoneInCompleteTeacher(dataMap) || completeProService.isHasPhoneInCompletePro(dataMap))
            return InvokeResult.failure("该手机号已经注册，请更换！");

        plantUserService.regUser(dataMap);
        return InvokeResult.success();
    }

    /*@RequestMapping(value = "/toexit", method = RequestMethod.POST)
    public InvokeResult toExit() {
        SessionUtil.getSession().setTimeout(0);
        return InvokeResult.success();
    }*/
}
