<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/center.css?v=${v}"/>
</head>
<body class="corresponding">

<div class="lan" style="height: 854px">
    <p>绑定手机</p>
    <div class="row" style="margin-left: 30px;margin-top: 30px;">
        <p style="color: #767676">1.绑定手机即可直接通过短信安全验证进行操作</p>
        <p style="color: #767676">2.更改手机是，请通过安全验证的重新输入新手机号码</p>
        <p style="color: #767676">3.受到安全验证码时，请在10分钟内完成验证</p>
        <div style="margin-left: 50px">
            <p style="margin:20px 0">
                <span>更改手机号码：</span>
                <input type="text" style="margin-left:29px;background-color: #F6F6F6;border: 1px solid #000;border-radius: 5px" id="PHONE"/>
            </p>
            <p style="margin:20px 0">
                <span>输入验证码：</span>
                <input type="text" style="margin-left:42px;background-color: #F6F6F6;border: 1px solid #000;border-radius: 5px" id="CODE"/>
                <img style="padding:5px 10px;" src="" id="validCode" onclick="getCode();"/>
            </p>
            <p>
                <span>短信验证码：</span>
                <input type="text" style="margin-left:42px;background-color: #F6F6F6;border: 1px solid #000;border-radius: 5px" id="SMSCODE"/>
                <button style="font-size: 0.2em;border-radius: 5px;border: 1px solid #949494;background-color: #F3F3F3" onclick="getSMSCode();" id="codeBtn">获取验证码</button>
                <input type="button" style="display: none;font-size: 0.2em;border-radius: 5px;border: 1px solid #949494;background-color: #F3F3F3" id="afterBtn" value="60秒后重试" />
            </p>
            <p class="baocun" style="margin-left:160px;margin-top: 40px">
                <button onclick="savePhone();" class="kd-xgai2">保存修改</button>
            </p>
        </div>
    </div>
</div>
<script language="JavaScript">
    $(function () {
        getCode();
    });

    var codeCount = 0;
    var codeTimer = null;
    var getCode = function () {
        var random = Math.random();
        $("#validCode").attr("src", ctxPath + "/plant/user/getcode?r=" + random);
    };
    
    var getSMSCode = function () {
        if($("#PHONE").val() == "") {
            showError("请填写新的手机号！");
            return false;
        }
        sendRequest(ctxPath + "/plant/user/api/getsmscode", {PHONE: $("#PHONE").val()}, "POST", function (res) {
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

    var savePhone = function () {
        sendRequest(ctxPath + "/plant/user/api/binding/phone", {PHONE: $("#PHONE").val(), CODE: $("#CODE").val(), SMSCODE: $("#SMSCODE").val()}, "POST", function (res) {
            if(res.hasErrors){
                showError(res.errorMessage);
                return false;
            }

            parent.showSuccess("绑定成功！");
        <#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'>
//            window.location.href = ctxPath + "/plant/user/basicinfo";
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
//            window.location.href = ctxPath + "/plant/teacher/basic";
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
    };
</script>

</body>
</html>