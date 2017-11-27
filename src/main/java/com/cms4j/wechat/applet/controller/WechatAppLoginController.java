package com.cms4j.wechat.applet.controller;

import com.alibaba.fastjson.JSONObject;
import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.system.role.service.RoleService;
import com.cms4j.base.util.*;
import com.cms4j.plant.user.service.CompleteProService;
import com.cms4j.plant.user.service.CompleteStudentService;
import com.cms4j.plant.user.service.CompleteTeacherService;
import com.cms4j.plant.user.service.PlantUserService;
import com.cms4j.plant.util.PlantConst;
import com.cms4j.wechat.service.WechatUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping(value = "/wechat/applet/api", method = RequestMethod.POST)
public class WechatAppLoginController extends ApiBaseController {

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

    @Autowired
    private PlantUserService plantUserService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public InvokeResult login() throws Exception {
        DataMap dataMap = this.getDataMap();

        String code = dataMap.getString("code");
        JSONObject jsonObject = wechatUserService.login(code);
        if(jsonObject.containsKey("openid") && jsonObject.containsKey("session_key")) {
            //请求成功
            DataMap wechatUser = new DataMap();
            /*wechatUser.put("UNIONID", jsonObject.getString("unionid"));
            wechatUser = wechatUserService.getWechatUserByUnionId(wechatUser);*/
            //未注册微信开放平台,用OPENID获取数据
            wechatUser.put("WXAPPOPENID", jsonObject.getString("openid"));
            wechatUser = wechatUserService.getWechatUserByWxAppOpenId(wechatUser);

            //新用户
            if(wechatUser == null) {
                wechatUser = new DataMap();
                wechatUser.put("USER_ID", ShortUUID.randomUUID());
                wechatUser.put("WXAPPOPENID", jsonObject.getString("openid"));
                //wechatUser.put("UNIONID", jsonObject.getString("unionid"));//未注册微信开放平台,不会返回unionid
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

            DataMap returnMap = new DataMap();
            returnMap.put("thirdSessionId", SessionUtil.getSession().getId());
            returnMap.put("isCompleted", curUser != null);

            return InvokeResult.success(returnMap);
        }

        return InvokeResult.failure("读取用户信息失败，请重试");
    }

    @RequestMapping(value = "relation", method = RequestMethod.POST)
    public InvokeResult relation() throws Exception {
        DataMap dataMap = this.getDataMap();
        String[] params = {"USERNAME", "PASSWORD"};
        if(!this.validParams(params, dataMap))
            return this.validFailure();

        DataMap wxUser = SessionUtil.getWechatFromSession();
        if(wxUser == null)
            return InvokeResult.failure(Const.NOLOGIN_CODE, "please relogin");

        dataMap.put("PASSWORD", MD5Util.getMD5(dataMap.getString("PASSWORD")));
        DataMap curUser = plantUserService.validUser(dataMap);
        if(curUser == null)
            return InvokeResult.failure("用户名或密码错误");

        wxUser.put("USER_ID", curUser.getString("USER_ID"));
        wechatUserService.editWechatUser(wxUser);
        return InvokeResult.success();
    }
}
