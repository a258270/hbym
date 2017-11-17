<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/search/search.css?v=${v}"/>
</head>
<body>
    <div class="container">
        <div class="kd-dkua">
            <p>
                <span>内容：</span>
                <select style="width: 150px;">
                    <option value="">默认</option>
                </select>
            </p>
            <textarea name="textarea" id="input1" onpropertychange="try{textCounter(this,1000)}catch(e){}" onkeypress="return keypress(event);" onkeydown="return keydown(event)"></textarea>
            <p style="text-align: center;">
                <input class="kd-bafa" style="margin-right:80px;;" type="button" value="保存"/>
                <#--<input class="kd-bafa" type="button" value="发送"/>-->
            </p>
        </div>
    </div>
</body>
</html>