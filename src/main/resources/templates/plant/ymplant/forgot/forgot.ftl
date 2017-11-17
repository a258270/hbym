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
    <form action="${ctxPath}/plant/user/forget2" method="post">
        <div class="kd-forgot">
            <div class="container">
                <div class="frame">
                    <p style="margin: 50px;text-align: center">
                        <img src="/static/ymplant/images/tubiao2/2.1.png" alt=""/>
                    </p>
                    <p style="text-align: center;margin-left: 130px">
                        <span>账号：</span>
                        <span class="sjhao">
                        <input type="text" placeholder="请输入账号/手机号" name="USERNAME"/>
                    </span>
                        <span style="color:#A9A9A9;margin-left: 15px;font-size: .8em">请填写用户名</span>
                    </p>
                    <p style="text-align: center;margin-top: 50px;">
                        <input class="xybu" type="submit" value="下一步"/>
                    </p>
                </div>
            </div>
        </div>
    </form>
<#if error??>
    <script language="JavaScript">
        showError("${error}");
    </script>
</#if>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>