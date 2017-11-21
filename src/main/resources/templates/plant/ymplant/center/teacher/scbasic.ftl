<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/center.css?v=${v}"/>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/scbaisc.css?v=${v}"/>
    <link rel="stylesheet" href="/static/plugin/h-ui/lib/chosen.jquery/chosen.min.css?v=${v}"/>
    <script src="/static/plugin/h-ui/lib/chosen.jquery/chosen.jquery.min.js?v=${v}"></script>
    <script src="${ctxPath}/static/plugin/h-ui/lib/take_photo/takephoto.js?v=${v}"></script>
    <link rel="stylesheet" type="text/css" href="${ctxPath}/static/plugin/h-ui/h-ui/css/H-ui.min.css?v=${v}" />
    <link rel="stylesheet" type="text/css" href="${ctxPath}/static/plugin/h-ui/h-ui.admin/css/H-ui.admin.css?v=${v}" />
    <link rel="stylesheet" type="text/css" href="${ctxPath}/static/plugin/h-ui/lib/Hui-iconfont/1.0.8/iconfont.css?v=${v}" />
    <link rel="stylesheet" type="text/css" href="${ctxPath}/static/plugin/h-ui/h-ui.admin/skin/default/skin.css?v=${v}" id="skin" />
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/kindeditor/kindeditor-all-min.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/kindeditor/lang/zh-CN.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/kindeditor/plugins/code/prettify.js?v=${v}"></script>
    <link rel="stylesheet" type="text/css" href="${ctxPath}/static/plugin/h-ui/lib/kindeditor/themes/default/default.css?v=${v}" />
    <link rel="stylesheet" type="text/css" href="${ctxPath}/static/plugin/h-ui/lib/kindeditor/plugins/code/prettify.css?v=${v}" />
    <link rel="stylesheet" type="text/css" href="${ctxPath}/static/plugin/h-ui/lib/simpleuploader/simpleuploader.css?v=${v}" />
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/layer/2.4/layer.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/h-ui/js/H-ui.min.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/h-ui.admin/js/H-ui.admin.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/jquery.tips/jquery.tips.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/jquery.validation/1.14.0/jquery.validate.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/jquery.validation/1.14.0/validate-methods.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/jquery.validation/1.14.0/messages_zh.js?v=${v}"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=UC4yLW5tsNC9fgL5Y0CQaomei9VSe1Zo"></script>
    <script>
        $(function () {
            var editorINTRODUCTION;
            var editorContentINTRODUCTION;
            KindEditor.ready(function(K) {
                editorContentINTRODUCTION = $('#SUMMARY').val();
                editorINTRODUCTION = K.create('textarea[name="INTRODUCTION"]', {
                    cssPath : ctxPath + '/static/plugin/h-ui/lib/kindeditor/plugins/code/prettify.css',
                    uploadJson : ctxPath + '/admin/kindfile/upload',
                    fileManagerJson : ctxPath + '/admin/kindfile/manager',
                    allowFileManager : true,
                    width:"100%"
                });
                prettyPrint();
                editorINTRODUCTION.text(editorContentINTRODUCTION);
            });

            var editorFACULTY;
            var editorContentFACULTY;
            KindEditor.ready(function(K) {
                editorContentFACULTY = $('#SUMMARY').val();
                editorFACULTY = K.create('textarea[name="FACULTY"]', {
                    cssPath : ctxPath + '/static/plugin/h-ui/lib/kindeditor/plugins/code/prettify.css',
                    uploadJson : ctxPath + '/admin/kindfile/upload',
                    fileManagerJson : ctxPath + '/admin/kindfile/manager',
                    allowFileManager : true,
                    width:"100%"
                });
                prettyPrint();
                editorFACULTY.text(editorContentFACULTY);
            });


            $("#selectbox").chosen({
                no_results_text: "没有找到结果！",//搜索无结果时显示的提示
                search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
                allow_single_deselect:true,
//                max_selected_options:5
            });

            $("#SUBJECTTYPE").chosen({
                no_results_text: "没有找到结果！",//搜索无结果时显示的提示
                search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
                allow_single_deselect:true
            });

            $("#SCPROPERTY").chosen({
                no_results_text: "没有找到结果！",//搜索无结果时显示的提示
                search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
                allow_single_deselect:true
            });

            $("#ARRANGMENT").chosen({
                no_results_text: "没有找到结果！",//搜索无结果时显示的提示
                search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
                allow_single_deselect:true
            });

            $("#form").validate({
                rules:{
                    TITLE:{
                        required:true,
                    },
                    CREATEDATE:{
                        isYear:true,
                    },
                },
                onkeyup:false,
                focusCleanup:true,
                success:"valid",
                submitHandler:function(form){
                    editorINTRODUCTION.sync();
                    editorFACULTY.sync();
                    if($("#SCTYPE").val() == null || $("#SCTYPE").val() == ""){
                        showError("学校类型不能为空！");
                        return false;
                    }
                    if($("#ARRANGMENT").val() == null || $("#ARRANGMENT").val() == ""){
                        showError("学历层次不能为空！");
                        return false;
                    }
                    $(form).ajaxSubmit(function (res) {
                        if(res.hasErrors){
                            showError(res.errorMessage);
                            return false;
                        }

                        parent.showSuccess("修改成功！");
                        window.location.href = ctxPath + "/plant/teacher/basic";
                    });
                }
            });
            parent.layer.close(parent.loader);
        });
    </script>
