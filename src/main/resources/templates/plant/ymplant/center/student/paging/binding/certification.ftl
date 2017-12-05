<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/h-ui/js/H-ui.min.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/h-ui.admin/js/H-ui.admin.js?v=${v}"></script>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/center.css?v=${v}"/>
</head>
<body>
    <div class="lan" style="height: 854px">
    <p>实名认证</p>
    <form action="${ctxPath}/plant/user/api/binding/idcard" method="post" id="form">
        <div class="row" style="margin-left: 30px;margin-top: 30px;">
            <p style="color: #767676">1.我们对您的信息绝对保密</p>
            <p style="color: #767676">2.认证可以提高信誉</p>
            <p style="color: #767676">3.认证完全免费，认证成功后不可修改</p>

            <div style="margin-left: 50px">
                <p style="margin:20px 0">
                    <span style="margin-right: 30px">真实姓名：</span>
                    <input type="text" style="background-color: #F6F6F6;border: 1px solid #000;border-radius: 5px" name="NAME"/>
                </p>
                <p style="margin:20px 0">
                    <span style="margin-right: 30px">身份证号：</span>
                    <input type="text" style="background-color: #F6F6F6;border: 1px solid #000;border-radius: 5px" name="IDCARD"/>
                </p>
                <p class="baocun" style="margin-left:160px;margin-top: 40px">
                    <input type="submit" value="提交认证">
                </p>
            </div>
        </div>
    </form>
</div>
<script language="JavaScript">
    $(function () {
        $("#form").validate({
            rules:{
            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                $(form).ajaxSubmit(function (res) {
                    if(res.hasErrors){
                        showError(res.errorMessage);
                        return false;
                    }

                    parent.showSuccess("认证成功！");
                <#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'>
//                    window.location.href = ctxPath + "/plant/user/basicinfo";
                    parent.$(".ster").each(function(){
                        if($(this).attr("data-href") == "${ctxPath}/plant/user/basicinfo"){
                            $(this).addClass("kd-lhtai");
                            window.location.href = ctxPath + "/plant/user/basicinfo";
                        }
                        else{
                            $(this).removeClass("kd-lhtai");
                        }
                    });
                </#if>
                <#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'm9bxdt9g36'>
//                    window.location.href = ctxPath + "/plant/teacher/basic";
                    parent.$(".ster").each(function(){
                        if($(this).attr("data-href") == "${ctxPath}/plant/teacher/basic"){
                            $(this).addClass("kd-lhtai");
                            window.location.href = ctxPath + "/plant/teacher/basic";
                        }
                        else{
                            $(this).removeClass("kd-lhtai");
                        }
                    });
                </#if>
                });
            }
        });
    });
</script>
</body>
</html>