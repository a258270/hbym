package com.cms4j.plant.chat.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.system.user.online.service.SessionService;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.card.util.CardUtil;
import com.cms4j.plant.chat.service.ChatScoreService;
import com.cms4j.plant.chat.service.ChatService;
import com.cms4j.plant.item.item.service.ItemBelongService;
import com.cms4j.plant.school.service.SchoolService;
import com.cms4j.plant.user.service.CompleteStudentService;
import com.cms4j.plant.user.service.CompleteTeacherService;
import com.cms4j.plant.user.service.ExamineeService;
import com.cms4j.plant.user.service.PlantUserService;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/plant/chat")
public class ChatController extends PageBaseController {

    @Autowired
    private PlantUserService plantUserService;

    @Autowired
    private ChatService chatService;

    @Autowired
    private CompleteStudentService completeStudentService;

    @Autowired
    private CompleteTeacherService completeTeacherService;
    @Autowired
    private ExamineeService examineeService;
    @Autowired
    private ChatScoreService chatScoreService;
    @Autowired
    private ItemBelongService itemBelongService;
    @Autowired
    private SessionService sessionService;
    @Autowired
    private SchoolService schoolService;

    @RequestMapping(value = {"/page/{flag}/{recId}", "/page/{flag}"})
    public ModelAndView page(@PathVariable String flag, @PathVariable(required = false) String recId) throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        if(!("student".equals(flag) || "teacher".equals(flag))) {
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null) {
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        if(StringUtils.isBlank(recId))
            modelAndView.addObject("url", "/plant/chat/" + flag);
        else
            modelAndView.addObject("url", "/plant/chat/" + flag + "/" + recId);

        modelAndView.setViewName("/plant/ymplant/chat/index");
        return modelAndView;
    }

