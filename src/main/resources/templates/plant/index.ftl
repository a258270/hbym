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

<div class="topcontainer">
    <script language="JavaScript">
        if (window != top) {top.location.href = location.href;}
    </script>
    <div class="kd-syse">
        <div class="container">
            <div class="row">
                <div style="padding: 5px 5px 5px 15px" class="col-md-5 col-sm-5 col-xs-5">
                    <div style="font-size: 10px">
                        <img src="/static/ymplant/img/slogan.png" style="height: 20px;" alt="">
                        <span class="colleges">
                        <span>我是高校丨我是专家</span>
                    </span>
                    </div>
                <#--<div class="colleges">-->

                <#--</div>-->
                </div>
                <div class="col-md-3 col-sm-3 col-xs-3">
                    <form action="${ctxPath}/plant/news/search" method="post">
                        <input type="text" class="sou" name="CONTENT" placeholder="搜索从这里开始...">
                    <#--<input class="suo" type="submit" value="">-->
                    <#--<i class="glyphicon glyphicon-search kd-ydong"></i>-->
                        <button class="suo" type="submit">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </form>

                </div>
                <div class="col-md-2 col-sm-2 col-xs-2">
                    <a href="#" class="tbi">
                        <img src="${ctxPath}/static/ymplant/img/sye/s.1.png" alt=""/>
                        <span>手机APP</span>
                    </a>
                    <span class="tbi">
                    <img src="${ctxPath}/static/ymplant/img/sye/s.2.png" alt=""/>
                    <span>微信</span>
                    <div class="qrcode">
                        <img src="${ctxPath}/static/ymplant/images/tubiao4/qrcode.jpg" alt="">
                        <p>请打开手机微信，扫一扫</p>
                    </div>
                </span>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-2">
                    <ul class="row">
                        <li class="col-md-12 col-sm-12 col-xs-12 disp">
                        <#if Session.session_user_key?? && Session.session_user_key.USERNAME??>
                            <div class="kd-dbut">
                                <img src="<#if Session.session_complete_key?? && Session.session_complete_key.HEADURL??>${Session.session_complete_key.HEADURL}<#else>/static/ymplant/img/timg.png</#if>" style="width: 40px;height:40px;border-radius: 50%" alt=""/>
                                <span class="badge kd-ydx">0</span>
                            </div>
                            <ul class="eject row">
                                <li class="col-md-4 col-sm-4 col-xs-4">
                                    <a href="<#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'>${ctxPath}/plant/user/center</#if><#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'm9bxdt9g36'>${ctxPath}/plant/teacher/center</#if>">
                                        <img src="<#if Session.session_complete_key?? && Session.session_complete_key.HEADURL??>${Session.session_complete_key.HEADURL}<#else>/static/ymplant/img/timg.png</#if>" style="width: 50px;height: 50px;border-radius: 50%" alt=""/>
                                    </a>
                                </li>
                                <li class="col-md-8 col-sm-8 col-xs-8">
                                    <a style="color:#333;" href="<#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'>${ctxPath}/plant/user/center</#if><#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'm9bxdt9g36'>${ctxPath}/plant/teacher/center</#if>">
                                        <p style="margin-bottom: 5px;font-weight: bold;"><#if Session.session_complete_key?? && Session.session_complete_key.NICKNAME??>${Session.session_complete_key.NICKNAME}<#else>暂无</#if></p>
                                    </a>
                                    <a href="${ctxPath}/plant/user/center?p=authority">
                                        <input class="ordinary" type="button" style="font-size: 10px;background-color:<#if Session.session_user_key?? && Session.session_user_key.OVERDUETIME??>#FE7F2A;<#else>#2DC473;</#if>" value="<#if Session.session_user_key?? && Session.session_user_key.OVERDUETIME??>黄金会员<#else>普通会员</#if>"/>
                                    </a>
                                </li>
                            <#--<#if Session.session_user_key?? && !Session.session_user_key.OVERDUETIME?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'>
                            <li class="col-md-12 col-sm-12 col-xs-12"  style="margin-top: 20px">
                                <a class="gold" href="javascript:void(0);" style="text-decoration: none;">升级黄金会员</a>
                            </li>
                            </#if>-->
                                <li class="col-md-12 col-sm-12 col-xs-12">
                                    <a class="goldw" style="text-decoration: none;margin-top: 20px;" href="<#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'>${ctxPath}/plant/user/center</#if><#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'm9bxdt9g36'>${ctxPath}/plant/teacher/center</#if>">个人中心</a>
                                </li>
                                <li class="col-md-12 col-sm-12 col-xs-12">
                                    <#if Session.session_user_key?? && Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'm9bxdt9g36'><a class="goldwt" href="${ctxPath}/plant/teacher/search">学生库</a></#if>
                                </li>
                                <li class="col-md-12 col-sm-12 col-xs-12">
                                    <#if Session.session_user_key?? && Session.session_user_key.USER_ID??><a class="goldwt" href="${ctxPath}/plant/message/index">消息(<span id="msgcount">0</span>)</a></#if>
                                </li>
                                <li class="col-md-12 col-sm-12 col-xs-12">
                                    <a class="goldwt" href="${ctxPath}/plant/api/toexit">安全退出</a>
                                </li>
                            </ul>
                        <#else>
                            <div style="padding-top: 5px;">
                                <ul class="kd-userinfo">
                                    <li class="c1" style="margin:0;">
                                        <a class="btn btn-lg" data-toggle="modal" data-target="#myModala">
                                            注册
                                        </a>
                                        <div class="modal fade" id="myModala" tabindex="-1" role="dialog">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content" style="width: 500px;">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                                                        <h2>学生注册</h2>
                                                        <!--<h4 class="modal-title" id="myModalLabel">Modal title</h4>-->
                                                    </div>
                                                    <form>
                                                        <p>
                                                            <i class="glyphicon glyphicon-user huahao">
                                                                <input class="kd-kdu" type="text" placeholder="请输入用户名" name="USERNAME" id="REG_USERNAME"/>
                                                            </i>
                                                        </p>
                                                        <p>
                                                            <i class="glyphicon glyphicon-earphone huahao">
                                                                <input class="kd-kdu" type="text" placeholder="请输入手机号码" name="PHONE" id="REG_PHONE"/>
                                                            </i>
                                                        </p>
                                                        <p>
                                                            <i class="glyphicon glyphicon-envelope huahao">
                                                                <input class="kd-kdu" type="text" placeholder="请输入验证码" style="width: 61%;" name="CODE" id="REG_CODE"/>
                                                                <input type="button" value="获取验证码" class="kd-hqu" id="codeBtnTop" onclick="getSMSCodeTop();"/>
                                                                <input type="button" class="kd-hqu" style="display: none;"id="afterBtnTop" value="60秒后重试" />
                                                            </i>
                                                        </p>
                                                        <p>
                                                            <i class="glyphicon glyphicon-lock huahao">
                                                                <input class="kd-kdu" type="password" placeholder="请输入密码" name="PASSWORD" id="REG_PASSWORD"/>
                                                            </i>
                                                        </p>
                                                        <p>
                                                            <i class="glyphicon glyphicon-lock huahao">
                                                                <input class="kd-kdu" type="password" placeholder="再次输入密码" name="REPASSWORD" id="REG_REPASSWORD"/>
                                                            </i>
                                                        </p>
                                                        <p style="font-size: 11px;margin-bottom: 15px;">
                                                            <input type="checkbox" id="agreebox">我已阅读并同意遵守
                                                            <a href="${ctxPath}/plant/clause" target="_blank">《${baseSetting.title}会员服务条款》</a>
                                                        </p>
                                                        <p class="wangjimima" style="text-align: center">
                                                            <input type="button" value="立即注册" id="regBtn" class="queren"/>
                                                        </p>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>丨</li>

                                    <li class="c1" style="margin: 0">
                                        <a class="btn btn-lg" data-toggle="modal" data-target="#myModal">
                                            登录
                                        </a>

                                        <!-- Modal -->
                                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content" style="width: 500px;">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                        <h2>欢迎登陆</h2>
                                                        <!--<h4 class="modal-title" id="myModalLabel">Modal title</h4>-->
                                                    </div>
                                                    <form action="${ctxPath}/plant/api/tologin" method="post" id="logForm">
                                                        <p style="margin: 0 auto;width: 300px;">
                                                            <i class="glyphicon glyphicon-user huahao">
                                                                <input class="kd-kdu" type="text" placeholder="请输入用户名/手机号" name="USERNAME" id="LOG_USERNAME"/>
                                                            </i>
                                                        </p>
                                                        <p style="margin: 0 auto;width: 300px;">
                                                            <i class="glyphicon glyphicon-lock huahao">
                                                                <input class="kd-kdu" type="password" placeholder="请输入密码" name="PASSWORD" id="LOG_PASSWORD"/>
                                                            </i>
                                                        </p>
                                                    <#--滑动验证 开始-->
                                                        <div style=" margin-bottom:30px;">
                                                            <div id="drag" style="margin: 0 auto"></div></div>
                                                        <script type="text/javascript">
                                                            $('#drag').drag();
                                                        </script>
                                                    <#--滑动验证 结束-->
                                                        <p class="wangjimima" style="text-align: center">
                                                            <a href="${ctxPath}/plant/user/forget" class="queren">忘记密码？</a>
                                                            <input type="button" value="确 定" id="logBtn" class="queren"/>
                                                        </p>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </#if>
                        </li>
                    </ul>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4" style="margin: -10px;padding-left: 25px;">
                    <p class="plan"><img src="${ctxPath}/static/ymplant/images/logo.png" style="height: 100%; width: auto;" /></p>
                </div>
                <div class="col-md-8 col-sm-8 col-xs-8" style="padding: 20px 15px 10px 15px;margin: -10px;">
                    <ul class="gation">
                        <li class="nal">
                            <a class="colour<#if curPage?? && curPage == 'index'> nav-active</#if>" href="/">网站首页</a>
                        </li>
                        <li class="nalism">
                            <a class="bse colour<#if curPage?? && curPage == 'report'> nav-active</#if>" href="javascript:void (0);">志愿推荐</a>
                            <ul class="notice">
                                <li>
                                    <a href="<#if !Session.session_user_key??>javascript:showError('请先登录账号');<#else><#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'><#if Session.session_user_key.OVERDUETIME??>${ctxPath}/plant/report/report<#else>javascript:showError('您当前不是黄金会员，点击确定前往激活页面', 'authority');</#if><#else>javascript:showError('请确认账号为学生身份');</#if></#if>">模拟填报</a>
                                </li>
                                <li>
                                    <a href="<#if !Session.session_user_key??>javascript:showError('请先登录账号');<#else><#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'><#if Session.session_user_key.OVERDUETIME??>${ctxPath}/plant/report/index<#else>javascript:showError('您当前不是黄金会员，点击确定前往激活页面', 'authority');</#if><#else>javascript:showError('请确认账号为学生身份');</#if></#if>">智能推荐</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nal">
                            <a class="colour<#if curPage?? && curPage == 'online'> nav-active</#if>" href="${ctxPath}/plant/school/online">院校咨询</a>
                        </li>
                        <li class="nal">
                            <a class="colour<#if curPage?? && curPage == 'pertde'> nav-active</#if>" href="javascript:void(0);">名师指导</a>
                        <#--${ctxPath}/plant/expert/index-->
                        </li>
                        <li class="nalism">
                            <a class="bse colour<#if curPage?? && curPage == 'library'> nav-active</#if>" href="javascript:void (0);">信息库</a>
                            <ul class="notice">
                                <li>
                                    <a class="colour" href="${ctxPath}/plant/school/library">院校库</a>
                                </li>
                                <li>
                                    <a class="colour" href="${ctxPath}/plant/major/index">专业库</a>
                                </li>
                            </ul>
                        </li>
                    <#--<li class="nal">-->
                    <#--<a class="colour<#if curPage?? && curPage == 'news'> nav-active</#if>" href="${ctxPath}/plant/news/core">性格测试</a>-->
                    <#--</li>-->
                        <li class="nal">
                            <a class="colour<#if curPage?? && curPage == 'news'> nav-active</#if>" href="${ctxPath}/plant/news/core">新闻中心</a>
                        </li>
                        <div class="clear"></div>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="kd-map bakg">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6"></div>
                <div class="col-md-2 col-sm-2 col-xs-2" style="padding: 0">
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
            <div class="row" style="margin:  0">
                <div class="col-md-6 col-sm-6 col-xs-6" style="padding: 0">
                    <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0;margin-bottom: 20px;">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <img src="/static/ymplant/img/sye/banner/banner1.jpg" alt="...">
                                </div>
                                <div class="item">
                                    <img src="/static/ymplant/img/sye/banner/banner2.jpg" alt="...">
                                </div>
                                <div class="item">
                                    <img src="/static/ymplant/img/sye/banner/banner3.jpg" alt="...">
                                </div>
                            </div>

                            <!-- Controls -->
                            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0;">
                        <div id="carousel-example-generic2" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic2" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic2" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic2" data-slide-to="2"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <img src="/static/ymplant/img/sye/banner/banner4.jpg" alt="...">
                                </div>
                                <div class="item">
                                    <img src="/static/ymplant/img/sye/banner/banner5.jpg" alt="...">
                                </div>
                                <div class="item">
                                    <img src="/static/ymplant/img/sye/banner/6.jpg" alt="...">
                                </div>
                            </div>

                            <!-- Controls -->
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
                                        <p style="color: #8D8C8A;font-size: 10px;">
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
            <!--线下活动、精选视频 开始-->
            <div class="row" style="margin: 20px 0;">
                <div class="col-md-6 col-sm-6 col-xs-6" style="padding: 0;">
                <#--<img src="/static/ymplant/img/sye/xxhd.png" style="width:100%;margin-bottom: 10px;" alt=""/>-->
                    <div class="kd-dtai">
                        线下活动
                        <a class="kd-gduo" href="${ctxPath}/plant/news/more/news/23wtostpu8" style="text-decoration: none;" target="_blank">更多>>></a>
                        <img class="kd-dtai2" src="/static/ymplant/img/sye/tubiao/xianxia.png" alt="">
                    </div>
                    <div class="row" style="padding: 30px 0;border: 1px solid #ccc;margin: 0;">
                        <div class="col-md-6 col-sm-6 col-xs-6">
                        <#if news?? && (news?size > 0)>
                            <#list news as newsObj>
                                <#if newsObj_index == 0>
                                    <a href="${ctxPath}/plant/news/details/${newsObj.NEWS_ID}" class="tivity" title="${newsObj.TITLE}" style="text-decoration: none" target="_blank">
                                        <img src="<#if newsObj.IMGURL??>${newsObj.IMGURL}<#else>${ctxPath}/static/ymplant/img/timg.png</#if>" style="width: 100%;height:190px;;" alt=""/>
                                        <p style="padding: 10px;font-size: 25px;">
                                            <span class="kd-yc">${newsObj.TITLE}</span>
                                        </p>
                                        <p style="color: #8D8C8A;padding: 0 10px;font-size: 10px;">
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