<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/major/library.css?v=${v}">
    <#--<script>-->
        <#--$(document).ready(function(){-->
            <#--$("#bke").click(function(){-->
                <#--alert("1");-->
                <#--$("#zxue").show();-->
                <#--$("#fxue").hide();-->
            <#--});-->
            <#--$("#zke").click(function(){-->
                <#--alert("2");-->
                <#--$("#fxue").show();-->
                <#--$("#zxue").hide();-->
            <#--});-->
        <#--})-->
    <#--</script>-->
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
    <div class="kd-professional">
        <div class="container">
            <div class="row">
                <!--左边栏 开始-->
                <div class="col-md-3 col-sm-3 col-xs-3">
                    <!--类别 开始-->
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="spot">
                                专业类别
                                <img class="province2" src="/static/ymplant/img/sye/tubiao/category.png" style="width:22px;height: 22px;" alt="">
                                <ul class="nav nav-tabs bke" id="bke" role="tablist">
                                    <select class="selectbox" id="selectbox">
                                        <option value="bke2">本科</option>
                                        <option value="bke3">专科</option>
                                    </select>
                                    <#--<li class="active" id="BMAJOR">
                                        <a href="#bke2" class="active" id="bke1" aria-controls="home" role="tab" data-toggle="tab" aria-expanded="true" onclick="setSearch(0)">
                                            本科
                                        </a>
                                    </li>
                                    <li id="ZMAJOR">
                                        <a href="#bke3" class="" id="zke" aria-controls="settings" role="tab" data-toggle="tab" onclick="setSearch(1);">
                                            专科
                                        </a>
                                    </li>-->
                                </ul>
                            </div>
                            <#--<div class="col-md-6 col-sm-6 col-xs-6" style="padding: 0">-->

                            <#--</div>-->
                        </div>
                    </div>
                    <!--类别 结束-->

                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="bke2" style="margin-bottom: 20px;">
                            <table role="tabpanel" class="anhui active">
                            <#if bmajors?? && (bmajors?size > 0)>
                                <#list bmajors as bmajor>
                                    <tr>
                                        <#list bmajor as bmajorObj>
                                            <td><a href="javascript:void(0);" class="bster" data-href="${bmajorObj.DIC_ID}">${bmajorObj.NAME}</a></td>
                                        </#list>
                                    </tr>
                                </#list>
                            <#else>
                                暂无信息
                            </#if>
                            </table>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="bke3" style="margin-bottom: 20px;">
                            <table role="tabpanel" class="anhui">
                            <#if zmajors?? && (zmajors?size > 0)>
                                <#list zmajors as zmajor>
                                    <tr>
                                        <#list zmajor as zmajorObj>
                                            <td><a href="javascript:void(0);" class="zster" data-href="${zmajorObj.DIC_ID}">${zmajorObj.NAME}</a></td>
                                        </#list>
                                    </tr>
                                </#list>
                            <#else>
                                暂无信息
                            </#if>
                            </table>
                        </div>
                    </div>

                    <!--热门 开始-->
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="spot">
                                热门
                                <img class="province2" src="/static/ymplant/img/sye/tubiao/hot.png" style="width:22px;height: 22px;" alt="">
                                <ul class="nav nav-tabs bke" id="bket" role="tablist">
                                    <select class="selectbox">
                                        <option value="bke4">本科</option>
                                        <option value="bke5">专科</option>
                                    </select>
                                    <#--<li class="active">
                                        <a href="#bke4" class="toptab active" aria-controls="homea" role="tab" data-toggle="tab"  aria-expanded="true">
                                            本科
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#bke5" class="toptab" aria-controls="settingsa" role="tab" data-toggle="tab">
                                            专科
                                        </a>
                                    </li>-->
                                </ul>
                            </div>
                        </div>
                    </div>
                    <#--<div class="col-md-6 col-sm-6 col-xs-6" style="padding: 0">-->

                    <#--</div>-->
                    <!--热门 结束-->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" style="margin: 5px 0 20px;" id="bke4">
                            <#--<div role="tabpanel">1</div>-->
                                <#if btopMajors?? && (btopMajors?size > 0)>
                                    <#list btopMajors as btopMajor>
                                    <#if (btopMajor_index < 3)>
                                    <div class="row" style="margin-bottom: 10px;">
                                        <div class="col-md-8 col-sm-8 col-xs-8 rmen">
                                            <span style="background-color: #33c9b5;padding: 2px 5px;color: #fff">${btopMajor_index + 1}</span>
                                            <a href="${ctxPath}/plant/major/details/${btopMajor.DIC_ID}" target="_blank">${btopMajor.NAME}</a>
                                        </div>
                                        <div class="col-md-4 col-sm-4 col-xs-4">
                                        <span>
                                            <img src="${ctxPath}/static/ymplant/images/fire.png" style="width: 20%" alt=""/>
                                            ${btopMajor.VIEWCOUNT}
                                        </span>
                                        </div>
                                    </div>
                                    </#if>
                                    <#if (btopMajor_index >= 3)>
                                    <div class="row" style="margin-bottom: 10px;">
                                        <div class="col-md-8 col-sm-8 col-xs-8 rmen">
                                            <span style="background-color: #B4B4B4;padding: 2px 5px;color: #fff">${btopMajor_index + 1}</span>
                                            <a href="${ctxPath}/plant/major/details/${btopMajor.DIC_ID}" target="_blank">${btopMajor.NAME}</a>
                                        </div>
                                        <div class="col-md-4 col-sm-4 col-xs-4">
                                        <span>
                                            <img src="${ctxPath}/static/ymplant/images/fire.png" style="width: 20%" alt=""/>
                                            ${btopMajor.VIEWCOUNT}
                                        </span>
                                        </div>
                                    </div>
                                    </#if>
                                    </#list>
                                <#else>
                                暂无信息
                                </#if>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="bke5" style="margin: 5px 0 20px;">
                            <#--<div role="tabpanel">2</div>-->
                            <#if ztopMajors?? && (ztopMajors?size > 0)>
                                <#list ztopMajors as ztopMajor>
                                    <#if (ztopMajor_index < 3)>
                                        <div class="row" style="margin-bottom: 10px;">
                                            <div class="col-md-8 col-sm-8 col-xs-8 rmen">
                                                <span style="background-color: #33c9b5;padding: 2px 5px;color: #fff">1</span>
                                                <a href="${ctxPath}/plant/major/details/${ztopMajor.DIC_ID}" target="_blank">${ztopMajor.NAME}</a>
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                        <span>
                                            <img src="${ctxPath}/static/ymplant/images/fire.png" style="width: 20%" alt=""/>
                                            ${ztopMajor.VIEWCOUNT}
                                        </span>
                                            </div>
                                        </div>
                                    </#if>
                                    <#if (ztopMajor_index >= 3)>
                                        <div class="row" style="margin-bottom: 10px;">
                                            <div class="col-md-8 col-sm-8 col-xs-8 rmen">
                                                <span style="background-color: #B4B4B4;padding: 2px 5px;color: #fff">4</span>
                                                <a href="${ctxPath}/plant/major/details/${ztopMajor.DIC_ID}" target="_blank">${ztopMajor.NAME}</a>
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                        <span>
                                            <img src="${ctxPath}/static/ymplant/images/fire.png" style="width: 20%" alt=""/>
                                        ${ztopMajor.VIEWCOUNT}
                                        </span>
                                            </div>
                                        </div>
                                    </#if>
                                </#list>
                            <#else>
                                暂无信息
                            </#if>
                        </div>
                    </div>
                </div>
                <!--左边栏 结束-->

                <!--搜索框 开始 -->
                <div class="col-md-9 col-sm-9 col-xs-9">
                    <div class="frame">
                        <div class="xnae">
                            <input type="text" placeholder="请输入专业名称" id="NAME"/>
                            <button onclick="searchMjByName();">搜 索</button>
                        </div>
                        <div id="page"></div>
                    </div>
                    <nav style="text-align: center">
                        <div id="pagination" class="page fl"></div>
                    </nav>
                </div>
                <!--搜索框 结束-->
            </div>
        </div>
    </div>
