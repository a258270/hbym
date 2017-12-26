<!DOCTYPE html>
<html>
<head>
<#include "${ctxPath}/base/include/head.ftl" />
<#include "${ctxPath}/base/include/jurisdiction.ftl" />
    <!-- 页面独有文件 -->
    <script type="text/javascript" src="${ctxPath}/static/plant/school/article/article/edit.js?v=${v}"></script>
</head>
<body>
<article class="page-container">
    <form action="${ctxPath}/admin/article/api/edit" method="post" class="form form-horizontal" id="form" enctype="multipart/form-data">
        <input type="hidden" name="ARTICLE_ID" value="${article.ARTICLE_ID}" />
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>标题：</label>
                <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" <#if article.TITLE??>value="${article.TITLE}"<#else>value=""</#if> placeholder="请输入标题" id="TITLE" name="TITLE">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">副标题：</label>
                <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" <#if article.SUBTITLE??>value="${article.SUBTITLE}"<#else>value=""</#if> placeholder="请输入副标题" id="SUBTITLE" name="SUBTITLE">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属学校：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <select class="chosen-select select" style="width:150px;height: 31px;" size="1" id="SCHOOL_ID" name="SCHOOL_ID">
                    <#list schools as school>
                        <option value="${school.SCHOOL_ID}"<#if article.SCHOOL_ID?? && (article.SCHOOL_ID == school.SCHOOL_ID)> selected</#if>>${school.NAME}</option>
                    </#list>
                    </select>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">封面图片：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <div id="preview_IMGURL">
                        <img id="imghead_IMGURL" border="0" src="${article.IMGURL}" width="150" height="150" onclick="$('#IMGURL').click();">
                    </div>
                    <input type="file" onchange="previewImage(this, 150, 150)" style="display: none;" id="IMGURL" name="IMGURL">
                    <input type="button" class="btn btn-primary radius" width="90" height="90" onclick="$('#IMGURL').click();" value="选择图片">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">排序：</label>
                <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" <#if article.MSORT??>value="${article.MSORT?c}"<#else>value=""</#if> placeholder="请输入排序" id="MSORT" name="MSORT">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>内容：</label>
                <div class="formControls col-xs-8 col-sm-9">
                        <textarea id="CONTENT" name="CONTENT" class="textarea" cols="100" rows="8"><#if article.CONTENT??>${article.CONTENT}</#if></textarea>
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