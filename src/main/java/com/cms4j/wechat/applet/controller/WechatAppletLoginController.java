package com.cms4j.wechat.applet.controller;

import com.alibaba.fastjson.JSONObject;
import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.system.role.service.RoleService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.base.util.ShortUUID;
import com.cms4j.plant.user.service.CompleteProService;
import com.cms4j.plant.user.service.CompleteStudentService;
import com.cms4j.plant.user.service.CompleteTeacherService;
import com.cms4j.plant.user.service.PlantUserService;
import com.cms4j.plant.util.PlantConst;
import com.cms4j.wechat.applet.service.WechatAppletLoginService;
import com.cms4j.wechat.service.WechatUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/wechat/applet/api")
public class WechatAppletLoginController extends ApiBaseController {
    @Autowired
    private WechatAppletLoginService wechatAppletLoginService;

    @Autowired
    private WechatUserService wechatUserService;

    @Autowired
    private PlantUserService plantUserService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private CompleteStudentService completeStudentService;

    @Autowired
    private CompleteTeacherService completeTeacherService;

    @Autowired
    private CompleteProService completeProService;

    @RequestMapping(value = "/login")
    public InvokeResult login() throws Exception {
        DataMap dataMap = this.getDataMap();

        String code = dataMap.getString("code");
        JSONObject jsonObject = wechatAppletLoginService.login(code);
        if(jsonObject.containsKey("openid") && jsonObject.containsKey("session_key")) {
            //请求成功
            DataMap wechatUser = new DataMap();
            wechatUser.put("UNIONID", jsonObject.getString("unionid"));
            wechatUser = wechatUserService.getWechatUserByUnionId(wechatUser);

            //新用户
            if(wechatUser == null) {
                wechatUser = new DataMap();
                wechatUser.put("USER_ID", ShortUUID.randomUUID());
                wechatUser.put("WXAPPOPENID", jsonObject.getString("openid"));
                wechatUser.put("UNIONID", jsonObject.getString("unionid"));
                wechatUserService.addWechatUser(wechatUser);
            }

            SessionUtil.addWechat2Session(wechatUser);

            DataMap curUser = plantUserService.getUserByUserId(wechatUser);
            if(curUser != null){
                SessionUtil.addUser2Session(curUser);

                //角色信息
                DataMap role = roleService.getRoleById(curUser);
                SessionUtil.addRole2Session(role);

                if(PlantConst.ROLE_STUDENT.equals(curUser.getString("ROLE_ID"))) {
                    DataMap complete = completeStudentService.getCompleteStudentByUserId(curUser);
                    SessionUtil.addComplete2Session(complete);
                }
                else if(PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))) {
                    DataMap complete = completeTeacherService.getCompleteTeacherByUserId(curUser);
                    SessionUtil.addComplete2Session(complete);
                }
                else if(PlantConst.ROLE_EXPERT.equals(curUser.getString("ROLE_ID"))) {
                    DataMap complete = completeProService.getCompleteProByUserId(curUser);
                    SessionUtil.addComplete2Session(complete);
                }
            }
        }
        else{
            return InvokeResult.failure("读取用户信息失败，请重试");
        }

        return InvokeResult.success();
    }
}
