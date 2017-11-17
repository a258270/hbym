<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/center.css?v=${v}"/>
</head>
<body>

<div class="lan" style="height: 854px">
    <p>忘记密码</p>
    <div class="row" style="margin-left: 30px;margin-top: 30px;">
        <div style="margin-left: 50px">
            <p style="margin:20px 0">
                <span>账号：</span>
                <input type="number" style="margin-left:42px;background-color: #F6F6F6;border: 1px solid #000;border-radius: 5px"/>
            </p>
            <p style="margin:20px 0">
                <span>短信验证码：</span>
                <input type="number" style="background-color: #F6F6F6;border: 1px solid #000;border-radius: 5px"/>
                <button style="font-size: 0.2em;border-radius: 5px;border: 1px solid #949494;background-color: #F3F3F3">获取验证码(60s)</button>
            </p>
            <p style="margin: 20px 0;">
                <span>新密码：</span>
                <input type="number" style="background-color: #F6F6F6;border: 1px solid #000;border-radius: 5px;margin-left: 28px;"/>
            </p>
            <p>
                <span>确认密码：</span>
                <input type="number" style="background-color: #F6F6F6;border: 1px solid #000;border-radius: 5px;margin-left: 15px;"/>
            </p>
            <p class="baocun" style="margin-left:160px;margin-top: 40px">
                <button>确认修改</button>
            </p>
        </div>
    </div>
</div>

</body>
</html>