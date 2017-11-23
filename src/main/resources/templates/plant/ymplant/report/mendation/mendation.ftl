<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/report/mendation/mendation.css?v=${v}"/>
    <link rel="stylesheet" href="${ctxPath}/static/plugin/h-ui/lib/chosen.jquery/chosen.min.css?v=${v}"/>
    <script src="${ctxPath}/static/plugin/h-ui/lib/chosen.jquery/chosen.jquery.min.js?v=${v}"></script>
    <style>
        color{
            #333
        }
        .kd-hei{
            background-color: #ccc;
        }
    </style>
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
    <div class="kd-tjia">
        <div class="container">
            <#--<div class="kd-jian">-->
                <#--<img src="/static/ymplant/img/sye/banner/zbanner.jpg" style="width:100%;" alt=""/>-->
            <#--</div>-->
            <div class="region">
                <p style="padding: 5px 0;">
                    <span style="font-weight: bold;color: #333">高考分数：</span>
                    <span><#if examinee?? && examinee.EXAMSCORE??>${examinee.EXAMSCORE}分<#else>暂无信息</#if></span>
                    <span>（注：分数需要在个人中心修改）</span>
                </p>
                <div class="gion">
                    <div class="row">
                        <div class="col-md-1 col-sm-1 col-xs-1" style="padding-right: 0;">
                            <span class="kd-dqu">批次</span>
                        </div>
                        <div class="col-md-11 col-sm-11 col-xs-11">
                            <label class="radio-inline">
                                <input type="radio" name="ARRANGMENT_ID" id="ARRANGMENT1" value="hjj4e5vr0c"> 本一
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="ARRANGMENT_ID" id="ARRANGMENT2" value="bdhsl11qtb"> 本二
                            </label>
                            <#--<label class="radio-inline">-->
                                <#--<input type="radio" name="ARRANGMENT_ID" id="ARRANGMENT3" value="8sqm1urq5w"> 专科-->
                            <#--</label>-->
                        </div>
                    </div>
                </div>
                <div class="gion">
                    <div class="row">
                        <div class="col-md-1 col-sm-1 col-xs-1" style="padding-right: 0;">
                            <span class="kd-dqu">地区</span>
                        </div>
                        <div class="col-md-11 col-sm-11 col-xs-11">
                            <table class="kd-bxia">
                                <tbody>
                                <tr>
                                    <td><a href="javascript:void(0);" class="province" data-href="">不限</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE1">北京</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE2">天津</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE22">重庆</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE9">上海</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE3">河北</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE4">山西</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE6">辽宁</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE7">吉林</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE8">黑龙江</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE10">江苏</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE11">浙江</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE12">安徽</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE13">福建</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE14">江西</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE15">山东</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE16">河南</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE17">湖北</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE18">湖南</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE19">广东</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE21">海南</a></td>
                                </tr>
                                <tr>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE23">四川</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE24">贵州</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE25">云南</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE27">陕西</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE28">甘肃</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE29">青海</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE5">内蒙古</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE20">广西</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE30">宁夏</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE31">新疆</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE26">西藏</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE33">香港</a></td>
                                    <td><a href="javascript:void(0);" class="province" data-href="PROVINCE34">澳门</a></td>
                                </tr>
                                </tbody></table>
                        </div>
                    </div>
                </div>
                <div class="gion">
                    <div class="row">
                        <div class="col-md-1 col-sm-1 col-xs-1" style="padding-right: 0;">
                            <span class="kd-dqu">类型</span>
                        </div>
                        <div class="col-md-11 col-sm-11 col-xs-11">
                            <table class="kd-bxia">
                                <tbody><tr>
                                    <td><a class="subjecttype" href="javascript:void(0);" data-href="">不限</a></td>
                                    <td>
                                        <a class="subjecttype" href="javascript:void(0);" data-href="d8r7gr81tw">综合类</a>
                                    </td>
                                    <td>
                                        <a class="subjecttype" href="javascript:void(0);" data-href="6m9ubgvqde">师范类</a>
                                    </td>
                                    <td>
                                        <a class="subjecttype" href="javascript:void(0);" data-href="6ysjjc4c8i">军事类</a>
                                    </td>
                                    <td>
                                        <a class="subjecttype" href="javascript:void(0);" data-href="9rxyeougpe">民族类</a>
                                    </td>
                                    <td>
                                        <a class="subjecttype" href="javascript:void(0);" data-href="ccngwlobnk">政法类</a>
                                    </td>
                                    <td>
                                        <a class="subjecttype" href="javascript:void(0);" data-href="iqzujiwxf1">农林类</a>
                                    </td>
                                    <td>
                                        <a class="subjecttype" href="javascript:void(0);" data-href="nkuqcscoji">医药类</a>
                                    </td>
                                    <td>
                                        <a class="subjecttype" href="javascript:void(0);" data-href="np0yhn0ino">理工类</a>
                                    </td>
                                    <td>
                                        <a class="subjecttype" href="javascript:void(0);" data-href="oabjf59odp">财经类</a>
                                    </td>
                                    <td>
                                        <a class="subjecttype" href="javascript:void(0);" data-href="q35o8blqls">语言类</a>
                                    </td>
                                    <td>
                                        <a class="subjecttype" href="javascript:void(0);" data-href="xiq87rt0eh">体育类</a>
                                    </td>
                                    <td>
                                        <a class="subjecttype" href="javascript:void(0);" data-href="zoba187w7h">艺术类</a>
                                    </td>
                                    <td>
                                        <a class="subjecttype" href="javascript:void(0);" data-href="b7egxlgsdk">其他类</a>
                                    </td>
                                </tr>
                                </tbody></table>
                        </div>
                    </div>
                </div>
                <div class="gion">
                    <div class="row">
                        <div class="col-md-1 col-sm-1 col-xs-1" style="padding-right: 0;">
                            <span class="kd-dqu">属性</span>
                        </div>
                        <div class="col-md-11 col-sm-11 col-xs-11 kd-zdia">
                            <table class="kd-bxia">
                                <tbody>
                                <tr>
                                    <td><a class="scproperty" href="javascript:void(0);" data-href="">不限</a></td>
                                    <td>
                                        <a class="scproperty" href="javascript:void(0);" data-href="sdqwcrkfwt">985</a>
                                    </td>
                                    <td>
                                        <a class="scproperty" href="javascript:void(0);" data-href="p7uuy9sza3">211</a>
                                    </td>
                                    <td>
                                        <a class="scproperty" href="javascript:void(0);" data-href="qdlfrqisbp">双一流</a>
                                    </td>
                                    <td>
                                        <a class="scproperty" href="javascript:void(0);" data-href="02ypbyl4cd">省重点</a>
                                    </td>
                                    <td>
                                        <a class="scproperty" href="javascript:void(0);" data-href="9ghnux2esv">卓越计划</a>
                                    </td>
                                    <td>
                                        <a class="scproperty" href="javascript:void(0);" data-href="4cqz1n7nvh">研究生院</a>
                                    </td>
                                    <td>
                                        <a class="scproperty" href="javascript:void(0);" data-href="m3vml9a83t">艺术生</a>
                                    </td>
                                </tr>
                                </tbody></table>
                        </div>
                    </div>
                </div>
                <div class="gion">
                    <div class="row">
                        <div class="col-md-1 col-sm-1 col-xs-1" style="padding-right: 0;">
                            <span class="kd-dqu">专业</span>
                        </div>
                        <div class="col-md-11 col-sm-11 col-xs-11 kd-zdia">
                            <select class="selectpicker show-tick form-control" style="width: 600px" size="1" name="PARENT_ID" id="selectbox" data-placeholder="不限" multiple>
                            <option value="">不限</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div style="padding: 10px;text-align: center">
                    <input class="kd-jguo" type="button" value="查看结果" onclick="mendation();"/>
                </div>
            </div>
            <div id="reportresult" style="display: none;">
                <nav>
                    <ul class="nav nav-tabs nav-justified" id="kd-xzhong" style="background-color: #D4F5F1">
                        <li role="presentation" class="active"><a class="kd-sliu" href="#tab-c-info" data-toggle="tab">冲</a></li>
                        <li role="presentation"><a class="kd-sliu2" href="#tab-w-info" data-toggle="tab">稳</a></li>
                        <li role="presentation"><a class="kd-sliu3" href="#tab-b-info" data-toggle="tab">保</a></li>
                        <li role="presentation"><a class="kd-sliu4" href="#tab-d-info" data-toggle="tab">垫</a></li>
                    </ul>
                </nav>
                <div class="tab-content">
                    <#--冲 开始-->
                    <table role="tabpanel" class="tab-pane active" id="tab-c-info" style="width: 1140px;">
                    </table>
                    <#--冲 结束-->
                    <#--稳 开始-->
                    <table role="tabpanel" class="tab-pane" id="tab-w-info" style="width: 1140px;">
                    </table>
                    <table role="tabpanel" class="tab-pane" id="tab-b-info" style="width: 1140px;">
                    </table>
                    <table role="tabpanel" class="tab-pane" id="tab-d-info" style="width: 1140px;">
                    </table>
                    <#--稳 结束-->
                </div>
            </div>
            <div class="kd-tshi">
                <p style="margin-bottom: 20px;">
                    <img src="/static/ymplant/images/tubiao4/tishi.png" alt="">
                    <span style="font-size: 16px;font-weight: bold;color: #333;">重要提示：</span>
                </p>
                <p style="font-size: 14px;color: #555;margin-bottom: 5px;">
                    1、本系统提供高考志愿填报智能模拟功能，不等同于实际的网上志愿填报。建议考生在填报志愿时，结合本系统的推荐来完善志愿表；
                </p>
                <p style="font-size: 14px;color: #555;margin-bottom: 5px;">
                    2、您正在使用的是河北考生志愿填报智能模拟系统，提供“普通类文理的本科一、本科二批”的志愿填报模拟功能，该功能主要数据来源参考与各省市出版的填报	指南以及各本科专科院系官网的历年数据；
                </p>
                <p style="font-size: 14px;color: #555;margin-bottom: 5px;">
                    3、当前版本使用的数据已经更新至2017年最新数据；
                </p>
                <p style="font-size: 14px;color: #555;margin-bottom: 5px;">
                    4、本系统推荐结果仅限参考，在正式填报时，以教育考试院公布的最新招生计划为准，具体情况请根据当年招生政策自行判断。
                </p>
            </div>
        </div>
    </div>
