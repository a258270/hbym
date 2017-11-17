package com.cms4j.plant.chat.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.chat.service.ChatScoreService;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/plant/chatscore/api")
public class ChatScoreApiController extends ApiBaseController {

    @Autowired
    private ChatScoreService chatScoreService;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public InvokeResult add() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_STUDENT.equals(curUser.getString("ROLE_ID")))
            return InvokeResult.failure("请登录账号！");

        DataMap dataMap = this.getDataMap();
        if(StringUtils.isBlank(dataMap.getString("SCORE")))
            return InvokeResult.failure("请填写分数！");

        if(StringUtils.isBlank(dataMap.getString("CONTENT")))
            return InvokeResult.failure("请填写评价内容！");

        try{
            Integer score = Integer.valueOf(dataMap.getString("SCORE"));
            if(score > 5)
                dataMap.put("SCORE", 4);
        }
        catch(Exception e){
            return InvokeResult.failure("分数填写不正确！");
        }

        if(StringUtils.isBlank(dataMap.getString("TEACHER_ID")))
            return InvokeResult.failure("请选择老师！");

        dataMap.put("STUDENT_ID", curUser.getString("USER_ID"));

        DataMap score = chatScoreService.getChatScoreByStudentIdAndTeacherId(dataMap);
        if(score != null)
            return InvokeResult.failure("您已评价过该老师，不可重复评价！");
        chatScoreService.evaluateTeacher(dataMap);
        return InvokeResult.success();
    }
}
