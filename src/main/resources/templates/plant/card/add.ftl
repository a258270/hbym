<!DOCTYPE html>
<html>
<head>
<#include "${ctxPath}/base/include/head.ftl" />
<#include "${ctxPath}/base/include/jurisdiction.ftl" />
    <!-- 页面独有文件 -->
    <script type="text/javascript" src="${ctxPath}/static/plant/card/card/add.js?v=${v}"></script>
</head>
<body>
<article class="page-container">
    <form action="${ctxPath}/admin/card/api/add" method="post" class="form form-horizontal" id="form">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>新增数量：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入新增数量" id="COUNT" name="COUNT">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>地区：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="chosen-select select" size="1" id="PROVINCE_ID" name="PROVINCE_ID">
                    <option value="" selected>无</option>
                    <#list provinces as province>
                        <option value="${province.CODE}">${province.NAME}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="chosen-select select" size="1" id="TYPE_ID" name="TYPE_ID">
                    <option value="" selected>无</option>
                <#list types as type>
                    <option value="${type.CODE}">${type.NAME}</option>
                </#list>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用途：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="chosen-select select" size="1" id="PURPOSE_ID" name="PURPOSE_ID">
                    <option value="" selected>无</option>
                <#list purposes as purpose>
                    <option value="${purpose.CODE}">${purpose.NAME}</option>
                </#list>
                </select>
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