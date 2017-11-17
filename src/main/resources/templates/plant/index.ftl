<!DOCTYPE html>
<html>
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?11523d4c0423a54ba580eb05e7edee8d";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/index-two.css?v=${v}"/>
    <script>
        $(document).ready(function(){
            $(".xyi").show(2000);
        })
    </script>
    <#--<script>-->
        <#--$(document).ready(function(){-->
            <#--$(".zyi").animate({-->
                <#--right:'68'-->
            <#--});-->
            <#--$(".yyi").animate({-->
                <#--left:'60'-->
            <#--});-->
            <#--$(".xyi").animate({-->
                <#--right:'68'-->
            <#--});-->
        <#--});-->
    <#--</script>-->
</head>
<body>
<div style="background-color: #ff8;border-bottom: 1px solid gray; display: none;" id="browseTip">
    <div class="container" style="padding: 10px 80px;text-align: center;font-weight: bold;font-size: 18px;">
        您的浏览器版本太低，将不能正常浏览知乎。请升级 <a href="http://windows.microsoft.com/zh-CN/internet-explorer/downloads/ie">Internet Explorer</a> 或使用
        <a href="http://www.google.com/chrome/">Google Chrome </a>浏览器。
        如果您在使用双核浏览器，请切换到高速 / 极速 / 神速核心。
    </div>
</div>