<script language="JavaScript">
    <#if Session.session_user_key?? && Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'>
        <#if !(examinee?? && examinee.EXAMSCORE??)>
        showError("您还没有添加高考分数，请在个人中心-考生信息处完善！", "examinee");
        </#if>
    </#if>
    <#if Session.session_user_key?? && Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'm9bxdt9g36'>
    showError('请确认账号为学生身份');
    </#if>
    <#if !Session.session_user_key??>
    showError("请先登录账号");
    </#if>
</script>
<script language="JavaScript">
    var bmajor = "<option value=''>不限</option>";
    <#if bmajors?? && (bmajors?size > 0)>
        <#list bmajors as bmajor>
        bmajor += "<option value='${bmajor.DIC_ID}'>${bmajor.NAME}</option>";
        </#list>
    </#if>
    var zmajor = "<option value=''>不限</option>";
    <#if zmajors?? && (zmajors?size > 0)>
        <#list zmajors as zmajor>
        zmajor += "<option value='${zmajor.DIC_ID}'>${zmajor.NAME}</option>";
        </#list>
    </#if>
    var tableHead = "";
    var tableFoot = "";
    tableHead += "<thead>";
    tableHead += "<tr style='background-color: #33C9B5;color: #fff;text-align: center'>";
    tableHead += "<td style='width: 340px' class='kd-namc' rowspan='2'>院校名称</td>";
    tableHead += "<td style='width: 200px' class='kd-namc' rowspan='2'>专业名称</td>";
    tableHead += "<td style='width: 124px' class='kd-namc' rowspan='2'>院校地区</td>";
    tableHead += "<td style='width: 187px' class='kd-namc' rowspan='2'>院校类型</td>";
    tableHead += "<td style='width: 285px' class='kd-namc' colspan='4'>院校历年的招生计划</td>";
    tableHead += "</tr>";
    tableHead += "<tr style='background-color: #33C9B5;color: #fff;text-align: center;border-top: 1px solid #fff'>";
    tableHead += "<td class='kd-namc'>年份</td>";
    tableHead += "<td class='kd-namc'>最高分</td>";
    tableHead += "<td class='kd-namc'>最低分</td>";
    tableHead += "<td class='kd-namc'>录取数</td>";
    tableHead += "</tr>";
    tableFoot += "</thead>";

    $(function () {
        <#if province?? && arrangment??>
            sendRequest(ctxPath + "/plant/report/api/reporting", {PROVINCE: "${province}", ARRANGMENT_ID: "${arrangment}"}, "POST", function (res) {
                if(res.hasErrors) {
                    showError(res.errorMessage);
                    return false;
                }

                setResult(res);
            });
        </#if>
        $(".province").click(function(){
            $(this).toggleClass("kd-hei");

            if($(this).text() == "不限") {
                $(".province").each(function () {
                    if($(this).text() != "不限") {
                        $(this).removeClass("kd-hei");
                    }
                });
            }
            else{
                $(".province").each(function () {
                    if($(this).text() == "不限") {
                        $(this).removeClass("kd-hei");
                    }
                });
            }
        });
        $(".subjecttype").click(function(){
            $(this).toggleClass("kd-hei");

            if($(this).text() == "不限") {
                $(".subjecttype").each(function () {
                    if($(this).text() != "不限") {
                        $(this).removeClass("kd-hei");
                    }
                });
            }
            else{
                $(".subjecttype").each(function () {
                    if($(this).text() == "不限") {
                        $(this).removeClass("kd-hei");
                    }
                });
            }
        });
        $(".scproperty").click(function(){
            $(this).toggleClass("kd-hei");

            if($(this).text() == "不限") {
                $(".scproperty").each(function () {
                    if($(this).text() != "不限") {
                        $(this).removeClass("kd-hei");
                    }
                });
            }
            else{
                $(".scproperty").each(function () {
                    if($(this).text() == "不限") {
                        $(this).removeClass("kd-hei");
                    }
                });
            }
        });
        $('#selectbox').chosen({
            no_results_text: "没有找到结果！",//搜索无结果时显示的提示
            search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
            allow_single_deselect:true,
            max_selected_options:5
        });
        //$("#selectbox").html(bmajor);
        $("#selectbox").trigger("chosen:updated");

        $("#ARRANGMENT1").click(function () {
            $("#selectbox").val("");
            $("#selectbox").html(bmajor);
            $("#selectbox").trigger("chosen:updated");
        });

        $("#ARRANGMENT2").click(function () {
            $("#selectbox").val("");
            $("#selectbox").html(bmajor);
            $("#selectbox").trigger("chosen:updated");
        });

        $("#ARRANGMENT3").click(function () {
            $("#selectbox").val("");
            $("#selectbox").html(zmajor);
            $("#selectbox").trigger("chosen:updated");
        });
    });

    var mendation = function () {
    <#if Session.session_user_key?? && Session.session_user_key.ROLE_ID??>
            <#if Session.session_user_key.ROLE_ID == 'sja4gc59bg'>
                layer.confirm("确定要进行智能推荐？此次操作需消耗一张智能推荐卡", {
                    btn: ["是", "否"]
                }, function(index) {
                    layer.close(index);
                    if(!($("#ARRANGMENT1").prop("checked") || $("#ARRANGMENT2").prop("checked") || $("#ARRANGMENT3").prop("checked"))){
                        showError("请选择批次！");
                        return false;
                    }
                    var param = {};
                    param.MAJOR = $("#selectbox").val();
                    if(param.MAJOR == null) param.MAJOR = "";
                    for(var i = 1; i < 3; i++) {
                        if($("#ARRANGMENT" + i).prop("checked")) {
                            param.ARRANGMENT_ID = $("#ARRANGMENT" + i).val();
                        }
                    }

                    param.PROVINCE = "";

                    $(".province").each(function () {
                        if($(this).hasClass("kd-hei")) {
                            param.PROVINCE += $(this).attr("data-href") + ",";
                        }
                    });

                    if(param.PROVINCE != "") {
                        param.PROVINCE = param.PROVINCE.substring(0, param.PROVINCE.length - 1);
                    }

                    param.SUBJECTTYPE = "";

                    $(".subjecttype").each(function () {
                        if($(this).hasClass("kd-hei")) {
                            param.SUBJECTTYPE += $(this).attr("data-href") + ",";
                        }
                    });

                    if(param.SUBJECTTYPE != "") {
                        param.SUBJECTTYPE = param.SUBJECTTYPE.substring(0, param.SUBJECTTYPE.length - 1);
                    }

                    param.SCPROPERTY = "";

                    $(".scproperty").each(function () {
                        if($(this).hasClass("kd-hei")) {
                            param.SCPROPERTY += $(this).attr("data-href") + ",";
                        }
                    });

                    if(param.SCPROPERTY != "") {
                        param.SCPROPERTY = param.SCPROPERTY.substring(0, param.SCPROPERTY.length - 1);
                    }

                    sendRequest(ctxPath + "/plant/report/api/reporting", param, "POST", function (res) {
                        if(res.hasErrors) {
                            showError(res.errorMessage);
                            return false;
                        }

                        setResult(res);
                    });
                });
            <#else>
                showError('请确认账号为学生身份');
                return false;
            </#if>
        <#else>
            showError('请先登录账号');
            return false;
    </#if>
    };

    var setResult = function (data) {
        var strHtml = "";
        if(data.data == "750") {
            strHtml += "<tr class='kd-xxiao'>";
            strHtml += "<td colspan='8'>";
            strHtml += "你已成为考神，可随意报考";
            strHtml += "</td>";
            strHtml += "</tr>";
        }
        else{
            if(data.listChong.length > 0) {
                for(var i = 0; i < data.listChong.length; i++) {
                    var obj = data.listChong[i];

                    strHtml += "<tr class='kd-xxiao'>";
                    strHtml += "<td>";
                    strHtml += "<a href='/plant/school/details/" + obj.SCHOOL_ID + "' target='_blank'>";
                    strHtml += "<span style='font-weight: bold;font-size: 16px;'>" + obj.NAME + "</span>";
                    strHtml += "<div style='margin-top: 20px;'>";
                    for(var j = 0; j < obj.properties.length; j++) {
                        var property = obj.properties[j];
                        strHtml += "<span class='kd-" + property.DIC_ID + "' title='" + property.NAME + "'></span>";
                    }

                    strHtml += "</div>";
                    strHtml += "</a>";
                    strHtml += "</td>";
                    strHtml += "<td>" + obj.MJNAME + "</td>";
                    strHtml += "<td>" + obj.PROVINCE_VALUE + "</td>";
                    strHtml += "<td>";
                    if(obj.subjecttypes.length == 0){
                        strHtml += "--";
                    }
                    for(var j = 0; j < obj.subjecttypes.length; j++) {
                        var subjecttype = obj.subjecttypes[j];
                        strHtml += "<span class='kd-" + subjecttype.DIC_ID + "' title='" + subjecttype.NAME + "'></span>";
                    }
                    strHtml += "</td>";
                    strHtml += "<td>";
                    for(var j = 0; j < 3; j++) {
                        if(j < obj.scores.length) {
                            strHtml += "<div class='kd-jju'>" + obj.scores[j].YEAR_VALUE + "</div>";
                        }
                        else{
                            strHtml += "<div class='kd-jju'>-</div>";
                        }
                    }
                    strHtml += "</td>";
                    strHtml += "<td>";
                    for(var j = 0; j < 3; j++) {
                        if(j < obj.scores.length) {
                            strHtml += "<div class='kd-jju'>" + obj.scores[j].MAXSCORE + "</div>";
                        }
                        else{
                            strHtml += "<div class='kd-jju'>-</div>";
                        }
                    }
                    strHtml += "</td>";
                    strHtml += "<td>";
                    for(var j = 0; j < 3; j++) {
                        if(j < obj.scores.length) {
                            strHtml += "<div class='kd-jju'>" + obj.scores[j].MINSCORE + "</div>";
                        }
                        else{
                            strHtml += "<div class='kd-jju'>-</div>";
                        }
                    }
                    strHtml += "</td>";
                    strHtml += "<td>";
                    for(var j = 0; j < 3; j++) {
                        if(j < obj.scores.length) {
                            strHtml += "<div class='kd-jju'>" + obj.scores[j].ENTERCOUNT + "</div>";
                        }
                        else{
                            strHtml += "<div class='kd-jju'>-</div>";
                        }
                    }
                    strHtml += "</td>";
                    strHtml += "</tr>";
                }
            }
            else{
                strHtml += "<tr class='kd-xxiao'>";
                strHtml += "<td colspan='8'>";
                strHtml += "查无数据";
                strHtml += "</td>";
                strHtml += "</tr>";
            }
        }

        $("#tab-c-info").html(tableHead + strHtml + tableFoot);

        strHtml = "";
        if(data.data == "750") {
            strHtml += "<tr class='kd-xxiao'>";
            strHtml += "<td colspan='8'>";
            strHtml += "你已成为考神，可随意报考";
            strHtml += "</td>";
            strHtml += "</tr>";
        }
        else{
            if(data.listWen.length > 0) {
                for(var i = 0; i < data.listWen.length; i++) {
                    var obj = data.listWen[i];

                    strHtml += "<tr class='kd-xxiao'>";
                    strHtml += "<td>";
                    strHtml += "<a href='/plant/school/details/" + obj.SCHOOL_ID + "' target='_blank'>";
                    strHtml += "<span style='font-weight: bold;font-size: 16px;'>" + obj.NAME + "</span>";
                    strHtml += "<div style='margin-top: 20px;'>";
                    for(var j = 0; j < obj.properties.length; j++) {
                        var property = obj.properties[j];
                        strHtml += "<span class='kd-" + property.DIC_ID + "' title='" + property.NAME + "'></span>";
                    }

                    strHtml += "</div>";
                    strHtml += "</a>";
                    strHtml += "</td>";
                    strHtml += "<td>" + obj.MJNAME + "</td>";
                    strHtml += "<td>" + obj.PROVINCE_VALUE + "</td>";
                    strHtml += "<td>";
                    if(obj.subjecttypes.length == 0){
                        strHtml += "--";
                    }
                    for(var j = 0; j < obj.subjecttypes.length; j++) {
                        var subjecttype = obj.subjecttypes[j];
                        strHtml += "<span class='kd-" + subjecttype.DIC_ID + "' title='" + subjecttype.NAME + "'></span>";
                    }
                    strHtml += "</td>";
                    strHtml += "<td>";
                    for(var j = 0; j < 3; j++) {
                        if(j < obj.scores.length) {
                            strHtml += "<div class='kd-jju'>" + obj.scores[j].YEAR_VALUE + "</div>";
                        }
                        else{
                            strHtml += "<div class='kd-jju'>-</div>";
                        }
                    }
                    strHtml += "</td>";
                    strHtml += "<td>";
                    for(var j = 0; j < 3; j++) {
                        if(j < obj.scores.length) {
                            strHtml += "<div class='kd-jju'>" + obj.scores[j].MAXSCORE + "</div>";
                        }
                        else{
                            strHtml += "<div class='kd-jju'>-</div>";
                        }
                    }
                    strHtml += "</td>";
                    strHtml += "<td>";
                    for(var j = 0; j < 3; j++) {
                        if(j < obj.scores.length) {
                            strHtml += "<div class='kd-jju'>" + obj.scores[j].MINSCORE + "</div>";
                        }
                        else{
                            strHtml += "<div class='kd-jju'>-</div>";
                        }
                    }
                    strHtml += "</td>";
                    strHtml += "<td>";
                    for(var j = 0; j < 3; j++) {
                        if(j < obj.scores.length) {
                            strHtml += "<div class='kd-jju'>" + obj.scores[j].ENTERCOUNT + "</div>";
                        }
                        else{
                            strHtml += "<div class='kd-jju'>-</div>";
                        }
                    }
                    strHtml += "</td>";
                    strHtml += "</tr>";
                }
            }
            else{
                strHtml += "<tr class='kd-xxiao'>";
                strHtml += "<td colspan='8'>";
                strHtml += "查无数据";
                strHtml += "</td>";
                strHtml += "</tr>";
            }
        }

        $("#tab-w-info").html(tableHead + strHtml + tableFoot);

        strHtml = "";
        if(data.data == "750") {
            strHtml += "<tr class='kd-xxiao'>";
            strHtml += "<td colspan='8'>";
            strHtml += "你已成为考神，可随意报考";
            strHtml += "</td>";
            strHtml += "</tr>";
        }
        else{
            if(data.listBao.length > 0) {
                for(var i = 0; i < data.listBao.length; i++) {
                    var obj = data.listBao[i];

                    strHtml += "<tr class='kd-xxiao'>";
                    strHtml += "<td>";
                    strHtml += "<a href='/plant/school/details/" + obj.SCHOOL_ID + "' target='_blank'>";
                    strHtml += "<span style='font-weight: bold;font-size: 16px;'>" + obj.NAME + "</span>";
                    strHtml += "<div style='margin-top: 20px;'>";
                    for(var j = 0; j < obj.properties.length; j++) {
                        var property = obj.properties[j];
                        strHtml += "<span class='kd-" + property.DIC_ID + "' title='" + property.NAME + "'></span>";
                    }

                    strHtml += "</div>";
                    strHtml += "</a>";
                    strHtml += "</td>";
                    strHtml += "<td>" + obj.MJNAME + "</td>";
                    strHtml += "<td>" + obj.PROVINCE_VALUE + "</td>";
                    strHtml += "<td>";
                    if(obj.subjecttypes.length == 0){
                        strHtml += "--";
                    }
                    for(var j = 0; j < obj.subjecttypes.length; j++) {
                        var subjecttype = obj.subjecttypes[j];
                        strHtml += "<span class='kd-" + subjecttype.DIC_ID + "' title='" + subjecttype.NAME + "'></span>";
                    }
                    strHtml += "</td>";
                    strHtml += "<td>";
                    for(var j = 0; j < 3; j++) {
                        if(j < obj.scores.length) {
                            strHtml += "<div class='kd-jju'>" + obj.scores[j].YEAR_VALUE + "</div>";
                        }
                        else{
                            strHtml += "<div class='kd-jju'>-</div>";
                        }
                    }
                    strHtml += "</td>";
                    strHtml += "<td>";
                    for(var j = 0; j < 3; j++) {
                        if(j < obj.scores.length) {
                            strHtml += "<div class='kd-jju'>" + obj.scores[j].MAXSCORE + "</div>";
                        }
                        else{
                            strHtml += "<div class='kd-jju'>-</div>";
                        }
                    }
                    strHtml += "</td>";
                    strHtml += "<td>";
                    for(var j = 0; j < 3; j++) {
                        if(j < obj.scores.length) {
                            strHtml += "<div class='kd-jju'>" + obj.scores[j].MINSCORE + "</div>";
                        }
                        else{
                            strHtml += "<div class='kd-jju'>-</div>";
                        }
                    }
                    strHtml += "</td>";
                    strHtml += "<td>";
                    for(var j = 0; j < 3; j++) {
                        if(j < obj.scores.length) {
                            strHtml += "<div class='kd-jju'>" + obj.scores[j].ENTERCOUNT + "</div>";
                        }
                        else{
                            strHtml += "<div class='kd-jju'>-</div>";
                        }
                    }
                    strHtml += "</td>";
                    strHtml += "</tr>";
                }
            }
            else{
                strHtml += "<tr class='kd-xxiao'>";
                strHtml += "<td colspan='8'>";
                strHtml += "查无数据";
                strHtml += "</td>";
                strHtml += "</tr>";
            }
        }

        $("#tab-b-info").html(tableHead + strHtml + tableFoot);

        strHtml = "";
        if(data.data == "750") {
            strHtml += "<tr class='kd-xxiao'>";
            strHtml += "<td colspan='8'>";
            strHtml += "你已成为考神，可随意报考";
            strHtml += "</td>";
            strHtml += "</tr>";
        }
        else{
            if(data.listDian.length > 0) {
                for(var i = 0; i < data.listDian.length; i++) {
                    var obj = data.listDian[i];

                    strHtml += "<tr class='kd-xxiao'>";
                    strHtml += "<td>";
                    strHtml += "<a href='/plant/school/details/" + obj.SCHOOL_ID + "' target='_blank'>";
                    strHtml += "<span style='font-weight: bold;font-size: 16px;'>" + obj.NAME + "</span>";
                    strHtml += "<div style='margin-top: 20px;'>";
                    for(var j = 0; j < obj.properties.length; j++) {
                        var property = obj.properties[j];
                        strHtml += "<span class='kd-" + property.DIC_ID + "' title='" + property.NAME + "'></span>";
                    }

                    strHtml += "</div>";
                    strHtml += "</a>";
                    strHtml += "</td>";
                    strHtml += "<td>" + obj.MJNAME + "</td>";
                    strHtml += "<td>" + obj.PROVINCE_VALUE + "</td>";
                    strHtml += "<td>";
                    if(obj.subjecttypes.length == 0){
                        strHtml += "--";
                    }
                    for(var j = 0; j < obj.subjecttypes.length; j++) {
                        var subjecttype = obj.subjecttypes[j];
                        strHtml += "<span class='kd-" + subjecttype.DIC_ID + "' title='" + subjecttype.NAME + "'></span>";
                    }
                    strHtml += "</td>";
                    strHtml += "<td>";
                    for(var j = 0; j < 3; j++) {
                        if(j < obj.scores.length) {
                            strHtml += "<div class='kd-jju'>" + obj.scores[j].YEAR_VALUE + "</div>";
                        }
                        else{
                            strHtml += "<div class='kd-jju'>-</div>";
                        }
                    }
                    strHtml += "</td>";
                    strHtml += "<td>";
                    for(var j = 0; j < 3; j++) {
                        if(j < obj.scores.length) {
                            strHtml += "<div class='kd-jju'>" + obj.scores[j].MAXSCORE + "</div>";
                        }
                        else{
                            strHtml += "<div class='kd-jju'>-</div>";
                        }
                    }
                    strHtml += "</td>";
                    strHtml += "<td>";
                    for(var j = 0; j < 3; j++) {
                        if(j < obj.scores.length) {
                            strHtml += "<div class='kd-jju'>" + obj.scores[j].MINSCORE + "</div>";
                        }
                        else{
                            strHtml += "<div class='kd-jju'>-</div>";
                        }
                    }
                    strHtml += "</td>";
                    strHtml += "<td>";
                    for(var j = 0; j < 3; j++) {
                        if(j < obj.scores.length) {
                            strHtml += "<div class='kd-jju'>" + obj.scores[j].ENTERCOUNT + "</div>";
                        }
                        else{
                            strHtml += "<div class='kd-jju'>-</div>";
                        }
                    }
                    strHtml += "</td>";
                    strHtml += "</tr>";
                }
            }
            else{
                strHtml += "<tr class='kd-xxiao'>";
                strHtml += "<td colspan='8'>";
                strHtml += "查无数据";
                strHtml += "</td>";
                strHtml += "</tr>";
            }
        }

        $("#tab-d-info").html(tableHead + strHtml + tableFoot);
        $("#reportresult").show();
    };
</script>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>