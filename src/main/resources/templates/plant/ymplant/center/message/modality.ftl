<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/search/search.css?v=${v}"/>
</head>
<body>
    <div class="kd-dkua">
        <#if invite??>
            <div class="row">
                <div class="col-md-2 col-sm-2 col-xs-2">
                    <img src="${invite.HEADURL!'/static/ymplant/img/nohead.png'}" style="width: 45px;height: 45px;border-radius: 50%;" alt=""/>
                </div>
                <div class="col-md-8 col-sm-8 col-xs-8" style="padding: 0;">
                    <p style="font-weight: bold;margin-bottom: 5px;">${invite.NICKNAME!'暂无'}</p>
                    <p style="font-size: 12px;">${invite.SCNAME!'暂无信息'}</p>
                </div>
            </div>
            <div class="kd-yqi">
                ${invite.CONTENT!''}
            </div>
            <!--<textarea name="textarea" id="input1" onpropertychange="try{textCounter(this,1000)}catch(e){}" onkeypress="return keypress(event);" onkeydown="return keydown(event)"></textarea>-->
            <p style="text-align: center;">
                <input class="kd-bafa" style="margin-right:80px;;" type="button" value="开始咨询" onclick="toChat('${invite.TEAUSER_ID!''}');"/>
                <input class="kd-bafa" type="button" value="取消" onclick="cancle();"/>
            </p>
        <#else>
            暂无信息
        </#if>
    </div>
<script language="JavaScript">
    function cancle() {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }

    function toChat(id) {
        top.location.href = ctxPath + "/plant/chat/page/student/" + id;
    }
</script>
</body>
</html>