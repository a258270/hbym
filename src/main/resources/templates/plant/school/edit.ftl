<!DOCTYPE html>
<html>
<head>
<#include "${ctxPath}/base/include/head.ftl" />
<#include "${ctxPath}/base/include/jurisdiction.ftl" />
    <!-- 页面独有文件 -->
    <script type="text/javascript" src="${ctxPath}/static/plant/school/edit.js?v=${v}"></script>
</head>
<body>
<article class="page-container">
    <form action="${ctxPath}/admin/school/api/edit" method="post" enctype="multipart/form-data" class="form form-horizontal" id="form">
        <input type="hidden" name="SCHOOL_ID" value="${school.SCHOOL_ID}" />
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">学校标志：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <div id="preview_HEADURL">
                        <img id="imghead_HEADURL" border="0" src="${ctxPath}${school.HEADURL}" width="150" height="150" onclick="$('#HEADURL').click();">
                    </div>
                    <input type="file" onchange="previewImage(this, 150, 150)" style="display: none;" id="HEADURL" name="HEADURL">
                    <input type="button" class="btn btn-primary radius" width="90" height="90" onclick="$('#HEADURL').click();" value="选择图片">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">学校广告图：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <div id="preview_LHEADURL">
                        <img id="imghead_LHEADURL" border="0" src="${ctxPath}${school.LHEADURL}" width="150" height="150" onclick="$('#LHEADURL').click();">
                    </div>
                    <input type="file" onchange="previewImage(this, 150, 150)" style="display: none;" id="LHEADURL" name="LHEADURL">
                    <input type="button" class="btn btn-primary radius" width="90" height="90" onclick="$('#LHEADURL').click();" value="选择图片">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>院校名称：</label>
                <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" <#if school.NAME??>value="${school.NAME}"<#else>value=""</#if> placeholder="请输入院校名称" id="NAME" name="NAME">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>省份：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <select class="chosen-select select" size="1" id="PROVINCE" name="PROVINCE">
                        <#if school.PROVINCE??>
                        <option value="">无</option>
                        <#list PROVINCEs as PROVINCE>
                        <#if PROVINCE.DIC_ID == school.PROVINCE>
                        <option value="${PROVINCE.DIC_ID}" selected>${PROVINCE.NAME}</option>
                        <#else>
                        <option value="${PROVINCE.DIC_ID}">${PROVINCE.NAME}</option>
                        </#if>
                        </#list>
                        <#else>
                        <option value="">无</option>
                        <#list PROVINCEs as PROVINCE>
                            <option value="${PROVINCE.DIC_ID}">${PROVINCE.NAME}</option>
                        </#list>
                        </#if>
                    </select>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>学校类型：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <select class="chosen-select select" size="1" id="SCTYPE" name="SCTYPE">
                        <#if school.SCTYPE??>
                        <option value="">无</option>
                        <#list SCTYPEs as SCTYPE>
                        <#if SCTYPE.DIC_ID == school.SCTYPE>
                        <option value="${SCTYPE.DIC_ID}" selected>${SCTYPE.NAME}</option>
                        <#else>
                        <option value="${SCTYPE.DIC_ID}">${SCTYPE.NAME}</option>
                        </#if>
                        </#list>
                        <#else>
                        <option value="">无</option>
                        <#list SCTYPEs as SCTYPE>
                            <option value="${SCTYPE.DIC_ID}">${SCTYPE.NAME}</option>
                        </#list>
                        </#if>
                    </select>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>学科类型：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <select class="chosen-select select" data-placeholder="请选择学科类型" multiple id="SUBJECTTYPE" name="SUBJECTTYPE">
                    <#if school.SUBJECTTYPE?? && (school.SUBJECTTYPE?size > 0)>
                        <#list SUBJECTTYPEs as SUBJECTTYPE>
                            <option value="${SUBJECTTYPE.DIC_ID}"
                                <#list school.SUBJECTTYPE as arrang>
                                    <#if SUBJECTTYPE.DIC_ID == arrang.DIC_ID>
                                    selected
                                    </#if>
                                </#list>
                            >${SUBJECTTYPE.NAME}</option>
                        </#list>
                    <#else>
                        <option value="" selected>无</option>
                        <#list SUBJECTTYPEs as SUBJECTTYPE>
                            <option value="${SUBJECTTYPE.DIC_ID}">${SUBJECTTYPE.NAME}</option>
                        </#list>
                    </#if>
                    </select>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">学校属性：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <select class="chosen-select select" data-placeholder="请选择学校属性" multiple id="SCPROPERTY" name="SCPROPERTY">
                        <option value="">无</option>
                    <#if school.SCPROPERTY?? && (school.SCPROPERTY?size > 0)>
                        <#list SCPROPERTYs as SCPROPERTY>
                            <option value="${SCPROPERTY.DIC_ID}"
                                <#list school.SCPROPERTY as arrang>
                                    <#if SCPROPERTY.DIC_ID == arrang.DIC_ID>
                                    selected
                                    </#if>
                                </#list>
                            >${SCPROPERTY.NAME}</option>
                        </#list>
                    <#else>
                        <option value="" selected>无</option>
                        <#list SCPROPERTYs as SCPROPERTY>
                            <option value="${SCPROPERTY.DIC_ID}">${SCPROPERTY.NAME}</option>
                        </#list>
                    </#if>
                    </select>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>学历层次：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <select class="chosen-select select" data-placeholder="请选择学历层次" multiple="multiple" id="ARRANGMENT" name="ARRANGMENT">
                    <#if school.ARRANGMENT?? && (school.ARRANGMENT?size > 0)>
                        <#list ARRANGMENTs as ARRANGMENT>
                            <option value="${ARRANGMENT.DIC_ID}"
                            <#list school.ARRANGMENT as arrang>
                                <#if ARRANGMENT.DIC_ID == arrang.DIC_ID>
                                    selected
                                </#if>
                            </#list>
                            >${ARRANGMENT.NAME}</option>
                        </#list>
                    <#else>
                        <#list ARRANGMENTs as ARRANGMENT>
                            <option value="${ARRANGMENT.DIC_ID}">${ARRANGMENT.NAME}</option>
                        </#list>
                    </#if>
                    </select>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>拥有专业：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <select class="chosen-select select" data-placeholder="请选择拥有专业" multiple="multiple" id="HASMAJOR" name="HASMAJOR">
                    <#if school.HASMAJOR?? && (school.HASMAJOR?size > 0)>
                        <#list HASMAJORs as HASMAJOR>
                            <option value="${HASMAJOR.DIC_ID}"
                            <#list school.HASMAJOR as arrang>
                                <#if HASMAJOR.DIC_ID == arrang.DIC_ID>
                                    selected
                                </#if>
                            </#list>
                            >${HASMAJOR.NAME}</option>
                        </#list>
                    <#else>
                        <#list HASMAJORs as HASMAJOR>
                            <option value="${HASMAJOR.DIC_ID}">${HASMAJOR.NAME}</option>
                        </#list>
                    </#if>
                    </select>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">创办年份：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="<#if school.CREATEDATE??>${school.CREATEDATE}</#if>" placeholder="请输入创办年份" id="CREATEDATE" name="CREATEDATE">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">招办电话：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" <#if school.PHONE??>value="${school.PHONE}"<#else>value=""</#if> placeholder="请输入招办电话" id="PHONE" name="PHONE">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">招办邮箱：</label>
                <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" <#if school.EMAIL??>value="${school.EMAIL}"<#else>value=""</#if> placeholder="请输入招办邮箱" id="EMAIL" name="EMAIL">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">学校地址：</label>
                <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" <#if school.ADDRESS??>value="${school.ADDRESS}"<#else>value=""</#if> placeholder="请输入学校地址" id="ADDRESS" name="ADDRESS">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">招办官网：</label>
                <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" <#if school.WEBSITE??>value="${school.WEBSITE}"<#else>value=""</#if> placeholder="请输入招办官网" id="WEBSITE" name="WEBSITE">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">学校官网：</label>
                <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" <#if school.SCWEBSITE??>value="${school.SCWEBSITE}"<#else>value=""</#if> placeholder="请输入学校官网" id="SCWEBSITE" name="SCWEBSITE">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">学校代码：</label>
                <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" <#if school.SCCODE??>value="${school.SCCODE}"<#else>value=""</#if> placeholder="请输入学校代码" id="SCCODE" name="SCCODE">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">主管部门：</label>
                <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" <#if school.SUBJECTION??>value="${school.SUBJECTION}"<#else>value=""</#if> placeholder="请输入主管部门" id="SUBJECTION" name="SUBJECTION">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">经度：</label>
                <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" <#if school.LON??>value="${school.LON?c}"<#else>value=""</#if> placeholder="请输入经度" id="LON" name="LON">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">纬度：</label>
                <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" <#if school.LAT??>value="${school.LAT?c}"<#else>value=""</#if> placeholder="请输入维度" id="LAT" name="LAT">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>排序：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" <#if school.MSORT??>value="${school.MSORT?c}"<#else>value=""</#if> placeholder="请输入排序" id="MSORT" name="MSORT">
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