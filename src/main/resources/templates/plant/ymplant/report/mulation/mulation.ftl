<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/report/mendation/mendation.css?v=${v}"/>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/index-two.css?v=${v}"/>
    <link rel="stylesheet" href="/static/ymplant/css/report/mulation/mulation.css?v=${v}"/>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/chosen.jquery/chosen.jquery.min.js?v=${v}"></script>
    <link rel="stylesheet" type="text/css" href="${ctxPath}/static/plugin/h-ui/lib/chosen.jquery/chosen.min.css?v=${v}" />
    <script language="javascript">
        $(function(){
            $(".absolutely").click(function(){
                var data_class = $(this).attr("data-class");
                $("." + data_class).fadeToggle();

                var button_src = $(this).find("img").attr("src");
                if(button_src.indexOf("button-top") >= 0) {
                    $(this).find("img").attr("src", button_src.replace("button-top", "button-bottom"));
                }
                else if(button_src.indexOf("button-bottom") >= 0) {
                    $(this).find("img").attr("src", button_src.replace("button-bottom", "button-top"));
                }
            })
        });
    </script>
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
<div class="kd-tbao">
    <div class="container">
        <div class="row" style="margin: 10px 0;">
            <div class="col-md-12 col-sm-12 col-xs-12" style="padding-left: 0;">
            <#--<div class="kd-jshao">
                <p style="font-weight: bold;">功能介绍：</p>
                <div style="padding: 15px 20px 15px 40px;line-height: 1.7">
                    <p>1、本功能是依托于历史大数据，通过本平台自主研发的智能算法为考生分析出最为精确的志愿填报方案。</p>
                    <p>2、为了保证考生可以顺利选择到自己喜欢的院校与专业，请尝试多选择一些条件以供精确推荐，具体介绍如下：</p>
                    <p style="padding: 0 40px;">
                        科类：考生考试时属于哪一科类（文/理）
                    </p>
                    <p style="padding: 0 40px;">
                        地区：考生想考入的院校地区
                    </p>
                    <p style="padding: 0 40px;">
                        类别：考生想考入的院校类别（本/考）
                    </p>
                    <p style="padding: 0 40px;">
                        类型：选择类别后，系统将优先推荐出所选类别院校
                    </p>
                    <p style="padding: 0 0 0 40px;">
                        属性：选择类型后，系统将优先推荐出所选属性院校（注：高校分数与院校分数差距过大时，选择无效）
                    </p>
                    <p style="padding: 0 40px;">
                        专业：可选择仔细喜欢的专业，选择后将优先推荐。专业数量添加不可超过5个
                    </p>
                    <p>3、本系统推荐结果仅限参考，具体情况请根据当年招生政策自行判断。</p>
                </div>
            </div>-->
            <#--<div class="row">-->
            <#--<div class="col-md-9 col-sm-9 col-xs-9">-->
            <#--<div style="padding: 10px 0;">高考分数：<#if examinee?? && examinee.EXAMSCORE??>${examinee.EXAMSCORE}分<#else>暂无信息</#if> （注：高考分数如需改动，<a href="${ctxPath}/plant/user/center?p=examinee">点此修改</a>）</div>-->
            <#--</div>-->
            <#--<div class="col-md-3 col-sm-3 col-xs-3">-->
            <#--<ul class="nav nav-tabs right" id="kd-xzhong" style="background-color: #D4F5F1;" role="tablist">-->
            <#--<li role="presentation" class="active"><a href="#kd-kql" aria-controls="home" role="tab" data-toggle="tab">本一</a></li>-->
            <#--<li role="presentation"><a href="#kd-kql2" aria-controls="profile" role="tab" data-toggle="tab">本二</a></li>-->
            <#--</ul>-->
            <#--</div>-->
            <#--</div>-->
            <#--<div class="tab-content">-->
            <#--<div role="tabpanel" id="kd-kql" class="tab-pane kd-kql active">-->
            <#--<div class="row kd-sxu">-->
            <#--<div class="col-md-2 col-sm-2 col-xs-2">-->

            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5">-->
            <#--院校名称-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5">-->
            <#--专业名称-->
            <#--</div>-->
            <#--<div class="col-md-3 col-sm-3 col-xs-3"></div>-->
            <#--</div>-->
            <#--<!--志愿 开始&ndash;&gt;-->
            <#--<div class="row kd-zyuan">-->
            <#--<div class="col-md-2 col-sm-2 col-xs-2 kd-pd">-->
            <#--志愿A-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="school1b1" name="school1b1" data-type="b1" data-placeholder="请选择">-->
            <#--<option value=""></option>-->
            <#--<#if b1schools?? && (b1schools?size > 0)>-->
            <#--<#list b1schools as school>-->
            <#--<option value="${school.SCHOOL_ID}">${school.NAME}</option>-->
            <#--</#list>-->
            <#--</#if>-->
            <#--</select>-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="zye1b1" name="zye1b1" data-type="b1" data-placeholder="请选择">-->
            <#--</select>-->
            <#--</div>-->
            <#--</div>-->
            <#--<div class="row kd-zyuan" style="background-color: #fff">-->
            <#--<div class="col-md-2 col-sm-2 col-xs-2 kd-pd">-->
            <#--志愿B-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="school2b1" name="school2b1" data-type="b1" data-placeholder="请选择">-->
            <#--<option value=""></option>-->
            <#--<#if b1schools?? && (b1schools?size > 0)>-->
            <#--<#list b1schools as school>-->
            <#--<option value="${school.SCHOOL_ID}">${school.NAME}</option>-->
            <#--</#list>-->
            <#--</#if>-->
            <#--</select>-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="zye2b1" name="zye2b1" data-type="b1" data-placeholder="请选择">-->
            <#--</select>-->
            <#--</div>-->
            <#--</div>-->
            <#--<div class="row kd-zyuan">-->
            <#--<div class="col-md-2 col-sm-2 col-xs-2 kd-pd">-->
            <#--志愿C-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="school3b1" name="school3b1" data-type="b1" data-placeholder="请选择">-->
            <#--<option value=""></option>-->
            <#--<#if b1schools?? && (b1schools?size > 0)>-->
            <#--<#list b1schools as school>-->
            <#--<option value="${school.SCHOOL_ID}">${school.NAME}</option>-->
            <#--</#list>-->
            <#--</#if>-->
            <#--</select>-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="zye3b1" name="zye3b1" data-type="b1" data-placeholder="请选择">-->
            <#--</select>-->
            <#--</div>-->
            <#--</div>-->
            <#--<div class="row kd-zyuan" style="background-color: #fff">-->
            <#--<div class="col-md-2 col-sm-2 col-xs-2 kd-pd">-->
            <#--志愿D-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="school4b1" name="school4b1" data-type="b1" data-placeholder="请选择">-->
            <#--<option value=""></option>-->
            <#--<#if b1schools?? && (b1schools?size > 0)>-->
            <#--<#list b1schools as school>-->
            <#--<option value="${school.SCHOOL_ID}">${school.NAME}</option>-->
            <#--</#list>-->
            <#--</#if>-->
            <#--</select>-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="zye4b1" name="zye4b1" data-type="b1" data-placeholder="请选择">-->
            <#--</select>-->
            <#--</div>-->
            <#--</div>-->
            <#--<div class="row kd-zyuan">-->
            <#--<div class="col-md-2 col-sm-2 col-xs-2 kd-pd">-->
            <#--志愿E-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="school5b1" name="school5b1" data-type="b1" data-placeholder="请选择">-->
            <#--<option value=""></option>-->
            <#--<#if b1schools?? && (b1schools?size > 0)>-->
            <#--<#list b1schools as school>-->
            <#--<option value="${school.SCHOOL_ID}">${school.NAME}</option>-->
            <#--</#list>-->
            <#--</#if>-->
            <#--</select>-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="zye5b1" name="zye5b1" data-type="b1" data-placeholder="请选择">-->
            <#--</select>-->
            <#--</div>-->
            <#--</div>-->
            <#--<div style="text-align: center;margin: 15px;">-->
            <#--<input class="kd-aniu" type="button" value="模拟填报" onclick="report(1);"/>-->
            <#--</div>-->
            <#--</div>-->
            <#--<div role="tabpanel" id="kd-kql2" class="tab-pane kd-kql2">-->
            <#--<div class="row kd-sxu">-->
            <#--<div class="col-md-2 col-sm-2 col-xs-2">-->

            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5">-->
            <#--院校名称-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5">-->
            <#--专业名称-->
            <#--</div>-->
            <#--<div class="col-md-3 col-sm-3 col-xs-3"></div>-->
            <#--</div>-->
            <#--<!--志愿 开始&ndash;&gt;-->
            <#--<div class="row kd-zyuan">-->
            <#--<div class="col-md-2 col-sm-2 col-xs-2 kd-pd">-->
            <#--志愿A-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="school1b2" name="school1b2" data-type="b2" data-placeholder="请选择">-->
            <#--<option value=""></option>-->
            <#--<#if b2schools?? && (b2schools?size > 0)>-->
            <#--<#list b2schools as school>-->
            <#--<option value="${school.SCHOOL_ID}">${school.NAME}</option>-->
            <#--</#list>-->
            <#--</#if>-->
            <#--</select>-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="zye1b2" name="zye1b2" data-type="b2" data-placeholder="请选择">-->
            <#--</select>-->
            <#--</div>-->
            <#--</div>-->
            <#--<div class="row kd-zyuan" style="background-color: #fff">-->
            <#--<div class="col-md-2 col-sm-2 col-xs-2 kd-pd">-->
            <#--志愿B-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="school2b2" name="school2b2" data-type="b2" data-placeholder="请选择">-->
            <#--<option value=""></option>-->
            <#--<#if b2schools?? && (b2schools?size > 0)>-->
            <#--<#list b2schools as school>-->
            <#--<option value="${school.SCHOOL_ID}">${school.NAME}</option>-->
            <#--</#list>-->
            <#--</#if>-->
            <#--</select>-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="zye2b2" name="zye2b2" data-type="b2" data-placeholder="请选择">-->
            <#--</select>-->
            <#--</div>-->
            <#--</div>-->
            <#--<div class="row kd-zyuan">-->
            <#--<div class="col-md-2 col-sm-2 col-xs-2 kd-pd">-->
            <#--志愿C-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="school3b2" name="school3b2" data-type="b2" data-placeholder="请选择">-->
            <#--<option value=""></option>-->
            <#--<#if b2schools?? && (b2schools?size > 0)>-->
            <#--<#list b2schools as school>-->
            <#--<option value="${school.SCHOOL_ID}">${school.NAME}</option>-->
            <#--</#list>-->
            <#--</#if>-->
            <#--</select>-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="zye3b2" name="zye3b2" data-type="b2" data-placeholder="请选择">-->
            <#--</select>-->
            <#--</div>-->
            <#--</div>-->
            <#--<div class="row kd-zyuan" style="background-color: #fff">-->
            <#--<div class="col-md-2 col-sm-2 col-xs-2 kd-pd">-->
            <#--志愿D-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="school4b2" name="school4b2" data-type="b2" data-placeholder="请选择">-->
            <#--<option value=""></option>-->
            <#--<#if b2schools?? && (b2schools?size > 0)>-->
            <#--<#list b2schools as school>-->
            <#--<option value="${school.SCHOOL_ID}">${school.NAME}</option>-->
            <#--</#list>-->
            <#--</#if>-->
            <#--</select>-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="zye4b2" name="zye4b2" data-type="b2" data-placeholder="请选择">-->
            <#--</select>-->
            <#--</div>-->
            <#--</div>-->
            <#--<div class="row kd-zyuan">-->
            <#--<div class="col-md-2 col-sm-2 col-xs-2 kd-pd">-->
            <#--志愿E-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="school5b2" name="school5b2" data-type="b2" data-placeholder="请选择">-->
            <#--<option value=""></option>-->
            <#--<#if b2schools?? && (b2schools?size > 0)>-->
            <#--<#list b2schools as school>-->
            <#--<option value="${school.SCHOOL_ID}">${school.NAME}</option>-->
            <#--</#list>-->
            <#--</#if>-->
            <#--</select>-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="zye5b2" name="zye5b2" data-type="b2" data-placeholder="请选择">-->
            <#--</select>-->
            <#--</div>-->
            <#--</div>-->
            <#--<div class="row kd-zyuan" style="background-color: #fff">-->
            <#--<div class="col-md-2 col-sm-2 col-xs-2 kd-pd">-->
            <#--志愿F-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="school6b2" name="school6b2" data-type="b2" data-placeholder="请选择">-->
            <#--<option value=""></option>-->
            <#--<#if b2schools?? && (b2schools?size > 0)>-->
            <#--<#list b2schools as school>-->
            <#--<option value="${school.SCHOOL_ID}">${school.NAME}</option>-->
            <#--</#list>-->
            <#--</#if>-->
            <#--</select>-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="zye6b2" name="zye6b2" data-type="b2" data-placeholder="请选择">-->
            <#--</select>-->
            <#--</div>-->
            <#--</div>-->
            <#--<div class="row kd-zyuan">-->
            <#--<div class="col-md-2 col-sm-2 col-xs-2 kd-pd">-->
            <#--志愿G-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="school7b2" name="school7b2" data-type="b2" data-placeholder="请选择">-->
            <#--<option value=""></option>-->
            <#--<#if b2schools?? && (b2schools?size > 0)>-->
            <#--<#list b2schools as school>-->
            <#--<option value="${school.SCHOOL_ID}">${school.NAME}</option>-->
            <#--</#list>-->
            <#--</#if>-->
            <#--</select>-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="zye7b2" name="zye7b2" data-type="b2" data-placeholder="请选择">-->
            <#--</select>-->
            <#--</div>-->
            <#--</div>-->
            <#--<div class="row kd-zyuan" style="background-color: #fff">-->
            <#--<div class="col-md-2 col-sm-2 col-xs-2 kd-pd">-->
            <#--志愿H-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="school8b2" name="school8b2" data-type="b2" data-placeholder="请选择">-->
            <#--<option value=""></option>-->
            <#--<#if b2schools?? && (b2schools?size > 0)>-->
            <#--<#list b2schools as school>-->
            <#--<option value="${school.SCHOOL_ID}">${school.NAME}</option>-->
            <#--</#list>-->
            <#--</#if>-->
            <#--</select>-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="zye8b2" name="zye8b2" data-type="b2" data-placeholder="请选择">-->
            <#--</select>-->
            <#--</div>-->
            <#--</div>-->
            <#--<div class="row kd-zyuan">-->
            <#--<div class="col-md-2 col-sm-2 col-xs-2 kd-pd">-->
            <#--志愿I-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="school9b2" name="school9b2" data-type="b2" data-type="b2" data-placeholder="请选择">-->
            <#--<option value=""></option>-->
            <#--<#if b2schools?? && (b2schools?size > 0)>-->
            <#--<#list b2schools as school>-->
            <#--<option value="${school.SCHOOL_ID}">${school.NAME}</option>-->
            <#--</#list>-->
            <#--</#if>-->
            <#--</select>-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="zye9b2" name="zye9b2" data-type="b2" data-placeholder="请选择">-->
            <#--</select>-->
            <#--</div>-->
            <#--</div>-->
            <#--<div class="row kd-zyuan" style="background-color: #fff">-->
            <#--<div class="col-md-2 col-sm-2 col-xs-2 kd-pd">-->
            <#--志愿J-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="school10b2" name="school10b2" data-type="b2" data-placeholder="请选择">-->
            <#--<option value=""></option>-->
            <#--<#if b2schools?? && (b2schools?size > 0)>-->
            <#--<#list b2schools as school>-->
            <#--<option value="${school.SCHOOL_ID}">${school.NAME}</option>-->
            <#--</#list>-->
            <#--</#if>-->
            <#--</select>-->
            <#--</div>-->
            <#--<div class="col-md-5 col-sm-5 col-xs-5 kd-pd">-->
            <#--<select class="zye" style="width: 100%" id="zye10b2" name="zye10b2" data-type="b2" data-placeholder="请选择">-->
            <#--</select>-->
            <#--</div>-->
            <#--</div>-->
            <#--<div style="text-align: center;margin: 15px;">-->
            <#--<input class="kd-aniu" type="button" value="模拟填报" onclick="report(2);"/>-->
            <#--</div>-->
            <#--</div>-->
            <#--</div>-->
            <!--志愿 结束-->
            </div>
            </div>
            <!--模拟填报结果 开始-->
            <div id="reportresult" style="display: none;">
            <table id="page" style="width: 1140px;">
            <thead>
            <tr style='background-color: #33C9B5;color: #fff;text-align: center'>
            <td style='width: 290px' class='kd-namc' rowspan='2'>院校名称</td>
            <td style='width: 200px' class='kd-namc' rowspan='2'>专业名称</td>
            <td style='width: 124px' class='kd-namc' rowspan='2'>院校地区</td>
            <td style='width: 187px' class='kd-namc' rowspan='2'>院校类型</td>
            <td style='width: 285px' class='kd-namc' colspan='4'>院校历年的招生计划</td>
            <td style='width: 50px' class='kd-namc' rowspan='2'>概率</td>
            </tr>
            <tr style='background-color: #33C9B5;color: #fff;text-align: center;border-top: 1px solid #fff'>
            <td class='kd-namc'>年份</td>
            <td class='kd-namc'>最高分</td>
            <td class='kd-namc'>最低分</td>
            <td class='kd-namc'>录取数</td>
            </tr>
            </thead>
            </table>
            <#--<table class="kd-bge">-->
            <#--<tr>-->
            <#--<td>院校名称</td>-->
            <#--<td>专业名称</td>-->
            <#--<td>成功概率</td>-->
            <#--</tr>-->
            <#--<div id="page"></div>-->
            <#--<tr class="kd-mchen"></tr>-->
            <#--</table>-->

            </div>
                <!--模拟填报结果 结束-->
                <!--重要提示 开始-->
                <div class="kd-tshi">
                    <p style="margin-bottom: 20px;">
                        <img src="/static/ymplant/images/tubiao4/tishi.png" alt="">
                        <span style="font-size: 16px;font-weight: bold;color: #333;">重要提示：</span>
                    </p>
                    <p style="font-size: 14px;color: #555;margin-bottom: 5px;">
                        1、本系统提供高考志愿填报智能模拟功能，不等同于实际的网上志愿填报。建议考生在填报志愿时，结合本系统的推荐来完善志愿表；
                    </p>
                    <p style="font-size: 14px;color: #555;margin-bottom: 5px;">
                        2、您正在使用的是河北考生志愿填报智能模拟系统，提供“普通类文理的本科一、本科二批”的志愿填报模拟功能，该功能主要数据来源参考与各省市出版的填报指南以及各本科专科院系官网的历年数据；
                    </p>
                    <p style="font-size: 14px;color: #555;margin-bottom: 5px;">
                        3、当前版本使用的数据已经更新至2017年最新数据；
                    </p>
                    <p style="font-size: 14px;color: #555;margin-bottom: 5px;">
                        4、本系统推荐结果仅限参考，在正式填报时，以教育考试院公布的最新招生计划为准，具体情况请根据当年招生政策自行判断。
                    </p>
                </div>
                <!--重要提示 结束-->
            <#--模拟填报 开始-->
                <div class="row">
                    <div class="col-md-9 col-sm-9 col-xs-9">
                        <div style="padding: 10px 0;">我的高考分数：<#if examinee?? && examinee.EXAMSCORE??>${examinee.EXAMSCORE}分<#else>暂无信息</#if><a style="margin-left: 10px;color: #00A2E8;" href="${ctxPath}/plant/user/center?p=examinee">修改</a></div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <ul class="nav nav-tabs right" id="kd-xzhong" style="background-color: #D4F5F1;" role="tablist">
                            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">本一</a></li>
                            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">本二</a></li>
                        </ul>
                    </div>
                </div>
                <div class="tab-content">
                    <div class="tab-pane active"  id="home">
                        <div class="volunteer" role="tabpanel">
                            <table style="width: 100%;text-align: center;border: 1px solid #33C9B5;">
                                <tbody>
                                <tr class="written">
                                    <td></td>
                                    <td>志愿 A</td>
                                    <td>志愿 B</td>
                                    <td>志愿 C</td>
                                    <td>志愿 D</td>
                                    <td>志愿 E</td>
                                </tr>
                                <tr class="a-line" style="background-color: #FAFAFA;">
                                    <td class="stitution" style="border-top: 1px solid #fff;border-bottom: 3px solid #fff;">
                                        <span style="padding: 5px 10px;">院校名称</span>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>北京大学</option>
                                            <option>清华大学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>北京大学</option>
                                            <option>清华大学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>北京大学</option>
                                            <option>清华大学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>北京大学</option>
                                            <option>清华大学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>北京大学</option>
                                            <option>清华大学</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 1</td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 2</td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 3</td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 4</td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 5</td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution" style="border-bottom: 1px solid #fff">专业 6</td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div style="text-align: center;margin: 15px;">
                                <input class="lation" type="button" value="模拟填报"/>
                            </div>
                        </div>
                        <div  class="result">
                            <table>
                                <tbody>
                                <tr style="background-color: #33C9B5;color: #fff;text-align: center">
                                    <td style="width: 200px" class="come" rowspan="2">专业名称</td>
                                    <td style="width: 124px" class="come" rowspan="2">院校地区</td>
                                    <td style="width: 187px" class="come" rowspan="2">院校类型</td>
                                    <td style="width: 290px" class="come" rowspan="2">院校名称</td>
                                    <td style="width: 285px" class="come" colspan="4">院校历年的招生计划</td>
                                    <td style="width: 50px" class="come" rowspan="2">概率</td>
                                </tr>
                                <tr style="background-color: #33C9B5;color: #fff;text-align: center;border-top: 1px solid #fff">
                                    <td class="come">年份</td>
                                    <td class="come">最高分</td>
                                    <td class="come">最低分</td>
                                    <td class="come">录取数</td>
                                </tr>
                                <tr class="simu">
                                    <td>
                                        <a href="javascript:void(0);" target="_blank">
                                            <span style="font-weight: bold;font-size: 16px;">北京理工大学</span>
                                            <div style="margin-top: 20px;">
                                                <span class="kd-p7uuy9sza3" title="211"></span>
                                                <span class="kd-p7uuy9sza3" title="985"></span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>北京市</td>
                                    <td>
                                        <span class="kd-np0yhn0ino" title="理工类"></span>
                                    </td>
                                    <td>理科试验班（物理精英班）</td>
                                    <td>
                                        <div class="kd-jju">2016</div>
                                        <div class="kd-jju">2015</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">679</div>
                                        <div class="kd-jju">665</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">679</div>
                                        <div class="kd-jju">665</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">1</div>
                                        <div class="kd-jju">1</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td style="font-size: 18px;font-weight: bold;">90%</td>
                                </tr>
                                <tr class="simu result1">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>理科试验班（物理精英班）</td>
                                    <td>
                                        <div class="kd-jju">2016</div>
                                        <div class="kd-jju">2015</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">679</div>
                                        <div class="kd-jju">665</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">679</div>
                                        <div class="kd-jju">665</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">1</div>
                                        <div class="kd-jju">1</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td style="font-size: 18px;font-weight: bold;">90%</td>
                                </tr>
                                <tr class="simu result1">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>理科试验班（物理精英班）</td>
                                    <td>
                                        <div class="kd-jju">2016</div>
                                        <div class="kd-jju">2015</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">679</div>
                                        <div class="kd-jju">665</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">679</div>
                                        <div class="kd-jju">665</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">1</div>
                                        <div class="kd-jju">1</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td style="font-size: 18px;font-weight: bold;">90%</td>
                                </tr>
                                <tr class="simu result1">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>理科试验班（物理精英班）</td>
                                    <td>
                                        <div class="kd-jju">2016</div>
                                        <div class="kd-jju">2015</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">679</div>
                                        <div class="kd-jju">665</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">679</div>
                                        <div class="kd-jju">665</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">1</div>
                                        <div class="kd-jju">1</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td style="font-size: 18px;font-weight: bold;">90%</td>
                                </tr>
                                <a class="absolutely" href="javascript:void(0);" data-class="result1">
                                    <div class="d1" style="background-color: #5BC0DE;text-align: center;">
                                        <img class=".bottom-bottom" src="/static/ymplant/images/tubiao4/button-bottom.png" style="width: 22px;height: 22px;" alt=""/>
                                    </div>
                                </a>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div  role="tabpanel"  id="profile" class="result tab-pane">
                        <div class="volunteer" role="tabpanel">
                            <table style="width: 100%;text-align: center;border: 1px solid #33C9B5;">
                                <tbody>
                                <tr class="written">
                                    <td></td>
                                    <td>志愿 A</td>
                                    <td>志愿 B</td>
                                    <td>志愿 C</td>
                                    <td>志愿 D</td>
                                    <td>志愿 E</td>
                                </tr>
                                <tr class="a-line" style="background-color: #FAFAFA;">
                                    <td class="stitution" style="border-top: 1px solid #fff;border-bottom: 3px solid #fff;">
                                        <span style="padding: 5px 10px;">院校名称</span>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>北京大学</option>
                                            <option>清华大学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>北京大学</option>
                                            <option>清华大学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>北京大学</option>
                                            <option>清华大学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>北京大学</option>
                                            <option>清华大学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>北京大学</option>
                                            <option>清华大学</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 1</td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 2</td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 3</td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 4</td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 5</td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution" style="border-bottom: 1px solid #fff">专业 6</td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table style="width: 100%;text-align: center;border: 1px solid #33C9B5;">
                                <tbody>
                                <tr class="written">
                                    <td></td>
                                    <td>志愿 F</td>
                                    <td>志愿 G</td>
                                    <td>志愿 H</td>
                                    <td>志愿 I</td>
                                    <td>志愿 J</td>
                                </tr>
                                <tr class="a-line" style="background-color: #FAFAFA">
                                    <td class="stitution" style="border-top: 1px solid #fff;border-bottom: 3px solid #fff;">
                                        <span style="padding: 5px 10px;">院校名称</span>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>北京大学</option>
                                            <option>清华大学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>北京大学</option>
                                            <option>清华大学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>北京大学</option>
                                            <option>清华大学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>北京大学</option>
                                            <option>清华大学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>北京大学</option>
                                            <option>清华大学</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 1</td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 2</td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 3</td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 4</td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 5</td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution" style="border-bottom: 1px solid #fff">专业 6</td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" name="">
                                            <option>计算机</option>
                                            <option>会计学</option>
                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div style="text-align: center;margin: 15px;">
                                <input class="lation" type="button" value="模拟填报"/>
                            </div>
                        </div>
                        <div  class="result">
                            <table>
                                <tbody>
                                <tr style="background-color: #33C9B5;color: #fff;text-align: center">
                                    <td style="width: 200px" class="come" rowspan="2">专业名称</td>
                                    <td style="width: 124px" class="come" rowspan="2">院校地区</td>
                                    <td style="width: 187px" class="come" rowspan="2">院校类型</td>
                                    <td style="width: 290px" class="come" rowspan="2">院校名称</td>
                                    <td style="width: 285px" class="come" colspan="4">院校历年的招生计划</td>
                                    <td style="width: 50px" class="come" rowspan="2">概率</td>
                                </tr>
                                <tr style="background-color: #33C9B5;color: #fff;text-align: center;border-top: 1px solid #fff">
                                    <td class="come">年份</td>
                                    <td class="come">最高分</td>
                                    <td class="come">最低分</td>
                                    <td class="come">录取数</td>
                                </tr>
                                <tr class="simu">
                                    <td>
                                        <a href="javascript:void(0);" target="_blank">
                                            <span style="font-weight: bold;font-size: 16px;">北京理工大学</span>
                                            <div style="margin-top: 20px;">
                                                <span class="kd-p7uuy9sza3" title="211"></span>
                                                <span class="kd-p7uuy9sza3" title="985"></span>
                                            </div>
                                        </a>
                                    </td>
                                    <td>北京市</td>
                                    <td>
                                        <span class="kd-np0yhn0ino" title="理工类"></span>
                                    </td>
                                    <td>理科试验班（物理精英班）</td>
                                    <td>
                                        <div class="kd-jju">2016</div>
                                        <div class="kd-jju">2015</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">679</div>
                                        <div class="kd-jju">665</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">679</div>
                                        <div class="kd-jju">665</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">1</div>
                                        <div class="kd-jju">1</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td style="font-size: 18px;font-weight: bold;">90%</td>
                                </tr>
                                <tr class="simu result1">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>理科试验班（物理精英班）</td>
                                    <td>
                                        <div class="kd-jju">2016</div>
                                        <div class="kd-jju">2015</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">679</div>
                                        <div class="kd-jju">665</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">679</div>
                                        <div class="kd-jju">665</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">1</div>
                                        <div class="kd-jju">1</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td style="font-size: 18px;font-weight: bold;">90%</td>
                                </tr>
                                <tr class="simu result1">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>理科试验班（物理精英班）</td>
                                    <td>
                                        <div class="kd-jju">2016</div>
                                        <div class="kd-jju">2015</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">679</div>
                                        <div class="kd-jju">665</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">679</div>
                                        <div class="kd-jju">665</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">1</div>
                                        <div class="kd-jju">1</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td style="font-size: 18px;font-weight: bold;">90%</td>
                                </tr>
                                <tr class="simu result1">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>理科试验班（物理精英班）</td>
                                    <td>
                                        <div class="kd-jju">2016</div>
                                        <div class="kd-jju">2015</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">679</div>
                                        <div class="kd-jju">665</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">679</div>
                                        <div class="kd-jju">665</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td>
                                        <div class="kd-jju">1</div>
                                        <div class="kd-jju">1</div>
                                        <div class="kd-jju">-</div>
                                    </td>
                                    <td style="font-size: 18px;font-weight: bold;">90%</td>
                                </tr>
                                <a class="absolutely" href="javascript:void(0);" data-class="result1">
                                    <div class="d1" style="background-color: #5BC0DE;text-align: center;">
                                        <img class=".bottom-bottom" src="/static/ymplant/images/tubiao4/button-bottom.png" style="width: 22px;height: 22px;" alt=""/>
                                    </div>
                                </a>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            <#--模拟填报 结束-->
            </div>
        </div>
        <script language="JavaScript">
            <#if Session.session_user_key?? && Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'>
                <#if !(examinee?? && examinee.EXAMSCORE??)>
                showError("您还没有添加高考分数，请在个人中心-考生信息处完善！", "examinee");
                </#if>
            </#if>
            <#if Session.session_user_key?? && Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'm9bxdt9g36'>
            showError('请确认账号为学生身份');
            </#if>
            <#if !Session.session_user_key??>
            showError("请先登录账号");
            </#if>
        </script>

        <script language="JavaScript">
            var tableHead = "";
            var tableFoot = "";
            tableHead += "<thead>";
            tableHead += "<tr style='background-color: #33C9B5;color: #fff;text-align: center'>";
            tableHead += "<td style='width: 290px' class='kd-namc' rowspan='2'>院校名称</td>";
            tableHead += "<td style='width: 200px' class='kd-namc' rowspan='2'>专业名称</td>";
            tableHead += "<td style='width: 124px' class='kd-namc' rowspan='2'>院校地区</td>";
            tableHead += "<td style='width: 187px' class='kd-namc' rowspan='2'>院校类型</td>";
            tableHead += "<td style='width: 285px' class='kd-namc' colspan='4'>院校历年的招生计划</td>";
            tableHead += "<td style='width: 50px' class='kd-namc' rowspan='2'>概率</td>";
            tableHead += "</tr>";
            tableHead += "<tr style='background-color: #33C9B5;color: #fff;text-align: center;border-top: 1px solid #fff'>";
            tableHead += "<td class='kd-namc'>年份</td>";
            tableHead += "<td class='kd-namc'>最高分</td>";
            tableHead += "<td class='kd-namc'>最低分</td>";
            tableHead += "<td class='kd-namc'>录取数</td>";
            tableHead += "</tr>";
            tableFoot += "</thead>";
            $(function () {
                $(".zye").chosen({
                    no_results_text: "没有找到结果！",//搜索无结果时显示的提示
                    search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
                    allow_single_deselect:true,
                    width: "100%"
                });
                $(".zye").change(function () {
                    var selectObj = $(this);
                    if(selectObj.attr("id").indexOf("school") >= 0){
                        sendRequest(ctxPath + "/plant/report/api/getmajors", {SCHOOL_ID: selectObj.val()}, "POST", function (res) {
                            if(res.hasErrors){
                                showError(res.errorMessage);
                                return false;
                            }
                            var zyeStr = selectObj.attr("id");
                            zyeStr = zyeStr.replace("school", "zye");
                            $("#" + zyeStr).html(createHtml(res.majors));
                            $("#" + zyeStr).trigger("chosen:updated");
                        });
                    }
                });
            });

            function createHtml(list) {
                var htmlStr = "";
                for(var i = 0; i < list.length; i++){
                    htmlStr += "<option value='" + list[i].DIC_ID + "'>" + list[i].NAME + "</option>";
                }

                return htmlStr;
            }

            function chkSelect(repindex) {
                var chkFlag = true;
                $(".zye").each(function () {
                    if($(this).attr("data-type") == ("b" + repindex)){
                        if($(this).val() == "" || $(this).val() == null) {
                            chkFlag = false;
                            return false;
                        }
                    }
                });

                return chkFlag;
            }
            function report(repindex) {
            <#if Session.session_user_key?? && Session.session_user_key.ROLE_ID??>
                <#if Session.session_user_key.ROLE_ID == 'sja4gc59bg'>
                    layer.confirm("确定要进行模拟填报？此次操作需消耗一张模拟填报卡", {
                        btn: ["是", "否"]
                    }, function(index) {
                        layer.close(index);

                        if(!chkSelect(repindex)) {
                            showError("选项不能为空！");
                            return false;
                        }
                        var param = {};
                        param.school1 = $("#school1b" + repindex).val();
                        param.school2 = $("#school2b" + repindex).val();
                        param.school3 = $("#school3b" + repindex).val();
                        param.school4 = $("#school4b" + repindex).val();
                        param.school5 = $("#school5b" + repindex).val();
                        param.zye1 = $("#zye1b" + repindex).val();
                        param.zye2 = $("#zye2b" + repindex).val();
                        param.zye3 = $("#zye3b" + repindex).val();
                        param.zye4 = $("#zye4b" + repindex).val();
                        param.zye5 = $("#zye5b" + repindex).val();
                        if(repindex == 2) {
                            param.school6 = $("#school6b" + repindex).val();
                            param.school7 = $("#school7b" + repindex).val();
                            param.school8 = $("#school8b" + repindex).val();
                            param.school9 = $("#school9b" + repindex).val();
                            param.school10 = $("#school10b" + repindex).val();
                            param.zye6 = $("#zye6b" + repindex).val();
                            param.zye7 = $("#zye7b" + repindex).val();
                            param.zye8 = $("#zye8b" + repindex).val();
                            param.zye9 = $("#zye9b" + repindex).val();
                            param.zye10 = $("#zye10b" + repindex).val();
                        }

                        param.flag = repindex;
                        sendRequest("${ctxPath}/plant/report/api/zy", param, "POST", function (res) {
                            if(res.hasErrors) {
                                showError(res.errorMessage);
                                return false;
                            }

                            setResult(res.data);
                        });
                    });
                <#else>
                    showError('请确认账号为学生身份');
                    return false;
                </#if>
            <#else>
                showError('请先登录账号');
                return false;
            </#if>
            }

            function setResult(list) {
                var strHtml = "";
                if(list == "750") {
                    strHtml += "<tr class='kd-xxiao'>";
                    strHtml += "<td colspan='9'>";
                    strHtml += "你已成为考神，可随意报考";
                    strHtml += "</td>";
                    strHtml += "</tr>";
                }
                else{
                    if(list.length > 0) {
                        for(var i = 0; i < list.length; i++) {
                            var obj = list[i];
                            strHtml += "<tr class='kd-xxiao'>";
                            strHtml += "<td>";
                            strHtml += "<a href='/plant/school/details/" + obj.SCHOOL_ID + "' target='_blank'>";
                            strHtml += "<span style='font-weight: bold;font-size: 16px;'>" + obj.NAME + "</span>";
                            strHtml += "<div style='margin-top: 20px;'>";
                            for(var j = 0; j < obj.properties.length; j++) {
                                var property = obj.properties[j];
                                strHtml += "<span class='kd-" + property.DIC_ID + "' title='" + property.NAME + "'></span>";
                            }

                            strHtml += "</div>";
                            strHtml += "</a>";
                            strHtml += "</td>";
                            strHtml += "<td>" + obj.MJNAME + "</td>";
                            strHtml += "<td>" + obj.PROVINCE_VALUE + "</td>";
                            strHtml += "<td>";
                            if(obj.subjecttypes.length == 0){
                                strHtml += "--";
                            }
                            for(var j = 0; j < obj.subjecttypes.length; j++) {
                                var subjecttype = obj.subjecttypes[j];
                                strHtml += "<span class='kd-" + subjecttype.DIC_ID + "' title='" + subjecttype.NAME + "'></span>";
                            }
                            strHtml += "</td>";
                            strHtml += "<td>";
                            for(var j = 0; j < 3; j++) {
                                if(j < obj.scores.length) {
                                    strHtml += "<div class='kd-jju'>" + obj.scores[j].YEAR_VALUE + "</div>";
                                }
                                else{
                                    strHtml += "<div class='kd-jju'>-</div>";
                                }
                            }
                            strHtml += "</td>";
                            strHtml += "<td>";
                            for(var j = 0; j < 3; j++) {
                                if(j < obj.scores.length) {
                                    strHtml += "<div class='kd-jju'>" + obj.scores[j].MAXSCORE + "</div>";
                                }
                                else{
                                    strHtml += "<div class='kd-jju'>-</div>";
                                }
                            }
                            strHtml += "</td>";
                            strHtml += "<td>";
                            for(var j = 0; j < 3; j++) {
                                if(j < obj.scores.length) {
                                    strHtml += "<div class='kd-jju'>" + obj.scores[j].MINSCORE + "</div>";
                                }
                                else{
                                    strHtml += "<div class='kd-jju'>-</div>";
                                }
                            }
                            strHtml += "</td>";
                            strHtml += "<td>";
                            for(var j = 0; j < 3; j++) {
                                if(j < obj.scores.length) {
                                    strHtml += "<div class='kd-jju'>" + obj.scores[j].ENTERCOUNT + "</div>";
                                }
                                else{
                                    strHtml += "<div class='kd-jju'>-</div>";
                                }
                            }
                            strHtml += "</td>";
                            strHtml += "<td style='font-size: 18px;font-weight: bold;'>";
                            strHtml += obj.chance;
                            strHtml += "</td>";
                            strHtml += "</tr>";
                        }
                    }
                    else{
                        strHtml += "<tr class='kd-xxiao'>";
                        strHtml += "<td colspan='9'>";
                        strHtml += "查无数据";
                        strHtml += "</td>";
                        strHtml += "</tr>";
                    }
                }
                $("#page").html(tableHead + strHtml + tableFoot);
                $("#reportresult").show();
            }
        </script>
    <#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>