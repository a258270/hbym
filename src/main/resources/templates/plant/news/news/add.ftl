<!DOCTYPE html>
<html>
<head>
<#include "${ctxPath}/base/include/head.ftl" />
<#include "${ctxPath}/base/include/jurisdiction.ftl" />
    <!-- 页面独有文件 -->
    <script type="text/javascript" src="${ctxPath}/static/plant/news/news/add.js?v=${v}"></script>
</head>
<body>
<article class="page-container">
    <form action="${ctxPath}/admin/news/api/add" method="post" enctype="multipart/form-data" class="form form-horizontal" id="form">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>标题：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入标题" id="TITLE" name="TITLE">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">副标题：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入副标题" id="SUBTITLE" name="SUBTITLE">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">封面图片：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <div class=" sp-uploader sp-blue">
                    <input type="text" class="sp-filename" readonly/>
                    <input type="button" class="sp-button" value="选择文件"/>
                    <input type="file" name="IMGURL" size="1"/>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>新闻分类：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="chosen-select select" size="1" id="NEWSTYPE" name="NEWSTYPE">
                    <option value="" selected>无</option>
                <#list NEWSTYPEs as NEWSTYPE>
                    <option value="${NEWSTYPE.DIC_ID}">${NEWSTYPE.NAME}</option>
                </#list>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">摘要：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea id="ABSTRACT" name="ABSTRACT" class="textarea" cols="100" rows="8"></textarea>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>内容：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea id="CONTENT" name="CONTENT" class="textarea" cols="100" rows="8"></textarea>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">排序序号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入排序序号" id="MSORT" name="MSORT">
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