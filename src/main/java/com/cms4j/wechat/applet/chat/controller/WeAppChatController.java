package com.cms4j.wechat.applet.chat.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.system.user.online.service.SessionService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.chat.service.ChatService;
import com.cms4j.plant.school.service.SchoolService;
import com.cms4j.plant.util.PlantConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = "/wechat/applet/chat")
public class WeAppChatController extends ApiBaseController {

    @Autowired
    private ChatService chatService;
    @Autowired
    private SchoolService schoolService;
    @Autowired
    private SessionService sessionService;

    /**
     * 获取联系人列表
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getcontactors")
    public InvokeResult getContractors() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        DataMap out = new DataMap();
        switch (curUser.getString("ROLE_ID")) {
            case PlantConst.ROLE_STUDENT: {
                DataMap param = new DataMap();
                param.put("SUSER_ID", curUser.getString("USER_ID"));
                List<DataMap> chatUsers = chatService.getChatRecBySendStudentId(param);
                if(chatUsers != null) {
                    List<DataMap> teachers = new ArrayList<DataMap>();
                    List<DataMap> expecters = new ArrayList<DataMap>();
                    for (DataMap chatUser : chatUsers) {
                        if (PlantConst.ROLE_TEACHER.equals(chatUser.getString("ROLE_ID"))) {
                            DataMap school = schoolService.getSchoolById(chatUser);
                            chatUser.put("school", school);
                            DataMap countParam = new DataMap();
                            countParam.put("SUSER_ID", chatUser.getString("RUSER_ID"));
                            countParam.put("RUSER_ID", chatUser.getString("SUSER_ID"));
                            Integer count = chatService.getCountMsg(countParam);
                            chatUser.put("count", count);
                            teachers.add(chatUser);
                        } else if (PlantConst.ROLE_EXPERT.equals(chatUser.getString("ROLE_ID")))
                            expecters.add(chatUser);
                    }

                    out.put("teachers", teachers);
                    out.put("expecters", expecters);
                }
                break;
            }
            case PlantConst.ROLE_TEACHER:
            case PlantConst.ROLE_EXPERT: {
                DataMap param = new DataMap();
                param.put("SUSER_ID", curUser.getString("USER_ID"));
                List<DataMap> chatUsers = chatService.getChatRecBySendTeacherId(param);
                if(chatUsers != null) {
                    for(DataMap chatUser : chatUsers){
                        DataMap countParam = new DataMap();
                        countParam.put("SUSER_ID", chatUser.getString("RUSER_ID"));
                        countParam.put("RUSER_ID", chatUser.getString("SUSER_ID"));
                        Integer count = chatService.getCountMsg(countParam);
                        chatUser.put("count", count);
                    }
                }
                out.put("students", chatUsers);
                break;
            }
        }

        if(out.get("students") == null) out.put("students", new ArrayList());
        if(out.get("teachers") == null) out.put("teachers", new ArrayList());
        if(out.get("expecters") == null) out.put("expecters", new ArrayList());

        for(DataMap student : (List<DataMap>) out.get("students")) {
            student.put("isOnline", sessionService.getUserOnlineInfo(student.getString("USER_ID")) != null);
        }

        for(DataMap teacher : (List<DataMap>) out.get("teachers")) {
            teacher.put("isOnline", sessionService.getUserOnlineInfo(teacher.getString("USER_ID")) != null);
        }

        for(DataMap expecter : (List<DataMap>) out.get("expecters")) {
            expecter.put("isOnline", sessionService.getUserOnlineInfo(expecter.getString("USER_ID")) != null);
        }

        return InvokeResult.success(out);
    }
}