<#include "${ctxPath}/plant/ymplant/top.ftl">
    <div class="kd-map bakg">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <#--<div class="xdui">-->
                        <#--<div class="zyi">-->
                        <#--&lt;#&ndash;<div class="juxing">&ndash;&gt;-->
                        <#--&lt;#&ndash;<div class="sanjiao"></div>&ndash;&gt;-->
                        <#--&lt;#&ndash;</div>&ndash;&gt;-->
                            <#--<img src="/static/ymplant/images/tubiao3/4-1.png" alt="">-->
                        <#--</div>-->
                        <#--<div class="yyi">-->
                        <#--&lt;#&ndash;<div class="zjuxing">&ndash;&gt;-->
                        <#--&lt;#&ndash;<div class="zsanjiao"></div>&ndash;&gt;-->
                        <#--&lt;#&ndash;</div>&ndash;&gt;-->
                            <#--<img src="/static/ymplant/images/tubiao3/4-2.png" alt="">-->
                        <#--</div>-->
                        <#--<div class="xyi">-->
                        <#--&lt;#&ndash;<div class="juxing" style="background-color: #96F9B6">&ndash;&gt;-->
                        <#--&lt;#&ndash;<div class="sanjiao" style="background-color: #96F9B6;"></div>&ndash;&gt;-->
                        <#--&lt;#&ndash;</div>&ndash;&gt;-->
                            <#--<img src="/static/ymplant/images/tubiao3/4-3.png" alt="">-->
                        <#--</div>-->
                    <#--</div>-->
                </div>


                <div class="col-md-2 col-sm-2 col-xs-2" style="padding: 0">
                <#--<img src="/static/ymplant/img/sye/white.png" style="width: 100%;height: 100%;" alt=""/>-->
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <div class="distance">
                        <p class="also"><#if distanceExam == 0>高考进行中<#else>距离高考还有<span>${distanceExam}</span>天</#if></p>
                        <div class="row" style="margin: 0;font-size: 12px;">
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <span style="color: #fff;font-size: 1.5em">分数：<#if exam?? && exam.EXAMSCORE??>${exam.EXAMSCORE}分<#else>暂无</#if></span>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding: 0;">
                                <span style="color: #fff;font-size: 1.5em">科类：<#if exam?? && exam.MAJORTYPE_VALUE??>${exam.MAJORTYPE_VALUE}<#else>暂无</#if></span>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="margin: 15px 0;">
                                <span style="color: #fff;font-size: 1.5em">批次：</span>
                                <select style="width:60px;border: #fff;padding: 3px 0;" id="arrangment">
                                <#--<#if arrangments?? && (arrangments?size > 0)>-->
                                    <#--<#list arrangments as arrangment>-->
                                        <#--<option value="${arrangment.DIC_ID}">${arrangment.NAME}</option>-->
                                    <#--</#list>-->
                                <#--</#if>-->
                                    <option value="hjj4e5vr0c">本一</option>
                                    <option value="bdhsl11qtb">本二</option>
                                </select>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="margin: 15px 0;padding: 0;">
                                <span style="color: #fff;font-size: 1.5em;">院校地区：</span>
                                <select style="border: #fff;padding: 3px 0;" id="province">
                                <#if provinces?? && (provinces?size > 0)>
                                    <#list provinces as province>
                                        <option value="${province.DIC_ID}">${province.NAME}</option>
                                    </#list>
                                </#if>
                                </select>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <a class="paper" href="<#if Session.session_user_key?? && Session.session_user_key.ROLE_ID??><#if Session.session_user_key.ROLE_ID == 'sja4gc59bg'>javascript:toReport();<#else>javascript:showError('请确认账号为学生身份');</#if><#else>javascript:showError('请先登录账号');</#if>">智能推荐</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mportant">
    <div class="container">
        <!--重要公告 开始-->
        <div class="cement">
            <div class="row">
                <#--<div class="col-xs-1 col-md-1 col-lg-1">-->
                    <#--公告：-->
                <#--</div>-->
                <div class="col-md-12 col-xs-12 col-md-12 col-lg-12">
                    <#--<marquee scrollamount="10" scrolldelay="100" onMouseOver="this.scrollDelay=500" onMouseOut="this.scrollDelay=1"  width="100%" onmouseover="this.stop()" onmouseout="this.start()">-->
                    <marquee scrollamount="5" scrolldelay="1"  width="100%" style="width: 100%;" onmouseover="this.stop()" onmouseout="this.start()">
                    <#if news_gg?? && (news_gg?size > 0)>
                        <#list news_gg as ggObj>
                            <a style="margin-right: 100%;text-decoration: none;color: #fff;" href="${ctxPath}/plant/news/details/${ggObj.NEWS_ID}" target="_blank">公告：${ggObj.TITLE}</a>
                        </#list>
                    </#if>
                    </marquee>
                </div>
            </div>
        </div>
        <!--重要公告 结束-->
        <!--专家团 开始-->
        <#--<div class="group">-->
            <#--<div class="gdui">-->
                <#--<span style="font-weight: bold;color: #BD2B2C;">专 &nbsp;家 &nbsp;团</span>-->
            <#--</div>-->
            <#--<ul style="padding: 10px 30px">-->
            <#--<#if experts?? && (experts?size > 0)>-->
                <#--<#list experts as expert>-->
                    <#--<li class="formula">-->
                        <#--<div class="row" style="margin: 0">-->
                            <#--<div class="col-md-4 col-sm-4 col-xs-4" style="padding: 0;">-->
                                <#--<img src="<#if expert.HEADURL??>${expert.HEADURL}<#else>/static/ymplant/img/timg.png</#if>" class="portrai" alt=""/>-->
                            <#--</div>-->
                            <#--<div class="col-md-5 col-sm-5 col-xs-5" style="padding: 0">-->
                                <#--<p style="color:#9EAAAA;font-size: 10px;margin-bottom: 10px"><#if expert.NICKNAME??>${expert.NICKNAME}<#else>暂无</#if></p>-->
                                <#--<p style="color:#9EAAAA;font-size: 10px">-->
                                    <#--<span><#if expert.JOBDATE_VALUE??>${expert.JOBDATE_VALUE}</#if></span>&lt;#&ndash;丨&ndash;&gt;-->
                                <#--&lt;#&ndash;<img src="/static/ymplant/images/tubiao/yhu.png" style="width: 20%" alt=""/>-->
                                <#--<span>32</span>&ndash;&gt;-->
                                <#--</p>-->
                            <#--</div>-->
                            <#--<div class="col-md-3 col-sm-3 col-xs-3" style="padding: 0;">-->
                                <#--<p style="color:#A53D3C;font-family: 微软雅黑;font-weight: bold">￥<span>${expert.PRICE?c}</span></p>-->
                                <#--<p>-->
                                    <#--<a class="make" href="${ctxPath}/plant/expert/index" target="_blank">预 约</a>-->
                                <#--</p>-->
                            <#--</div>-->
                        <#--</div>-->
                    <#--</li>-->
                <#--</#list>-->
            <#--<#else>-->
                <#--暂无专家入驻-->
            <#--</#if>-->
                <#--<div class="clear"></div>-->
            <#--</ul>-->
        <#--</div>-->
        <!--专家团 结束-->
        <!--轮播图 开始-->
        <div class="row" style="margin: 0">
            <div class="col-md-6 col-sm-6 col-xs-6" style="padding: 0">
                <div style="margin-bottom: 20px" id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- 地下小点 -->
                    <ol class="carousel-indicators kd-dian" style="bottom:-5px;">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                    </ol>

                    <!-- 图片-->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active left">
                            <img src="/static/ymplant/img/sye/banner/banner1.jpg" alt="...">
                        </div>
                        <div class="item next left">
                            <img src="/static/ymplant/img/sye/banner/banner2.jpg" alt="...">
                        </div>
                        <div class="item next left">
                            <img src="/static/ymplant/img/sye/banner/banner3.jpg" alt="...">
                        </div>
                    </div>

                    <!-- 两边 -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0">
                    <div id="carousel-example-generic2" class="carousel slide" data-ride="carousel">
                        <!-- 地下小点 -->
                        <ol class="carousel-indicators kd-dian">
                            <li data-target="#carousel-example-generic2" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic2" data-slide-to="1" class=""></li>
                            <li data-target="#carousel-example-generic2" data-slide-to="2" class=""></li>
                        </ol>

                        <!-- 图片-->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img src="/static/ymplant/img/sye/banner/banner4.jpg" alt="...">
                            </div>
                            <div class="item next left">
                                <img src="/static/ymplant/img/sye/banner/banner5.jpg" alt="...">
                            </div>
                            <div class="item next left">
                                <img src="/static/ymplant/img/sye/banner/6.jpg" alt="...">
                            </div>
                        </div>

                        <!-- 两边 -->
                        <a class="left carousel-control" href="#carousel-example-generic2" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic2" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>

            </div>
            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
            <#--<img src="/static/ymplant/img/sye/gkdt.png" style="width: 100%" alt=""/>-->
                <div class="kd-dtai">
                    高考动态
                    <a class="kd-gduo" href="${ctxPath}/plant/news/more/news/opsmpn8psb" style="text-decoration: none;" target="_blank">更多>>></a>
                    <img class="kd-dtai2" style="width: 22px" src="/static/ymplant/img/sye/tubiao/dongtai.png" alt="">
                </div>
                <div class="row namic">
                    <div class="col-md-4 col-sm-4 col-xs-4">
                    <#if news2?? && (news2?size > 0)>
                        <#list news2 as newsObj>
                            <#if (newsObj_index == 0)>
                                <a href="${ctxPath}/plant/news/details/${newsObj.NEWS_ID}" class="kd-bhong" title="${newsObj.TITLE}" style="text-decoration: none;" target="_blank">
                                    <img src="<#if newsObj.IMGURL??>${newsObj.IMGURL}<#else>${ctxPath}/static/ymplant/img/timg.png</#if>" style="width: 100%;height: 115px;" alt=""/>
                                    <p style="padding-top:2px;">
                                        <span class="kd-yc">${newsObj.TITLE}</span>
                                    </p>
                                    <p style="color: #8D8C8A;">
                                        <span>${newsObj.CREATETIME?string("yyyy-MM-dd")}</span>
                                    </p>
                                </a>
                            </#if>
                        </#list>
                    <#else>
                        <a href="javascript:void(0);" class="kd-bhong" style="text-decoration:none;">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;height: 115px;" alt=""/>
                            <p style="padding:10px;">暂无信息</p>
                        </a>
                    </#if>
                    <#if news2?? && (news2?size > 1)>
                        <#list news2 as newsObj>
                            <#if (newsObj_index == 1)>
                                <a href="${ctxPath}/plant/news/details/${newsObj.NEWS_ID}" class="kd-bhong" title="${newsObj.TITLE}" style="text-decoration: none;" target="_blank">
                                    <img src="<#if newsObj.IMGURL??>${newsObj.IMGURL}<#else>${ctxPath}/static/ymplant/img/timg.png</#if>" style="width: 100%;height: 115px;" alt=""/>
                                    <p style="padding-top:2px;">
                                        <span class="kd-yc">${newsObj.TITLE}</span>
                                    </p>
                                    <p style="color: #8D8C8A;">
                                        <span>${newsObj.CREATETIME?string("yyyy-MM-dd")}</span>
                                    </p>
                                </a>
                            </#if>
                        </#list>
                    <#else>
                        <a href="javascript:void(0);" class="kd-bhong" style="text-decoration: none;">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;height: 115px;" alt=""/>
                            <p style="padding:10px;font-weight: bold;">暂无信息</p>
                        </a>
                    </#if>
                    </div>
                    <div class="col-md-8 col-sm-8 col-xs-8" style="line-height: 2;">
                    <#if news2?? && (news2?size > 2)>
                        <#list news2 as newsObj>
                            <#if (newsObj_index > 1)>
                                <div class="kd-bhongt row" style="margin-right:0;font-size: 10px; color:#000;border-bottom: 1px solid #ccc">
                                    <div class="col-md-9 col-sm-9 col-xs-9">
                                        <a class="kd-bhongs" href="${ctxPath}/plant/news/details/${newsObj.NEWS_ID}" title="${newsObj.TITLE}" target="_blank">${newsObj.TITLE}</a>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 0;text-align: right">
                                        <span style="color:#999;">
                                            <#--<i class="glyphicon glyphicon-time"></i>-->
                                            <span style="margin-right: 10px;">${newsObj.CREATETIME?string("yyyy-MM-dd")}</span>
                                            <#--<i class="glyphicon glyphicon-eye-open"></i>-->
                                        <#--<span>${newsObj.VIEWCOUNT}</span>-->
                                    </span>
                                    </div>
                                </div>
                            </#if>
                        </#list>
                    <#else>
                        <p class="kd-bhongt" style="font-size: 10px;border-bottom: 1px solid #ccc">
                            <a class="kd-bhongs" href="javascript:void(0);">暂无信息</a>
                            <span style="float: right;color:#999;">
                                        <i class="glyphicon glyphicon-time"></i>
                                        <span style="margin-right: 10px;">暂无</span>
                                        <i class="glyphicon glyphicon-eye-open"></i>
                                    <span>0</span>
                                </span>
                        </p>
                        <p class="kd-bhongt" style="font-size: 10px;border-bottom: 1px solid #ccc">
                            <a class="kd-bhongs" href="javascript:void(0);">暂无信息</a>
                            <span style="float: right;color:#999;">
                                        <i class="glyphicon glyphicon-time"></i>
                                        <span style="margin-right: 10px;">暂无</span>
                                        <i class="glyphicon glyphicon-eye-open"></i>
                                    <span>0</span>
                                </span>
                        </p>
                        <p class="kd-bhongt" style="font-size: 10px;border-bottom: 1px solid #ccc">
                            <a class="kd-bhongs" href="javascript:void(0);">暂无信息</a>
                            <span style="float: right;color:#999;">
                                        <i class="glyphicon glyphicon-time"></i>
                                        <span style="margin-right: 10px;">暂无</span>
                                        <i class="glyphicon glyphicon-eye-open"></i>
                                    <span>0</span>
                                </span>
                        </p>
                        <p class="kd-bhongt" style="font-size: 10px;border-bottom: 1px solid #ccc">
                            <a class="kd-bhongs" href="javascript:void(0);">暂无信息</a>
                            <span style="float: right;color:#999;">
                                        <i class="glyphicon glyphicon-time"></i>
                                        <span style="margin-right: 10px;">暂无</span>
                                        <i class="glyphicon glyphicon-eye-open"></i>
                                    <span>0</span>
                                </span>
                        </p>
                        <p class="kd-bhongt" style="font-size: 10px;border-bottom: 1px solid #ccc">
                            <a class="kd-bhongs" href="javascript:void(0);">暂无信息</a>
                            <span style="float: right;color:#999;">
                                        <i class="glyphicon glyphicon-time"></i>
                                        <span style="margin-right: 10px;">暂无</span>
                                        <i class="glyphicon glyphicon-eye-open"></i>
                                    <span>0</span>
                                </span>
                        </p>
                        <p class="kd-bhongt" style="font-size: 10px;border-bottom: 1px solid #ccc">
                            <a class="kd-bhongs" href="javascript:void(0);">暂无信息</a>
                            <span style="float: right;color:#999;">
                                        <i class="glyphicon glyphicon-time"></i>
                                        <span style="margin-right: 10px;">暂无</span>
                                        <i class="glyphicon glyphicon-eye-open"></i>
                                    <span>0</span>
                                </span>
                        </p>
                        <p class="kd-bhongt" style="font-size: 10px;border-bottom: 1px solid #ccc">
                            <a class="kd-bhongs" href="javascript:void(0);">暂无信息</a>
                            <span style="float: right;color:#999;">
                                        <i class="glyphicon glyphicon-time"></i>
                                        <span style="margin-right: 10px;">暂无</span>
                                        <i class="glyphicon glyphicon-eye-open"></i>
                                    <span>0</span>
                                </span>
                        </p>
                        <p class="kd-bhongt" style="font-size: 10px;border-bottom: 1px solid #ccc">
                            <a class="kd-bhongs" href="javascript:void(0);">暂无信息</a>
                            <span style="float: right;color:#999;">
                                        <i class="glyphicon glyphicon-time"></i>
                                        <span style="margin-right: 10px;">暂无</span>
                                        <i class="glyphicon glyphicon-eye-open"></i>
                                    <span>0</span>
                                </span>
                        </p>
                        <p class="kd-bhongt" style="font-size: 10px;border-bottom: 1px solid #ccc">
                            <a class="kd-bhongs" href="javascript:void(0);">暂无信息</a>
                            <span style="float: right;color:#999;">
                                        <i class="glyphicon glyphicon-time"></i>
                                        <span style="margin-right: 10px;">暂无</span>
                                        <i class="glyphicon glyphicon-eye-open"></i>
                                    <span>0</span>
                                </span>
                        </p>
                        <p class="kd-bhongt" style="font-size: 10px;border-bottom: 1px solid #ccc">
                            <a class="kd-bhongs" href="javascript:void(0);">暂无信息</a>
                            <span style="float: right;color:#999;">
                                        <i class="glyphicon glyphicon-time"></i>
                                        <span style="margin-right: 10px;">暂无</span>
                                        <i class="glyphicon glyphicon-eye-open"></i>
                                    <span>0</span>
                                </span>
                        </p>
                        <p class="kd-bhongt" style="font-size: 10px;border-bottom: 1px solid #ccc">
                            <a class="kd-bhongs" href="javascript:void(0);">暂无信息</a>
                            <span style="float: right;color:#999;">
                                        <i class="glyphicon glyphicon-time"></i>
                                        <span style="margin-right: 10px;">暂无</span>
                                        <i class="glyphicon glyphicon-eye-open"></i>
                                    <span>0</span>
                                </span>
                        </p>
                        <p class="kd-bhongt" style="font-size: 10px;border-bottom: 1px solid #ccc">
                            <a class="kd-bhongs" href="javascript:void(0);">暂无信息</a>
                            <span style="float: right;color:#999;">
                                        <i class="glyphicon glyphicon-time"></i>
                                        <span style="margin-right: 10px;">暂无</span>
                                        <i class="glyphicon glyphicon-eye-open"></i>
                                    <span>0</span>
                                </span>
                        </p>
                    </#if>
                    </div>
                </div>
            </div>
        </div>
        <!--轮播图 结束-->
        <!--院校咨询 开始-->
        <div class="row" style="margin: 20px 0;">
            <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 10px 0 0 0;">
            <#--<img src="/static/ymplant/img/sye/zxzx.png" style="width: 100%" alt=""/>-->
                <div class="kd-dtai">
                    院校咨询
                    <a href="${ctxPath}/plant/school/online" class="kd-gduo">更多>>></a>
                    <img class="kd-dtai2" src="/static/ymplant/img/sye/tubiao/zixun.png" alt="">
                </div>
            </div>
            <ul class="col-md-12 col-sm-12 col-xs-12 consu">
            <#if advertisementSchools?? && (advertisementSchools?size > 0)>
                <#list advertisementSchools as advertisementSchool>
                    <li>
                        <a href="${ctxPath}/plant/school/details/${advertisementSchool.SCHOOL_ID}" target="_blank">
                            <img src="${advertisementSchool.LHEADURL}" style="width: 100%" alt=""/>
                        </a>
                        <ul class="sult">
                            <li class="hbei">${advertisementSchool.PROVINCE_VALUE}</li>
                            <li class="hbei" style="border-left: 1px solid #ccc;">${advertisementSchool.ARRANGMENT}</li>
                            <li class="hbei" style="border-left: 1px solid #ccc;">${advertisementSchool.SCTYPE_VALUE}</li>
                            <#if advertisementSchool.properties?? && (advertisementSchool.properties?size > 0)>
                                <p style="margin: 15px 0;">
                                    <#list advertisementSchool.properties as property>
                                        <span class="kd-${property.DIC_ID}"></span>
                                    </#list>
                                </p>
                            </#if>
                            <div class="clear"></div>
                            <#if advertisementSchool.teachers?? && (advertisementSchool.teachers?size > 0)>
                                <#list advertisementSchool.teachers as teacher>
                                    <div class="row" style="width: 100%;;margin: 5px 0">
                                        <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 0">
                                            <img src="<#if teacher.HEADURL??>${teacher.HEADURL}<#else>${ctxPath}/static/ymplant/img/timg.png</#if>" style="width: 50px;height: 50px;border-radius: 50%" alt=""/>
                                        </div>
                                        <div class="col-md-5 col-sm-5 col-xs-5" style="padding: 5px 0">
                                            <p style="font-weight: bold;"><#if teacher.NICKNAME??>${teacher.NICKNAME}<#else>暂无</#if></p>
                                            <#--<span style="color:#E08DAB;"><#if teacher.JOBDATE_VALUE??>${teacher.JOBDATE_VALUE}<#else></#if></span></br>-->
                                            <p style="font-size: 10px;margin: 2px 0;"><span style="color:#E08DAB;"><#if teacher.JOBTYPE??>${teacher.JOBTYPE}<#else>暂无</#if></span></p>
                                        </div>
                                        <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 0;">
                                            <a class="start" href="${ctxPath}/plant/chat/page/student/${teacher.USER_ID}">咨询</a>
                                        </div>
                                    </div>
                                </#list>
                            </#if>
                            <div class="row" style="margin: 5px 0;border-bottom:1px solid #e3e3e3;">
                                <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 0">
                                    <img src="/static/ymplant/images/tubiao3/service.png" class="portrai" alt="">
                                </div>
                                <div class="col-md-5 col-sm-5 col-xs-5" style="padding: 0;text-align: left;">
                                    <p style="color:#9EAAAA;font-size: 10px;margin-top: 10px">在线客服</p>
                                    <p style="color:#9EAAAA;font-size: 10px">
                                        <span>院校咨询专员</span>
                                    </p>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 0;">
                                    <p style="padding: 17px 0;">
                                        <a style="background-color: #c3c3c3;color: #999" class="start" href="<#if Session.session_user_key?? && Session.session_user_key.USER_ID??>javascript:showError('当前无客服人员在线！');<#else>javascript:showError('请先登录账号');</#if>">咨 询</a>
                                    </p>
                                </div>
                            </div>
                        </ul>
                    </li>
                </#list>
            <#else>
                暂无信息
            </#if>
                <div class="clear"></div>
            </ul>
        </div>
        <!--咨询 结束-->
        <!--院校、专业信息库 开始-->
    <#--<div class="row">
        <!--院校库 开始&ndash;&gt;
        <div class="col-md-6 col-sm-6 col-xs-6">
            <div class="row">
                <div class="col-md-5 col-sm-5 col-xs-5" style="padding-right: 0">
                    <div class="ks-yxk">
                        <p style="margin-bottom: 10px;font-size: 1.3em;font-weight: bold">院校信息库</p>
                        <p>
                            <i class="glyphicon glyphicon-ok-circle"></i>
                            <span style="font-weight: bold">全国优质院校信息</span>
                        </p>
                        <p>
                            <i class="glyphicon glyphicon-ok-circle"></i>
                            <span style="font-weight: bold">全国优质院校信息</span>
                        </p>
                        <p>
                            <i class="glyphicon glyphicon-ok-circle"></i>
                            <span style="font-weight: bold">全国优质院校信息</span>
                        </p>
                    </div>
                </div>
                <div class="col-md-7 col-sm-7 col-xs-7" style="border: 1px solid #ccc;">
                    <div class="ks-dqu">
                        <p style="margin-bottom: 10px;">
                            <span style="font-weight: bold">地区：</span>
                            <select class="region" id="scprovince">
                                <#if provinces?? && (provinces?size > 0)>
                                    <#list provinces as province>
                                        <option value="${province.DIC_ID}">${province.NAME}</option>
                                    </#list>
                                </#if>
                            </select>
                        </p>
                        <p style="margin-bottom: 10px;">
                            <span style="font-weight: bold">类型：</span>
                            <select class="kd-lei" id="scscproperty">
                                <#if scproperties?? &&(scproperties?size > 0)>
                                    <#list scproperties as scproperty>
                                        <option value="${scproperty.DIC_ID}">${scproperty.NAME}</option>
                                    </#list>
                                </#if>
                            </select>
                            <span style="font-weight: bold;margin-left: 5px;">批次：</span>
                            <select class="kd-lei" id="scarrangment">
                            <#if arrangments?? && (arrangments?size > 0)>
                                <#list arrangments as arrangment>
                                    <option value="${arrangment.DIC_ID}">${arrangment.NAME}</option>
                                </#list>
                            </#if>
                            </select>
                        </p>
                        <p style="margin-bottom: 10px;">
                            <span style="font-weight: bold;">名称：</span>
                            <input type="text" value="" id="scname" style="width:75%;"/>
                        </p>
                        <p style="text-align: center">
                            <input class="kd-cha" type="button" value="查 询" onclick="searchsc();"/>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <!--院校库 结束&ndash;&gt;
        <!--专业库 开始&ndash;&gt;
        &lt;#&ndash;<div class="col-md-6 col-sm-6 col-xs-6">
            <div class="row" style="margin-right: 0">
                <div class="col-md-5 col-sm-5 col-xs-5" style="padding-right: 0">
                    <div class="ks-yxk">
                        <p style="margin-bottom: 10px;font-size: 1.3em;font-weight: bold">专业信息库</p>
                        <p>
                            <i class="glyphicon glyphicon-ok-circle"></i>
                            <span style="font-weight: bold">全国优质院校信息</span>
                        </p>
                        <p>
                            <i class="glyphicon glyphicon-ok-circle"></i>
                            <span style="font-weight: bold">全国优质院校信息</span>
                        </p>
                        <p>
                            <i class="glyphicon glyphicon-ok-circle"></i>
                            <span style="font-weight: bold">全国优质院校信息</span>
                        </p>
                    </div>
                </div>
                <div class="col-md-7 col-sm-7 col-xs-7" style="border: 1px solid #ccc;">
                    <div class="ks-dqu">
                        &lt;#&ndash;<p style="margin-bottom: 10px;">&ndash;&gt;
                            &lt;#&ndash;<span style="font-weight: bold">地区：</span>&ndash;&gt;
                            &lt;#&ndash;<select class="region">&ndash;&gt;
                            &lt;#&ndash;<#if provinces?? && (provinces?size > 0)>&ndash;&gt;
                                &lt;#&ndash;<#list provinces as province>&ndash;&gt;
                                    &lt;#&ndash;<option value="${province.DIC_ID}">${province.NAME}</option>&ndash;&gt;
                                &lt;#&ndash;</#list>&ndash;&gt;
                            &lt;#&ndash;</#if>&ndash;&gt;
                            &lt;#&ndash;</select>&ndash;&gt;
                        &lt;#&ndash;</p>&ndash;&gt;
                            <p style="margin-bottom: 10px;">
                                <span style="font-weight: bold">专业类型：</span>
                                <select class="region" id="CODE" onchange="setParentId();">
                                &lt;#&ndash;<#if provinces?? && (provinces?size > 0)>&ndash;&gt;
                                    &lt;#&ndash;<#list provinces as province>&ndash;&gt;
                                        &lt;#&ndash;<option value="${province.DIC_ID}">${province.NAME}</option>&ndash;&gt;
                                    <option value="BMAJOR">本科</option>
                                    <option value="ZMAJOR">专科</option>
                                    &lt;#&ndash;</#list>&ndash;&gt;
                                &lt;#&ndash;</#if>&ndash;&gt;
                                </select>
                            </p>
                        <p style="margin-bottom: 10px;">
                            <span style="font-weight: bold;">专业类别：</span>
                            <select class="region" id="PARENT_ID">
                            &lt;#&ndash;<#if provinces?? && (provinces?size > 0)>&ndash;&gt;
                            &lt;#&ndash;<#list provinces as province>&ndash;&gt;
                            &lt;#&ndash;<option value="${province.DIC_ID}">${province.NAME}</option>&ndash;&gt;
                                <#if bmajors?? && (bmajors?size > 0)>
                                    <#list bmajors as bmajor>
                                        <option value="${bmajor.DIC_ID}">${bmajor.NAME}</option>
                                    </#list>
                                </#if>
                            &lt;#&ndash;</#list>&ndash;&gt;
                            &lt;#&ndash;</#if>&ndash;&gt;
                            </select>
                        </p>
                        <p style="text-align: center">
                            <input class="kd-cha" type="button" value="查 询" onclick="searchmj();"/>
                        </p>
                    </div>
                </div>
            </div>
        </div>&ndash;&gt;
        <!--专业库 结束&ndash;&gt;
    </div>-->
        <!--院校、专业信息库 结束-->
        <!--线下活动、精选视频 开始-->
        <div class="row" style="margin: 20px 0;">
            <div class="col-md-6 col-sm-6 col-xs-6" style="padding: 0;">
            <#--<img src="/static/ymplant/img/sye/xxhd.png" style="width:100%;margin-bottom: 10px;" alt=""/>-->
                <div class="kd-dtai">
                    线下活动
                    <a class="kd-gduo" href="${ctxPath}/plant/news/more/news/23wtostpu8" style="text-decoration: none;" target="_blank">更多>>></a>
                    <img class="kd-dtai2" src="/static/ymplant/img/sye/tubiao/xianxia.png" alt="">
                </div>
                <div class="row" style="padding: 27px 0;border: 1px solid #ccc;margin: 0;">
                    <div class="col-md-6 col-sm-6 col-xs-6">
                    <#if news?? && (news?size > 0)>
                        <#list news as newsObj>
                            <#if newsObj_index == 0>
                                <a href="${ctxPath}/plant/news/details/${newsObj.NEWS_ID}" class="tivity" title="${newsObj.TITLE}" style="text-decoration: none" target="_blank">
                                    <img src="<#if newsObj.IMGURL??>${newsObj.IMGURL}<#else>${ctxPath}/static/ymplant/img/timg.png</#if>" style="width: 100%;height:190px;;" alt=""/>
                                    <p style="padding: 10px;font-size: 25px;">
                                        <span class="kd-yc">${newsObj.TITLE}</span>
                                    </p>
                                    <p style="color: #8D8C8A;padding: 0 10px;">
                                        <#--<i class="glyphicon glyphicon-time"></i>-->
                                        <span>${newsObj.CREATETIME?string("yyyy-MM-dd")}</span>
                                        <#--<i class="glyphicon glyphicon-eye-open"></i>-->
                                        <#--<span>${newsObj.VIEWCOUNT}</span>-->
                                    </p>
                                </a>
                            </#if>
                        </#list>
                    <#else>
                        <a href="javascript:void(0);" class="tivity" style="text-decoration: none">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;height:190px;;" alt=""/>
                            <p style="padding: 10px;font-weight: bold;font-size: 25px;">暂无信息</p>
                            <p style="color: #8D8C8A;padding: 0 10px;">
                                <span class="glyphicon glyphicon-time"></span>
                                <span>暂无</span>丨
                                <#--<i class="glyphicon glyphicon-eye-open"></i>-->
                                <#--<span>0</span>-->
                            </p>
                        </a>
                    </#if>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6">
                    <#if news?? && (news?size > 1)>
                        <#list news as newsObj>
                            <#if (newsObj_index > 0) && (newsObj_index < 5)>
                                <div class="row kd-bti">
                                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding-left: 0">
                                        <a href="${ctxPath}/plant/news/details/${newsObj.NEWS_ID}" class="tivi" target="_blank">
                                            <img src="<#if newsObj.IMGURL??>${newsObj.IMGURL}<#else>${ctxPath}/static/ymplant/img/timg.png</#if>" style="width:66px;height: 53px;" alt=""/>
                                        </a>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding: 0">
                                        <a href="${ctxPath}/plant/news/details/${newsObj.NEWS_ID}" class="tivi" title="${newsObj.TITLE}" style="text-decoration: none;" target="_blank">
                                            <p>
                                                <span class="kd-yc">${newsObj.TITLE}</span>
                                            </p>
                                        </a>
                                        <p style="font-size: 10px;margin-top: 7px;">
                                            <#--<i class="glyphicon glyphicon-time"></i>-->
                                            <span>${newsObj.CREATETIME?string("yyyy-MM-dd")}</span>
                                        </p>
                                        <p style="color:#8D8C8A;">
                                            <#--<i class="glyphicon glyphicon-eye-open"></i>-->
                                            <#--<span>${newsObj.VIEWCOUNT}</span>-->
                                        </p>
                                    </div>
                                </div>
                            </#if>
                        </#list>
                    <#else>
                        <div class="row kd-bti">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-left: 0">
                                <a href="javascript:void(0);" class="tivi">
                                    <img src="${ctxPath}/static/ymplant/img/timg.png" style="width:100%;" alt=""/>
                                </a>
                            </div>
                            <div class="col-md-8 col-sm-8 col-xs-8" style="padding: 0">
                                <a href="javascript:void(0);" class="tivi" style="text-decoration: none;">
                                    <p style="font-weight: bold">暂无信息</p>
                                </a>
                                <p style="font-size: 10px;">
                                    <span class="glyphicon glyphicon-time"></span>
                                    <span>暂无</span>
                                </p>
                                <p style="color:#8D8C8A;">
                                    <#--<i class="glyphicon glyphicon-eye-open"></i>-->
                                    <#--<span>0</span>-->
                                </p>
                            </div>
                        </div>
                        <div class="row kd-bti">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-left: 0">
                                <a href="javascript:void(0);" class="tivi">
                                    <img src="${ctxPath}/static/ymplant/img/timg.png" style="width:100%;" alt=""/>
                                </a>
                            </div>
                            <div class="col-md-8 col-sm-8 col-xs-8" style="padding: 0">
                                <a href="javascript:void(0);" class="tivi" style="text-decoration: none;">
                                    <p style="font-weight: bold">暂无信息</p>
                                </a>
                                <p style="font-size: 10px;">
                                    <span class="glyphicon glyphicon-time"></span>
                                    <span>暂无</span>
                                </p>
                                <p style="color:#8D8C8A;">
                                    <#--<i class="glyphicon glyphicon-eye-open"></i>-->
                                    <#--<span>0</span>-->
                                </p>
                            </div>
                        </div>
                        <div class="row kd-bti">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-left: 0">
                                <a href="javascript:void(0);" class="tivi">
                                    <img src="${ctxPath}/static/ymplant/img/timg.png" style="width:100%;" alt=""/>
                                </a>
                            </div>
                            <div class="col-md-8 col-sm-8 col-xs-8" style="padding: 0">
                                <a href="javascript:void(0);" class="tivi" style="text-decoration: none;">
                                    <p style="font-weight: bold">暂无信息</p>
                                </a>
                                <p style="font-size: 10px;">
                                    <span class="glyphicon glyphicon-time"></span>
                                    <span>暂无</span>
                                </p>
                                <p style="color:#8D8C8A;">
                                    <#--<i class="glyphicon glyphicon-eye-open"></i>-->
                                    <#--<span>0</span>-->
                                </p>
                            </div>
                        </div>
                        <div class="row kd-bti">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-left: 0">
                                <a href="javascript:void(0);" class="tivi">
                                    <img src="${ctxPath}/static/ymplant/img/timg.png" style="width:100%;" alt=""/>
                                </a>
                            </div>
                            <div class="col-md-8 col-sm-8 col-xs-8" style="padding: 0">
                                <a href="javascript:void(0);" class="tivi" style="text-decoration: none;">
                                    <p style="font-weight: bold">暂无信息</p>
                                </a>
                                <p style="font-size: 10px;">
                                    <span class=""></span>
                                    <span>暂无</span>
                                </p>
                                <p style="color:#8D8C8A;">
                                    <#--<i class="glyphicon glyphicon-eye-open"></i>-->
                                    <#--<span>0</span>-->
                                </p>
                            </div>
                        </div>
                    </#if>
                    </div>
                    <div class="row" style="margin: 0;padding: 0 25px;">
                    <#if news?? && (news?size > 5)>
                        <#list news as newsObj>
                            <#if (newsObj_index > 4)>
                                <div class="col-md-12 col-sm-12 col-xs-12 kd-bse" style="border-bottom: 1px dashed #ccc;padding:0;">
                                    <div class="col-md-9 col-sm-9 col-xs-9" style="padding: 5px;">
                                        <a href="${ctxPath}/plant/news/details/${newsObj.NEWS_ID}" class="acti" target="_blank">
                                        ${newsObj.TITLE}
                                        </a>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 5px;font-size: 10px;color: #999;text-align: right;">
                                        <#--<span class="glyphicon glyphicon-time"></span>-->
                                        <span>${newsObj.CREATETIME?string("yyyy-MM-dd")}</span>
                                    </div>
                                    <#--<div class="col-md-2 col-sm-2 col-xs-2" style="padding: 5px;font-size: 10px;color: #999">-->
                                        <#--<i class="glyphicon glyphicon-eye-open"></i>-->
                                        <#--<span>${newsObj.VIEWCOUNT}</span>-->
                                    <#--</div>-->
                                </div>
                            </#if>
                        </#list>
                    <#else>
                        <div class="col-md-12 col-sm-12 col-xs-12 kd-bse" style="border-bottom: 1px dashed #ccc;padding:0;">
                            <div class="col-md-7 col-sm-7 col-xs-7" style="padding: 5px;">
                                <a href="javascript:void(0);" class="acti">
                                    暂无信息
                                </a>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 5px;font-size: 10px;color: #999">
                                <span class="glyphicon glyphicon-time"></span>
                                <span>暂无</span>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding: 5px;font-size: 10px;color: #999">
                                <#--<i class="glyphicon glyphicon-eye-open"></i>-->
                                <#--<span>0</span>-->
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12 kd-bse" style="border-bottom: 1px dashed #ccc;padding:0;">
                            <div class="col-md-7 col-sm-7 col-xs-7" style="padding: 5px;">
                                <a href="javascript:void(0);" class="acti">
                                    暂无信息
                                </a>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 5px;font-size: 10px;color: #999">
                                <span class="glyphicon glyphicon-time"></span>
                                <span>暂无</span>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding: 5px;font-size: 10px;color: #999">
                                <#--<i class="glyphicon glyphicon-eye-open"></i>-->
                                <#--<span>0</span>-->
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12 kd-bse" style="border-bottom: 1px dashed #ccc;padding:0;">
                            <div class="col-md-7 col-sm-7 col-xs-7" style="padding: 5px;">
                                <a href="javascript:void(0);" class="acti">
                                    暂无信息
                                </a>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 5px;font-size: 10px">
                                <span class="glyphicon glyphicon-time" style="color: #999"></span>
                                <span style="color: #999">暂无</span>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding: 5px;font-size: 10px;color: #999">
                                <#--<i class="glyphicon glyphicon-eye-open"></i>-->
                                <#--<span>0</span>-->
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12 kd-bse" style="border-bottom: 1px dashed #ccc;padding:0;">
                            <div class="col-md-7 col-sm-7 col-xs-7" style="padding: 5px;">
                                <a href="javascript:void(0);" class="acti">
                                    暂无信息
                                </a>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 5px;font-size: 10px">
                                <span class="glyphicon glyphicon-time" style="color: #999"></span>
                                <span style="color: #999">暂无</span>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding: 5px;font-size: 10px;color: #999">
                                <#--<i class="glyphicon glyphicon-eye-open"></i>-->
                                <#--<span>0</span>-->
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12 kd-bse" style="border-bottom: 1px dashed #ccc;padding:0;">
                            <div class="col-md-7 col-sm-7 col-xs-7" style="padding: 5px;">
                                <a href="javascript:void(0);" class="acti">
                                    暂无信息
                                </a>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 5px;font-size: 10px">
                                <span class="glyphicon glyphicon-time" style="color: #999"></span>
                                <span style="color: #999">暂无</span>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding: 5px;font-size: 10px;color: #999">
                                <#--<i class="glyphicon glyphicon-eye-open"></i>-->
                                <#--<span>0</span>-->
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12 kd-bse" style="border-bottom: 1px dashed #ccc;padding:0;">
                            <div class="col-md-7 col-sm-7 col-xs-7" style="padding: 5px;">
                                <a href="javascript:void(0);" class="acti">
                                    暂无信息
                                </a>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 5px;font-size: 10px">
                                <span class="glyphicon glyphicon-time" style="color: #999"></span>
                                <span style="color: #999">暂无</span>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding: 5px;font-size: 10px;color: #999">
                                <#--<i class="glyphicon glyphicon-eye-open"></i>-->
                                <#--<span>0</span>-->
                            </div>
                        </div>
                    </#if>
                    </div>
                </div>
            </div>
            <!--精选视频 开始-->
            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0">
            <#--<img src="/static/ymplant/img/sye/jxsp.png" style="width:100%;margin-bottom: 10px;" alt=""/>-->
                <div class="kd-dtai">
                    精选视频
                    <a class="kd-gduo" href="${ctxPath}/plant/news/more/news/621yynn9i8" style="text-decoration: none;" target="_blank">更多>>></a>
                    <img class="kd-dtai2" src="/static/ymplant/img/sye/tubiao/shipin.png" alt="">
                </div>
                <div class="row" style="margin: 0;border: 1px solid #ccc;">
                <#if news3?? && (news3?size > 0)>
                    <#list news3 as newsObj>
                        <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 6px 15px;">
                            <a href="${ctxPath}/plant/news/details/${newsObj.NEWS_ID}" class="kd-sji" style="text-decoration: none;" target="_blank">
                                <img src="<#if newsObj.IMGURL??>${newsObj.IMGURL}<#else>${ctxPath}/static/ymplant/img/timg.png</#if>" style="width: 100%;height: 115px;" alt=""/>
                                <p style="padding: 5px 10px;">${newsObj.TITLE}</p>
                            </a>
                        </div>
                    </#list>
                <#else>
                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 10px 15px;">
                        <a href="javascript:void(0);" class="kd-sji" style="text-decoration: none;">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;height: 115px;" alt=""/>
                            <p style="padding: 5px 10px;">暂无信息</p>
                        </a>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 10px 15px;">
                        <a href="javascript:void(0);" class="kd-sji" style="text-decoration: none;">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;height: 115px;" alt=""/>
                            <p style="padding: 5px 10px;">暂无信息</p>
                        </a>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 10px 15px;">
                        <a href="javascript:void(0);" class="kd-sji" style="text-decoration: none;">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;height: 115px;" alt=""/>
                            <p style="padding: 5px 10px;">暂无信息</p>
                        </a>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 10px 15px;">
                        <a href="javascript:void(0);" class="kd-sji" style="text-decoration: none;">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;height: 115px;" alt=""/>
                            <p style="padding: 5px 10px;">暂无信息</p>
                        </a>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 10px 15px;">
                        <a href="javascript:void(0);" class="kd-sji" style="text-decoration: none;">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;height: 115px;" alt=""/>
                            <p style="padding: 5px 10px;">暂无信息</p>
                        </a>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 10px 15px;">
                        <a href="javascript:void(0);" class="kd-sji" style="text-decoration: none;">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;height: 115px;" alt=""/>
                            <p style="padding: 5px 10px;">暂无信息</p>
                        </a>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 10px 15px;">
                        <a href="javascript:void(0);" class="kd-sji" style="text-decoration: none;">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;height: 115px;" alt=""/>
                            <p style="padding: 5px 10px;">暂无信息</p>
                        </a>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 10px 15px;">
                        <a href="javascript:void(0);" class="kd-sji" style="text-decoration: none;">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;height: 115px;" alt=""/>
                            <p style="padding: 5px 10px;">暂无信息</p>
                        </a>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 10px 15px;">
                        <a href="javascript:void(0);" class="kd-sji" style="text-decoration: none;">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;height: 115px;" alt=""/>
                            <p style="padding: 5px 10px;">暂无信息</p>
                        </a>
                    </div>
                </#if>
                </div>
            </div>
            <!--精选视频 结束-->
        </div>
        <!--线下活动、精选视频 结束-->

    </div>
</div>
<script>
    $(function () {
    var mb = myBrowser();

        if ("IE" == mb) {
            $("#browseTip").show();
        }
    });
    function toReport() {
        layer.confirm("确定要进行智能推荐？此次操作需消耗一张智能推荐卡", {
            btn: ["是", "否"]
        }, function (index) {
            window.location.href = ctxPath + "/plant/report/index?province=" + $("#province").val() + "&arrangment=" + $("#arrangment").val();
        });
    }
</script>

<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>