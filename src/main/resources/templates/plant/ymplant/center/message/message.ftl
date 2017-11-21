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
            <li role="presentation" class="active"><a href="#home" class="kd-shdi" aria-controls="home" role="tab" data-toggle="tab">联系人
                <span class="kd-hdi"></span>
            </a></li>
        <#if Session.session_user_key?? && Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'><li role="presentation"><a href="#profile" class="kd-shdi" aria-controls="profile" role="tab" data-toggle="tab">邀请函
            <span class="kd-hdi"></span>
        </a></li></#if>
            <li role="presentation"><a href="#messages" class="kd-shdi" aria-controls="messages" role="tab" data-toggle="tab">系统
                <span class="kd-hdi"></span>
            </a></li>
        </ul>
        <div class="tab-content" style="margin-top: 20px;">
            <div class="tab-pane active" role="tabpanel" id="home">
                <#if noReadMsgs?? && (noReadMsgs?size > 0)>
                    <#list noReadMsgs as noReadMsg>
                        <div class="kd-kzhu">
                            <div class="kd-xld">
                                <dt>${noReadMsg.CHATDATE}</dt>
                                <div class="kd-ld"></div>
                                <#if noReadMsg.datas?? && (noReadMsg.datas?size > 0)>
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
                        <p class="kd-nomsg">暂时没有此类消息，<a href="<#if Session.session_user_key?? && Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'>${ctxPath}/plant/chat/page/student</#if><#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'm9bxdt9g36'>${ctxPath}/plant/chat/page/teacher</#if>">点此进入聊天窗口</a></p>
                    </div>
                </#if>
            </div>
            <div class="tab-pane" role="tabpanel" id="profile">
                <#if noReadInvites?? && (noReadInvites?size > 0)>
                    <#list noReadInvites as noReadInvite>
                        <div class="kd-kzhu">
                            <div class="kd-xld">
                                <dt>${noReadInvite.CHATDATE}</dt>
                                <div class="kd-ld"></div>
                                <#if noReadInvite.datas?? && (noReadInvite.datas?size > 0)>
                                    <#list noReadInvite.datas as dataObj>
                                        <div class="kd-tzhi">
                                            <span class="kd-yji">
                                                <span>【邀请】</span>${dataObj.CONTENT}
                                            </span>
                                            <a class="kd-xhua" href="javascript:void(0);" onclick="toInviteDetails('${dataObj.INVITE_ID}')">点击查看</a>
                                        </div>
                                    </#list>
                                </#if>
                            </div>
                        </div>
                    </#list>
                <#else>
                    <div class="kd-nothing">
                        <img src="/static/ymplant/images/tubiao3/remind.png" style="width: 55px;height: 55px;" alt=""/><br/>
                        <p class="kd-nomsg">暂时没有此类消息</p>
                    </div>
                </#if>
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
<script language="JavaScript">
    function toInviteDetails(id) {
        showWindow("邀请函详情", ctxPath + "/plant/message/modality/" + id, 500, 395);
    }
</script>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>