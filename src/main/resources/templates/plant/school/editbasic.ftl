<!DOCTYPE html>
<html>
<head>
<#include "${ctxPath}/base/include/head.ftl" />
<#include "${ctxPath}/base/include/jurisdiction.ftl" />
    <!-- 页面独有文件 -->
    <script type="text/javascript" src="${ctxPath}/static/plant/school/editbasic.js?v=${v}"></script>
</head>
<body>
<article class="page-container">
    <form action="${ctxPath}/admin/school/api/editbasic" method="post" class="form form-horizontal" id="form">
        <input type="hidden" name="SCHOOL_ID" value="${school.SCHOOL_ID}" />
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">院校名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="<#if school.NAME??>${school.NAME}</#if>" disabled>
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">院校介绍：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea id="INTRODUCTION" name="INTRODUCTION" class="textarea" cols="100" rows="8"><#if introduction?? && introduction.CONTENT??>${introduction.CONTENT}</#if></textarea>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">院系与专业：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea id="FACULTY" name="FACULTY" class="textarea" cols="100" rows="8"><#if faculty?? && faculty.CONTENT??>${faculty.CONTENT}</#if></textarea>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit" value="提交">
            </div>
        </div>
    </form>
</article>
</body>
</html>