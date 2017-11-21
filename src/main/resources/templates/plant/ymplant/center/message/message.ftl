<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/message/message.css?v=${v}"/>
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
    <div class="kd-meg">
    <div class="container" style="padding: 30px 50px;">
        <ul class="nav nav-tabs" id="kd-lhx" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">联系人</a></li>
            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">邀请函</a></li>
            <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">系统</a></li>
        </ul>
        <div class="tab-content" style="margin-top: 20px;">
            <div class="tab-pane active" role="tabpanel" id="home">
                <#if noReadMsgs?? && (noReadMsgs?size > 0)>
                    <#list noReadMsgs as noReadMsg>
                        <div class="kd-kzhu">
                            <div class="kd-xld">
                                <dt>${noReadMsg.CHATDATE}</dt>
                                <div class="kd-ld"></div>
                                <#if noReadMsg.datas?? && (noReadMsg?size > 0)>
                                    <#list noReadMsg.datas as dataObj>
                                        <div class="kd-xxi">
                                            <p>
                                                <a class="kd-xhua" href="<#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'>${ctxPath}/plant/chat/page/student/${dataObj.SUSER_ID}</#if><#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'm9bxdt9g36'>${ctxPath}/plant/chat/page/teacher/${dataObj.SUSER_ID}</#if>">${dataObj.NICKNAME!"暂无"}给您发来了<span>${dataObj.COUNT}</span>条消息，快去看看吧！</a>
                                            </p>
                                            <p class="kd-lxx">${dataObj.CONTENT}</p>
                                        </div>
                                    </#list>
                                </#if>
                            </div>
                        </div>
                    </#list>
                <#else>
                    <div class="kd-nothing">
                        <img src="/static/ymplant/images/tubiao3/remind.png" style="width: 55px;height: 55px;" alt=""/><br/>
                        <p class="kd-nomsg">暂时没有此类消息，<a href="<#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'>${ctxPath}/plant/chat/page/student</#if><#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'm9bxdt9g36'>${ctxPath}/plant/chat/page/teacher</#if>">点此进入聊天窗口</a></p>
                    </div>
                </#if>
            </div>
            <div class="tab-pane" role="tabpanel" id="profile">
                <div class="kd-kzhu">
                    <div class="kd-xld">
                        <dt>8月31日</dt>
                        <div class="kd-ld"></div>
                        <div class="kd-tzhi">
                                <span class="kd-yji">
                                    <span>【邀请】</span>同学你好，来我们学校看看吧，我们学校就是和要你这样的学生。
                                </span>
                            <a class="kd-xhua" href="javascript:void(0);">点击咨询</a>
                        </div>
                    </div>
                </div>
                <div class="kd-kzhu">
                    <div class="kd-xld">
                        <dt>8月31日</dt>
                        <div class="kd-ld"></div>
                        <div class="kd-tzhi">
                                <span class="kd-yji">
                                    <span>【邀请】</span>同学你好，来我们学校看看吧，我们学校就是和要你这样的学生。
                                </span>
                            <a class="kd-xhua" href="javascript:void(0);">点击咨询</a>
                        </div>
                    </div>
                </div>
                <div class="kd-kzhu">
                    <div class="kd-xld">
                        <dt>8月31日</dt>
                        <div class="kd-ld"></div>
                        <div class="kd-tzhi">
                                <span class="kd-yji">
                                    <span>【邀请】</span>同学你好，来我们学校看看吧，我们学校就是和要你这样的学生。
                                </span>
                            <a class="kd-xhua" href="javascript:void(0);">点击咨询</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" role="tabpanel" id="messages">
                <div class="kd-nothing">
                    <img src="/static/ymplant/images/tubiao3/remind.png" style="width: 55px;height: 55px;" alt=""/><br/>
                    <p class="kd-nomsg">暂时没有此类消息</p>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>