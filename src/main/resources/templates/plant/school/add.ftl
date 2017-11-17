<!DOCTYPE html>
<html>
<head>
<#include "${ctxPath}/base/include/head.ftl" />
<#include "${ctxPath}/base/include/jurisdiction.ftl" />
    <!-- 页面独有文件 -->
    <script type="text/javascript" src="${ctxPath}/static/plant/school/add.js?v=${v}"></script>
</head>
<body>
<article class="page-container">
    <form action="${ctxPath}/admin/school/api/add" method="post" enctype="multipart/form-data" class="form form-horizontal" id="form">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">学校标志：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <div id="preview_HEADURL">
                    <img id="imghead_HEADURL" border="0" src="${ctxPath}/static/ymplant/img/timg.png" width="150" height="150" onclick="$('#HEADURL').click();">
                </div>
                <input type="file" onchange="previewImage(this, 150, 150)" style="display: none;" id="HEADURL" name="HEADURL">
                <input type="button" class="btn btn-primary radius" width="90" height="90" onclick="$('#HEADURL').click();" value="选择图片">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">学校广告图：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <div id="preview_LHEADURL">
                    <img id="imghead_LHEADURL" border="0" src="${ctxPath}/static/ymplant/img/timg.png" width="150" height="150" onclick="$('#LHEADURL').click();">
                </div>
                <input type="file" onchange="previewImage(this, 150, 150)" style="display: none;" id="LHEADURL" name="LHEADURL">
                <input type="button" class="btn btn-primary radius" width="90" height="90" onclick="$('#LHEADURL').click();" value="选择图片">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>院校名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入院校名称" id="NAME" name="NAME">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>省份：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="chosen-select select" size="1" id="PROVINCE" name="PROVINCE">
                    <option value="" selected>无</option>
                <#list PROVINCEs as PROVINCE>
                    <option value="${PROVINCE.DIC_ID}">${PROVINCE.NAME}</option>
                </#list>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>学校类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="chosen-select select" size="1" id="SCTYPE" name="SCTYPE">
                    <option value="" selected>无</option>
                <#list SCTYPEs as SCTYPE>
                    <option value="${SCTYPE.DIC_ID}">${SCTYPE.NAME}</option>
                </#list>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>学科类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="chosen-select select" data-placeholder="请选择学科类型" multiple id="SUBJECTTYPE" name="SUBJECTTYPE">
                <#list SUBJECTTYPEs as SUBJECTTYPE>
                    <option value="${SUBJECTTYPE.DIC_ID}">${SUBJECTTYPE.NAME}</option>
                </#list>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">学校属性：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="chosen-select select" data-placeholder="请选择学校属性" multiple id="SCPROPERTY" name="SCPROPERTY">
                    <option value="">无</option>
                <#list SCPROPERTYs as SCPROPERTY>
                    <option value="${SCPROPERTY.DIC_ID}">${SCPROPERTY.NAME}</option>
                </#list>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>学历层次：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="chosen-select select" data-placeholder="请选择学历层次" multiple id="ARRANGMENT" name="ARRANGMENT">
                <#list ARRANGMENTs as ARRANGMENT>
                    <option value="${ARRANGMENT.DIC_ID}">${ARRANGMENT.NAME}</option>
                </#list>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>拥有专业：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="chosen-select select" data-placeholder="请选择拥有专业" multiple id="HASMAJOR" name="HASMAJOR">
                <#list HASMAJORs as HASMAJOR>
                    <option value="${HASMAJOR.DIC_ID}">${HASMAJOR.NAME}</option>
                </#list>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">创办年份：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入创办年份" id="CREATEDATE" name="CREATEDATE">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">招办电话：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入招办电话" id="PHONE" name="PHONE">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">招办邮箱：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入招办邮箱" id="EMAIL" name="EMAIL">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">学校地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入学校地址" id="ADDRESS" name="ADDRESS">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">招办官网：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入招办官网" id="WEBSITE" name="WEBSITE">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">学校官网：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入学校官网" id="SCWEBSITE" name="SCWEBSITE">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">学校代码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入学校代码" id="SCCODE" name="SCCODE">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">主管部门：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入主管部门" id="SUBJECTION" name="SUBJECTION">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">经度：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入经度" id="LON" name="LON">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">纬度：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入维度" id="LAT" name="LAT">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>排序：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入排序" id="MSORT" name="MSORT">
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