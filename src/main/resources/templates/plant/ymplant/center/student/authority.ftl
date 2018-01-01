<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/center.css?v=${v}"/>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/center.css?v=${v}"/>
    <link rel="stylesheet" href="/static/plugin/h-ui/lib/chosen.jquery/chosen.min.css?v=${v}"/>
    <script src="/static/plugin/h-ui/lib/chosen.jquery/chosen.jquery.min.js?v=${v}"></script>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/student/belongings.css?v=${v}"/>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/drag/drag.css?v=${v}"/>
    <script src="${ctxPath}/static/ymplant/js/drag/drag.js?v=${v}"></script>

    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/h-ui/js/H-ui.min.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/h-ui.admin/js/H-ui.admin.js?v=${v}"></script>
</head>
<body class="corresponding">
<form id="form" action="${ctxPath}/plant/user/api/vip" method="post">
<div class="lan" style="height: 854px">
    <p>账户权限</p>
    <div class="line">
        <div class="prompt">
            <div class="tuao">
                <img src="/static/ymplant/images/tubiao2/7.1.png" style="width: 100%;height: 100%;" alt=""/>
            </div>
            <span class="hyan">您当前身份属于<#if Session.session_user_key?? && Session.session_user_key.OVERDUETIME?? && Session.session_user_key.CARD_PURPOSE=='UB'>黄金会员<#else><#if Session.session_user_key?? && Session.session_user_key.OVERDUETIME?? && Session.session_user_key.CARD_PURPOSE=='UC'>黑钻会员<#else><#if Session.session_user_key?? && Session.session_user_key.OVERDUETIME?? && Session.session_user_key.CARD_PURPOSE=='UA'>白银会员<#else>普通会员</#if></#if></#if>，请<span style="color:#FF7F27;">激活</span>会员卡后提升权限！</span>
        </div>
    </div>

    <div style="padding: 20px 80px;text-align: center">
        <!--<input onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />-->
        卡号：<input class="activation" name="NUMBER" id="NUMBER" placeholder="请输入15位卡号" type="text"><br><br>
        激活码：<input class="activation" name="PASSWORD" id="PASSWORD" placeholder="请输入10位激活码" type="password">
    </div>
    <!--滑动验证 开始-->
        <div style=" margin-bottom:30px;">
            <div id="drag" style="margin: 0 auto;"></div>
        </div>
        <script type="text/javascript">
            $('#drag').drag();
        </script>
        <!--滑动验证 结束-->
    <div class="complete">
        <input value="激 活" type="submit"/>
    </div>
</div>
    <script language="JavaScript">
        $("#form").validate({
            rules:{
            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                if(document.getElementById("drag").innerText != "验证通过") {showError("请进行滑动验证！");return false;}
                $(form).ajaxSubmit(function (res) {
                    if(res.hasErrors){
                        showError(res.errorMessage);
                        return false;
                    }

                    top.location.href = "${ctxPath}/plant/user/center?p=authority";
                });
            }
        });
        $(function () {
            parent.layer.close(parent.loader);
        });
    </script>
</form>
</body>
</html>