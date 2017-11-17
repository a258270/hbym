<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/pertde/pertde.css?v=${v}"/>
</head>
<body style="height: 100%">
<#include "${ctxPath}/plant/ymplant/top.ftl">
    <div class="kd-bjin">
        <div class="kd-zjt">
            <div class="row" style="width: 500px">
                <#if experts?? && (experts?size > 0)>
                    <#list experts as expert>
                        <div class="col-md-3 col-sm-3 col-xs-3" style="margin-bottom: 30px;">
                            <div class="kd-yge">
                                <img src="<#if expert.HEADURL??>${expert.HEADURL}<#else>/static/ymplant/img/timg.png</#if>" style="width:90px;height: 90px;border-radius: 50%;" alt=""/>
                                <ul class="kd-zliao">
                                    <li class="kd-mzi"><#if expert.NICKNAME??>${expert.NICKNAME}<#else>暂无信息</#if></li>
                                    <li style="padding: 15px;font-weight: bold;">
                                        <p class="kd-yse">
                                            <span>从业经验：</span>
                                            <span><#if expert.JOBDATE??>${expert.JOBDATE_VALUE}<#else>暂无</#if></span>
                                        </p>
                                        <#--<p class="kd-yse">
                                            <span>咨询人数：</span>
                                            <span>50</span>
                                            <span>人</span>
                                        </p>-->
                                        <div class="kd-yse row" style="margin: 0">
                                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 0">指导方向：</div>
                                            <div class="col-md-8 col-sm-8 col-xs-8" style="padding: 0;font-size: 14px;line-height: 1.7">
                                                <span class="kd-fx" style="background: #F1823A;">职业规划</span>
                                                <span class="kd-fx" style="background: #F1823A;">心理咨询</span>
                                                <span class="kd-fx" style="background: #00A1E2;">志愿填报</span>
                                            </div>
                                        </div>
                                        <p class="kd-yse">
                                            <span>咨询价格：</span>
                                            <span style="color: #B43843;font-size: 18px;">¥</span>
                                            <span style="color: #B43843;font-size: 18px;"><#if expert.PRICE??>${expert.PRICE?c}<#else>暂无</#if></span>
                                        </p>
                                        <p class="kd-yse">
                                            <span>联系方式：</span>
                                            <span><#if expert.complete?? && expert.complete.PHONE??>${expert.complete.PHONE}<#else>暂无</#if></span>
                                        </p>
                                        <#--<div class="kd-jjie">
                                            <p>个人简介</p>
                                            <p>问：据报道，俄罗斯外长拉夫罗夫20日在莫斯科核不扩散会议上称，解决半岛危机需要积极外交努力，当前主要目标是防止爆发军事冲突，否则将不可避免引发大规模灾难。</p>
                                        </div>-->
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </#list>
                <#else>
                    <p style="color: #FFFFFF;font-weight: bolder;text-align: center;">暂无专家团入驻</p>
                </#if>
            </div>
        </div>
    </div>
    <#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>