</head>
<body>
<form action="${ctxPath}/plant/teacher/api/management_edit" id="form" method="post" enctype="multipart/form-data">
    <div class="lan" style="height: 1701px;margin-left: 0;overflow-y: auto;">
        <div class="row" style="padding: 0 15px;">
            <p class="zlan col-md-3 col-sm-3 col-xs-3" style="padding-top: 5px">基础资料管理</p>
            <div class="col-md-9 col-sm-9 col-xs-9">
            <#--<div class="row">
                <div class="col-md-1 col-sm-1 col-xs-1" style="text-align: right">
                    <img src="/static/ymplant/img/jinggao.png" style="width:100%;height: 100%;" alt=""/>
                </div>
                <div class="col-md-10 col-sm-10 col-xs-10" style="padding-top: 5px;">
                    <div class="progress" style="">
                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                            60%
                        </div>
                    </div>
                </div>
            </div>-->
            </div>
        </div>
        <div class="row minis">
            <div class="col-md-2 col-sm-2 col-xs-2"></div>
            <div class=" col-md-8 col-sm-8 col-xs-8">
                <div class="row" style="padding: 10px 0;">
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div id="preview_HEADURL" style="width: 80px;height: 80px;border-radius: 50%;overflow: hidden;border: 1px solid #ccc;">
                            <img id="imghead_HEADURL" border="0" src="<#if school.HEADURL??>${school.HEADURL}<#else>/static/ymplant/img/timg.png</#if>" width="100%" height="100%" onclick="$('#IMGURL').click();">
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-9 col-xs-9" style="padding-top: 30px;">
                        <input type="file" style="display: none" onchange="previewImage(this,90,90)" id="HEADURL" name="HEADURL">
                        <input type="button" class="toxang " value="选择文件" width="90" height="90" onclick="$('#HEADURL').click()">
                    </div>
                </div>
                <div style="border-top: 1px solid #ccc;padding: 10px 20px;">
                    <span>院校代码：</span>
                    <input type="text" style="border: 1px solid #000000;" value="<#if school.SCCODE??>${school.SCCODE}</#if>" id="SCCODE" name="SCCODE"/>
                </div>
                <div style="border-top: 1px solid #ccc;padding: 10px 20px;">
                    <span>院校名称：<#if school.NAME??>${school.NAME}</#if></span>
                </div>
                <div style="border-top: 1px solid #ccc;padding: 10px 20px;">
                    <span>院校类型：</span>
                    <select id="SCTYPE" name="SCTYPE">
                    <#if school.SCTYPE??>
                        <#list SCTYPEs as SCTYPE>
                            <#if SCTYPE.DIC_ID == school.SCTYPE>
                                <option value="${SCTYPE.DIC_ID}" selected>${SCTYPE.NAME}</option>
                            <#else>
                                <option value="${SCTYPE.DIC_ID}">${SCTYPE.NAME}</option>
                            </#if>
                        </#list>
                    <#else>
                        <#list SCTYPEs as SCTYPE>
                            <option value="${SCTYPE.DIC_ID}">${SCTYPE.NAME}</option>
                        </#list>
                    </#if>
                    </select>
                </div>
                <div style="border-top: 1px solid #ccc;padding: 10px 20px;">
                    <span>院校介绍：</span>
                    <textarea id="INTRODUCTION" name="INTRODUCTION" class="textarea" cols="100" rows="8"><#if introduction?? && introduction.CONTENT??>${introduction.CONTENT}</#if></textarea>
                </div>
                <div style="border-top: 1px solid #ccc;padding: 10px 20px;">
                    <span>学科类型：</span>
                    <select class="chosen-select select" data-placeholder="请选择学科类型" multiple id="SUBJECTTYPE" name="SUBJECTTYPE" style="width: 100%;">
                    <#if subjecttypes?? && (subjecttypes?size > 0)>
                        <#list SUBJECTTYPEs as SUBJECTTYPE>
                            <option value="${SUBJECTTYPE.DIC_ID}"
                                <#list subjecttypes as subjecttype>
                                    <#if SUBJECTTYPE.DIC_ID == subjecttype.DIC_ID>
                                    selected
                                    </#if>
                                </#list>
                            >${SUBJECTTYPE.NAME}</option>
                        </#list>
                    <#else>
                        <#list SUBJECTTYPEs as SUBJECTTYPE>
                            <option value="${SUBJECTTYPE.DIC_ID}">${SUBJECTTYPE.NAME}</option>
                        </#list>
                    </#if>
                    </select>
                </div>
                <div style="border-top: 1px solid #ccc;padding: 10px 20px;">
                    <span>院校属性：</span>
                    <select class="chosen-select select" data-placeholder="请选择院校属性" multiple id="SCPROPERTY" name="SCPROPERTY" style="width: 100%;">
                    <#if properties?? && (properties?size > 0)>
                        <#list SCPROPERTYs as SCPROPERTY>
                            <option value="${SCPROPERTY.DIC_ID}"
                                <#list properties as property>
                                    <#if SCPROPERTY.DIC_ID == property.DIC_ID>
                                    selected
                                    </#if>
                                </#list>
                            >${SCPROPERTY.NAME}</option>
                        </#list>
                    <#else>
                        <#list SCPROPERTYs as SCPROPERTY>
                            <option value="${SCPROPERTY.DIC_ID}">${SCPROPERTY.NAME}</option>
                        </#list>
                    </#if>
                    </select>
                </div>
                <div style="border-top: 1px solid #ccc;padding: 10px 20px;">
                    <span>学历层次：</span>
                    <select class="chosen-select select" data-placeholder="请选择学历层次" multiple id="ARRANGMENT" name="ARRANGMENT" style="width: 100%;">
                    <#if arrangments?? && (arrangments?size > 0)>
                        <#list ARRANGMENTs as ARRANGMENT>
                            <option value="${ARRANGMENT.DIC_ID}"
                                <#list arrangments as arrangment>
                                    <#if ARRANGMENT.DIC_ID == arrangment.DIC_ID>
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
            <#--<div style="border-top: 1px solid #ccc;padding: 10px 20px;">
                <span>历年分数：</span>
                <span>年份：</span>
                                    <span>
                                        <input type="text" style="border: 1px solid #000000;width: 50px"/>
                                    </span>
                <span>最高分：</span>
                                    <span>
                                        <input type="text" style="border: 1px solid #000000;width: 50px"/>
                                    </span>
                <span>最低分：</span>
                                    <span>
                                        <input type="text" style="border: 1px solid #000000;width: 50px"/>
                                    </span>
                <input type="button" value="新增" class="xzeng"/>
                <div class="nfen">
                    <table style="margin: 0 auto;">
                        <tr>
                            <td>年份</td>
                            <td>最高分</td>
                            <td>最低分</td>
                        </tr>
                        <tr>
                            <td>2016：</td>
                            <td>600</td>
                            <td>500</td>
                        </tr>
                        <tr>
                            <td>2015：</td>
                            <td>620</td>
                            <td>550</td>
                        </tr>
                        <tr>
                            <td>2014：</td>
                            <td>650</td>
                            <td>450</td>
                        </tr>
                    </table>
                </div>
            </div>-->
                <div style="border-top: 1px solid #ccc;padding: 10px 20px;">
                    <span>隶属：</span>
                    <input type="text" style="margin-left: 25px;border: 1px solid #000;" value="<#if school.SUBJECTION??>${school.SUBJECTION}</#if>" id="SUBJECTION" name="SUBJECTION"/>
                </div>
                <div style="border-top: 1px solid #ccc;padding: 10px 20px;">
                    <span style="margin-right: 6px">所在地：</span>
                    <input type="text" value="<#if school.ADDRESS??>${school.ADDRESS}</#if>" style="width: 100%;" id="ADDRESS" name="ADDRESS"/>
                </div>
                <div style="border-top: 1px solid #ccc;padding: 10px 20px;">
                    <span>创办时间：</span>
                    <span><input type="text" value="" id="CREATEDATE" name=CREATEDATE />年</span>
                </div>
            <#--<div style="border-top: 1px solid #ccc;padding: 10px 20px;">
                <span>占地面积：</span>
                                    <span>
                                        <input type="text"/>
                                    </span>
            </div>-->
            <#--<div style="border-top: 1px solid #ccc;padding: 10px 20px;">
                <div class="row">
                    <div class="col-md-2 col-sm-3 col-xs-3" style="padding-right: 0">院校介绍：</div>
                    <div class="col-md-8 col-sm-9 col-xs-9" style="padding-left: 0">
                        <textarea id="SUMMARY" name="SUMMARY" class="textarea" cols="100" rows="8"></textarea>
                    </div>
                </div>
            </div>-->
                <div style="border-top: 1px solid #ccc;padding: 10px 20px;">
                    <span>院校网址：</span>
                    <input type="text" value="<#if school.SCWEBSITE??>${school.SCWEBSITE}</#if>" name="SCWEBSITE" id="SCWEBSITE"/>
                </div>
                <div style="border-top: 1px solid #ccc;padding: 10px 20px;">
                    <span>招办网址：</span>
                    <input type="text" value="<#if school.WEBSITE??>${school.WEBSITE}</#if>" name="WEBSITE" id="WEBSITE"/>
                </div>
                <div style="border-top: 1px solid #ccc;padding: 10px 20px;">
                    <span>院系与专业：</span>
                    <textarea id="FACULTY" name="FACULTY" class="textarea" cols="100" rows="8"><#if faculty?? && faculty.CONTENT??>${faculty.CONTENT}</#if></textarea>
                </div>
                <div style="border-top: 1px solid #ccc;padding: 10px 20px;">
                    <span>学校位置：</span>
                    <div id="allmap" style="height: 300px;"></div>
                </div>

                <input type="hidden" name="LON" id="LON" value="<#if school.LON??>${school.LON}</#if>" />
                <input type="hidden" name="LAT" id="LAT" value="<#if school.LAT??>${school.LAT}</#if>" />
            <#--<div style="border-top: 1px solid #ccc;padding: 10px 20px;">
                <div>
                    <span>批次与专业设置：</span>
                    <span>招生批次：</span>
                                        <span>
                                            <select>
                                                <option>本一</option>
                                                <option>本二</option>
                                                <option>专科</option>
                                            </select>
                                        </span>
                    <span>院系名称：</span>
                                        <span>
                                            <input style="width: 80px;" type="text"/>
                                        </span>
                                        <span>
                                            <input class="xzeng" type="button" value="新增"/>
                                        </span>
                </div>
                <div style="padding-top: 10px">
                    <span>开设专业：</span>
                    <label style="color: #333;">
                        <select class="selectpicker show-tick form-control" style="width: 200px" size="1" name="PARENT_ID" id="selectbox" data-placeholder="不限" multiple data-live-search="false">
                            <option value="1">会计学</option>
                            <option value="2">计算机</option>
                            <option value="3">生物</option>
                            <option value="4">土木工程</option>
                            <option>化学</option>
                            <option>化学</option>
                        </select>
                    </label>
                </div>
                <!--本一 开始&ndash;&gt;
                <div style="text-align: center;font-size: 20px;font-weight: bold">
                    本一
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        院校名称
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        开设专业
                    </div>
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        计算机学院
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        软件工程、软件工程、软件工程、软件工程、软件工程软件工程、软件工程、
                    </div>
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        计算机学院
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        软件工程、软件工程、软件工程软件工程、软件工程、
                    </div>
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        计算机学院
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        软件工程、软件工程、软件工程软件工程、软件工程、
                    </div>
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        计算机学院
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        软件工程、软件工程、软件工程软件工程、软件工程、
                    </div>
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        计算机学院
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        软件工程、软件工程、软件工程软件工程、软件工程、
                    </div>
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        计算机学院
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        软件工程、软件工程、软件工程软件工程、软件工程、
                    </div>
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        计算机学院
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        软件工程、软件工程、软件工程软件工程、软件工程、
                    </div>
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        计算机学院
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        软件工程、软件工程、软件工程软件工程、软件工程、
                    </div>
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        计算机学院
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        软件工程、软件工程、软件工程软件工程、软件工程、
                    </div>
                </div>
                <nav style="text-align: center">
                    <ul class="pagination">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!--本一 结束&ndash;&gt;
                <!--本二 开始&ndash;&gt;
                <div style="text-align: center;font-size: 20px;font-weight: bold">
                    本二
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        院校名称
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        开设专业
                    </div>
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        计算机学院
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        软件工程、软件工程、软件工程、软件工程、软件工程软件工程、软件工程、
                    </div>
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        计算机学院
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        软件工程、软件工程、软件工程软件工程、软件工程、
                    </div>
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        计算机学院
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        软件工程、软件工程、软件工程软件工程、软件工程、
                    </div>
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        计算机学院
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        软件工程、软件工程、软件工程软件工程、软件工程、
                    </div>
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        计算机学院
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        软件工程、软件工程、软件工程软件工程、软件工程、
                    </div>
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        计算机学院
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        软件工程、软件工程、软件工程软件工程、软件工程、
                    </div>
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        计算机学院
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        软件工程、软件工程、软件工程软件工程、软件工程、
                    </div>
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        计算机学院
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        软件工程、软件工程、软件工程软件工程、软件工程、
                    </div>
                </div>
                <div class="row hxian">
                    <div class="zce col-md-3 col-sm-3 col-xs-3">
                        计算机学院
                    </div>
                    <div class="yce col-md-9 col-sm-9 col-xs-9">
                        软件工程、软件工程、软件工程软件工程、软件工程、
                    </div>
                </div>
                <nav style="text-align: center">
                    <ul class="pagination">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!--本二 结束&ndash;&gt;
                <div style="text-align: center;border-top: 1px solid #ccc;padding: 20px 0;">
                    <input class="butn" type="button" value="保存修改"/>
                </div>
            </div>-->
                <div style="text-align: center;border-top: 1px solid #ccc;padding: 20px 0;">
                    <input class="butn" type="submit" value="保存修改"/>
                </div>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2"></div>
        </div>
    </div>
</form>
<script language="JavaScript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");
    map.centerAndZoom(new BMap.Point(<#if school.LON??>${school.LON}<#else>116.404</#if>, <#if school.LAT??>${school.LAT}<#else>39.915</#if>), 15);
    map.enableScrollWheelZoom(true);

    map.addEventListener("click", setFlag);

    function setFlag(e){
        map.clearOverlays();
        var marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));
        map.addOverlay(marker);
        $("#LON").val(e.point.lng);
        $("#LAT").val(e.point.lat);
    }
</script>
</body>
</html>