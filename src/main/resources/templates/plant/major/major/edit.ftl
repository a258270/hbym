<!DOCTYPE html>
<html>
<head>
<#include "${ctxPath}/base/include/head.ftl" />
<#include "${ctxPath}/base/include/jurisdiction.ftl" />
    <!-- 页面独有文件 -->
    <script type="text/javascript" src="${ctxPath}/static/plant/major/major/edit.js?v=${v}"></script>
</head>
<body>
<article class="page-container">
    <form action="${ctxPath}/admin/major/api/edit" method="post" class="form form-horizontal" id="form">
        <input type="hidden" name="MAJOR_ID" value="${major.MAJOR_ID}" />
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>专业名称：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <label><#if major.NAME??>${major.NAME}<#else>暂无信息</#if></label>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>简介：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <textarea id="SUMMARY" name="SUMMARY" class="textarea" cols="100" rows="8"><#if major.SUMMARY??>${major.SUMMARY}</#if></textarea>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>浏览量：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" <#if major.VIEWCOUNT??>value="${major.VIEWCOUNT?c}"<#else>value=""</#if> placeholder="请输入浏览量" id="VIEWCOUNT" name="VIEWCOUNT">
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