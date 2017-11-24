<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/school/online.css?v=${v}"/>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/school/library.css?v=${v}"/>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/school/details.css?v=${v}"/>
    <style>
        .kd-hei{
            background-color: #ccc;
        }
    </style>
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
<div class="library">
    <div class="container">
        <div class="platform">
            入驻平台院校
            <img class="settled" src="/static/ymplant/img/sye/tubiao/settled.png" style="width:22px;height:22px;" alt="">
        </div>
        <!--院校框 开始-->
        <div class="row">
            <div class="col-md-9 col-sm-9 col-xs-9">
                <div class="row" style="margin-top: 20px">
                    <div class="col-md-9 col-sm-9 col-xs-9">
                        <input type="text" class="college" placeholder="输入院校名称" id="NAME"/>
                        <input type="button" onclick="searchScByName();" value="搜 索" class="ssuo"/>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <p style="text-align: right">共找到 <span style="color: #F73C4F" id="COUNT">0</span> 所院校</p>
                    </div>
                </div>
                <!--院校框 结束-->
                <!--按地区选择院校 开始-->
                <div class="region">
                    <div class="gion">
                        <div class="row">
                            <div class="col-md-1 col-sm-1 col-xs-1" style="padding-right: 0;">
                                <div class="kd-dqu">地区</div>
                            </div>
                            <div class="col-md-11 col-sm-11 col-xs-11">
                                <table class="kd-bxia">
                                    <tr>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="">不限</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE1">北京</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE2">天津</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE22">重庆</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE9">上海</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE3">河北</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE4">山西</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE6">辽宁</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE7">吉林</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE8">黑龙江</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE10">江苏</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE11">浙江</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE12">安徽</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE13">福建</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE14">江西</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE15">山东</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE16">河南</a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE17">湖北</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE18">湖南</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE19">广东</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE21">海南</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE23">四川</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE24">贵州</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE25">云南</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE27">陕西</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE28">甘肃</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE29">青海</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE5">内蒙古</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE20">广西</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE30">宁夏</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE31">新疆</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE26">西藏</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE33">香港</a></td>
                                        <td><a href="javascript:void(0);" class="province hei" data-href="PROVINCE34">澳门</a></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="gion">
                        <div class="row">
                            <div class="col-md-1 col-sm-1 col-xs-1" style="padding-right: 0;">
                                <div class="kd-dqu">批次</div>
                            </div>
                            <div class="col-md-11 col-sm-11 col-xs-11">
                                <table class="kd-bxia">
                                    <tr>
                                        <td><a href="javascript:void(0);" class="arrangment hei" data-href="">不限</a></td>
                                        <td><a href="javascript:void(0);" class="arrangment hei" data-href="hjj4e5vr0c">本一</a></td>
                                        <td><a href="javascript:void(0);" class="arrangment hei" data-href="bdhsl11qtb">本二</a></td>
                                        <td><a href="javascript:void(0);" class="arrangment hei" data-href="8sqm1urq5w">专科</a></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="gion">
                        <div class="row">
                            <div class="col-md-1 col-sm-1 col-xs-1" style="padding-right: 0;">
                                <div class="kd-dqu">类型</div>
                            </div>
                            <div class="col-md-11 col-sm-11 col-xs-11">
                                <table class="kd-bxia">
                                    <tr>
                                        <td><a href="javascript:void(0);" class="subjecttype hei" data-href="">不限</a></td>
                                        <td><a href="javascript:void(0);" class="subjecttype hei" data-href="d8r7gr81tw">综合类</a></td>
                                        <td><a href="javascript:void(0);" class="subjecttype hei" data-href="np0yhn0ino">理工类</a></td>
                                        <td><a href="javascript:void(0);" class="subjecttype hei" data-href="6m9ubgvqde">师范类</a></td>
                                        <td><a href="javascript:void(0);" class="subjecttype hei" data-href="oabjf59odp">财经类</a></td>
                                        <td><a href="javascript:void(0);" class="subjecttype hei" data-href="q35o8blqls">语言类</a></td>
                                        <td><a href="javascript:void(0);" class="subjecttype hei" data-href="zoba187w7h">艺术类</a></td>
                                        <td><a href="javascript:void(0);" class="subjecttype hei" data-href="nkuqcscoji">医药类</a></td>
                                        <td><a href="javascript:void(0);" class="subjecttype hei" data-href="iqzujiwxf1">农林类</a></td>
                                        <td><a href="javascript:void(0);" class="subjecttype hei" data-href="ccngwlobnk">政法类</a></td>
                                        <td><a href="javascript:void(0);" class="subjecttype hei" data-href="xiq87rt0eh">体育类</a></td>
                                        <td><a href="javascript:void(0);" class="subjecttype hei" data-href="9rxyeougpe">民族类</a></td>
                                        <td><a href="javascript:void(0);" class="subjecttype hei" data-href="6ysjjc4c8i">军事类</a></td>
                                        <td><a href="javascript:void(0);" class="subjecttype hei" data-href="b7egxlgsdk">其他类</a></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="gion">
                        <div class="row">
                            <div class="col-md-1 col-sm-1 col-xs-1" style="padding-right: 0;">
                                <div class="kd-dqu">属性</div>
                            </div>
                            <div class="col-md-11 col-sm-11 col-xs-11 kd-zdia">
                                <table class="kd-bxia">
                                    <tr>
                                        <td><a href="javascript:void(0);" class="property hei" data-href="">不限</a></td>
                                        <td><a href="javascript:void(0);" class="property hei" data-href="qdlfrqisbp">双一流</a></td>
                                        <td><a href="javascript:void(0);" class="property hei" data-href="sdqwcrkfwt">985</a></td>
                                        <td><a href="javascript:void(0);" class="property hei" data-href="p7uuy9sza3">211</a></td>
                                        <td><a href="javascript:void(0);" class="property hei" data-href="4cqz1n7nvh">研究生</a></td>
                                        <td><a href="javascript:void(0);" class="property hei" data-href="9ghnux2esv">卓越</a></td>
                                        <td><a href="javascript:void(0);" class="property hei" data-href="02ypbyl4cd">省重点</a></td>
                                        <td><a href="javascript:void(0);" class="property hei" data-href="m3vml9a83t">艺术生</a></td>
                                        <td>
                                            <input class="kd-ssuo" type="button" value="搜 索" onclick="searchByCondition();"/>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!--按地区选择院校 结束-->
                <!--院校学校 开始-->
                <div id="universities" class="xyuan"></div>
                <!--分页 开始-->
                <nav>
                    <div id="pagination" class="page_div"></div>
                </nav>
                <!--分页 结束-->
                <!--院校学校 结束-->
            </div>
            <div class="col-md-3 col-sm-3 col-xs-3" style="padding-top: 20px">
                <div class="follow" style="margin-bottom: 20px;">
                    <p>
                        <img src="/static/ymplant/images/tubiao/follow.png" style="width: 100%" alt=""/>
                    </p>
                <#if topSchools?? && (topSchools?size > 0)>
                    <#list topSchools as topSchool>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-md-2 col-sm-2 col-xs-2">
                                <span class="ranking">${topSchool_index + 1}</span>
                            </div>
                            <div class="col-md-7 col-sm-7 col-xs-7" style="padding:0 15px 0 0;">
                                <a class="kd-jjyc" style="text-decoration: none;" href="${ctxPath}/plant/school/details/${topSchool.SCHOOL_ID}" title="${topSchool.NAME}">${topSchool.NAME}</a>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="font-size: 10px;padding: 0">
                                <i class="glyphicon glyphicon-eye-open"></i> <span>${topSchool.VIEWCOUNT}</span>
                            </div>
                        </div>
                    </#list>
                </#if>
                </div>
            <#--<div class="evaluate" style="margin-bottom: 20px;">
                <p>
                    <img src="/static/ymplant/images/tubiao/evaluate.png" style="width: 100%" alt=""/>
                </p>
                <div class="row" style="margin-bottom: 10px;">
                    <div class="col-md-2 col-sm-2 col-xs-2">
                        <span class="ranking">1</span>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" style="padding:0;">
                        清华大学
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3" style="font-size: .3em;padding: 0">
                        收藏：<span>100W</span>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 10px;">
                    <div class="col-md-2 col-sm-2 col-xs-2">
                        <span class="ranking">1</span>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" style="padding:0;">
                        清华大学
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3" style="font-size: .3em;padding: 0">
                        收藏：<span>100W</span>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 10px;">
                    <div class="col-md-2 col-sm-2 col-xs-2">
                        <span class="ranking">1</span>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" style="padding:0;">
                        清华大学
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3" style="font-size: .3em;padding: 0">
                        收藏：<span>100W</span>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 10px;">
                    <div class="col-md-2 col-sm-2 col-xs-2">
                        <span class="ranking">1</span>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" style="padding:0;">
                        清华大学
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3" style="font-size: .3em;padding: 0">
                        收藏：<span>100W</span>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 10px;">
                    <div class="col-md-2 col-sm-2 col-xs-2">
                        <span class="ranking">1</span>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" style="padding:0;">
                        清华大学
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3" style="font-size: .3em;padding: 0">
                        收藏：<span>100W</span>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 10px;">
                    <div class="col-md-2 col-sm-2 col-xs-2">
                        <span class="ranking">1</span>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" style="padding:0;">
                        清华大学
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3" style="font-size: .3em;padding: 0">
                        收藏：<span>100W</span>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 10px;">
                    <div class="col-md-2 col-sm-2 col-xs-2">
                        <span class="ranking">1</span>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" style="padding:0;">
                        清华大学
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3" style="font-size: .3em;padding: 0">
                        收藏：<span>100W</span>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 10px;">
                    <div class="col-md-2 col-sm-2 col-xs-2">
                        <span class="ranking">1</span>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" style="padding:0;">
                        清华大学
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3" style="font-size: .3em;padding: 0">
                        收藏：<span>100W</span>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 10px;">
                    <div class="col-md-2 col-sm-2 col-xs-2">
                        <span class="ranking">1</span>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" style="padding:0;">
                        清华大学
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3" style="font-size: .3em;padding: 0">
                        收藏：<span>100W</span>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 10px;">
                    <div class="col-md-2 col-sm-2 col-xs-2">
                        <span class="ranking">1</span>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" style="padding:0;">
                        清华大学
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3" style="font-size: .3em;padding: 0">
                        收藏：<span>100W</span>
                    </div>
                </div>
            </div>-->
                <div>
                    <img src="/static/ymplant/img/zjia.png" style="width:100%;" alt=""/>
                </div>
            </div>
        </div>
    </div>
