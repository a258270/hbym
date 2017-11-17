<!DOCTYPE html>
<html>
<head>
<#include "${ctxPath}/base/include/head.ftl" />
<#include "${ctxPath}/base/include/jurisdiction.ftl" />
    <!-- 页面独有文件 -->
    <script type="text/javascript" src="${ctxPath}/static/plant/yf/yf/add.js?v=${v}"></script>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 院校库管理 <span class="c-gray en">&gt;</span> 一分一档 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<article class="page-container">
    <form action="${ctxPath}/admin/yf/api/add" method="post" class="form form-horizontal" id="form" enctype="multipart/form-data">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">模板下载：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <a href="${ctxPath}/static/ymplant/mb/yfmb.xls">点击下载</a>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>年份：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="chosen-select select" size="1" id="YEAR_ID" name="YEAR_ID">
                    <option value="" selected>无</option>
                <#list YEARs as YEAR>
                    <option value="${YEAR.DIC_ID}">${YEAR.NAME}</option>
                </#list>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>文件：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="file" name="FILE" id="FILE" value="选择文件"/>
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