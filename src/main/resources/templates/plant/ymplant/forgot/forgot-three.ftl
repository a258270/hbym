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
<div class="kd-forgot">
    <div class="container">
        <div class="frame">
            <p style="margin: 50px;text-align: center">
                <img src="/static/ymplant/images/tubiao2/2.3.png" alt=""/>
            </p>
            <p style="text-align: center">
                <img src="/static/ymplant/images/tubiao2/mark.png" alt=""/>
                <span style="font-size: 1.5em;font-weight: bold;margin-left: 20px">您的密码修改成功，请<a href="${ctxPath}/">登录</a></span>
            </p>
        </div>
    </div>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</div>
</body>
</html>