    /**
     *
     * @param recId 老师User_id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = {"/student", "/student/{recId}"})
    public ModelAndView student(@PathVariable(required = false) String recId) throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_STUDENT.equals(curUser.getString("ROLE_ID"))) {
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }
        modelAndView.setViewName("/plant/ymplant/chat/student/student");

        if(StringUtils.isBlank(curUser.getString("OVERDUETIME"))) {
            modelAndView.addObject("error", "当前会员身份无此权限，点击确定前往激活页面");
            modelAndView.addObject("url", "authority");
            return modelAndView;
        }

        DataMap complete_stu = completeStudentService.getCompleteStudentByUserId(curUser);
        modelAndView.addObject("complete_stu", complete_stu);
        if(complete_stu == null || StringUtils.isBlank(complete_stu.getString("NICKNAME"))){
            modelAndView.addObject("error", "个人信息不完整，请在个人中心-基础信息处完善！");
            modelAndView.addObject("url", "basicinfo");
            return modelAndView;
        }

        DataMap examinee = examineeService.getExamineeByUserId(curUser);
        if(examinee == null || StringUtils.isBlank(examinee.getString("EXAMSCORE")) || StringUtils.isBlank(examinee.getString("EXAMAREA")) || StringUtils.isBlank(examinee.getString("MAJORTYPE")) || StringUtils.isBlank(examinee.getString("GRADE"))){
            modelAndView.addObject("error", "考生信息不完整，请在个人中心-考生信息处完善！");
            modelAndView.addObject("url", "examinee");
            return modelAndView;
        }

        modelAndView.addObject("recId", recId);

        if (!StringUtils.isBlank(recId)) {
            DataMap teacher = new DataMap();
            teacher.put("USER_ID", recId);
            teacher = plantUserService.getUserByUserId(teacher);
            boolean flag = true;
            if(teacher != null && PlantConst.ROLE_TEACHER.equals(teacher.getString("ROLE_ID"))){
                DataMap param = new DataMap();
                param.put("SUSER_ID", curUser.getString("USER_ID"));
                param.put("RUSER_ID", teacher.getString("USER_ID"));
                Integer count = chatService.getChatMappingBySRUserId(param);
                if(count.equals(0)){
                    DataMap cardParam = new DataMap();
                    cardParam.put("USER_ID", curUser.getString("USER_ID"));
                    cardParam.put("ITEMTYPE", PlantConst.ITEMTYPE_ZXK);

                    if(!CardUtil.CARD_PURPOSE_VIP3.equals(curUser.getString("CARD_PURPOSE"))){
                        //获取 院校咨询卡 次数
                        //ls: 注掉方法：List<DataMap> cards = itemBelongService.getValItemBelongByUserIdAndItemType(cardParam);
                        int cards = itemBelongService.getValItemBelongCountByUserIdAndItemType(cardParam);
                        //确保咨询卡有可用次数  并且扣除一次 后建立双方映射链接
                        if(cards != 0 && cards > 0){
                            int cards_used = cards - 1;
                            cardParam.put("COUNT",cards_used);
                            //
                            itemBelongService.reduceItemBelong(cardParam);


                        }
                        else{
                            modelAndView.addObject("error", "院校咨询卡数量不足，无法开启新会话！");
                            flag = false;
                        }
                    }

                    if(flag){
                        chatService.addChatMapping(curUser.getString("USER_ID"), recId);
                    }
                    //  itemBelongService.useItem(cards.get(0));

                }
                else if(count > 2) {
                    chatService.deleteChatMappingBySRUserId(param);
                    chatService.addChatMapping(curUser.getString("USER_ID"), recId);
                }
            }
            if(teacher != null && PlantConst.ROLE_TEACHER.equals(teacher.getString("ROLE_ID")) && flag){
                DataMap complete_tea = completeTeacherService.getCompleteTeacherByUserId(teacher);
                modelAndView.addObject("complete_tea", complete_tea);

                DataMap param = new DataMap();
                param.put("TEACHER_ID", teacher.getString("USER_ID"));
                Double totalscore = chatScoreService.getTeacherTotalScore(param);
                modelAndView.addObject("totalscore", totalscore);

                if(sessionService.getUserOnlineInfo(teacher.getString("USER_ID")) == null)
                    teacher.put("isOnline", "false");
                else
                    teacher.put("isOnline", "true");

                DataMap countParam = new DataMap();
                countParam.put("RUSER_ID", teacher.getString("USER_ID"));
                Integer chatCount = chatService.getCountTeacherChatMapping(countParam);
                modelAndView.addObject("teacherChatCount", chatCount);
                modelAndView.addObject("teacher", teacher);
            }
        }

        DataMap param = new DataMap();
        param.put("SUSER_ID", curUser.getString("USER_ID"));
        List<DataMap> chatUsers = chatService.getChatRecBySendStudentId(param);
        if(chatUsers != null) {
            List<DataMap> teachers = new ArrayList<DataMap>();
            List<DataMap> expecters = new ArrayList<DataMap>();
            for (DataMap chatUser: chatUsers) {
                if (PlantConst.ROLE_TEACHER.equals(chatUser.getString("ROLE_ID"))){
                    DataMap school = schoolService.getSchoolById(chatUser);
                    chatUser.put("school", school);
                    DataMap countParam = new DataMap();
                    countParam.put("SUSER_ID", chatUser.getString("RUSER_ID"));
                    countParam.put("RUSER_ID", chatUser.getString("SUSER_ID"));
                    Integer count = chatService.getCountMsg(countParam);
                    chatUser.put("count", count);
                    teachers.add(chatUser);
                }

                else if(PlantConst.ROLE_EXPERT.equals(chatUser.getString("ROLE_ID")))
                    expecters.add(chatUser);
            }

            modelAndView.addObject("teachers", teachers);
            modelAndView.addObject("expecters", expecters);
        }

        //不通过后台渲染显示聊天记录，通过ajax异步加载
        //param.put("RUSER_ID", recId);
        //List<DataMap> chatRecords = chatService.getChatRecBySRUserId(param);
        //modelAndView.addObject("chatRecords", chatRecords);

        return modelAndView;
    }

    /**
     *
     * @param recId 学生User_id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = {"/teacher", "/teacher/{recId}"})
    public ModelAndView teacher(@PathVariable(required = false) String recId) throws Exception {
        ModelAndView modelAndView = this.getModelAndView();

        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null || !PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))) {
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }

        DataMap complete_tea = completeTeacherService.getCompleteTeacherByUserId(curUser);
        modelAndView.addObject("complete_tea", complete_tea);

        modelAndView.setViewName("/plant/ymplant/chat/expert-chat/expert-chat");

        modelAndView.addObject("recId", recId);

        if (!StringUtils.isBlank(recId)) {
            DataMap student = new DataMap();
            student.put("USER_ID", recId);
            student = plantUserService.getUserByUserId(student);
            if(student != null && PlantConst.ROLE_STUDENT.equals(student.getString("ROLE_ID"))) {
                DataMap completeStu = completeStudentService.getCompleteStudentByUserId(student);
                student.putAll(completeStu);
                if(sessionService.getUserOnlineInfo(student.getString("USER_ID")) == null)
                    student.put("isOnline", "false");
                else
                    student.put("isOnline", "true");
                modelAndView.addObject("student", student);
                DataMap complete_stu = completeStudentService.getCompleteStudentByUserId(student);
                modelAndView.addObject("complete_stu", complete_stu);
                DataMap exam = examineeService.getExamineeByUserId(student);
                modelAndView.addObject("exam", exam);
            }

            /*if(student != null && PlantConst.ROLE_STUDENT.equals(student.getString("ROLE_ID"))) {
                chatService.addChatMapping(curUser.getString("USER_ID"), recId);
            }*/
        }

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
        modelAndView.addObject("chatUsers", chatUsers);

        //不通过后台渲染显示聊天记录，通过ajax异步加载
        //param.put("RUSER_ID", recId);
        //List<DataMap> chatRecords = chatService.getChatRecBySRUserId(param);
        //modelAndView.addObject("chatRecords", chatRecords);

        return modelAndView;
    }
}
