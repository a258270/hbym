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
    <p>交易密码修改</p>
    <form action="${ctxPath}/plant/user/api/updatetpass" method="post" id="form">
        <div class="row" style="margin-left: 30px;margin-top: 30px;">
            <p style="color: #767676">1.请牢记登录密码</p>
            <p style="color: #767676">2.如果丢失密码，可以通过绑定的手机或邮箱找到</p>

            <div style="margin-left: 50px">
                <p style="margin:20px 0">
                    <span style="margin-right: 30px">原密码：</span>
                    <input type="password" style="background-color: #F6F6F6;border: 1px solid #000;border-radius: 5px" name="PASSWORD"/>
                </p>
                <p style="margin:20px 0">
                    <span style="margin-right: 30px">验证码：</span>
                    <input type="text" style="background-color: #F6F6F6;border: 1px solid #000;border-radius: 5px" name="CODE"/>
                    <input type="button" style="font-size: 0.2em;border-radius: 5px;border: 1px solid #949494;background-color: #F3F3F3" onclick="getSMSCode();" id="codeBtn" value="获取验证码" />
                    <input type="button" style="display: none;font-size: 0.2em;border-radius: 5px;border: 1px solid #949494;background-color: #F3F3F3" id="afterBtn" value="60秒后重试" />
                </p>
                <p style="margin:20px 0">
                    <span style="margin-right: 30px">新密码：</span>
                    <input type="password" style="background-color: #F6F6F6;border: 1px solid #000;border-radius: 5px" name="NEWPASSWORD"/>
                </p>
                <p style="margin:20px 0">
                    <span style="margin-right: 17px">确认密码：</span>
                    <input type="password" style="background-color: #F6F6F6;border: 1px solid #000;border-radius: 5px" name="RENEWPASSWORD"/>
                </p>
                <p class="baocun" style="margin-left:160px;margin-top: 40px">
                    <input type="submit" class="kd-xgai2" value="提交修改" />
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
    var codeCount = 0;
    var codeTimer = null;
    var getSMSCode = function () {
        sendRequest(ctxPath + "/plant/user/api/getsmscode", {SELF: "T"}, "POST", function (res) {
            if(res.hasErrors){
                showError(res.errorMessage);
                return false;
            }

            $("#codeBtn").hide();
            $("#afterBtn").show();
            codeTimer = setInterval("goCount()", 1000);
            showSuccess("发送成功！");
        });
    };

    var goCount = function () {
        if(codeCount == 60){
            clearInterval(codeTimer);
            $("#codeBtn").show();
            $("#afterBtn").hide();
            codeCount = 0;
            codeTimer = null;
            ("#afterBtn").val("60秒后重试");
            return;
        }
        codeCount++;
        $("#afterBtn").val((60 - codeCount) + "秒后重试");
    };
</script>
</body>
</html>