<!DOCTYPE html>
<html>
<head>
<#include "${ctxPath}/base/include/head.ftl" />
<#include "${ctxPath}/base/include/jurisdiction.ftl" />
    <!-- 页面独有文件 -->
    <script type="text/javascript" src="${ctxPath}/static/plant/major/major/add.js?v=${v}"></script>
</head>
<body>
<article class="page-container">
    <form action="${ctxPath}/admin/major/api/add" method="post" class="form form-horizontal" id="form">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"></label>
            <div class="formControls col-xs-8 col-sm-9">
                <div class="radio-box">
                    <input type="radio" id="radio-1" name="radio1" onclick="javascript:window.location.href='${ctxPath}/admin/major/add/BMAJOR'" <#if flag == "BMAJOR">checked</#if>>
                    <label for="radio-1">本科专业</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="radio-2" name="radio1" onclick="javascript:window.location.href='${ctxPath}/admin/major/add/ZMAJOR'" <#if flag == "ZMAJOR">checked</#if>>
                    <label for="radio-2">专科专业</label>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>专业名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="chosen-select select" size="1" id="DIC_ID" name="DIC_ID">
                    <option value="" selected>无</option>
                    <#if majors?? && (majors?size > 0)>
                        <#list majors as major>
                            <option value="${major.DIC_ID}">${major.NAME}</option>
                        </#list>
                    </#if>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>简介：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea id="SUMMARY" name="SUMMARY" class="textarea" cols="100" rows="8"></textarea>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>浏览量：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入浏览量" id="VIEWCOUNT" name="VIEWCOUNT">
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