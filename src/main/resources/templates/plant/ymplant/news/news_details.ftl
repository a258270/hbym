<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/details.css?v=${v}">
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">

<section class="kd-pagesection" style="padding-top: 30px;">
    <div class="container">
        <div class="col-md-8 col-sm-8 col-xs-8" style="margin-right: 30px">
            <div class="kd-blog-detail">

                <div class="inn-detail">
                    <#if article??>
                        <div>
                            <div style="margin-bottom: 26px">
                                <#--<span class="new">NEW</span>-->
                                <span style="font-size: 2em;font-weight: bold;font-family:楷体;"><#if article.TITLE??>${article.TITLE}<#else>暂无信息</#if></span>
                            </div>
                            <p class="kd-detailpost-option">编辑：<#if author.NAME??>${author.NAME}<#else>暂无信息</#if>丨发布时间:<#if article.CREATETIME??>${article.CREATETIME}<#else>暂无信息</#if></p>
                            <p></p>
                        ${article.CONTENT}
                            <p></p>
                        </div>
                    <#else>
                        暂无信息
                    </#if>
                </div>

            </div>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-3">

            <div class="widget widget-blogpost">
                <div class="kd-widget-title2">
                    公告
                    <img class="noticet" src="/static/ymplant/img/sye/tubiao/noticet.png" style="width:22px;height: 22px;" alt="">
                </div>
                <ul style="list-style: none">
                    <#if news_gg?? && (news_gg?size > 0)>
                    <#list news_gg as new_gg>
                        <li class="gonggao">
                            <div class="kd-post-info">
                                <h5>
                                    <a style="font-size: 14px;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical;" href="${ctxPath}/plant/news/details/${new_gg.NEWS_ID}" target="_blank">${new_gg.TITLE}</a>
                                </h5>
                                <time datetime="${new_gg.CREATETIME}" style="color: #999;font-size: 10px;">${new_gg.CREATETIME}</time>
                            </div>
                        </li>
                    </#list>
                    <#else>
                        <li class="gonggao">
                            <#--<figure style="float:left">-->
                                <#--<a href="javascript:void(0);">-->
                                    <#--<img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;" alt=""/>-->
                                <#--</a>-->
                            <#--</figure>-->
                            <div class="kd-post-info">
                                <h4>
                                    <a style="overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical;" href="javascript:void(0);">暂无信息</a>
                                </h4>
                            </div>
                        </li>
                    </#if>
                </ul>
            </div>

            <div class="widget widget-blogpost">
                <div class="kd-widget-title2">
                    热点新闻
                    <img class="noticet" src="/static/ymplant/img/sye/tubiao/hot.png" style="width:22px;height: 22px;" alt="">
                </div>
                <ul style="list-style: none">
                <#if news_rdxw?? && (news_rdxw?size > 0)>
                    <#list news_rdxw as new_rdxw>
                        <li class="gonggao">
                            <div class="kd-post-info">
                                <h5>
                                    <a style="overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical;" href="${ctxPath}/plant/news/details/${new_rdxw.NEWS_ID}" target="_blank">${new_rdxw.TITLE}</a>
                                </h5>
                                <time datetime="${new_rdxw.CREATETIME}" style="color: #999;font-size: 10px;">${new_rdxw.CREATETIME}</time>
                            </div>
                        </li>
                    </#list>
                <#else>
                    <li class="gonggao">
                        <figure style="float:left">
                            <a href="javascript:void(0);">
                                <img src="${ctxPath}/static/ymplant/img/timg.png" alt=""/>
                            </a>
                        </figure>
                        <div class="kd-post-info">
                            <h4>
                                <a href="javascript:void(0);">暂无信息</a>
                            </h4>
                        </div>
                    </li>
                    <li class="gonggao">
                        <figure style="float:left">
                            <a href="javascript:void(0);">
                                <img src="${ctxPath}/static/ymplant/img/timg.png" alt=""/>
                            </a>
                        </figure>
                        <div class="kd-post-info">
                            <h4>
                                <a href="javascript:void(0);">暂无信息</a>
                            </h4>
                        </div>
                    </li>
                    <li class="gonggao">
                        <figure style="float:left">
                            <a href="javascript:void(0);">
                                <img src="${ctxPath}/static/ymplant/img/timg.png" alt=""/>
                            </a>
                        </figure>
                        <div class="kd-post-info">
                            <h4>
                                <a href="javascript:void(0);">暂无信息</a>
                            </h4>
                        </div>
                    </li>
                </#if>
                </ul>
            </div>


            <div class="kd-widget-title2">
                往届活动
                <img class="noticet" src="/static/ymplant/img/sye/tubiao/xianxia.png" style="width:22px;height: 22px;" alt="">
            </div>
            <div class="row asdf" style="margin: 0">
                <#if news_wjhd?? && (news_wjhd?size > 0)>
                    <#list news_wjhd as new_wjhd>
                        <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 10px 0 0 0; ">
                            <a href="${ctxPath}/plant/news/details/${new_wjhd.NEWS_ID}" target="_blank">
                                <img src="${new_wjhd.IMGURL}" style="width: 55px;height:55px;padding-left:0;margin-bottom: 5px;" alt="">
                            </a>
                        </div>
                    </#list>
                <#else>
                    <div class="col-md-3">
                        <a href="javascript:void(0);">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;padding-left:0" alt="">
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="javascript:void(0);">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;padding-left:0" alt="">
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="javascript:void(0);">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;padding-left:0" alt="">
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="javascript:void(0);">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;padding-left:0" alt="">
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="javascript:void(0);">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;padding-left:0" alt="">
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="javascript:void(0);">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;padding-left:0" alt="">
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="javascript:void(0);">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;padding-left:0" alt="">
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="javascript:void(0);">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;padding-left:0" alt="">
                        </a>
                    </div>
                </#if>
            </div>
        </div>

    </div>
</section>



<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>