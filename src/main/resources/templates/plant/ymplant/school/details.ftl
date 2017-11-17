<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/school/details.css?v=${v}"/>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=UC4yLW5tsNC9fgL5Y0CQaomei9VSe1Zo"></script>
    <script>
        $(document).ready(function(e) {
            /***不需要自动滚动，去掉即可***/
            time = window.setInterval(function(){
                $('.og_next').click();
            },5000);
            /***不需要自动滚动，去掉即可***/
            linum = $('.mainlist li').length;//图片数量
            w = linum * 250;//ul宽度
            $('.piclist').css('width', w + 'px');//ul宽度
            $('.swaplist').html($('.mainlist').html());//复制内容

            $('.og_next').click(function(){

                if($('.swaplist,.mainlist').is(':animated')){
                    $('.swaplist,.mainlist').stop(true,true);
                }

                if($('.mainlist li').length>4){//多于4张图片
                    ml = parseInt($('.mainlist').css('left'));//默认图片ul位置
                    sl = parseInt($('.swaplist').css('left'));//交换图片ul位置
                    if(ml<=0 && ml>w*-1){//默认图片显示时
                        $('.swaplist').css({left: '1000px'});//交换图片放在显示区域右侧
                        $('.mainlist').animate({left: ml - 1000 + 'px'},'slow');//默认图片滚动
                        if(ml==(w-1000)*-1){//默认图片最后一屏时
                            $('.swaplist').animate({left: '0px'},'slow');//交换图片滚动
                        }
                    }else{//交换图片显示时
                        $('.mainlist').css({left: '1000px'})//默认图片放在显示区域右
                        $('.swaplist').animate({left: sl - 1000 + 'px'},'slow');//交换图片滚动
                        if(sl==(w-1000)*-1){//交换图片最后一屏时
                            $('.mainlist').animate({left: '0px'},'slow');//默认图片滚动
                        }
                    }
                }
            })
            $('.og_prev').click(function(){

                if($('.swaplist,.mainlist').is(':animated')){
                    $('.swaplist,.mainlist').stop(true,true);
                }

                if($('.mainlist li').length>4){
                    ml = parseInt($('.mainlist').css('left'));
                    sl = parseInt($('.swaplist').css('left'));
                    if(ml<=0 && ml>w*-1){
                        $('.swaplist').css({left: w * -1 + 'px'});
                        $('.mainlist').animate({left: ml + 1000 + 'px'},'slow');
                        if(ml==0){
                            $('.swaplist').animate({left: (w - 1000) * -1 + 'px'},'slow');
                        }
                    }else{
                        $('.mainlist').css({left: (w - 1000) * -1 + 'px'});
                        $('.swaplist').animate({left: sl + 1000 + 'px'},'slow');
                        if(sl==0){
                            $('.mainlist').animate({left: '0px'},'slow');
                        }
                    }
                }
            })
        });

        $(document).ready(function(){
            $('.og_prev,.og_next').hover(function(){
                $(this).fadeTo('fast',1);
            },function(){
                $(this).fadeTo('fast',0.7);
            })

        })
    </script>
    <script>
        $(document).ready(function(){
            $('.zhanbtn').click(function(){
                if($(this).siblings('div.yxjs_nei').css('overflow')=='hidden'){
                    $(this).parent().css({'overflow':'visible','height':'auto'});
                    $(this).siblings('div.yxjs_nei').css({'overflow':'visible','height':'auto'});
                    $(this).html('（收起全部）');
                }else{
                    $(this).parent().css({'overflow':'hidden','height':'177px'});
                    $(this).siblings('div.yxjs_nei').css({'overflow':'hidden','height':'137px'});
                    $(this).html('（展开全部）');
                }
            });
        })
    </script>
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
<div class="advisory">
    <div class="container">
        <!--学校 顶部 开始-->
        <div class="row kd-dbu">
            <div class="col-md-1 col-sm-1 col-xs-1">
                <img src="<#if school.HEADURL??>${school.HEADURL}<#else>/static/ymplant/img/timg.png</#if>" style="width: 120%" alt=""/>
            </div>
            <div class="col-md-7 col-sm-7 col-xs-7">
                <p style="color:#8F1929;font-size: 22px;font-weight: bold;">${school.NAME}</p>
                <p><a class="kd-gwanh btn btn-info" style="text-decoration: none;" href="<#if school?? && school.SCWEBSITE??>${school.SCWEBSITE}<#else>javascript:void(0);</#if>" target="_blank">官方网站</a></p>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2">
            <#--<a class="kd-gwanh" href="<#if school?? && school.SCWEBSITE??>${school.SCWEBSITE}<#else>javascript:void(0);</#if>">官方网站</a>-->
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: right">
                <span class="kd-yru">
                    <input class="kd-wlshi" type="button" value="在线咨询">
                    <ul class="kd-cxian">
                        <li class="kd-lshi">入驻老师</li>
                        <li class="formula">
                        <#if teachers?? && (teachers?size > 0)>
                            <#list teachers as teacher>
                                <div class="row" style="margin: 0;border-bottom:1px solid #e3e3e3;">
                                <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 10px 10px 10px 25px;">
                                    <img src="<#if teacher.HEADURL??>${teacher.HEADURL}<#else>/static/ymplant/img/timg.png</#if>" class="portrai" alt="">
                                </div>
                                <div class="col-md-5 col-sm-5 col-xs-5" style="padding: 0;text-align: left;padding-left: 10px;">
                                    <p style="color:#9EAAAA;font-size: 10px;margin-top: 10px"><#if teacher.NICKNAME??>${teacher.NICKNAME}<#else>暂无</#if></p>
                                    <p style="color:#9EAAAA;font-size: 10px">
                                        <span><#if teacher.JOBTYPE??>${teacher.JOBTYPE}<#else>暂无</#if></span>
                                    </p>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 0;">
                                    <#--<p style="color:#A53D3C;font-family: 微软雅黑;font-weight: bold">￥<span>500</span></p>-->
                                        <p style="padding: 17px 0;">
                                        <a class="btn btn-info" href="<#if Session?? && Session.session_user_key??>${ctxPath}/plant/chat/page/student/${teacher.USER_ID}<#else>javascript:showError('请登录账号！');</#if>">咨 询</a>
                                    </p>
                                </div>
                            </div>
                            </#list>

                            <#else>
                        </#if>
                            <div class="row" style="margin: 0;border-bottom:1px solid #e3e3e3;">
                                <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 10px 10px 10px 25px;">
                                    <img src="/static/ymplant/images/tubiao3/service.png" class="portrai" alt="">
                                </div>
                                <div class="col-md-5 col-sm-5 col-xs-5" style="padding: 0;text-align: left;padding-left: 10px;">
                                    <p style="color:#9EAAAA;font-size: 10px;margin-top: 10px">在线客服</p>
                                    <p style="color:#9EAAAA;font-size: 10px">
                                        <span>院校咨询专员</span>
                                    </p>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 0;">
                                        <p style="padding: 17px 0;">
                                        <a class="btn btn-info" href="<#if Session.session_user_key?? && Session.session_user_key.USER_ID??>javascript:showError('当前无客服人员在线！');<#else>javascript:showError('请先登录账号');</#if>">咨 询</a>
                                    </p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </span>
            <#--<input class="collection" type="button" value="+收藏"/>-->
            </div>

        </div>
        <!--学校 顶部结束-->

        <!--在线咨询 开始-->
        <div class="row">
        <#--<div class="col-md-8 col-sm-8 col-xs-8">-->
        <#--<div class="frame">-->
        <#--<span class="zxlg">在线咨询</span>-->
        <#--<ul class="consulting">-->
        <#--<#if teachers?? && (teachers?size > 0)>-->
        <#--<#list teachers as teacher>-->
        <#--<li style="width: 33.3%;">-->
        <#--<div class="row">-->
        <#--<div class="col-md-4 col-sm-4 col-xs-4" style="padding-left: 0">-->
        <#--<div style="width: 100%;height:60px;border-radius: 50%;overflow: hidden">-->
        <#--<img src="<#if teacher.HEADURL??>${teacher.HEADURL}<#else>${ctxPath}/static/ymplant/img/timg.png</#if>" style="width: 100%;height: 100%;" alt=""/>-->
        <#--</div>-->
        <#--</div>-->
        <#--<div class="col-md-8 col-sm-8 col-xs-8" style="padding: 0">-->
        <#--<p style="margin: 0;font-weight: bold"><#if teacher.NICKNAME??>${teacher.NICKNAME}<#else>暂无信息</#if></p>-->
        <#--<p style="margin: 0;font-size: .1em"><span style="color:#FA83B9;"><#if teacher.JOBDATE_VALUE??>${teacher.JOBDATE_VALUE}<#else>暂无</#if></span>丨<span style="color:#FA83B9;"><#if teacher.JOBTYPE??>${teacher.JOBTYPE}<#else>暂无</#if></span></p>-->
        <#--<a type="button" style="text-decoration: none;" class="him" href="<#if Session?? && Session.session_user_key??>${ctxPath}/plant/chat/page/student/${teacher.USER_ID}<#else>javascript:showError('请登录账号！');</#if>">开始咨询</a>-->
        <#--</div>-->
        <#--</div>-->
        <#--</li>-->
        <#--</#list>-->
        <#--</#if>-->
        <#--<div style="clear: both;"></div>-->
        <#--</ul>-->
        <#--</div>-->
        <#--</div>-->
            <div class="col-md-8 col-sm-8 col-xs-8">
                <div class="platform">
                    院校介绍
                    <img class="kd-tion" src="/static/ymplant/img/sye/tubiao/schoolIntroduction.png" style="width: 22px;height: 22px;" alt="">
                </div>
                <div class="yxjs_wai">
                    <div class="yxjs_nei">
                        <#if introduce??>${introduce.CONTENT}<#else>暂无信息</#if>
                    </div>
                    <a class="zhanbtn" style="color: #39A3E2;" href="javascript:void (0);">（展开全部）</a>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-left: 0;">
                <div class="platform">
                    基本信息
                    <img class="kd-tion" src="/static/ymplant/img/sye/tubiao/essentialInformation.png" style="width: 22px;height: 22px;" alt="">
                </div>
                <div class="frame">
                <#--<div class="row kd-lxing">-->
                <#--<div class="col-md-6 col-sm-6 col-xs-6">-->
                <#--<span>院校类型：</span>-->
                <#--<span><#if school.SCTYPE_VALUE??>${school.SCTYPE_VALUE}</#if></span>-->
                <#--</div>-->
                <#--<div class="col-md-6 col-sm-6 col-xs-6">-->
                <#--<span>创办时间：</span>-->
                <#--<span><#if school.CREATEDATE??>${school.CREATEDATE}<#else>暂无</#if></span>-->
                <#--<span>年</span>-->
                <#--</div>-->
                <#--</div>-->
                <#--<div class="row kd-lxing">-->
                <#--<div class="col-md-6 col-sm-6 col-xs-6">-->
                <#--<span>隶属于：<#if school.SUBJECTION??>${school.SUBJECTION}<#else>暂无</#if></span>-->
                <#--</div>-->
                <#--<div class="col-md-6 col-sm-6 col-xs-6">-->
                <#--<span>所在地：<#if school.PROVINCE_VALUE??>${school.PROVINCE_VALUE}<#else>暂无</#if></span>-->
                <#--</div>-->
                <#--</div>-->
                    <p style="margin-bottom: 5px;">
                        <span style="font-weight: bold;">学校类别：</span>
                        <span><#if school?? && school.SCTYPE_VALUE??>${school.SCTYPE_VALUE}<#else>暂无</#if></span>
                    </p>
                    <p style="margin-bottom: 5px;">
                        <span style="font-weight: bold;">创建时间：</span>
                        <span><#if school?? && school.CREATEDATE??>${school.CREATEDATE}年<#else>暂无</#if></span>
                    </p>
                    <p style="margin-bottom: 5px;display: flex;flex-direction:row;align-items:center;">
                        <span style="font-weight: bold;">学校类型：</span>
                        <#if school?? && school.subjecttypes?? && (school.subjecttypes?size > 0)>
                            <#list school.subjecttypes as subjecttypeObj>
                                <span class="kd-${subjecttypeObj.DIC_ID}" title="${subjecttypeObj.NAME}"></span>
                            </#list>
                        <#else>
                            暂无
                        </#if>
                    </p>
                    <p style="margin-bottom: 5px;">
                        <span style="margin-right: 10px;font-weight: bold;">所在地：</span>
                        <span><#if school?? && school.PROVINCE_VALUE??>${school.PROVINCE_VALUE}<#else>暂无</#if></span>
                    </p>
                    <p style="margin-bottom: 5px;">
                        <span style="margin-right: 10px;font-weight: bold;">隶属于：</span>
                        <span><#if school?? && school.SUBJECTION??>${school.SUBJECTION}<#else>暂无</#if></span>
                    </p>
                    <p style="margin-bottom: 5px;display: flex;flex-direction:row;align-items:center;">
                        <span style="font-weight: bold;">学校属性：</span>
                        <span>
                        <#if school?? && school.properties?? && (school.properties?size > 0)>
                            <#list school.properties as property>
                                <span class="kd-${property.DIC_ID}" title="${property.NAME}"></span>
                            </#list>
                        <#else>
                            暂无
                        </#if>
                            </span>
                    </p>
                </div>
            </div>
        </div>
        <!--在线咨询 结束-->

        <!--院校介绍 开始-->
    <#--<div class="platform">-->
    <#--院校介绍-->
    <#--</div>-->
    <#--<div class="introduce">-->
    <#--</div>-->
        <!--院校介绍 结束-->
        <!--线下活动 开始-->
        <div class="row">
            <div class="col-md-8 col-sm-8 col-xs-8">
                <div class="platform">
                    学校资料
                    <img class="kd-tion" src="/static/ymplant/img/sye/tubiao/schoolInfo.png" style="width: 22px;height: 22px;" alt="">
                </div>
                <div class="kd-hdong row">
                <#if articles?? && (articles?size > 0)>
                    <#list articles as article>
                        <#if (article_index == 0)>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="${ctxPath}/plant/news/details/${article.ARTICLE_ID}">
                                    <img src="<#if article.IMGURL??>${article.IMGURL}<#else>/static/ymplant/img/timg.png</#if>" style="width:216px;height: 162px;" alt=""/>
                                    <p style="text-align: center;font-weight: bold">
                                    ${article.TITLE}
                                    </p>
                                </a>
                            </div>
                        </#if>
                    </#list>
                <#else>
                    <div class="col-md-4 col-sm-4 col-xs-4">
                        <a href="javascript:void(0);">
                            <img src="/static/ymplant/img/timg.png" style="width:216px;height: 162px;" alt=""/>
                            <p style="text-align: center;font-weight: bold">
                                暂无信息
                            </p>
                        </a>
                    </div>
                </#if>

                    <div class="col-md-8 col-sm-8 col-xs-8">
                    <#if articles?? && (articles?size > 1)>
                        <#list articles as article>
                            <#if (article_index > 0)>
                                <div class="row kd-jjin">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <a href="${ctxPath}/plant/article/details/${article.ARTICLE_ID}" class="kd-kao"style="text-decoration: none">${article.TITLE}</a>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6" style="color: #939393;text-align: right">
                                        <i class="glyphicon glyphicon-time"></i>
                                        <span>${article.CREATETIME}</span>
                                        <span style="margin-left: 20px;">
                                                    <i class="glyphicon glyphicon-eye-open"></i>&nbsp;
                                        ${article.VIEWCOUNT}
                                                </span>
                                    </div>
                                </div>
                            </#if>
                        </#list>
                    <#else>
                        <div class="row kd-jjin">
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <a href="javascript:void(0);" class="kd-kao"style="text-decoration: none">暂无信息</a>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="color: #939393;text-align: right">
                                <i class="glyphicon glyphicon-time"></i>
                                <span>暂无</span>
                                <span style="margin-left: 20px;">
                                            <i class="glyphicon glyphicon-eye-open"></i>&nbsp;
                                            0
                                        </span>
                            </div>
                        </div>
                    </#if>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 5px 35px;text-align: right">
                        <a href="${ctxPath}/plant/news/more/article/${school.SCHOOL_ID
                        }" style="font-size: 12px;color: #814648;text-decoration: none">更多 >>></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-left: 0">
                <div class="kd-fshu row">
                    <div class="col-md-6 col-sm-6 col-xs-6 platform2">
                        <div style="font-size:16px;color: #fff;padding-top: 5px;padding-left: 5px;">
                            往年分数线
                        </div>
                        <img class="kd-tion2" src="/static/ymplant/img/sye/tubiao/previousscores.png" style="width: 22px;height: 22px;" alt="">
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" style="line-height: 2">
                    <#--<ul class="nav nav-tabs bke" id="bke" role="tablist">-->
                    <#--<li class="active" id="BMAJOR">-->
                    <#--<a href="#bke2" class="active" id="bke1" aria-controls="home" role="tab" data-toggle="tab" aria-expanded="true" onclick="setSearch(0)">-->
                    <#--文科-->
                    <#--</a>-->
                    <#--</li>-->
                    <#--<li id="ZMAJOR" class="">-->
                    <#--<a href="#bke3" class="" id="zke" aria-controls="settings" role="tab" data-toggle="tab" onclick="setSearch(1);" aria-expanded="false">-->
                    <#--理科-->
                    <#--</a>-->
                    <#--</li>-->
                    <#--</ul>-->
                        <span style="margin-right: 10px;color: #fff;font-weight: bold">河北省</span>
                    <#--<select name="" id="">
                        <option value="">本一</option>
                        <option value="">本二</option>
                        <option value="">专科</option>
                    </select>-->
                        <select id="bkemajortype">
                            <option value="bke2">文科</option>
                            <option value="bke3">理科</option>
                        </select>
                    </div>
                </div>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="bke2">
                        <div class="kd-nfen">
                        <#--<table style="width:100%;">-->
                        <#--<tr>-->
                        <#--<td>年份</td>-->
                        <#--<td>批次</td>-->
                        <#--<td>最高分</td>-->
                        <#--<td>最低分</td>-->
                        <#--<td>计划数</td>-->
                        <#--</tr>-->
                        <#--</table>-->
                            <table style="width:100%;">
                                <tr>
                                    <td>年份</td>
                                    <td>批次</td>
                                    <td>最高分</td>
                                    <td>最低分</td>
                                    <td>录取数</td>
                                </tr>
                            <#if wscores?? && (wscores?size > 0)>
                                <#list wscores as score>
                                    <tr>
                                        <td>${score.YEAR_VALUE}</td>
                                        <td>${score.ARRANGMENT_VALUE}</td>
                                        <td>${score.MAXSCORE}</td>
                                        <td>${score.MINSCORE}</td>
                                        <td>${score.ENTERCOUNT}</td>
                                    </tr>
                                </#list>
                            <#else>
                                <tr><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                                <tr><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                                <tr><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                            </#if>
                            </table>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="bke3">
                        <div class="kd-nfen">
                            <table style="width:100%;">
                                <tr>
                                    <td>年份</td>
                                    <td>批次</td>
                                    <td>最高分</td>
                                    <td>最低分</td>
                                    <td>计划数</td>
                                </tr>
                            <#if lscores?? && (lscores?size > 0)>
                                <#list lscores as score>
                                    <tr>
                                        <td>${score.YEAR_VALUE}</td>
                                        <td>${score.ARRANGMENT_VALUE}</td>
                                        <td>${score.MAXSCORE}</td>
                                        <td>${score.MINSCORE}</td>
                                        <td>${score.ENTERCOUNT}</td>
                                    </tr>
                                </#list>
                            <#else>
                                <tr><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                                <tr><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                                <tr><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                            </#if>
                            </table>
                        </div>
                    </div>
                </div>

            <#--<div class="kd-hse">
                <input class="kd-cshi" style="margin-right: 40px;" type="button" value="同层次院校"/>
                <input class="kd-cshi" type="button" value="加入测试"/>
            </div>-->
            </div>
        </div>
        <!--线下活动 结束-->


        <!--院校风光 院校地址 开始-->
        <div class="row" style="margin-top: 20px;margin-bottom: 20px;">
            <!--院校风光 开始-->
            <div class="col-md-8 col-sm-8 col-xs-8">
            <#--<div class="platform">-->
            <#--院校视频-->
            <#--</div>-->
            <#--<div class="kd-lse row">-->
            <#--<div class="col-md-8 col-sm-8 col-xs-8">-->
            <#--<div id="videoViewer">-->
            <#--<#if videos?? && (videos?size > 0)>-->
            <#--<#list videos as video>-->
            <#--<#if (video_index == 0)>-->
            <#--<embed src="${video.URL}" type="video/x-ms-asf-plugin" width="390" height="350" autostart="false" loop="true">-->
            <#--</#if>-->
            <#--</#list>-->
            <#--<#else>-->
            <#--<img src="/static/ymplant/img/timg.png" style="width: 100%;" alt=""/>-->
            <#--</#if>-->
            <#--</div>-->
            <#--</div>-->
            <#--<div class="col-md-4 col-sm-4 col-xs-4">-->
            <#--<#if videos?? && (videos?size > 0)>-->
            <#--<#list videos as video>-->
            <#--<div style="margin-bottom: 10px;" class="row kd-yxiao">-->
            <#--<a href="#${video.URL}" class="kd-yse">-->
            <#--<div class="col-md-6 col-sm-6 col-xs-6">-->
            <#--<img src="/static/ymplant/img/2.png" style="width: 100%;" alt=""/>-->
            <#--</div>-->
            <#--<div class="col-md-6 col-sm-6 col-xs-6" style="padding: 0">-->
            <#--<p style="font-size: 10px;">${video.TITLE}</p>-->
            <#--<p style="font-size: 10px;">${video.CREATETIME}</p>-->
            <#--</div>-->
            <#--</a>-->
            <#--</div>-->
            <#--</#list>-->
            <#--<#else>-->
            <#--<div style="margin-bottom: 10px;" class="row kd-yxiao">-->
            <#--<a href="#" class="kd-yse">-->
            <#--<div class="col-md-6 col-sm-6 col-xs-6">-->
            <#--<img src="/static/ymplant/img/timg.png" style="width: 100%;" alt=""/>-->
            <#--</div>-->
            <#--<div class="col-md-6 col-sm-6 col-xs-6" style="padding: 0">-->
            <#--<p style="font-size: 10px;">暂无信息</p>-->
            <#--</div>-->
            <#--</a>-->
            <#--</div>-->
            <#--</#if>-->
            <#--</div>-->
            <#--</div>-->
                <div class="platform">
                    院校地址
                    <img class="kd-tion" src="/static/ymplant/img/sye/tubiao/schoolmap.png" style="width: 22px;height: 22px;" alt="">
                </div>
                <div class="address" id="allmap" style="height: 300px;">
                </div>
                <p>详细地址：<#if school.ADDRESS??>${school.ADDRESS}<#else>暂无信息</#if></p>
            </div>
            <!--院校风光 结束-->
            <!--院校地址 开始-->
            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-left: 0;">
                <div class="platform">
                    同省院校
                    <img class="kd-tion" src="/static/ymplant/img/sye/tubiao/province.png" style="width: 22px;height: 22px;" alt="">
                </div>
                <div style="padding: 0;">
                    <div class="row" style="margin: 0">
                    <#if otherSchools?? && (otherSchools?size > 0)>
                        <#list otherSchools as otherSchool>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding: 15px 0;border-bottom: 1px dashed #333">
                                <a href="${ctxPath}/plant/school/details/${otherSchool.SCHOOL_ID}" target="_blank">
                                    <div class="row" style="margin: 0;color: #333333;">
                                        <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 0;">
                                            <div style="width: 45px;height: 45px;border-radius: 50%;overflow: hidden">
                                                <img src="<#if otherSchool.HEADURL??>${otherSchool.HEADURL}<#else>/static/ymplant/img/timg.png</#if>" style="width: 100%;height: 100%;" alt="">
                                            </div>
                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-9" style="font-size: 13px;">
                                            <#if otherSchool.NAME??>${otherSchool.NAME}<#else>暂无信息</#if>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </#list>
                    <#else>
                        <div class="col-md-6 col-sm-6 col-xs-6" style="padding: 15px 0;border-bottom: 1px dashed #333">
                            <a href="javascript:void(0);">
                                <div class="row" style="margin: 0;color: #333333;">
                                    <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 0;">
                                        <div style="width: 45px;height: 45px;border-radius: 50%;overflow: hidden">
                                            <img src="/static/ymplant/img/timg.png" style="width: 100%;height: 100%;" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-sm-9 col-xs-9" style="font-size: 13px;">
                                        暂无信息
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6" style="padding: 15px 0;border-bottom: 1px dashed #333">
                            <a href="javascript:void(0);">
                                <div class="row" style="margin: 0;color: #333333;">
                                    <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 0;">
                                        <div style="width: 45px;height: 45px;border-radius: 50%;overflow: hidden">
                                            <img src="/static/ymplant/img/timg.png" style="width: 100%;height: 100%;" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-sm-9 col-xs-9" style="font-size: 13px;">
                                        暂无信息
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6" style="padding: 15px 0;border-bottom: 1px dashed #333">
                            <a href="javascript:void(0);">
                                <div class="row" style="margin: 0;color: #333333;">
                                    <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 0;">
                                        <div style="width: 45px;height: 45px;border-radius: 50%;overflow: hidden">
                                            <img src="/static/ymplant/img/timg.png" style="width: 100%;height: 100%;" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-sm-9 col-xs-9" style="font-size: 13px;">
                                        暂无信息
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6" style="padding: 15px 0;border-bottom: 1px dashed #333">
                            <a href="javascript:void(0);">
                                <div class="row" style="margin: 0;color: #333333;">
                                    <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 0;">
                                        <div style="width: 45px;height: 45px;border-radius: 50%;overflow: hidden">
                                            <img src="/static/ymplant/img/timg.png" style="width: 100%;height: 100%;" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-sm-9 col-xs-9" style="font-size: 13px;">
                                        暂无信息
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6" style="padding: 15px 0;border-bottom: 1px dashed #333">
                            <a href="javascript:void(0);">
                                <div class="row" style="margin: 0;color: #333333;">
                                    <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 0;">
                                        <div style="width: 45px;height: 45px;border-radius: 50%;overflow: hidden">
                                            <img src="/static/ymplant/img/timg.png" style="width: 100%;height: 100%;" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-sm-9 col-xs-9" style="font-size: 13px;">
                                        暂无信息
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6" style="padding: 15px 0;border-bottom: 1px dashed #333">
                            <a href="javascript:void(0);">
                                <div class="row" style="margin: 0;color: #333333;">
                                    <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 0;">
                                        <div style="width: 45px;height: 45px;border-radius: 50%;overflow: hidden">
                                            <img src="/static/ymplant/img/timg.png" style="width: 100%;height: 100%;" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-sm-9 col-xs-9" style="font-size: 13px;">
                                        暂无信息
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6" style="padding: 15px 0;border-bottom: 1px dashed #333">
                            <a href="javascript:void(0);">
                                <div class="row" style="margin: 0;color: #333333;">
                                    <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 0;">
                                        <div style="width: 45px;height: 45px;border-radius: 50%;overflow: hidden">
                                            <img src="/static/ymplant/img/timg.png" style="width: 100%;height: 100%;" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-sm-9 col-xs-9" style="font-size: 13px;">
                                        暂无信息
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6" style="padding: 15px 0;border-bottom: 1px dashed #333">
                            <a href="javascript:void(0);">
                                <div class="row" style="margin: 0;color: #333333;">
                                    <div class="col-md-3 col-sm-3 col-xs-3" style="padding: 0;">
                                        <div style="width: 45px;height: 45px;border-radius: 50%;overflow: hidden">
                                            <img src="/static/ymplant/img/timg.png" style="width: 100%;height: 100%;" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-sm-9 col-xs-9" style="font-size: 13px;">
                                        暂无信息
                                    </div>
                                </div>
                            </a>
                        </div>
                    </#if>
                    </div>
                </div>
            </div>
            <!--院校地址 结束-->
        </div>
        <!--院校风光 院校地址 结束-->
    <#--<div class="scenery">-->
    <#--<ul class="row kd-fdong">-->
    <#--<#if images?? && (images?size > 0)>-->
    <#--<#list images as image>-->
    <#--<li style="width: 20%">-->
    <#--<div class="college">-->
    <#--<a href="javascript:void(0);">-->
    <#--<img src="${image.URL}" style="width: 100%;height:100%;" alt=""/>-->
    <#--<p class="gate">${image.TITLE}</p>-->
    <#--</a>-->
    <#--</div>-->
    <#--</li>-->
    <#--</#list>-->
    <#--<#else>-->
    <#--<li style="width: 20%">-->
    <#--<div class="college">-->
    <#--<a href="javascript:void(0);">-->
    <#--<img src="/static/ymplant/img/timg.png" style="width: 100%;height:100%;" alt=""/>-->
    <#--</a>-->
    <#--</div>-->
    <#--</li>-->
    <#--</#if>-->
    <#--<div class="clear"></div>-->
    <#--</ul>-->
    <#--<a class="zuo" href="#">-->
    <#--<img src="/static/ymplant/images/tubiao/zuo.png" alt=""/>-->
    <#--</a>-->
    <#--<a class="you" href="#">-->
    <#--<img src="/static/ymplant/images/tubiao/you.png" alt=""/>-->
    <#--</a>-->
    <#--</div>-->
    <#--<div class="box">-->
    <#--<div class="picbox">-->
    <#--<ul class="piclist mainlist">-->
    <#--<li><a href="javascript:void(0);" target="_blank"><img src="/static/ymplant/img/2.png" width="220" height="105" /></a></li>-->
    <#--<li><a href="javascript:void(0);" target="_blank"><img src="/static/ymplant/img/2.png" width="220" height="105" /></a></li>-->
    <#--<li><a href="javascript:void(0);" target="_blank"><img src="/static/ymplant/img/2.png" width="220" height="105"  /></a></li>-->
    <#--<li><a href="javascript:void(0);" target="_blank"><img src="/static/ymplant/img/2.png" width="220" height="105"  /></a></li>-->
    <#--<li><a href="javascript:void(0);" target="_blank"><img src="/static/ymplant/img/2.png" width="220" height="105"  /></a></li>-->
    <#--<li><a href="javascript:void(0);" target="_blank"><img src="/static/ymplant/img/2.png" width="220" height="105"  /></a></li>-->
    <#--<li><a href="javascript:void(0);" target="_blank"><img src="/static/ymplant/img/2.png" width="220" height="105"  /></a></li>-->
    <#--<li><a href="javascript:void(0);" target="_blank"><img src="/static/ymplant/img/2.png" width="220" height="105"  /></a></li>-->
    <#--</ul>-->
    <#--<ul class="piclist swaplist"></ul>-->
    <#--</div>-->
    <#--<div class="og_prev"></div>-->
    <#--<div class="og_next"></div>-->
    <#--</div>-->
        <!--院系 开设专业 结束-->
    <#if faculty?? && faculty.CONTENT??>
        <div class="platform">
            院系与专业
            <img class="kd-tion" src="/static/ymplant/img/sye/tubiao/schoolandmajor.png" style="width: 22px;height: 22px;" alt="">
        </div>
    ${faculty.CONTENT}
    </#if>
    </div>
