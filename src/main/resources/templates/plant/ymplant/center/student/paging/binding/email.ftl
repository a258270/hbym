<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/center.css?v=${v}"/>
</head>
<body>
    <div class="lan" style="height: 854px">
    <p>绑定邮箱</p>
    <div class="row" style="margin-left: 30px;margin-top: 30px;">
        <p style="color: #767676">1.此邮箱可接受密码找回，订单通知等等解决安全服务集体性使用，请务必填写正确邮箱</p>
        <p style="color: #767676">2.设置提交后，系统将自动发送验证邮件到绑定的邮箱，请您在24小时内登录邮箱并完成验证</p>
        <p style="color: #767676">3.更改邮箱时，请通过安全验证输入新邮箱进行绑定</p>
        <div style="margin-left: 50px">
            <p style="margin:20px 0">
                <span>绑定邮箱地址：</span>
                <input type="text" style="background-color: #F6F6F6;border: 1px solid #000;border-radius: 5px" id="EMAIL"/>
            </p>
            <p>
                <span>短信验证码：</span>
                <input type="text" style="background-color: #F6F6F6;border: 1px solid #000;border-radius: 5px" id="EMAILCODE"/>
                <button style="font-size: 0.2em;border-radius: 5px;border: 1px solid #949494;background-color: #F3F3F3" onclick="getSMSCode();" id="codeBtn">获取验证码</button>
                <input type="button" style="display: none;font-size: 0.2em;border-radius: 5px;border: 1px solid #949494;background-color: #F3F3F3" id="afterBtn" value="60秒后重试" />
            </p>
            <p class="baocun" style="margin-left:160px;margin-top: 40px">
                <button class="kd-xgai2" onclick="saveEmail();">保存修改</button>
            </p>
        </div>
    </div>
</div>
<script language="JavaScript">
    var codeCount = 0;
    var codeTimer = null;
    var getSMSCode = function () {
        sendRequest(ctxPath + "/plant/user/api/getsmscode", {}, "POST", function (res) {
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

    var saveEmail = function () {
        sendRequest(ctxPath + "/plant/user/api/binding/email", {EMAIL: $("#EMAIL").val(), CODE: $("#EMAILCODE").val()}, "POST", function (res) {
            if(res.hasErrors){
                showError(res.errorMessage);
                return false;
            }

            parent.showSuccess("绑定成功！");
        <#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'>
            window.location.href = ctxPath + "/plant/user/basicinfo";
        </#if>
        <#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'm9bxdt9g36'>
            window.location.href = ctxPath + "/plant/teacher/basic";
        </#if>
        });
    };
</script>
</body>
</html>