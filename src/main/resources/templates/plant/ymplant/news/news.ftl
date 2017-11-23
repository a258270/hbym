<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/news.css?v=${v}">
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
<#--banner 开始-->
<#--<div class="kd-content">-->
    <#--<div class="container">-->
        <#--<div class="col-md-6">-->
            <#--<div class="juxing">-->
                <#--<div class="sanjiao"></div>-->
            <#--</div>-->
            <#--<div class="juxing" style="background-color: #96F9B6">-->
                <#--<div class="sanjiao" style="background-color: #96F9B6"></div>-->
            <#--</div>-->
        <#--</div>-->
        <#--<div class="col-md-6">-->
            <#--<div class="zjuxing" style="margin-top:18px;">-->
                <#--<div class="zsanjiao"></div>-->
            <#--</div>-->
            <#--<div class="zjuxing" style="margin-top: 60px; background-color: #FED845">-->
                <#--<div class="zsanjiao" style="background-color: #FED845"></div>-->
            <#--</div>-->
        <#--</div>-->
    <#--</div>-->
<#--</div>-->
<#--banner 结束-->

<#--公告 开始-->

<div class="kd-pagesection" id="gonggao">
    <div class="container" style="position: relative">
            <div class="gonggao kd-ydon">
                公告
                <img class="noticet" src="${ctxPath}/static/ymplant/img/sye/tubiao/noticet.png" style="width:22px;height: 22px;" alt="">
            </div>
        <div class="more">
            <a href="${ctxPath}/plant/news/more/news/1es852a5gv" target="_blank">
                <h4>更多>></h4>
            </a>
        </div>
        <div class="hengxian">
            <div class="row">
                <div class="col-md-6">
                    <figure class="experts col-md-4">
                        <#if firstNews_gg??>
                        <a href="${ctxPath}/plant/news/details/${firstNews_gg.NEWS_ID}" title="${firstNews_gg.TITLE}" style="color: #333;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical;" target="_blank">
                            <img src="${firstNews_gg.IMGURL}" style="margin-bottom: 20px" alt="">
                            <p>${firstNews_gg.TITLE}</p>
                        </a>
                        <#else>
                        <a href="javascript:void(0);" style="color: #333">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="margin-bottom: 20px" alt="">
                            <p style="font-weight: bold;">暂无信息</p>
                        </a>
                        </#if>
                    </figure>
                    <div class="oneti col-md-8" style="padding: 13px">
                        <ul class="menda">
                            <#if firstNewses_gg?? && (firstNewses_gg?size > 0)>
                                <#list firstNewses_gg as firstNews_gg>
                            <li class="row"">
                                <p class="col-md-9">
                                    <a href="${ctxPath}/plant/news/details/${firstNews_gg.NEWS_ID}" style="color: #000" target="_blank">${firstNews_gg.TITLE}</a>
                                </p>
                                <span class="col-md-3">${firstNews_gg.CREATETIME?string("yyyy-MM-dd")}</span>
                            </li>
                                </#list>
                            </#if>
                        </ul>
                    </div>
                 </div>
                <div class="col-md-6">
                    <figure class="experts col-md-4">
                        <#if secondNews??>
                            <a href="${ctxPath}/plant/news/details/${secondNews_gg.NEWS_ID}" target="_blank">
                                <img src="${secondNews_gg.IMGURL}" alt="">
                                <h3>${secondNews_gg.TITLE}</h3>
                            </a>
                        </#if>
                    </figure>
                    <div class="oneti col-md-8" style="padding: 13px">
                        <ul class="menda">
                        <#if secondNewses_gg?? && (secondNewses_gg?size > 0)>
                            <#list secondNewses_gg as secondNews_gg>
                                <li class="row"">
                                <h4 class="col-md-9">
                                    <a href="${ctxPath}/plant/news/details/${secondNews_gg.NEWS_ID}" style="color: #000" target="_blank">${secondNews_gg.TITLE}</a>
                                </h4>
                                <span class="col-md-3">${secondNews_gg.CREATETIME?string("yyyy-MM-dd")}</span>
                                </li>
                            </#list>
                        </#if>
                        </ul>
                    </div>
                </div>
                </div>

            </div>

        </div>
    </div>
<#--公告 结束-->

<#--高考动态 开始-->