</div>
<script language="JavaScript">
    $(function () {
        sendRequest("/plant/school/api/addview", {SCHOOL_ID: "<#if school?? && school.SCHOOL_ID??>${school.SCHOOL_ID}</#if>"}, "POST");
        $(".kd-yse").click(function () {
            var url = $(this).attr("href");
            url = url.substring(1, url.length);
            if(url != ""){
                var strHtml = "";
                strHtml += "<video src='" + url + "' width='390' height='350' autostart='false' loop='true' controls='controls' preload=''>";
                strHtml += "您的浏览器不支持视频播放";
                strHtml += "</video>";
                $("#videoViewer").html(strHtml);
            }
        });

        $("#bkemajortype").change(function () {
            $(".tab-pane").each(function () {
                $(this).hide();
            });
            $("#" + $(this).val()).show();
        });
    });

    var map = new BMap.Map("allmap");
    map.centerAndZoom(new BMap.Point(<#if school.LON??>${school.LON}<#else>116.404</#if>, <#if school.LAT??>${school.LAT}<#else>39.915</#if>), 15);
    map.enableScrollWheelZoom(true);
    <#if school.LON?? && school.LAT??>
    var marker = new BMap.Marker(new BMap.Point(${school.LON}, ${school.LAT}));
    map.addOverlay(marker);
    </#if>
</script>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>