<script>
$(function() {
    getDatas();

    $(".bster").click(function () {
        var href = $(this).attr("data-href");
        $(this).parent().toggleClass("hei");
        if($(this).parent().hasClass("hei")){
            $(".bster").each(function () {
                if($(this).attr("data-href") != href)
                    $(this).parent().removeClass("hei");
            });

            setSearch(0);
        }
    });

    $(".zster").click(function () {
        var href = $(this).attr("data-href");
        $(this).parent().toggleClass("hei");
        if($(this).parent().hasClass("hei")){
            $(".zster").each(function () {
                if($(this).attr("data-href") != href)
                    $(this).parent().removeClass("hei");
            });

            setSearch(1);
        }
    });

    $(".selectbox").change(function () {
        if($(this).val() == "bke2"){
            setSearch(0);
        }

        if($(this).val() == "bke3"){
            setSearch(1);
        }
        if($(this).val() == "bke2" || $(this).val() == "bke3"){
            $("#bke2").hide();
            $("#bke3").hide();
            $("#" + $(this).val()).toggle();
        }

        if($(this).val() == "bke4" || $(this).val() == "bke5"){
            $("#bke4").hide();
            $("#bke5").hide();
            $("#" + $(this).val()).toggle();
        }
    });
});

var setSearch = function (index) {
    if(index == 0) {
        var param = {CODE: "BMAJOR"};
        var parent_id = "";
        $(".bster").each(function () {
            if($(this).parent().hasClass("hei")){
                parent_id = $(this).attr("data-href");
            }
        });

        if(parent_id != "")
            param.PARENT_ID = parent_id;

        sendRequest(ctxPath + "/plant/major/api/getmajors", param, "POST", function (res) {
            if(res.hasErrros){
                showError(res.errorMessage);
                return false;
            }

            setPage(res.results);
            $("#pagination").pagination({
                currentPage: (res.pageNumber + 1),
                totalPage: res.totalPage,
                callback: function (current) {
                    var param = {};
                    param.currentPage = current;

                    if($("#selectbox").val() == "bke2") {
                        param.CODE = "BMAJOR";
                    }
                    if($("#selectbox").val() == "bke3") {
                        param.CODE = "ZMAJOR";
                    }
                    sendRequest(ctxPath + "/plant/major/api/getmajors", param, "POST", function (res) {
                        if(res.hasErrros){
                            showError(res.errorMessage);
                            return false;
                        }

                        setPage(res.results);
                    });
                }
            });
        });
    }
    else if(index == 1) {
        var param = {CODE: "ZMAJOR"};
        var parent_id = "";
        $(".zster").each(function () {
            if($(this).parent().hasClass("hei")){
                parent_id = $(this).attr("data-href");
            }
        });

        if(parent_id != "")
            param.PARENT_ID = parent_id;
        sendRequest(ctxPath + "/plant/major/api/getmajors", param, "POST", function (res) {
            if(res.hasErrros){
                showError(res.errorMessage);
                return false;
            }

            setPage(res.results);
            $("#pagination").pagination({
                currentPage: (res.pageNumber + 1),
                totalPage: res.totalPage,
                callback: function (current) {
                    var param = {};
                    param.currentPage = current;

                    if($("#selectbox").val() == "bke2") {
                        param.CODE = "BMAJOR";
                    }
                    if($("#selectbox").val() == "bke3") {
                        param.CODE = "ZMAJOR";
                    }
                    sendRequest(ctxPath + "/plant/major/api/getmajors", param, "POST", function (res) {
                        if(res.hasErrros){
                            showError(res.errorMessage);
                            return false;
                        }

                        setPage(res.results);
                    });
                }
            });
        });
    }
};

