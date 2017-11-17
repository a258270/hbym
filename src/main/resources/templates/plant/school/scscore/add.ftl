<!DOCTYPE html>
<html>
<head>
<#include "${ctxPath}/base/include/head.ftl" />
<#include "${ctxPath}/base/include/jurisdiction.ftl" />
    <!-- 页面独有文件 -->
    <script type="text/javascript" src="${ctxPath}/static/plant/school/scscore/add.js?v=${v}"></script>
</head>
<body>
<article class="page-container">
    <form action="${ctxPath}/admin/scscore/api/add" method="post" class="form form-horizontal" id="form">
        <input type="hidden" value="${school.SCHOOL_ID}" name="SCHOOL_ID" id="SCHOOL_ID">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>院校名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${school.NAME}" readonly>
            </div>
        </div>
        <div class="row cl">
            <label class="col-xs-1 col-sm-1 text-c">
                <input type="checkbox" name="ck_all" class="group-checkable" data-set="#sample_1 .checkboxes" />
                <span></span>
            </label>
            <label class="col-xs-1 col-sm-1 text-c">年份</label>
            <label class="col-xs-2 col-sm-2 text-c">招生批次</label>
            <label class="col-xs-2 col-sm-2 text-c">文理科</label>
            <label class="col-xs-2 col-sm-2 text-c">最高分</label>
            <label class="col-xs-2 col-sm-2 text-c">最低分</label>
            <label class="col-xs-2 col-sm-2 text-c">录取数</label>
        </div>
        <input type="hidden" id="COUNTS" name="COUNTS" <#if scscores?? && (scscores?size > 0)>value="${scscores?size}"<#else>value="0"</#if>>
        <div id="tab">
        <#if scscores?? && (scscores?size > 0)>
            <#list scscores as scscore>
                <#list YEARs as YEAR>
                    <#if scscore.YEAR_ID == YEAR.DIC_ID>
                        <div class="row cl" id="row${scscore_index}">
                            <label class="col-xs-1 col-sm-1 text-c">
                                <input type="checkbox" class="group-checkable" value="${scscore_index}" />
                                <span></span>
                            </label>
                            <label class="col-xs-1 col-sm-1 text-c">
                                <span class="select-box">
                                    <select class="select" data-placeholder="请选择年份" size="1" id="YEAR${scscore_index}" name="YEAR${scscore_index}">
                                        <#list YEARs as YEARTMP>
                                            <option value="${YEARTMP.DIC_ID}" <#if scscore.YEAR_ID == YEARTMP.DIC_ID>selected</#if>>${YEARTMP.NAME}</option>
                                        </#list>
                                    </select>
                                </span>
                            </label>
                            <label class="col-xs-2 col-sm-2 text-c">
                                <span class="select-box">
                                    <select class="select" data-placeholder="请选择招生批次" size="1" id="ARRANGMENT${scscore_index}" name="ARRANGMENT${scscore_index}">
                                        <#list ARRANGMENTs as ARRANGMENT>
                                            <option value="${ARRANGMENT.DIC_ID}" <#if scscore.ARRANGMENT_ID == ARRANGMENT.DIC_ID>selected</#if>>${ARRANGMENT.NAME}</option>
                                        </#list>
                                    </select>
                                </span>
                            </label>
                            <label class="col-xs-2 col-sm-2 text-c">
                                <span class="select-box">
                                    <select class="select" data-placeholder="请选择文理科" size="1" id="MAJORTYPE${scscore_index}" name="MAJORTYPE${scscore_index}">
                                        <#list MAJORTYPEs as MAJORTYPE>
                                            <option value="${MAJORTYPE.DIC_ID}" <#if scscore.MAJORTYPE_ID == MAJORTYPE.DIC_ID>selected</#if>>${MAJORTYPE.NAME}</option>
                                        </#list>
                                    </select>
                                </span>
                            </label>
                            <label class="col-xs-2 col-sm-2 text-c"><input type="text" class="input-text" value="${scscore.MAXSCORE?c}" placeholder="请输入最高分" id="MAXSCORE${scscore_index}" name="MAXSCORE${scscore_index}"></label>
                            <label class="col-xs-2 col-sm-2 text-c"><input type="text" class="input-text" value="${scscore.MINSCORE?c}" placeholder="请输入最低分" id="MINSCORE${scscore_index}" name="MINSCORE${scscore_index}"></label>
                            <label class="col-xs-2 col-sm-2 text-c"><input type="text" class="input-text" value="${scscore.ENTERCOUNT?c}" placeholder="请输入录取分" id="ENTERCOUNT${scscore_index}" name="ENTERCOUNT${scscore_index}"></label>
                        </div>
                    </#if>
                </#list>
            </#list>
        </#if>
        </div>

        <div class="row cl">
            <div class="col-xs-2 col-sm-2">
            </div>
            <div class="col-xs-3 col-sm-3">
            <#if QX.ADD_QX == 'true'><a href="javascript:;" onclick="addscore()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 新增</a></#if>
            <#if QX.DEL_QX == 'true'><a href="javascript:;" onclick="removescore()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a></#if>
            </div>
            <div class="col-xs-3 col-sm-3">
                <input class="btn btn-primary radius" type="submit" value="提交">
            </div>
            <div class="col-xs-3 col-sm-3">
            </div>
            <div class="col-xs-1 col-sm-1">
            </div>
        </div>
    </form>
</article>
</body>
<script language="JavaScript">
    var yearStr = "";
    <#list YEARs as YEAR>
    yearStr += "<option value='${YEAR.DIC_ID}'>${YEAR.NAME}</option>";
    </#list>
    var arrangmentStr = "";
    <#list ARRANGMENTs as ARRANGMENT>
    arrangmentStr += "<option value='${ARRANGMENT.DIC_ID}'>${ARRANGMENT.NAME}</option>";
    </#list>
    var majortypeStr = "";
    <#list MAJORTYPEs as MAJORTYPE>
    majortypeStr += "<option value='${MAJORTYPE.DIC_ID}'>${MAJORTYPE.NAME}</option>";
    </#list>
</script>
</html>