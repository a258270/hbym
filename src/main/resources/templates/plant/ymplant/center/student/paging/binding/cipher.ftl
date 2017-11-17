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
    <p>登录密码修改</p>
    <form action="${ctxPath}/plant/user/api/updatepass" method="post" id="form">
        <div class="row" style="margin-left: 30px;margin-top: 30px;">
            <p style="color: #767676">1.请牢记登录密码</p>
            <p style="color: #767676">2.如果丢失密码，可以通过绑定的手机或邮箱找到</p>

            <div style="margin-left: 50px">
                <p style="margin:20px 0">
                    <span style="margin-right: 30px">原密码：</span>
                    <input type="password" style="background-color: #F6F6F6;border: 1px solid #000;border-radius: 5px" id="PASSWORD" name="PASSWORD"/>
                </p>
                <p style="margin:20px 0">
                    <span style="margin-right: 30px">新密码：</span>
                    <input type="password" style="background-color: #F6F6F6;border: 1px solid #000;border-radius: 5px" id="NEWPASSWORD" name="NEWPASSWORD"/>
                </p>
                <p style="margin:20px 0">
                    <span style="margin-right: 17px">确认密码：</span>
                    <input type="password" style="background-color: #F6F6F6;border: 1px solid #000;border-radius: 5px" id="RENEWPASSWORD" name="RENEWPASSWORD"/>
                </p>
                <p class="baocun" style="margin-left:160px;margin-top: 40px">
                    <input type="submit" class="kd-xgai2" value="确认修改" />
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

                    parent.showSuccess("修改成功！");
                <#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'>
                    window.location.href = ctxPath + "/plant/user/basicinfo";
                </#if>
                <#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'm9bxdt9g36'>
                    window.location.href = ctxPath + "/plant/teacher/basic";
                </#if>
                });
            }
        });
    });
</script>
</body>
</html>