var getDatas = function () {
    var param = {};

    if($("#selectbox").val() == "bke2") {
        param.CODE = "BMAJOR";
    }
    if($("#selectbox").val() == "bk3") {
        param.CODE = "ZMAJOR";
    }
    sendRequest(ctxPath + "/plant/major/api/getmajors", param, "POST", function (res) {
        if(res.hasErrros){
            showError(res.errorMessage);
            return false;
        }

        setPage(res.results);
        $("#pagination").pagination({
            currentPage: (res.pageNumber + 1),
            totalPage: res.totalPage,
            callback: function (current) {
                var param = {};
                param.currentPage = current;

                if($("#selectbox").val() == "bke2") {
                    param.CODE = "BMAJOR";
                }
                if($("#selectbox").val() == "bke3") {
                    param.CODE = "ZMAJOR";
                }
                sendRequest(ctxPath + "/plant/major/api/getmajors", param, "POST", function (res) {
                    if(res.hasErrros){
                        showError(res.errorMessage);
                        return false;
                    }

                    setPage(res.results);
                });
            }
        });
    });
};

var setPage = function (list) {
    var strHtml = "";
    var headDiv = "<div class='learn' style='border-bottom:1px solid #ccc;padding:10px;margin-bottom:10px'>";

    for(var i = 0; i < list.length; i++){
        strHtml += headDiv;
        var obj = list[i];
        var topTitle = "<h4 style='margin-bottom:10px;font-weight:bold'>";
        var title = obj.NAME;
        strHtml += topTitle + title + "(" + obj.CODE + ")" + "</h4>";
        strHtml += "<div>";
        if(typeof(obj.childs) != "undefined"){
            for(var j = 0; j < obj.childs.length; j++){
                var obj2 = obj.childs[j];
                strHtml += "<p style='font-weight:700;margin:0'>";
                strHtml += obj2.NAME + "(" + obj2.CODE + ")";
                strHtml += "</p>";
                strHtml += "<div class='row'>";
                if(typeof(obj2.childs) != "undefined"){
                    for(var x = 0; x < obj2.childs.length; x++){
                        var obj3 = obj2.childs[x];
                        strHtml += "<div class='col-md-3 col-sm-3 col-xs-3' style='text-align:center;margin-top:10px;padding: 0 5px;height: 35px;font-size: 14px;'>";
                        strHtml += "<a style='color: #333;text-decoration: none;' href='${ctxPath}/plant/major/details/" + obj3.DIC_ID + "' target='_blank'>";
                        strHtml += "<p style='margin:0'>";
                        strHtml += obj3.NAME;
                        strHtml += "</p>";
                        strHtml += "</a>";
                        strHtml += "</div>";
                    }
                }
                strHtml += "</div>";
            }
        }
        strHtml += "</div>";
        strHtml += "</div>";
    }

    $("#page").html(strHtml);
};

var searchMjByName = function () {
    var param = {};

    if($("#selectbox").val() == "bke2") {
        param.CODE = "BMAJOR";
    }
    if($("#selectbox").val() == "bke3") {
        param.CODE = "ZMAJOR";
    }
    param.NAME = $("#NAME").val();
    sendRequest(ctxPath + "/plant/major/api/getmajors", param, "POST", function (res) {
        if(res.hasErrros){
            showError(res.errorMessage);
            return false;
        }

        setPage(res.results);
        $("#pagination").pagination({
            currentPage: (res.pageNumber + 1),
            totalPage: res.totalPage,
            callback: function (current) {
                var param = {};
                param.currentPage = current;

                if($("#selectbox").val() == "bke2") {
                    param.CODE = "BMAJOR";
                }
                if($("#selectbox").val() == "bke3") {
                    param.CODE = "ZMAJOR";
                }
                param.NAME = $("#NAME").val();
                sendRequest(ctxPath + "/plant/major/api/getmajors", param, "POST", function (res) {
                    if(res.hasErrros){
                        showError(res.errorMessage);
                        return false;
                    }

                    setPage(res.results);
                });
            }
        });
    });
};

</script>
<#--<script src="js/bootstrap.js"></script>-->
    <#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>