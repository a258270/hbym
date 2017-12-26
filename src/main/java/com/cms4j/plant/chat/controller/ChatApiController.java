package com.cms4j.plant.chat.controller;

import com.cms4j.base.controller.ApiBaseController;
import com.cms4j.base.server.SocketServer;
import com.cms4j.base.util.DataMap;
import com.cms4j.base.util.InvokeResult;
import com.cms4j.base.util.Page;
import com.cms4j.base.util.SessionUtil;
import com.cms4j.plant.chat.service.ChatService;
import com.cms4j.plant.school.service.ScInviteService;
import com.cms4j.plant.util.PlantConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = {"/plant/chat/api", "/wechat/applet/chat"})
public class ChatApiController extends ApiBaseController {

    @Autowired
    private ChatService chatService;
    @Autowired
    private ScInviteService scInviteService;

    @RequestMapping(value = "/sendMessage")
    public InvokeResult sendMessage() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return InvokeResult.failure("请登录您的账号！");

        DataMap dataMap = this.getDataMap();

        String recUser = dataMap.getString("USER_ID");
        String message = dataMap.getString("MESSAGE");

        if(StringUtils.isBlank(message)) return InvokeResult.failure("发送的消息不能为空！");

        DataMap param = new DataMap();
        param.put("SUSER_ID", curUser.getString("USER_ID"));
        param.put("RUSER_ID", recUser);
        param.put("CONTENT", message);
        chatService.addChatRec(param);

        chatService.setChatMappingValiable(param);

        SocketServer.sendMessage(curUser.getString("USER_ID") + "----" + message, recUser);
        return InvokeResult.success();
    }

    @RequestMapping(value = "/todel")
    public InvokeResult toDel() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return InvokeResult.failure("请登录您的账号！");

        DataMap dataMap = this.getDataMap();
        dataMap.put("RUSER_ID", dataMap.getString("USER_ID"));
        dataMap.put("SUSER_ID", curUser.getString("USER_ID"));
        chatService.deleteUserChatMapping(dataMap);

        return InvokeResult.success();
    }

    @RequestMapping(value = "/getrecs")
    public InvokeResult getRecs() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser == null)
            return InvokeResult.failure("请登录您的账号！");

        //dataMap中包含所需RUSER_ID参数
        DataMap dataMap = this.getDataMap();

        dataMap.put("SUSER_ID", curUser.getString("USER_ID"));
        List<DataMap> chatRecords = chatService.getChatRecBySRUserId(dataMap);


        return InvokeResult.success(chatRecords == null ? new ArrayList() : chatRecords);

        /*Map params = new HashMap();
        params.put("RUSER_ID", dataMap.getString("RUSER_ID"));
        params.put("SUSER_ID", curUser.getString("USER_ID"));
        Page page = new Page();
        page.setParams(params);

        if(StringUtils.isBlank(dataMap.getString("currentPage"))) dataMap.put("currentPage", "0");
        else{
            try{
                Integer currentPage = Integer.valueOf(dataMap.getString("currentPage"));
                currentPage--;
                if(currentPage < 0) currentPage = 0;
                dataMap.put("currentPage", currentPage);
            }
            catch (Exception e) {
                dataMap.put("currentPage", "0");
            }
        }
        page.setPageNumber(Integer.valueOf(dataMap.getString("currentPage")));
        page.setPageSize(10);

        List<DataMap> records = chatService.listChatRecords(page);
        page.setResults(records);*/

    }

    @RequestMapping(value = "/setread")
    public InvokeResult setRead() throws Exception {
        DataMap dataMap = this.getDataMap();
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser != null) {
            dataMap.put("RUSER_ID", curUser.getString("USER_ID"));
            chatService.setRead(dataMap);
        }

        return InvokeResult.success();
    }

    @RequestMapping(value = "/hasmsg")
    public InvokeResult hasMsg() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser != null) {
            DataMap param = new DataMap();
            param.put("RUSER_ID", curUser.getString("USER_ID"));
            return InvokeResult.success(chatService.isHasMsg(param));
        }

        return InvokeResult.success(false);
    }

    /**
     * 获取未读聊天信息数量
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getmsgcount")
    public InvokeResult getMsgCount() throws Exception {
        DataMap curUser = SessionUtil.getCurUser();
        if(curUser != null) {
            DataMap param = new DataMap();
            param.put("RUSER_ID", curUser.getString("USER_ID"));
            Integer iChat = chatService.getNoReadMsgCount(param);
            Integer iInvite = scInviteService.getCountNoReadScInvites(curUser);
            return InvokeResult.success(iChat + iInvite);
        }

        return InvokeResult.success(0);
    }
}
