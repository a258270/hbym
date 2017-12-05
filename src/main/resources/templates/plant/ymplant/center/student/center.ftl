<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
    <#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <script src="/static/ymplant/js/center/jquery-accordion-menu.js" type="text/javascript"></script>
    <link href="/static/ymplant/css/center/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/column.css?v=${v}"/>
    <script language="JavaScript" src="${ctxPath}/static/ymplant/js/center/center.js?v=${v}"></script>
    <script>
        $(document).ready(function(){
            $(".stration").click(function(){
                $(this).parent().children(".kd-jchu").toggle();
                $(this).parent().children(".stration").toggleClass("red");
            });
        })
    </script>
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
<div id="personal">
    <div class="container">
        <div class="row" style="padding-top: 15px;">
            <!--左边栏 开始-->
            <div class="col-md-3 col-sm-3 col-xs-3 zbl">
                <div class="kd-zxin">
                    个人中心
                </div>
                <div class="round">
                    <img src="<#if completeInfo?? && completeInfo.HEADURL??>${completeInfo.HEADURL}<#else>/static/ymplant/img/timg.png</#if>" style="width: 100%;height: 100%;border-radius: 50%;" alt=""/>
                </div>
                <p class="name"><#if completeInfo?? && completeInfo.NICKNAME??>${completeInfo.NICKNAME}<#else>暂无</#if></p>
                <p style="color: #7F7F7F;font-weight: bold;text-align: center;">学生</p>
                <#--<p style="color: #C3C3C3;font-weight: bold;text-align: center"><#if Session.session_user_key?? && Session.session_user_key.OVERDUETIME??>黄金<#else>普通</#if>会员</p>-->
                <p style="text-align: center">
                    <input class="ordinary" type="button" style="font-size: 10px;background-color:<#if Session.session_user_key?? && Session.session_user_key.OVERDUETIME??>#FE7F2A;<#else>#2DC473;</#if>" value="<#if Session.session_user_key?? && Session.session_user_key.OVERDUETIME??>黄金会员<#else>普通会员</#if>"/>
                </p>
                <p style="text-align: center;margin: 15px 0">
                <#if Session.session_user_key?? && !Session.session_user_key.OVERDUETIME?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'>
                    <input type="button" value="升级黄金会员" class="gol" onclick="$('#authority').click()"/>
                </#if>
                </p>
                <#--<div class="kd-bkua">-->
                    <#--<input type="button" class="stration" value="个人资料"/>-->
                    <#--<img class="xzhu" src="/static/ymplant/images/tubiao/xzhu.png" alt=""/>-->
                    <#--<div class="kd-jchu">-->
                        <#--<input class="ster <#if !url??>kd-lhtai</#if>" type="button" data-href="${ctxPath}/plant/user/basicinfo" value="基础信息"/>-->
                        <#--<input class="ster <#if url?? && url == 'examinee'>kd-lhtai</#if>" type="button" value="考生信息" data-href="${ctxPath}/plant/user/examinee"/>-->
                    <#--</div>-->
                <#--</div>-->
                <#--<div class="kd-bkua">-->
                    <#--<input type="button" class="stration" value="账户信息"/>-->
                    <#--<img class="xzhu" src="/static/ymplant/images/tubiao/xzhu.png" alt=""/>-->
                    <#--<div class="kd-jchu">-->
                        <#--<input type="button" class="ster <#if url?? && url == 'pocket'>kd-lhtai</#if>" value="我的物品" data-href="${ctxPath}/plant/user/pocket"/>-->
                        <#--<input type="button" class="ster <#if url?? && url == 'account'>kd-lhtai</#if>" value="账户安全" data-href="${ctxPath}/plant/user/account"/>-->
                        <#--<input type="button" class="ster <#if url?? && url == 'authority'>kd-lhtai</#if>" value="账户权限" data-href="${ctxPath}/plant/user/authority" id="authority"/>-->
                    <#--</div>-->
                <#--</div>-->

                <div class="content">
                    <div id="jquery-accordion-menu" class="jquery-accordion-menu red">
                        <ul id="demo-list" style="border-top: 1px solid #F8F8F8;">
                            <li class="change"><a href="javascript:void(0);" class="personal">个人信息 </a>
                                <span class="small personal-data"></span>
                                <#--<img src="/static/ymplant/images/tubiao6/personal-data.png" class="small" alt="">-->
                                <ul class="submenu">
                                    <li><a href="javascript:void(0);" class="ster <#if !url??>kd-lhtai</#if>" data-href="${ctxPath}/plant/user/basicinfo">基础信息</a></li>
                                    <li><a href="javascript:void(0);" class="ster <#if url?? && url == 'examinee'>kd-lhtai</#if>" data-href="${ctxPath}/plant/user/examinee">考生信息 </a></li>
                                </ul>
                            </li>
                            <li class="change"><a href="javascript:void(0);" class="personal">账户信息</a>
                                <#--<img src="/static/ymplant/images/tubiao6/account.png" class="small" alt="">-->
                                <ul class="submenu">
                                    <span class="small account"></span>
                                    <li><a href="javascript:void(0);" class="ster <#if url?? && url == 'pocket'>kd-lhtai</#if>"  data-href="${ctxPath}/plant/user/pocket">我的物品</a></li>
                                    <li><a href="javascript:void(0);" class="ster <#if url?? && url == 'account'>kd-lhtai</#if>" data-href="${ctxPath}/plant/user/account">账户安全</a></li>
                                    <li><a href="javascript:void(0);" class="ster <#if url?? && url == 'authority'>kd-lhtai</#if>" data-href="${ctxPath}/plant/user/authority" id="authority">账户权限</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>

                <script type="text/javascript">
                    jQuery("#jquery-accordion-menu").jqueryAccordionMenu();
                </script>

            </div>
            <!--左边栏 结束-->
            <div class="col-md-9 col-sm-9 col-xs-9">

                <iframe id="information" scrolling="no" name="information" src="${ctxPath}/plant/user/<#if url??>${url}<#else>basicinfo</#if>" frameborder="0" onload="iFrameHeight()" style="border: 1px solid #7F7F7F;width: 100%;">

                </iframe>
            </div>
        </div>
    </div>
</div>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>