<div class="kd-pagesection" id="consulting">
    <div class="container"  style="position: relative">
        <div class="row" style="margin: 0 -2px 0 0;">
            <div class="consulting col-md-3">
                高考动态
                <img class="noticet" style="width: 22px;height: 22px;" src="/static/ymplant/img/sye/tubiao/dongtai.png" alt="">
            </div>
        </div>
        <div class="more"style="position: absolute;top: 26px; right: 25px">
            <a href="${ctxPath}/plant/news/more/news/opsmpn8psb" target="_blank">
                <h4>更多>></h4>
            </a>
        </div>
        <div class="hengxian row">
            <div class="col-md-4">
                <#if firstNews_gkdt??>
                <a href="${ctxPath}/plant/news/details/${firstNews_gkdt.NEWS_ID}" style="overflow: hidden;ext-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical;" target="_blank">
                    <img src="${firstNews_gkdt.IMGURL}" style="width: 345px;height: 265px;" alt="">
                </a>
                <p style="margin: 5px">
                    <a href="${ctxPath}/plant/news/details/${firstNews_gkdt.NEWS_ID}" style="color: #000;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical;" target="_blank">
                        <p><#if firstNews_gkdt.TITLE??>${firstNews_gkdt.TITLE}<#else>暂无</#if></p>
                        <p style="color:#AFAFAF;">${firstNews_gkdt.CREATETIME?string("yyyy-MM-dd")}</p>
                    </a>
                </p>
                <#else>
                <a href="javascript:void(0);">
                    <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%" alt="">
                </a>
                <p style="font-weight: bold;margin: 20px 5px 5px 5px">
                    <a href="javascript:void(0);" style="color: #000">
                        <p style="font-weight: bold;">暂无信息</p>
                    </a>
                </p>
                </#if>
            </div>
            <div class="col-md-4">
                <ul>
                    <#if firstNewses_gkdt?? && (firstNewses_gkdt?size > 0)>
                        <#list firstNewses_gkdt as firstNews_gkdt>
                    <li class="row" style="border-bottom: 1px solid #C7C7C7;margin-bottom: 5px;padding-right: 10px;">
                        <div class="col-md-3" style="padding: 0 14px 5px 0">
                            <a href="${ctxPath}/plant/news/details/${firstNews_gkdt.NEWS_ID}" style="overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical;" target="_blank">
                                <img src="${firstNews_gkdt.IMGURL}" style="width: 78px;height: 65px;" alt="">
                            </a>
                        </div>
                        <div class="col-md-9" style="padding-left: 0">
                            <a href="/plant/news/details/${firstNews_gkdt.NEWS_ID}" style="overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical;" target="_blank">
                                <p style="color: #333;margin-top: 7px;"><#if firstNews_gkdt.TITLE??>${firstNews_gkdt.TITLE}<#else>暂无</#if></p>
                            </a>
                            <p style="color:#AFAFAF;margin-top:10px;">${firstNews_gkdt.CREATETIME?string("yyyy-MM-dd")}</p>
                            <#--<p style="color:#AFAFAF;">-->
                                <#--<i class="glyphicon glyphicon-eye-open"></i>-->
                                <#--${firstNews_gkdt.VIEWCOUNT}-->
                            <#--</p>-->
                        </div>
                    </li>
                        </#list>
                    </#if>
                </ul>
            </div>
            <div class="col-md-4">
                <#if secondNews_gkdt??>
                <#--<p style="margin-bottom: 18px">-->
                    <#--<a href="${ctxPath}/plant/news/details/${secondNews_gkdt.NEWS_ID}" style="color: #333;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical;" target="_blank">${secondNews_gkdt.TITLE}</a>-->
                <#--</p>-->
                </#if>
                <ul class="mend">
                    <#if secondNewses_gkdt?? && (secondNewses_gkdt?size > 0)>
                        <#list secondNewses_gkdt as secondNews_gkdt>
                    <li class="row kd-jju">

                        <p class="col-md-8">
                            <a href="${ctxPath}/plant/news/details/${secondNews_gkdt.NEWS_ID}" style="color: #000;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical;" target="_blank">${secondNews_gkdt.TITLE}</a>
                        </p>
                        <span class="col-md-4" style="text-align: right">${secondNews_gkdt.CREATETIME?string("yyyy-MM-dd")}</span>
                    </li>
                        </#list>
                    </#if>
                </ul>
            </div>
        </div>
    </div>
</div>
<#--新闻资讯 结束-->

<#--往届活动 开始-->

<div class="kd-pagesection" id="consulting">
    <div class="container"  style="position: relative">
        <div class="row" style="margin: 0">
            <div class="consulting col-md-3">
                线下活动
                <img class="noticet" src="/static/ymplant/img/sye/tubiao/xianxia.png" alt="">
            </div>
            <div class="more col-md-1" style="position: absolute;top: 26px; right: -10px">
                <a href="${ctxPath}/plant/news/more/news/x8jfplc17d" target="_blank">
                    <h4>更多>></h4>
                </a>
            </div>
        </div>
        <#--<div class="more" style="position: absolute;top: 50px; right: 15px">-->
            <#--<a href="javascript:void(0);">-->
                <#--<h4>更多>></h4>-->
            <#--</a>-->
        <#--</div>-->
        <div class="hengxian row">
            <div class="col-md-5">
                <#if firstNews_wjhd??>
                <a href="${ctxPath}/plant/news/details/${firstNews_wjhd.NEWS_ID}" style="overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical;" target="_blank">
                    <img src="${firstNews_wjhd.IMGURL}" style="width: 440px;height:300px;margin-bottom: 10px;" alt="">
                    <p style="color: #333">${firstNews_wjhd.TITLE}</p>
                </a>
                <#else>
                <a href="javascript:void(0);">
                    <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;margin-bottom: 10px;" alt="">
                    <p style="color: #333">暂无信息</p>
                </a>
                </#if>
            </div>
            <div class="col-md-7">
                <div class="row">
                    <#if firstNewses_wjhd?? && (firstNewses_wjhd?size > 0)>
                        <#list firstNewses_wjhd as firstNews_wjhd>
                    <div class="col-md-4" style="margin-bottom: 10px">
                        <a href="${ctxPath}/plant/news/details/${firstNews_wjhd.NEWS_ID}" style="overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical;" target="_blank">
                            <img src="${firstNews_wjhd.IMGURL}" style="width: 190px;height: 130px; margin-bottom: 10px" alt="">
                            <p style="color: #333;">${firstNews_wjhd.TITLE}</p>
                        </a>
                    </div>
                        </#list>
                    </#if>
                </div>
            </div>
        </div>
    </div>
</div>

<#--往届活动 结束-->



<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>