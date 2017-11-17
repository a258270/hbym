<!DOCTYPE html>
<html>
<head>
<#include "${ctxPath}/base/include/head.ftl" />
<#include "${ctxPath}/base/include/jurisdiction.ftl" />
    <!-- 页面独有文件 -->
    <script type="text/javascript" src="${ctxPath}/static/plant/card/card/excel.js?v=${v}"></script>
</head>
<body>
<article class="page-container">
    <form action="${ctxPath}/admin/card/toexcel" method="post" class="form form-horizontal" id="form">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>起始时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" onClick="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss' })" placeholder="请选择起始时间" id="BEGINTIME" name="BEGINTIME" class="input-text Wdate" readOnly>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>结束时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" onClick="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss' })" placeholder="请选择结束时间" id="ENDTIME" name="ENDTIME" class="input-text Wdate" readOnly>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">地区：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span class="select-box">
                    <select class="chosen-select select" size="1" id="PROVINCE_ID" name="PROVINCE_ID">
                        <option value="" selected>不限</option>
                    <#list provinces as province>
                        <option value="${province.CODE}">${province.NAME}</option>
                    </#list>
                    </select>
                </span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span class="select-box">
                    <select class="chosen-select select" size="1" id="TYPE_ID" name="TYPE_ID">
                        <option value="" selected>不限</option>
                    <#list types as type>
                        <option value="${type.CODE}">${type.NAME}</option>
                    </#list>
                    </select>
                </span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">用途：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span class="select-box">
                    <select class="chosen-select select" size="1" id="PURPOSE_ID" name="PURPOSE_ID">
                        <option value="" selected>不限</option>
                    <#list purposes as purpose>
                        <option value="${purpose.CODE}">${purpose.NAME}</option>
                    </#list>
                    </select>
                </span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">是否销售：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span class="select-box">
                    <select class="chosen-select select" size="1" id="ISSALED" name="ISSALED">
                        <option value="" selected>不限</option>
                        <option value="1">是</option>
                        <option value="0">否</option>
                    </select>
                </span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">是否使用：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span class="select-box">
                    <select class="chosen-select select" size="1" id="ISUSED" name="ISUSED">
                        <option value="" selected>不限</option>
                        <option value="1">是</option>
                        <option value="0">否</option>
                    </select>
                </span>
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