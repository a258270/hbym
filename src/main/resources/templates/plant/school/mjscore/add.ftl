<!DOCTYPE html>
<html>
<head>
<#include "${ctxPath}/base/include/head.ftl" />
<#include "${ctxPath}/base/include/jurisdiction.ftl" />
    <!-- 页面独有文件 -->
    <script type="text/javascript" src="${ctxPath}/static/plant/school/mjscore/add.js?v=${v}"></script>
</head>
<body>
<article class="page-container">
    <form action="${ctxPath}/admin/mjscore/api/add" method="post" class="form form-horizontal" id="form">
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
            <label class="col-xs-2 col-sm-2 text-c">专业名称</label>
            <label class="col-xs-1 col-sm-1 text-c">年份</label>
            <label class="col-xs-1 col-sm-1 text-c">招生批次</label>
            <label class="col-xs-1 col-sm-1 text-c">文理科</label>
            <label class="col-xs-2 col-sm-2 text-c">最高分</label>
            <label class="col-xs-2 col-sm-2 text-c">最低分</label>
            <label class="col-xs-2 col-sm-2 text-c">录取数</label>
        </div>
        <input type="hidden" id="COUNTS" name="COUNTS" <#if mjscores?? && (mjscores?size > 0)>value="${mjscores?size}"<#else>value="0"</#if>>
        <div id="tab">
    <#if mjscores?? && (mjscores?size > 0)>
        <#list mjscores as mjscore>
            <#list YEARs as YEAR>
                <#if mjscore.YEAR_ID == YEAR.DIC_ID>
                    <div class="row cl" id="row${mjscore_index}">
                        <label class="col-xs-1 col-sm-1 text-c">
                            <input type="checkbox" class="group-checkable" value="${mjscore_index}" />
                            <span></span>
                        </label>
                        <label class="col-xs-2 col-sm-2 text-c">
                                <span class="select-box">
                                    <select class="select" data-placeholder="请选择专业名称" size="1" id="MAJOR${mjscore_index}" name="MAJOR${mjscore_index}">
                                        <#list MAJORs as MAJOR>
                                            <option value="${MAJOR.DIC_ID}" <#if mjscore.MAJOR_ID == MAJOR.DIC_ID>selected</#if>>${MAJOR.NAME}</option>
                                        </#list>
                                    </select>
                                </span>
                        </label>
                        <label class="col-xs-1 col-sm-1 text-c">
                                <span class="select-box">
                                    <select class="select" data-placeholder="请选择年份" size="1" id="YEAR${mjscore_index}" name="YEAR${mjscore_index}">
                                        <#list YEARs as YEARTMP>
                                            <option value="${YEARTMP.DIC_ID}" <#if mjscore.YEAR_ID == YEARTMP.DIC_ID>selected</#if>>${YEARTMP.NAME}</option>
                                        </#list>
                                    </select>
                                </span>
                        </label>
                        <label class="col-xs-1 col-sm-1 text-c">
                                <span class="select-box">
                                    <select class="select" data-placeholder="请选择招生批次" size="1" id="ARRANGMENT${mjscore_index}" name="ARRANGMENT${mjscore_index}">
                                        <#list ARRANGMENTs as ARRANGMENT>
                                            <option value="${ARRANGMENT.DIC_ID}" <#if mjscore.ARRANGMENT_ID == ARRANGMENT.DIC_ID>selected</#if>>${ARRANGMENT.NAME}</option>
                                        </#list>
                                    </select>
                                </span>
                        </label>
                        <label class="col-xs-1 col-sm-1 text-c">
                                <span class="select-box">
                                    <select class="select" data-placeholder="请选择文理科" size="1" id="MAJORTYPE${mjscore_index}" name="MAJORTYPE${mjscore_index}">
                                        <#list MAJORTYPEs as MAJORTYPE>
                                            <option value="${MAJORTYPE.DIC_ID}" <#if mjscore.MAJORTYPE_ID == MAJORTYPE.DIC_ID>selected</#if>>${MAJORTYPE.NAME}</option>
                                        </#list>
                                    </select>
                                </span>
                        </label>
                        <label class="col-xs-2 col-sm-2 text-c"><input type="text" class="input-text" value="${mjscore.MAXSCORE?c}" placeholder="请输入最高分" id="MAXSCORE${mjscore_index}" name="MAXSCORE${mjscore_index}"></label>
                        <label class="col-xs-2 col-sm-2 text-c"><input type="text" class="input-text" value="${mjscore.MINSCORE?c}" placeholder="请输入最低分" id="MINSCORE${mjscore_index}" name="MINSCORE${mjscore_index}"></label>
                        <label class="col-xs-2 col-sm-2 text-c"><input type="text" class="input-text" value="${mjscore.ENTERCOUNT?c}" placeholder="请输入录取分" id="ENTERCOUNT${mjscore_index}" name="ENTERCOUNT${mjscore_index}"></label>
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
            <#if QX.ADD_QX == 'true'><a href="javascript:;" onclick="addmjscore()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 新增</a></#if>
            <#if QX.DEL_QX == 'true'><a href="javascript:;" onclick="removemjscore()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a></#if>
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
    var majorStr = "";
    <#list MAJORs as MAJOR>
    majorStr += "<option value='${MAJOR.DIC_ID}'>${MAJOR.NAME}</option>";
    </#list>
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