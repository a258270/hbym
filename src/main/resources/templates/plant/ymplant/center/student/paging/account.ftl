<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/center.css?v=${v}"/>
</head>
<body class="corresponding">
    <div class="lan" style="height: 854px">
    <p>账户安全</p>
    <div class="row" style="margin-left: 30px;">
        <div style="padding: 20px">
            <#--<p>您当前的安全等级：<span style="color: red;font-weight: bold">${completeLevel}</span></p>-->
                <p style="padding:0 0 10px 20px;border-bottom: 1px solid #C3C3C3">
                    <img src="/static/ymplant/images/tubiao5/prompt.png" style="width: 35px;" alt="">
                    <span style="padding-left: 15px;">您的账号存在安全风险，建议立即优化以下<span style="color: red;font-weight: bold;padding: 0 5px;">5</span>项</span>
                </p>
            <div class="security row" style="margin-bottom: 20px;margin-top: 30px;">
                <div class="col-md-1 col-sm-1 col-xs-1">
                    <img src="/static/ymplant/img/antu/03.png" alt=""/>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-2" style="padding-right: 0">
                    <ul>
                        <li style="font-weight: bold">登录密码</li>
                        <li>已设置</li>
                    </ul>
                </div>
                <div class="col-md-7 col-sm-7 col-xs-7" style="padding-left:0">
                    安全性高的密码可以使账号更安全。建议使用含字母、数字、特殊符号的组合。
                </div>
                <div class="col-md-2 col-sm-2 col-xs-2" style="text-align:center;padding: 0;">
                    <a style="outline:none;background-color: #5BC0DE;padding: 5px 20px;color: #fff;font-weight: bold;border-radius: 10px;border: none;" href="${ctxPath}/plant/user/updatepass">修改密码</a>
                </div>
            </div>
            <div class="security row" style="margin-bottom: 20px">
                <div class="col-md-1 col-sm-1 col-xs-1">
                    <img src="/static/ymplant/img/antu/05.png" alt=""/>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-2" style="padding-right: 0">
                    <ul>
                        <li style="font-weight: bold">支付密码</li>
                        <li><#if isTrade == 'true'>已<#else>未</#if>设置</li>
                    </ul>
                </div>
                <div class="col-md-7 col-sm-7 col-xs-7" style="padding-left:0">
                    为提供更好的服务，建议设置您的支付密码，请确保支付密码与登录密码不同。
                </div>
                <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: center;padding: 0;">
                    <a style="outline:none;background-color: #5BC0DE;padding: 5px 20px;color: #fff;font-weight: bold;border-radius: 10px;border: none;" href="${ctxPath}/plant/user/updatetpass">修改密码</a>
                </div>
            </div>
            <div class="security row" style="margin-bottom: 20px">
                <div class="col-md-1 col-sm-1 col-xs-1">
                    <img src="/static/ymplant/img/antu/02.png" alt=""/>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-2" style="padding-right: 0">
                    <ul>
                        <li style="font-weight: bold">手机绑定</li>
                        <li><#if isPhone == 'true'>已<#else>未</#if>设置</li>
                    </ul>
                </div>
                <div class="col-md-7 col-sm-7 col-xs-7" style="padding-left:0">
                    绑定手机后，您即可享受丰富的手机服务，如手机找回密码等。
                </div>
                <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: center;padding: 0;">
                    <a style="outline:none;background-color: #5BC0DE;padding: 5px 20px;color: #fff;font-weight: bold;border-radius: 10px;border: none;" href="${ctxPath}/plant/user/binding/phone">修改手机</a>
                </div>
            </div>
            <div class="security row" style="margin-bottom: 20px">
                <div class="col-md-1 col-sm-1 col-xs-1">
                    <img src="/static/ymplant/img/antu/04.png" alt=""/>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-2" style="padding-right: 0">
                    <ul>
                        <li style="font-weight: bold">邮箱绑定</li>
                        <li><#if isEmail == 'true'>已<#else>未</#if>设置</li>
                    </ul>
                </div>
                <div class="col-md-7 col-sm-7 col-xs-7" style="padding-left:0">
                    验证邮箱可以用好找回密码，并能享受其他定制服务。
                </div>
                <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: center;padding: 0;">
                    <#if isEmail != 'true'><a style="outline:none;background-color: #5BC0DE;padding: 5px 20px;color: #fff;font-weight: bold;border-radius: 10px;border: none;" href="${ctxPath}/plant/user/binding/email">绑定邮箱</a></#if>
                </div>
            </div>
            <div class="security row">
                <div class="col-md-1 col-sm-1 col-xs-1">
                    <img src="/static/ymplant/img/antu/01.png" alt=""/>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-2" style="padding-right: 0">
                    <ul>
                        <li style="font-weight: bold">实名认证</li>
                        <li><#if isRealName == 'true'>已<#else>未</#if>认证</li>
                    </ul>
                </div>
                <div class="col-md-7 col-sm-7 col-xs-7" style="padding-left:0">
                    用于提升账号的安全性和信任级别。认证后的账号不能修改认证信息。
                </div>
                <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: center;padding: 0;">
                    <#if isRealName == 'true'><#else><a style="outline:none;background-color: #5BC0DE;padding: 5px 20px;color: #fff;font-weight: bold;border-radius: 10px;border: none;" href="${ctxPath}/plant/user/binding/idcard">实名认证</a></#if>
                </div>
            </div>
        </div>
    </div>
</div>
<script language="JavaScript">
    $(function () {
        parent.layer.close(parent.loader);
    });
</script>
</body>
</html>