</div>
<script language="JavaScript">
    $(function(){
        sendRequest(ctxPath + "/plant/school/api/getschools", {}, "POST", function (res) {
            if(res.hasErrros){
                showError(res.errorMessage);
                return false;
            }
            $("#COUNT").text(res.data.totalRecord);
            setPage(res.data.results);
            $("#pagination").pagination({
                currentPage: (res.data.pageNumber + 1),
                totalPage: res.data.totalPage,
                callback: function (current) {
                    var param = {};
                    param.currentPage = current;

                    param.NAME = $("#NAME").val();
                    sendRequest(ctxPath + "/plant/school/api/getschools", param, "POST", function (res) {
                        if(res.hasErrros){
                            showError(res.errorMessage);
                            return false;
                        }
                        $("#COUNT").text(res.data.totalRecord);
                        setPage(res.data.results);
                    });
                }
            });
        });
        $(".province").click(function () {
            $(this).toggleClass("kd-hei");
            if($(this).attr("data-href") == "") {
                $(".province").each(function () {
                    if($(this).attr("data-href") != "") {
                        $(this).removeClass("kd-hei");
                    }
                });
            }
            if($(this).attr("data-href") != "" && $(this).hasClass("kd-hei")){
                $(".province").each(function () {
                    if($(this).attr("data-href") == "") {
                        $(this).removeClass("kd-hei");
                    }
                });
            }
        });

        $(".property").click(function () {
            $(this).toggleClass("kd-hei");
            if($(this).attr("data-href") == "") {
                $(".property").each(function () {
                    if($(this).attr("data-href") != "") {
                        $(this).removeClass("kd-hei");
                    }
                });
            }
            if($(this).attr("data-href") != "" && $(this).hasClass("kd-hei")){
                $(".property").each(function () {
                    if($(this).attr("data-href") == "") {
                        $(this).removeClass("kd-hei");
                    }
                });
            }
        });

        $(".arrangment").click(function () {
            $(this).toggleClass("kd-hei");
            if($(this).attr("data-href") == "") {
                $(".arrangment").each(function () {
                    if($(this).attr("data-href") != "") {
                        $(this).removeClass("kd-hei");
                    }
                });
            }
            if($(this).attr("data-href") != "" && $(this).hasClass("kd-hei")){
                $(".arrangment").each(function () {
                    if($(this).attr("data-href") == "") {
                        $(this).removeClass("kd-hei");
                    }
                });
            }
        });

        $(".subjecttype").click(function () {
            $(this).toggleClass("kd-hei");
            if($(this).attr("data-href") == "") {
                $(".subjecttype").each(function () {
                    if($(this).attr("data-href") != "") {
                        $(this).removeClass("kd-hei");
                    }
                });
            }
            if($(this).attr("data-href") != "" && $(this).hasClass("kd-hei")){
                $(".subjecttype").each(function () {
                    if($(this).attr("data-href") == "") {
                        $(this).removeClass("kd-hei");
                    }
                });
            }
        });
    });

    function searchByCondition() {
        var param = {};
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

        param.PROPERTY = "";

        $(".property").each(function () {
            if($(this).hasClass("kd-hei")) {
                param.PROPERTY += $(this).attr("data-href") + ",";
            }
        });

        if(param.PROPERTY != "") {
            param.PROPERTY = param.PROPERTY.substring(0, param.PROPERTY.length - 1);
        }

        param.ARRANGMENT = "";

        $(".arrangment").each(function () {
            if($(this).hasClass("kd-hei")) {
                param.ARRANGMENT += $(this).attr("data-href") + ",";
            }
        });

        if(param.ARRANGMENT != "") {
            param.ARRANGMENT = param.ARRANGMENT.substring(0, param.ARRANGMENT.length - 1);
        }

        sendRequest(ctxPath + "/plant/school/api/getschools", param, "POST", function (res) {
            if(res.hasErrros){
                showError(res.errorMessage);
                return false;
            }
            $("#COUNT").text(res.data.totalRecord);
            setPage(res.data.results);
        });
    }
    function searchScByName() {
        sendRequest(ctxPath + "/plant/school/api/getschools", {NAME: $("#NAME").val()}, "POST", function (res) {
            if(res.hasErrros){
                showError(res.errorMessage);
                return false;
            }
            $("#COUNT").text(res.data.totalRecord);
            setPage(res.data.results);
        });
    }

    function setPage(list) {
        var strHtml = "";
        for(var i = 0; i < list.length; i++){
            var school = list[i];
            strHtml += "<div class='university row'>";
            strHtml += "<a href='" + ctxPath + "/plant/school/details/" + school.SCHOOL_ID + "' target='_blank'>";
            strHtml += "<div class='col-xs-2 col-md-2 col-lg-2' style='min-width: 120px;' '>";
            strHtml += "<img style='width: 100px;height: 100px;' src='" + school.HEADURL + "' alt=''/>";
            strHtml += "</div>";
            strHtml += "</a>";
            strHtml += "<div class='col-xs-8 col-md-8 col-lg-8'>";
            strHtml += "<ul>";
            strHtml += "<li class='table_title'>";
            strHtml += "<a href='" + ctxPath + "/plant/school/details/" + school.SCHOOL_ID + "' target='_blank'>";
            strHtml += school.NAME;
            strHtml += "&nbsp;&nbsp;";
            for(var j = 0; j < school.properties.length; j++) {
                var property = school.properties[j];
                strHtml += "<span class='kd-" + property.DIC_ID + "' title='" + property.NAME + "'></span>";
            }
            strHtml += "</a>";
            strHtml += "&nbsp;&nbsp;";





            strHtml += "</li>";
            strHtml += "<li style='color: #636363'>";
            strHtml += "<a href='" + ctxPath + "/plant/school/details/" + school.SCHOOL_ID + "' target='_blank'>";
            strHtml += "<ul class='property_table'>";

            strHtml += "<li class='table_body' style='width: 20%'>";
            strHtml += "入驻人数：" + school.TEACOUNT + "人";
            strHtml += "</li>";

            strHtml += "<li class='table_body' style='width: 20%'>";
            strHtml += "地区：" + school.PROVINCE_VALUE;
            strHtml += "</li>";

            strHtml += "<li class='table_body' style='width: 20%'>";
            if(school.SCTYPE_VALUE == null)
                strHtml += "学校性质：暂无";
            else
                strHtml += "学校性质：" + school.SCTYPE_VALUE;
            strHtml += "</li>";

            strHtml += "<li class='table_body' style='width: 25%'>";
            if(school.CREATEDATE == null)
                strHtml += "创建时间：暂无";
            else
                strHtml += "创建时间：" + school.CREATEDATE + "年";
            strHtml += "</li>";

            strHtml += "<div class='clear'></div>";
            strHtml += "</ul>";
            strHtml += "</a>";
            strHtml += "</li>";
            strHtml += "<li>";

            for(var j = 0; j < school.subjecttypes.length; j++) {
                var subjecttype = school.subjecttypes[j];
                strHtml += "<span class='kd-" + subjecttype.DIC_ID + "' title='" + subjecttype.NAME + "'></span>";
            }
            strHtml += "</li>";
            strHtml += "</ul>";
            strHtml += "</div>";
            strHtml += "<div class='col-md-2 col-sm-2 col-xs-2' style='padding-top: 30px;'>";
            strHtml += "<span class='kd-yru'>";
            strHtml += "<input class='kd-wlshi' type='button' value='在线咨询'>";
            strHtml += "<ul class='kd-cxian'>";
            strHtml += "<li class='kd-lshi'>入驻老师</li>";
            strHtml += "<li class='formula'>";


            for(var j = 0; j < school.teachers.length; j++) {
                var teacher = school.teachers[j];
                strHtml += "<div class='row' style='margin: 0;border-bottom:1px solid #e3e3e3;'>";
                strHtml += "<div class='col-md-3 col-sm-3 col-xs-3' style='padding: 10px 10px 10px 25px;'>";
                if(teacher.HEADURL) {
                    strHtml += "<img src='" + teacher.HEADURL + "' class='portrai' alt=''>";
                }
                else{
                    strHtml += "<img src='/static/ymplant/img/timg.png' class='portrai' alt=''>";
                }
                strHtml += "</div>";
                strHtml += "<div class='col-md-5 col-sm-5 col-xs-5' style='padding: 0;text-align: left;padding-left: 10px;'>";
                if(teacher.NICKNAME){
                    strHtml += "<p style='color:#9EAAAA;font-size: 10px;margin-top: 10px'>" + teacher.NICKNAME + "</p>";
                }
                else{
                    strHtml += "<p style='color:#9EAAAA;font-size: 10px;margin-top: 10px'>暂无</p>";
                }
                strHtml += "<p style='color:#9EAAAA;font-size: 10px'>";
                if(teacher.JOBTYPE){
                    strHtml += "<span>" + teacher.JOBTYPE + "</span>";
                }
                else{
                    strHtml += "<span>暂无</span>";
                }
                strHtml += "</p>";
                strHtml += "</div>";
                strHtml += "<div class='col-md-3 col-sm-3 col-xs-3' style='padding: 0;'>";
                strHtml += "<p style='padding: 17px 0;'>";
                strHtml += "<a class='btn btn-info' href='<#if Session?? && Session.session_user_key??>${ctxPath}/plant/chat/page/student/" + teacher.USER_ID + "<#else>javascript:showError(\"请登录账号！\");</#if>'>咨 询</a>";
                strHtml += "</p>";
                strHtml += "</div>";
                strHtml += "</div>";
            }

            strHtml += "<div class='row' style='margin: 0;border-bottom:1px solid #e3e3e3;'>";
            strHtml += "<div class='col-md-3 col-sm-3 col-xs-3' style='padding: 10px 10px 10px 25px;'>";
            strHtml += "<img src='/static/ymplant/images/tubiao3/service.png' class='portrai' alt=''>";
            strHtml += "</div>";
            strHtml += "<div class='col-md-5 col-sm-5 col-xs-5' style='padding: 0;text-align: left;padding-left: 10px;'>";
            strHtml += "<p style='color:#9EAAAA;font-size: 10px;margin-top: 10px'>在线客服</p>";
            strHtml += "<p style='color:#9EAAAA;font-size: 10px'>";
            strHtml += "<span>院校咨询专员</span>";
            strHtml += "</p>";
            strHtml += "</div>";
            strHtml += "<div class='col-md-3 col-sm-3 col-xs-3' style='padding: 0;'>";
            strHtml += "<p style='padding: 17px 0;'>";
            strHtml += "<a class='btn btn-info' href='<#if Session.session_user_key?? && Session.session_user_key.USER_ID??>javascript:showError(\"当前无客服人员在线！\");<#else>javascript:showError(\"请先登录账号\");</#if>'>咨 询</a>";
            strHtml += "</p>";
            strHtml += "</div>";
            strHtml += "</div>";
            strHtml += "</li>";
            strHtml += "</ul>";
            strHtml += "</span>";
            strHtml += "</div>";
            strHtml += "</a>";
            strHtml += "</div>";
            /*strHtml += "<div class='col-md-3' style='margin-top: 5px;'>";
            if(school.STOREUP){
                strHtml += "<button class='shou'>已收藏</button>";
            }
            else{
                strHtml += "<button class='ceshi' onclick=storeUp('" + school.SCHOOL_ID + "');>收藏</button>";
            }
            strHtml += "</div>";*/
            strHtml += "</div>";
        }

        $(".xyuan").html(strHtml);
    }
</script>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>