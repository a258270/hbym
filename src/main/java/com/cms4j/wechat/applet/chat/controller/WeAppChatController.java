package com.cms4j.wechat.applet.chat.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.system.user.online.service.SessionService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.chat.service.ChatScoreService;
import com.cms4j.plant.chat.service.ChatService;
import com.cms4j.plant.item.item.service.ItemBelongService;
import com.cms4j.plant.school.service.SchoolService;
import com.cms4j.plant.user.service.*;
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
    @Autowired
    private PlantUserService plantUserService;
    @Autowired
    private ItemBelongService itemBelongService;
    @Autowired
    private CompleteStudentService completeStudentService;
    @Autowired
    private CompleteTeacherService completeTeacherService;
    @Autowired
    private CompleteProService completeProService;
    @Autowired
    private ChatScoreService chatScoreService;
    @Autowired
    private ExamineeService examineeService;

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
            student.put("isOnline", sessionService.getUserOnlineInfo(student.getString("RUSER_ID")) != null);
        }

        for(DataMap teacher : (List<DataMap>) out.get("teachers")) {
            teacher.put("isOnline", sessionService.getUserOnlineInfo(teacher.getString("RUSER_ID")) != null);
        }

        for(DataMap expecter : (List<DataMap>) out.get("expecters")) {
            expecter.put("isOnline", sessionService.getUserOnlineInfo(expecter.getString("RUSER_ID")) != null);
        }

        return InvokeResult.success(out);
    }

    @RequestMapping(value = "/getchatrecs")
    public InvokeResult getChatRes() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        DataMap dataMap = this.getDataMap();
        String[] params = {"USER_ID"};
        if(!this.validParams(params)){
            return this.validFailure();
        }

        DataMap out = new DataMap();

        switch (curUser.getString("ROLE_ID")) {
            case PlantConst.ROLE_STUDENT: {
                DataMap teacher = plantUserService.getUserByUserId(dataMap);

                if(teacher != null && PlantConst.ROLE_TEACHER.equals(teacher.getString("ROLE_ID"))){
                    DataMap param = new DataMap();
                    param.put("SUSER_ID", curUser.getString("USER_ID"));
                    param.put("RUSER_ID", teacher.getString("USER_ID"));
                    Integer count = chatService.getChatMappingBySRUserId(param);
                    if(count.equals(0)){
                        DataMap cardParam = new DataMap();
                        cardParam.put("USER_ID", curUser.getString("USER_ID"));
                        cardParam.put("ITEMTYPE", PlantConst.ITEMTYPE_ZXK);
                        int cards = itemBelongService.getValItemBelongCountByUserIdAndItemType(cardParam);

                       //ls:注掉原方法： List<DataMap> cards = itemBelongService.getValItemBelongByUserIdAndItemType(cardParam);
                        if(cards != 0 && cards > 0){
                            int cards_used = cards - 1;
                            cardParam.put("COUNT",cards_used);
                            itemBelongService.reduceItemBelong(cardParam);
                           // ls:注掉原方法 itemBelongService.useItem(cards.get(0));
                            chatService.addChatMapping(curUser.getString("USER_ID"), dataMap.getString("USER_ID"));
                        }
                        else{

                            return InvokeResult.failure("院校咨询卡数量不足，无法开启新会话！");
                        }

                    }
                    else if(count > 2) {
                        chatService.deleteChatMappingBySRUserId(param);
                        chatService.addChatMapping(curUser.getString("USER_ID"), dataMap.getString("USER_ID"));
                    }
                }

                if(teacher != null && PlantConst.ROLE_TEACHER.equals(teacher.getString("ROLE_ID"))){
                    DataMap complete_tea = completeTeacherService.getCompleteTeacherByUserId(teacher);
                    out.put("complete_tea", complete_tea);

                    DataMap param = new DataMap();
                    param.put("TEACHER_ID", teacher.getString("USER_ID"));
                    Double totalscore = chatScoreService.getTeacherTotalScore(param);
                    out.put("totalscore", totalscore);

                    if(sessionService.getUserOnlineInfo(teacher.getString("USER_ID")) == null)
                        teacher.put("isOnline", "false");
                    else
                        teacher.put("isOnline", "true");

                    DataMap countParam = new DataMap();
                    countParam.put("RUSER_ID", teacher.getString("USER_ID"));
                    Integer chatCount = chatService.getCountTeacherChatMapping(countParam);
                    out.put("teacherChatCount", chatCount);
                    out.put("teacher", teacher);
                }

                DataMap param = new DataMap();
                param.put("SUSER_ID", curUser.getString("USER_ID"));

                param.put("RUSER_ID", dataMap.getString("USER_ID"));
                List<DataMap> chatRecords = chatService.getChatRecBySRUserId(param);
                out.put("chatRecords", chatRecords);
                break;
            }

            case PlantConst.ROLE_EXPERT:
            case PlantConst.ROLE_TEACHER: {
                DataMap student = plantUserService.getUserByUserId(dataMap);

                if(student != null && PlantConst.ROLE_STUDENT.equals(student.getString("ROLE_ID"))) {
                    DataMap completeStu = completeStudentService.getCompleteStudentByUserId(student);
                    student.putAll(completeStu);
                    if(sessionService.getUserOnlineInfo(student.getString("USER_ID")) == null)
                        student.put("isOnline", "false");
                    else
                        student.put("isOnline", "true");
                    out.put("student", student);
                    DataMap complete_stu = completeStudentService.getCompleteStudentByUserId(student);
                    out.put("complete_stu", complete_stu);
                    DataMap exam = examineeService.getExamineeByUserId(student);
                    out.put("exam", exam);
                }

                DataMap param = new DataMap();
                param.put("SUSER_ID", curUser.getString("USER_ID"));

                param.put("RUSER_ID", dataMap.getString("USER_ID"));
                List<DataMap> chatRecords = chatService.getChatRecBySRUserId(param);
                out.put("chatRecords", chatRecords);
                break;
            }
        }

        return InvokeResult.success(out);
    }
}
