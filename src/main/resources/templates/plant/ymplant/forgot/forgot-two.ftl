<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/forgot/forgot.css?v=${v}"/>
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
<form action="${ctxPath}/plant/user/forget3" method="post">
<div class="kd-forgot">
    <div class="container">
        <div class="frame">
            <p style="margin: 50px;text-align: center">
                <img src="/static/ymplant/images/tubiao2/2.2.png" alt=""/>
            </p>
            <p style="text-align: center;margin-left: 105px">
                <span>用户名：</span>
                <span class="sjhao">
                    ${USERNAME}
                </span>
            </p>
            <p style="text-align: center;margin-left: 105px">
                <span>请输入验证码：</span>
                    <span class="sjhao">
                        <input type="text" placeholder="请输入验证码" name="CODE"/>
                    </span>
                <span style="margin-left: 15px;font-size: .8em">
                    <input type="button" value="点击获取验证码" onclick="getSMSCode();" id="codeBtn"/>
                    <input type="button" style="display: none;font-size: 0.2em;border-radius: 5px;border: 1px solid #949494;background-color: #F3F3F3" id="afterBtn" value="60秒后重试" />
                </span>
            </p>
            <p style="margin-left: 409px"   >
                <span>请输入新密码：</span>
                    <span class="sjhao">
                        <input style="width: 23%" type="password" name="PASSWORD"/>
                    </span>
                <span style="margin-left:13px;color: #A9A9A9">6-16位字符，包含数字和英文</span>
            </p>
            <p style="margin-left: 437px"   >
                <input type="hidden" value="${USERNAME}" name="USERNAME" />
                <span>确认密码：</span>
                <span class="sjhao">
                    <input style="width: 24%" type="password" name="REPASSWORD"/>
                </span>
            </p>
            <p style="text-align: center;margin-top: 50px;">
                <input class="xybu" type="submit" value="确认修改"/>
            </p>
        </div>
    </div>
</div>
</form>
<script language="JavaScript">
    var codeCount = 0;
    var codeTimer = null;
    var getSMSCode = function () {
        sendRequest(ctxPath + "/plant/user/api/getsmscode/forget", {USERNAME: "${USERNAME}"}, "POST", function (res) {
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
<#if error??>
<script language="JavaScript">
    showError("${error}");
</script>
</#if>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>