<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/center.css?v=${v}"/>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/student/belongings.css?v=${v}"/>
</head>
<body class="corresponding">
<div class="lan" style="height: 854px">
    <p>我的物品</p>
    <div class="row" style="margin-left: 30px;">
        <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 20px 100px 20px 20px">

            <#--<p style="border-bottom:1px solid #CECECE;padding: 20px 0">-->
                <#--<img src="" alt="">-->
                <#--<span style="margin-left: 10px;">剩余金币：</span>-->
                <#--<span style="margin-left: 20px;"><#if pocket?? && pocket.BALANCE??>${pocket.BALANCE?c}<#else>0</#if></span><span>个</span>-->
            <#--</p>-->
            <#--<p style="border-bottom:1px solid #CECECE;padding: 20px 0">-->
                <#--<span style="margin-left: 10px;">院校咨询卡：</span>-->
                <#--<span style="margin-left: 20px;"><#if yxzxk??>${yxzxk?c}<#else>0</#if></span><span>个</span>-->
            <#--</p>-->
            <#--<p style="border-bottom:1px solid #CECECE;padding: 20px 0">-->
                <#--<span style="margin-left: 10px;">模拟填报卡：</span>-->
                <#--<span style="margin-left: 20px;"><#if mntbk??>${mntbk?c}<#else>0</#if></span><span>个</span>-->
            <#--</p>-->
            <#--<p style="border-bottom:1px solid #CECECE;padding: 20px 0">-->
                <#--<span style="margin-left: 10px;">智能推荐卡：</span>-->
                <#--<span style="margin-left: 20px;"><#if zntjk??>${zntjk?c}<#else>0</#if></span><span>个</span>-->
            <#--</p>-->
            <div class="row" style="border-top: 1px solid #CECECE;padding: 10px;">
                <div class="col-md-2 col-sm-2 col-xs-2">
                    <img src="/static/ymplant/images/tubiao5/gold.jpg" style="width: 88px;height: 88px;" alt="">
                </div>
                <div class="col-md-9 col-sm-9 col-xs-9" style="line-height: 30px;">
                    <p style="font-size: 16px;font-weight: bold;">金币</p>
                    <p>
                        <span>剩余金币：</span>
                        <span><#if pocket?? && pocket.BALANCE??>${pocket.BALANCE?c}<#else>0</#if></span><span>个</span>
                    </p>
                    <p>
                        <a style="color:#999;" href="javascript:void (0)">历史交易记录</a>
                    </p>
                </div>
            </div>
            <div class="row" style="border-top: 1px solid #CECECE;padding: 10px;">
                    <div class="col-md-2 col-sm-2 col-xs-2">
                        <img src="/static/ymplant/images/tubiao5/card.jpg" style="width: 88px;height: 88px;" alt="">
                    </div>
                    <div class="col-md-9 col-sm-9 col-xs-9" style="line-height: 30px;">
                        <p style="font-size: 16px;font-weight: bold;">院校咨询卡</p>
                        <p>
                            <span>院校咨询卡：</span>
                            <span><#if yxzxk??>${yxzxk?c}<#else>0</#if></span><span>张</span>
                        </p>
                        <p>
                            <a style="color:#999;" href="javascript:void (0)">历史交易记录</a>
                        </p>
                    </div>
                </div>
            <div class="row" style="border-top: 1px solid #CECECE;padding: 10px;">
                    <div class="col-md-2 col-sm-2 col-xs-2">
                        <img src="/static/ymplant/images/tubiao5/filling.jpg" style="width: 88px;height: 88px;" alt="">
                    </div>
                    <div class="col-md-9 col-sm-9 col-xs-9" style="line-height: 30px;">
                        <p style="font-size: 16px;font-weight: bold;">模拟填报卡</p>
                        <p>
                            <span>模拟填报卡：</span>
                            <span><#if mntbk??>${mntbk?c}<#else>0</#if></span><span>张</span>
                        </p>
                        <p>
                            <a style="color:#999;" href="javascript:void (0)">历史交易记录</a>
                        </p>
                    </div>
                </div>
            <div class="row" style="border-top: 1px solid #CECECE;border-bottom: 1px solid #CECECE;padding: 10px;">
                    <div class="col-md-2 col-sm-2 col-xs-2">
                        <img src="/static/ymplant/images/tubiao5/telligen.jpg" style="width: 88px;height: 88px;" alt="">
                    </div>
                    <div class="col-md-9 col-sm-9 col-xs-9" style="line-height: 30px;">
                        <p style="font-size: 16px;font-weight: bold;">智能推荐卡</p>
                        <p>
                            <span>智能推荐卡：</span>
                            <span><#if zntjk??>${zntjk?c}<#else>0</#if></span><span>张</span>
                        </p>
                        <p>
                            <a style="color:#999;" href="javascript:void (0)">历史交易记录</a>
                        </p>
                    </div>
                </div>
        </div>
    </div>
    <#--<p>历史交易记录</p>
    <div style="padding: 30px;">
        <div class="row mcheng">
            <div class="col-md-3 col-sm-3 col-xs-3">
                名称
            </div>
            <div class="col-md-3 col-sm-3 col-xs-3">
                价格
            </div>
            <div class="col-md-3 col-sm-3 col-xs-3">
                操作
            </div>
        </div>
        <div id="page"></div>
    </div>

    <nav style="text-align: center">
        <div id="pagination" class="page fl"></div>
    </nav>-->
</div>
<#--<script language="JavaScript">
    $(function () {
        getDatas();
    });

    var getDatas = function () {
        sendRequest(ctxPath + "/plant/user/api/getbuyrecs", {}, "POST", function (res) {
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
                    /*param.currentPage = current;

                    if($("#BMAJOR").attr("class") == "active"){
                        param.CODE = "BMAJOR";
                    }
                    if($("#ZMAJOR").attr("class") == "active"){
                        param.CODE = "ZMAJOR";
                    }*/
                    sendRequest(ctxPath + "/plant/teacher/api/getbuyrecs", param, "POST", function (res) {
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

        for(var i = 0; i < list.length; i++){
            var obj = list[i];

            strHtml += "<div class='row qhua'>";
            strHtml += "<div class='col-md-3 col-sm-3 col-xs-3'>";
            strHtml += obj.NAME;
            strHtml += "</div>";
            strHtml += "<div class='col-md-3 col-sm-3 col-xs-3'>";
            strHtml += obj.PRICE + "金币";
            strHtml += "</div>";
            strHtml += "<div class='col-md-3 col-sm-3 col-xs-3'>";
            strHtml += toLocalTime(obj.CREATETIME);
            strHtml += "</div>";
            strHtml += "</div>";
        }

        $("#page").html(strHtml);
    };
</script>-->
<script language="JavaScript">
    $(function () {
        parent.layer.close(parent.loader);
    });
</script>
</body>
</html>