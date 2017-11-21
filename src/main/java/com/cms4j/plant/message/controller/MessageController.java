package com.cms4j.plant.message.controller;

import com.cms4j.base.controller.PageBaseController;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.chat.service.ChatService;
import com.cms4j.plant.util.PlantConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
@RequestMapping(value = "/plant/message")
public class MessageController extends PageBaseController {

    @Autowired
    private ChatService chatService;

    @RequestMapping(value = "/index")
    public ModelAndView index() throws Exception {
        ModelAndView modelAndView = this.getModelAndView();
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null){
            modelAndView.setViewName(PlantConst.URL_NOLOGIN);
            return modelAndView;
        }
        modelAndView.setViewName("/plant/ymplant/center/message/message");

        DataMap param = new DataMap();
        param.put("RUSER_ID", curUser.getString("USER_ID"));
        if(PlantConst.ROLE_STUDENT.equals(curUser.getString("ROLE_ID"))) {
            param.put("isStudent", true);
        }
        else if(PlantConst.ROLE_TEACHER.equals(curUser.getString("ROLE_ID"))) {
            param.put("isTeacher", true);
        }
        List<DataMap> noReadMsgs = chatService.getNoReadMsgs(param);
        if(noReadMsgs == null) noReadMsgs = new ArrayList<DataMap>();
        TreeSet<String> set = new TreeSet<String>();

        for(DataMap noReadMsg : noReadMsgs) {
            set.add(noReadMsg.getString("SHOWDATE"));
        }

        List<DataMap> listOut = new ArrayList<DataMap>();

        Iterator<String> iterator = set.descendingIterator();
        while (iterator.hasNext()) {
            String str = iterator.next();
            DataMap dataMapOut = new DataMap();
            dataMapOut.put("CHATDATE", str);
            List<DataMap> dataListOut = new ArrayList<DataMap>();
            for(DataMap noReadMsg : noReadMsgs) {
                if(str.equals(noReadMsg.getString("SHOWDATE"))) {
                    dataListOut.add(noReadMsg);
                }
            }

            if(dataListOut.size() == 0) continue;
            dataMapOut.put("datas", dataListOut);
            listOut.add(dataMapOut);
        }
        modelAndView.addObject("noReadMsgs", listOut);

        return modelAndView;
    }
}