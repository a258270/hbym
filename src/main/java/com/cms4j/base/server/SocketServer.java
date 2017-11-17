package com.cms4j.base.server;

import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.util.HashMap;
import java.util.Map;

@ServerEndpoint(value = "/plant/chat/{userId}")
@Component
public class SocketServer {

    private Session session;
    private static Map<String, Session> sessionPool = new HashMap<String, Session>();
    private static Map<String, String> sessionIds = new HashMap<String, String>();

    @OnOpen
    public void onOpen(Session session, @PathParam(value = "userId") String userId) {
        this.session = session;

        sessionPool.put(userId, session);
        sessionIds.put(session.getId(), userId);
    }

    @OnMessage
    public void onMessage(String message) {
        System.out.println("当前发送人" + session.getId() + "发送消息" + message);
    }

    @OnClose
    public void onClose() {
        sessionPool.remove(sessionIds.get(session.getId()));
        sessionIds.remove(session.getId());
    }

    @OnError
    public void onError(Session session, Throwable error) {
        error.printStackTrace();
    }

    public static void sendMessage(String message, String userId) {
        Session session = sessionPool.get(userId);
        if(session != null) {
            try{
                session.getBasicRemote().sendText(message);
            }
            catch (Exception e){
                System.out.println("socket发送出错！");
            }
        }
    }
}
