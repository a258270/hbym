<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/school/library.css?v=${v}"/>
    <style>
        .bxian{
            background-color: #ccc;
        }
        .asd{
            background-color: #fff;
        }
    </style>
    <script>
        $(function(){
            $(".hei").click(function(){
                $(this).toggleClass("bxian");
            });
        })
    </script>
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
<div class="kd-base" style="margin-top: 5px;">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-lg-3">
                <div class="provinces" style="margin-bottom: 30px">
                    <div class="shengf">
                        省份
                        <img class="province2" src="/static/ymplant/img/sye/tubiao/province.png" style="width:22px;height: 22px;" alt="">
                    </div>
                    <table class="anhui">
                        <tr>
                            <td class="selected"><a href="javascript:void(0);" class="province" data-href="">不限</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE1">北京</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE2">天津</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE22">重庆</a></td>
                        </tr>
                        <tr>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE9">上海</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE3">河北</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE4">山西</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE6">辽宁</a></td>
                        </tr>
                        <tr>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE7">吉林</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE8">黑龙江</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE10">江苏</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE11">浙江</a></td>
                        </tr>
                        <tr>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE12">安徽</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE13">福建</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE14">江西</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE15">山东</a></td>
                        </tr>
                        <tr>

                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE16">河南</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE17">湖北</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE18">湖南</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE19">广东</a></td>
                        </tr>
                        <tr>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE21">海南</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE23">四川</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE24">贵州</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE25">云南</a></td>
                        </tr>
                        <tr>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE27">陕西</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE28">甘肃</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE29">青海</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE5">内蒙古</a></td>
                        </tr>
                        <tr>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE20">广西</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE30">宁夏</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE31">新疆</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE26">西藏</a></td>
                        </tr>
                        <tr>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE33">香港</a></td>
                            <td><a href="javascript:void(0);" class="province" data-href="PROVINCE34">澳门</a></td>
                        </tr>
                    </table>
                </div>

                <div class="attribute" style="margin-bottom: 30px">
                    <div class="shengf">
                        属性
                        <img class="province2" src="/static/ymplant/img/sye/tubiao/attribute.png" style="width:22px;height: 22px;" alt="">
                    </div>
                    <table class="anhui">
                        <tbody>
                            <tr>
                                <td class="selected"><a href="javascript:void(0);" class="property" data-href="">不限</a></td>
                                <td><a href="javascript:void(0);" class="property" data-href="qdlfrqisbp">双一流</a></td>
                                <td><a href="javascript:void(0);" class="property" data-href="sdqwcrkfwt">985</a></td>
                                <td><a href="javascript:void(0);" class="property" data-href="p7uuy9sza3">211</a></td>
                            </tr>
                            <tr>
                                <td><a href="javascript:void(0);" class="property" data-href="4cqz1n7nvh">研究生</a></td>
                                <td><a href="javascript:void(0);" class="property" data-href="9ghnux2esv">卓越</a></td>
                                <td><a href="javascript:void(0);" class="property" data-href="02ypbyl4cd">省重点</a></td>
                                <td><a href="javascript:void(0);" class="property" data-href="m3vml9a83t">艺术生</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="batch" style="margin-bottom: 30px">
                    <div class="shengf">
                        批次
                        <img class="province2" src="/static/ymplant/img/sye/tubiao/batch.png" style="width:22px;height: 22px;" alt="">
                    </div>
                    <table class="anhui">
                        <tbody>
                        <tr>
                            <td class="selected"><a href="javascript:void(0);" class="arrangment" data-href="">不限</a></td>
                            <td><a href="javascript:void(0);" class="arrangment" data-href="hjj4e5vr0c">本一</a></td>
                            <td><a href="javascript:void(0);" class="arrangment" data-href="bdhsl11qtb">本二</a></td>
                            <td><a href="javascript:void(0);" class="arrangment" data-href="8sqm1urq5w">专科</a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="sort" style="margin-bottom: 30px">
                    <div class="shengf">
                        类别
                        <img class="province2" src="/static/ymplant/img/sye/tubiao/category.png" style="width:22px;height: 22px;" alt="">
                    </div>
                    <table class="anhui">
                        <tbody>
                        <tr>
                            <td class="selected"><a href="javascript:void(0);" class="subjecttype" data-href="">不限</a></td>
                            <td><a href="javascript:void(0);" class="subjecttype" data-href="d8r7gr81tw">综合类</a></td>
                            <td><a href="javascript:void(0);" class="subjecttype" data-href="np0yhn0ino">理工类</a></td>
                            <td><a href="javascript:void(0);" class="subjecttype" data-href="6m9ubgvqde">师范类</a></td>
                        </tr>
                        <tr>
                            <td><a href="javascript:void(0);" class="subjecttype" data-href="oabjf59odp">财经类</a></td>
                            <td><a href="javascript:void(0);" class="subjecttype" data-href="q35o8blqls">语言类</a></td>
                            <td><a href="javascript:void(0);" class="subjecttype" data-href="zoba187w7h">艺术类</a></td>
                            <td><a href="javascript:void(0);" class="subjecttype" data-href="nkuqcscoji">医药类</a></td>
                        </tr>
                        <tr>
                            <td><a href="javascript:void(0);" class="subjecttype" data-href="iqzujiwxf1">农林类</a></td>
                            <td><a href="javascript:void(0);" class="subjecttype" data-href="ccngwlobnk">政法类</a></td>
                            <td><a href="javascript:void(0);" class="subjecttype" data-href="xiq87rt0eh">体育类</a></td>
                            <td><a href="javascript:void(0);" class="subjecttype" data-href="9rxyeougpe">民族类</a></td>
                        </tr>
                        <tr>
                            <td><a href="javascript:void(0);" class="subjecttype" data-href="6ysjjc4c8i">军事类</a></td>
                            <td><a href="javascript:void(0);" class="subjecttype" data-href="b7egxlgsdk">其他类</a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <button style="width: 100%;background-color: #5BC0DE;color: #fff;border-radius: 4px;border: none;padding: 5px 10px; height: 33px;" onclick="searchScs();">搜 索</button>

            </div>
            <div class="col-md-9 col-lg-9">
                <div class="youbian">
                    <div class="xnae">
                        <input type="text" placeholder="请输入院校名称" id="NAME"/>
                        <button onclick="searchScByName();">搜 索</button>
                        <span style="float: right;font-weight: bold">共找到<span style="color: #5BC0DE" id="COUNT">0</span>所院校</span>
                    </div>
                    <div id="universities">
                    </div>
                    <div id="pagination" class="page_div"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script language="JavaScript">
    $(function () {
        searchScByName();

        $(".province").click(function () {
            $(this).parent().toggleClass("selected");
            if($(this).attr("data-href") == "") {
                $(".province").each(function () {
                    if($(this).attr("data-href") != "") {
                        $(this).parent().removeClass("selected");
                    }
                });
            }
            if($(this).attr("data-href") != "" && $(this).parent().attr("class") == "selected"){
                $(".province").each(function () {
                   if($(this).attr("data-href") == "") {
                       $(this).parent().removeClass("selected");
                   }
                });
            }
        });

        $(".property").click(function () {
            $(this).parent().toggleClass("selected");
            if($(this).attr("data-href") == "") {
                $(".property").each(function () {
                    if($(this).attr("data-href") != "") {
                        $(this).parent().removeClass("selected");
                    }
                });
            }
            if($(this).attr("data-href") != "" && $(this).parent().attr("class") == "selected"){
                $(".property").each(function () {
                    if($(this).attr("data-href") == "") {
                        $(this).parent().removeClass("selected");
                    }
                });
            }
        });

        $(".arrangment").click(function () {
            $(this).parent().toggleClass("selected");
            if($(this).attr("data-href") == "") {
                $(".arrangment").each(function () {
                    if($(this).attr("data-href") != "") {
                        $(this).parent().removeClass("selected");
                    }
                });
            }
            if($(this).attr("data-href") != "" && $(this).parent().attr("class") == "selected"){
                $(".arrangment").each(function () {
                    if($(this).attr("data-href") == "") {
                        $(this).parent().removeClass("selected");
                    }
                });
            }
        });

        $(".subjecttype").click(function () {
            $(this).parent().toggleClass("selected");
            if($(this).attr("data-href") == "") {
                $(".subjecttype").each(function () {
                    if($(this).attr("data-href") != "") {
                        $(this).parent().removeClass("selected");
                    }
                });
            }
            if($(this).attr("data-href") != "" && $(this).parent().attr("class") == "selected"){
                $(".subjecttype").each(function () {
                    if($(this).attr("data-href") == "") {
                        $(this).parent().removeClass("selected");
                    }
                });
            }
        });
    });

    function setPage(list) {
        var strHtml = "";
        for(var i = 0; i < list.length; i++) {
            var school = list[i];

            strHtml += "<div class='university row'>";
            strHtml += "<a href='" + ctxPath + "/plant/school/details/" + school.SCHOOL_ID + "' target='_blank'>";
            strHtml += "<div class='col-xs-2 col-md-2 col-lg-2' style='min-width: 120px;' '>";
            strHtml += "<img style='width: 100px;height: 100px;' src='" + school.HEADURL + "' alt=''/>";
            strHtml += "</div>";
            strHtml += "<div class='col-xs-9 col-md-9 col-lg-9'>";
            strHtml += "<ul>";
            strHtml += "<li class='table_title'>";
            strHtml += school.NAME;
            strHtml += "&nbsp;&nbsp;";
            for(var j = 0; j < school.properties.length; j++) {
                var property = school.properties[j];
                strHtml += "<span class='kd-" + property.DIC_ID + "' title='" + property.NAME + "'></span>";
            }
            strHtml += "</li>";
            strHtml += "<li style='color: #636363'>";
            strHtml += "<ul class='property_table'>";

            strHtml += "<li class='table_body' style='width:30%;'>";
            strHtml += "隶属：" + school.SUBJECTION;
            strHtml += "</li>";

            strHtml += "<li class='table_body' style='width:20%;'>";
            strHtml += "地区：" + school.PROVINCE_VALUE;
            strHtml += "</li>";

            strHtml += "<li class='table_body' style='width:20%;'>";
            if(school.SCTYPE_VALUE == null)
                strHtml += "学校性质：暂无";
            else
                strHtml += "学校性质：" + school.SCTYPE_VALUE;
            strHtml += "</li>";

            strHtml += "<li class='table_body' style='width:20%;'>";
            if(school.CREATEDATE == null)
                strHtml += "创建时间：暂无";
            else
                strHtml += "创建时间：" + school.CREATEDATE + "年";
            strHtml += "</li>";

            strHtml += "<div class='clear'></div>";
            strHtml += "</ul>";
            strHtml += "</li>";
            strHtml += "<li>";


            for(var j = 0; j < school.subjecttypes.length; j++) {
                var subjecttype = school.subjecttypes[j];
                strHtml += "<span class='kd-" + subjecttype.DIC_ID + "' title='" + subjecttype.NAME + "'></span>";
            }
            strHtml += "</li>";
            strHtml += "</ul>";
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

        $("#universities").html(strHtml);
    }

    function storeUp(index) {
        sendRequest(ctxPath + "/plant/school/api/storeup", {SCHOOL_ID: index}, "POST", function (res) {
            if(res.hasErrors){
                showError(res.errorMessage);
                return false;
            }

            showSuccess("收藏成功！");
        });
    }

    function searchScs() {
        sendRequest(ctxPath + "/plant/school/api/getschool", getParams(), "POST", function (res) {
            if(res.hasErrors) {
                showError(res.errorMessage);
                return false;
            }

            $("#COUNT").text(res.data.totalRecord);
            setPage(res.data.results);
            $("#pagination").pagination({
                currentPage: (res.data.pageNumber + 1),
                totalPage: res.data.totalPage,
                callback: function (current) {
                    var param = getParams();
                    param.currentPage = current;

                    sendRequest(ctxPath + "/plant/school/api/getschool", param, "POST", function (res) {
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
    }

    function getParams() {
        var provinces = "";
        var properties = "";
        var arrangments = "";
        var subjecttypes = "";

        $(".province").each(function () {
            if($(this).parent().attr("class") == "selected") {
                provinces += $(this).attr("data-href") + ",";
            }
        });

        $(".property").each(function () {
            if($(this).parent().attr("class") == "selected") {
                properties += $(this).attr("data-href") + ",";
            }
        });

        $(".arrangment").each(function () {
            if($(this).parent().attr("class") == "selected") {
                arrangments += $(this).attr("data-href") + ",";
            }
        });

        $(".subjecttype").each(function () {
            if($(this).parent().attr("class") == "selected") {
                subjecttypes += $(this).attr("data-href") + ",";
            }
        });

        if(provinces != "") provinces = provinces.substring(0, provinces.length - 1);
        if(properties != "") properties = properties.substring(0, properties.length - 1);
        if(arrangments != "") arrangments = arrangments.substring(0, arrangments.length - 1);
        if(subjecttypes != "") subjecttypes = subjecttypes.substring(0, subjecttypes.length - 1);

        return {provinces: provinces, properties: properties, arrangments: arrangments, subjecttypes: subjecttypes};
    }

    function searchScByName() {
        sendRequest(ctxPath + "/plant/school/api/getschool", {<#if param??>${param}<#else>NAME: $("#NAME").val()</#if>}, "POST", function (res) {
            if(res.hasErrors) {
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
                    sendRequest(ctxPath + "/plant/school/api/getschool", param, "POST", function (res) {
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
    }
</script>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>