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
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
<div class="kd-tbao">
    <div class="container">
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
                                        <select class="slctk" data-placeholder="请选择院校" id="school1b1" name="school1b1" data-type="b1">
                                            <option value=""></option>
                                        <#if b1schools?? && (b1schools?size > 0)>
                                            <#list b1schools as school>
                                                <option value="${school.SCHOOL_ID}">${school.NAME}</option>
                                            </#list>
                                        </#if>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择院校" id="school2b1" name="school2b1" data-type="b1">
                                            <option value=""></option>
                                        <#if b1schools?? && (b1schools?size > 0)>
                                            <#list b1schools as school>
                                                <option value="${school.SCHOOL_ID}">${school.NAME}</option>
                                            </#list>
                                        </#if>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择院校" id="school3b1" name="school3b1" data-type="b1">
                                            <option value=""></option>
                                        <#if b1schools?? && (b1schools?size > 0)>
                                            <#list b1schools as school>
                                                <option value="${school.SCHOOL_ID}">${school.NAME}</option>
                                            </#list>
                                        </#if>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择院校" id="school4b1" name="school4b1" data-type="b1">
                                            <option value=""></option>
                                        <#if b1schools?? && (b1schools?size > 0)>
                                            <#list b1schools as school>
                                                <option value="${school.SCHOOL_ID}">${school.NAME}</option>
                                            </#list>
                                        </#if>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择院校" id="school5b1" name="school5b1" data-type="b1">
                                            <option value=""></option>
                                        <#if b1schools?? && (b1schools?size > 0)>
                                            <#list b1schools as school>
                                                <option value="${school.SCHOOL_ID}">${school.NAME}</option>
                                            </#list>
                                        </#if>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 1</td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major1b1_1" name="major1b1_1" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major2b1_1" name="major2b1_1" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major3b1_1" name="major3b1_1" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major4b1_1" name="major4b1_1" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major5b1_1" name="major5b1_1" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 2</td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major1b1_2" name="major1b1_2" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major2b1_2" name="major2b1_2" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major3b1_2" name="major3b1_2" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major4b1_2" name="major4b1_2" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major5b1_2" name="major5b1_2" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 3</td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major1b1_3" name="major1b1_3" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major2b1_3" name="major2b1_3" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major3b1_3" name="major3b1_3" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major4b1_3" name="major4b1_3" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major5b1_3" name="major5b1_3" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 4</td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major1b1_4" name="major1b1_4" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major2b1_4" name="major2b1_4" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major3b1_4" name="major3b1_4" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major4b1_4" name="major4b1_4" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major5b1_4" name="major5b1_4" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 5</td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major1b1_5" name="major1b1_5" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major2b1_5" name="major2b1_5" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major3b1_5" name="major3b1_5" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major4b1_5" name="major4b1_5" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major5b1_5" name="major5b1_5" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution" style="border-bottom: 1px solid #fff">专业 6</td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major1b1_6" name="major1b1_6" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major2b1_6" name="major2b1_6" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major3b1_6" name="major3b1_6" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major4b1_6" name="major4b1_6" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major5b1_6" name="major5b1_6" data-type="b1">
                                            
                                            
                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div style="text-align: center;margin: 15px;">
                                <input class="lation" type="button" value="模拟填报" onclick="report(1);"/>
                            </div>
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
                                        <select class="slctk" data-placeholder="请选择院校" id="school1b2" name="school1b2" data-type="b2">
                                            <option value=""></option>
                                        <#if b2schools?? && (b2schools?size > 0)>
                                            <#list b2schools as school>
                                                <option value="${school.SCHOOL_ID}">${school.NAME}</option>
                                            </#list>
                                        </#if>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择院校" id="school2b2" name="school2b2" data-type="b2">
                                            <option value=""></option>
                                        <#if b2schools?? && (b2schools?size > 0)>
                                            <#list b2schools as school>
                                                <option value="${school.SCHOOL_ID}">${school.NAME}</option>
                                            </#list>
                                        </#if>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择院校" id="school3b2" name="school3b2" data-type="b2">
                                            <option value=""></option>
                                        <#if b2schools?? && (b2schools?size > 0)>
                                            <#list b2schools as school>
                                                <option value="${school.SCHOOL_ID}">${school.NAME}</option>
                                            </#list>
                                        </#if>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择院校" id="school4b2" name="school4b2" data-type="b2">
                                            <option value=""></option>
                                        <#if b2schools?? && (b2schools?size > 0)>
                                            <#list b2schools as school>
                                                <option value="${school.SCHOOL_ID}">${school.NAME}</option>
                                            </#list>
                                        </#if>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择院校" id="school5b2" name="school5b2" data-type="b2">
                                            <option value=""></option>
                                        <#if b2schools?? && (b2schools?size > 0)>
                                            <#list b2schools as school>
                                                <option value="${school.SCHOOL_ID}">${school.NAME}</option>
                                            </#list>
                                        </#if>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 1</td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major1b2_1" name="major1b2_1" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major2b2_1" name="major2b2_1" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major3b2_1" name="major3b2_1" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major4b2_1" name="major4b2_1" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major5b2_1" name="major5b2_1" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 2</td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major1b2_2" name="major1b2_2" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major2b2_2" name="major2b2_2" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major3b2_2" name="major3b2_2" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major4b2_2" name="major4b2_2" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major5b2_2" name="major5b2_2" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 3</td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major1b2_3" name="major1b2_3" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major2b2_3" name="major2b2_3" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major3b2_3" name="major3b2_3" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major4b2_3" name="major4b2_3" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major5b2_3" name="major5b2_3" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 4</td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major1b2_4" name="major1b2_4" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major2b2_4" name="major2b2_4" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major3b2_4" name="major3b2_4" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major4b2_4" name="major4b2_4" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major5b2_4" name="major5b2_4" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 5</td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major1b2_5" name="major1b2_5" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major2b2_5" name="major2b2_5" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major3b2_5" name="major3b2_5" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major4b2_5" name="major4b2_5" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major5b2_5" name="major5b2_5" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 6</td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major1b2_6" name="major1b2_6" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major2b2_6" name="major2b2_6" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major3b2_6" name="major3b2_6" data-type="b2">
                                            
                                            
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major4b2_6" name="major4b2_6" data-type="b2">
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major5b2_6" name="major5b2_6" data-type="b2">
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
                                        <select class="slctk" data-placeholder="请选择院校" id="school6b2" name="school6b2" data-type="b2">
                                            <option value=""></option>
                                        <#if b2schools?? && (b2schools?size > 0)>
                                            <#list b2schools as school>
                                                <option value="${school.SCHOOL_ID}">${school.NAME}</option>
                                            </#list>
                                        </#if>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择院校" id="school7b2" name="school7b2" data-type="b2">
                                            <option value=""></option>
                                        <#if b2schools?? && (b2schools?size > 0)>
                                            <#list b2schools as school>
                                                <option value="${school.SCHOOL_ID}">${school.NAME}</option>
                                            </#list>
                                        </#if>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择院校" id="school8b2" name="school8b2" data-type="b2">
                                            <option value=""></option>
                                        <#if b2schools?? && (b2schools?size > 0)>
                                            <#list b2schools as school>
                                                <option value="${school.SCHOOL_ID}">${school.NAME}</option>
                                            </#list>
                                        </#if>
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择院校" id="school9b2" name="school9b2" data-type="b2">
                                            <option value=""></option>
                                        <#if b2schools?? && (b2schools?size > 0)>
                                            <#list b2schools as school>
                                                <option value="${school.SCHOOL_ID}">${school.NAME}</option>
                                            </#list>
                                        </#if>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择院校" id="school10b2" name="school10b2" data-type="b2">
                                            <option value=""></option>
                                        <#if b2schools?? && (b2schools?size > 0)>
                                            <#list b2schools as school>
                                                <option value="${school.SCHOOL_ID}">${school.NAME}</option>
                                            </#list>
                                        </#if>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 1</td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major6b2_1" name="major6b2_1" data-type="b2">
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major7b2_1" name="major7b2_1" data-type="b2">
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major8b2_1" name="major8b2_1" data-type="b2">
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major9b2_1" name="major9b2_1" data-type="b2">
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major10b2_1" name="major10b2_1" data-type="b2">
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 2</td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major6b2_2" name="major6b2_2" data-type="b2">
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major7b2_2" name="major7b2_2" data-type="b2">
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major8b2_2" name="major8b2_2" data-type="b2">
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major9b2_2" name="major9b2_2" data-type="b2">
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major10b2_2" name="major10b2_2" data-type="b2">
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 3</td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major6b2_3" name="major6b2_3" data-type="b2">
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major7b2_3" name="major7b2_3" data-type="b2">
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major8b2_3" name="major8b2_3" data-type="b2">
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major9b2_3" name="major9b2_3" data-type="b2">
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major10b2_3" name="major10b2_3" data-type="b2">
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution">专业 4</td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major6b2_4" name="major6b2_4" data-type="b2">
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major7b2_4" name="major7b2_4" data-type="b2">
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major8b2_4" name="major8b2_4" data-type="b2">
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major9b2_4" name="major9b2_4" data-type="b2">
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major10b2_4" name="major10b2_4" data-type="b2">
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution" style="border-bottom: 1px solid #fff">专业 5</td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major6b2_5" name="major6b2_5" data-type="b2">
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major7b2_5" name="major7b2_5" data-type="b2">
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major8b2_5" name="major8b2_5" data-type="b2">
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major9b2_5" name="major9b2_5" data-type="b2">
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major10b2_5" name="major10b2_5" data-type="b2">
                                        </select>
                                    </td>
                                </tr>
                                <tr class="a-line">
                                    <td class="stitution" style="border-bottom: 1px solid #fff">专业 6</td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major6b2_6" name="major6b2_6" data-type="b2">
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major7b2_6" name="major7b2_6" data-type="b2">
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major8b2_6" name="major8b2_6" data-type="b2">
                                        </select>
                                    </td>
                                    <td class="dark">
                                        <select class="slctk" data-placeholder="请选择专业" id="major9b2_6" name="major9b2_6" data-type="b2">
                                        </select>
                                    </td>
                                    <td>
                                        <select class="slctk" data-placeholder="请选择专业" id="major10b2_6" name="major10b2_6" data-type="b2">
                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div style="text-align: center;margin: 15px;">
                                <input class="lation" type="button" value="模拟填报" onclick="report(2);"/>
                            </div>
                        </div>
                    </div>
                </div>
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
            tableHead += "<td style='width: 124px' class='kd-namc' rowspan='2'>院校地区</td>";
            tableHead += "<td style='width: 187px' class='kd-namc' rowspan='2'>院校类型</td>";
            tableHead += "<td style='width: 200px' class='kd-namc' rowspan='2'>专业名称</td>";
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
                $(".slctk").chosen({
                    no_results_text: "没有找到结果！",//搜索无结果时显示的提示
                    search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
                    allow_single_deselect:true,
                    width: "130px"
                });
                $(".slctk").change(function () {
                    var selectObj = $(this);
                    if(selectObj.attr("id").indexOf("school") >= 0){
                        var selectObjIndex = selectObj.attr("data-type");
                        sendRequest(ctxPath + "/plant/report/api/getmajors", {SCHOOL_ID: selectObj.val()}, "POST", function (res) {
                            if(res.hasErrors){
                                showError(res.errorMessage);
                                return false;
                            }

                            var zyeStr = selectObj.attr("id");
                            zyeStr = zyeStr.replace("school", "major");
                            for(var i = 1; i < 7; i++) {
                                $("#" + zyeStr + "_" + i).html(createHtml(res.majors));
                                $("#" + zyeStr + "_" + i).trigger("chosen:updated");
                            }
                        });
                    }
                });
            });

            function createHtml(list) {
                var htmlStr = "<option value=''></option>";
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

                        /*if(!chkSelect(repindex)) {
                            showError("选项不能为空！");
                            return false;
                        }*/
                        var param = {};
                        param.school1 = $("#school1b" + repindex).val();
                        param.school2 = $("#school2b" + repindex).val();
                        param.school3 = $("#school3b" + repindex).val();
                        param.school4 = $("#school4b" + repindex).val();
                        param.school5 = $("#school5b" + repindex).val();
                        param.zye1 = "";
                        param.zye2 = "";
                        param.zye3 = "";
                        param.zye4 = "";
                        param.zye5 = "";
                        for(var x = 1; x < 7; x++) {
                            if($("#major1b" + repindex + "_" + x).val() != null && $("#major1b" + repindex + "_" + x).val() != "")
                                param.zye1 += $("#major1b" + repindex + "_" + x).val() + ",";
                            if($("#major2b" + repindex + "_" + x).val() != null && $("#major2b" + repindex + "_" + x).val() != "")
                                param.zye2 += $("#major2b" + repindex + "_" + x).val() + ",";
                            if($("#major3b" + repindex + "_" + x).val() != null && $("#major3b" + repindex + "_" + x).val() != "")
                                param.zye3 += $("#major3b" + repindex + "_" + x).val() + ",";
                            if($("#major4b" + repindex + "_" + x).val() != null && $("#major4b" + repindex + "_" + x).val() != "")
                                param.zye4 += $("#major4b" + repindex + "_" + x).val() + ",";
                            if($("#major5b" + repindex + "_" + x).val() != null && $("#major5b" + repindex + "_" + x).val() != "")
                                param.zye5 += $("#major5b" + repindex + "_" + x).val() + ",";
                        }

                        param.zye1 = param.zye1.substring(0, param.zye1.length - 1);
                        param.zye2 = param.zye2.substring(0, param.zye2.length - 1);
                        param.zye3 = param.zye3.substring(0, param.zye3.length - 1);
                        param.zye4 = param.zye4.substring(0, param.zye4.length - 1);
                        param.zye5 = param.zye5.substring(0, param.zye5.length - 1);

                        if(repindex == 2) {
                            param.school6 = $("#school6b" + repindex).val();
                            param.school7 = $("#school7b" + repindex).val();
                            param.school8 = $("#school8b" + repindex).val();
                            param.school9 = $("#school9b" + repindex).val();
                            param.school10 = $("#school10b" + repindex).val();

                            param.zye6 = "";
                            param.zye7 = "";
                            param.zye8 = "";
                            param.zye9 = "";
                            param.zye10 = "";
                            for(var x = 1; x < 7; x++) {
                                if($("#major6b" + repindex + "_" + x).val() != null && $("#major6b" + repindex + "_" + x).val() != "")
                                    param.zye6 += $("#major6b" + repindex + "_" + x).val() + ",";
                                if($("#major7b" + repindex + "_" + x).val() != null && $("#major7b" + repindex + "_" + x).val() != "")
                                    param.zye7 += $("#major7b" + repindex + "_" + x).val() + ",";
                                if($("#major8b" + repindex + "_" + x).val() != null && $("#major8b" + repindex + "_" + x).val() != "")
                                    param.zye8 += $("#major8b" + repindex + "_" + x).val() + ",";
                                if($("#major9b" + repindex + "_" + x).val() != null && $("#major9b" + repindex + "_" + x).val() != "")
                                    param.zye9 += $("#major9b" + repindex + "_" + x).val() + ",";
                                if($("#major10b" + repindex + "_" + x).val() != null && $("#major10b" + repindex + "_" + x).val() != "")
                                    param.zye10 += $("#major10b" + repindex + "_" + x).val() + ",";
                            }

                            param.zye6 = param.zye6.substring(0, param.zye6.length - 1);
                            param.zye7 = param.zye7.substring(0, param.zye7.length - 1);
                            param.zye8 = param.zye8.substring(0, param.zye8.length - 1);
                            param.zye9 = param.zye9.substring(0, param.zye9.length - 1);
                            param.zye10 = param.zye10.substring(0, param.zye10.length - 1);
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
                            var objs = list[i];
                            for(var j = 0; j < objs.length; j++) {
                                var obj = objs[j];
                                if(j == 0)
                                    strHtml += "<tr class='simu'>";
                                else
                                    strHtml += "<tr class='simu result" + i + "' style='display: none;'>";
                                strHtml += "<td>";
                                if(j == 0) {
                                    strHtml += "<a href='/plant/school/details/" + obj.SCHOOL_ID + "' target='_blank'>";
                                    strHtml += "<span style='font-weight: bold;font-size: 16px;'>" + obj.NAME + "</span>";
                                    strHtml += "<div style='margin-top: 20px;'>";
                                    for(var x = 0; x < obj.properties.length; x++) {
                                        var property = obj.properties[x];
                                        strHtml += "<span class='kd-" + property.DIC_ID + "' title='" + property.NAME + "'></span>";
                                    }

                                    strHtml += "</div>";
                                    strHtml += "</a>";
                                }
                                strHtml += "</td>";

                                if(j == 0)
                                    strHtml += "<td>" + obj.PROVINCE_VALUE + "</td>";
                                else
                                    strHtml += "<td></td>";
                                strHtml += "<td>";
                                if(j == 0){
                                    if(obj.subjecttypes.length == 0){
                                        strHtml += "--";
                                    }
                                    for(var x = 0; x < obj.subjecttypes.length; x++) {
                                        var subjecttype = obj.subjecttypes[x];
                                        strHtml += "<span class='kd-" + subjecttype.DIC_ID + "' title='" + subjecttype.NAME + "'></span>";
                                    }
                                }

                                strHtml += "</td>";
                                strHtml += "<td>" + obj.MJNAME + "</td>";
                                strHtml += "<td>";
                                for(var x = 0; x < 3; x++) {
                                    if(x < obj.scores.length) {
                                        strHtml += "<div class='kd-jju'>" + obj.scores[x].YEAR_VALUE + "</div>";
                                    }
                                    else{
                                        strHtml += "<div class='kd-jju'>-</div>";
                                    }
                                }
                                strHtml += "</td>";
                                strHtml += "<td>";
                                for(var x = 0; x < 3; x++) {
                                    if(x < obj.scores.length) {
                                        strHtml += "<div class='kd-jju'>" + obj.scores[x].MAXSCORE + "</div>";
                                    }
                                    else{
                                        strHtml += "<div class='kd-jju'>-</div>";
                                    }
                                }
                                strHtml += "</td>";
                                strHtml += "<td>";
                                for(var x = 0; x < 3; x++) {
                                    if(x < obj.scores.length) {
                                        strHtml += "<div class='kd-jju'>" + obj.scores[x].MINSCORE + "</div>";
                                    }
                                    else{
                                        strHtml += "<div class='kd-jju'>-</div>";
                                    }
                                }
                                strHtml += "</td>";
                                strHtml += "<td>";
                                for(var x = 0; x < 3; x++) {
                                    if(x < obj.scores.length) {
                                        strHtml += "<div class='kd-jju'>" + obj.scores[x].ENTERCOUNT + "</div>";
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
                                if(j == objs.length - 1) {
                                    strHtml += "<tr class='caonima'>";
                                    strHtml += "<td colspan='9'>";
                                    strHtml += "<a class='absolutely' href='javascript:void(0);' data-class='result" + i + "'>";
                                    strHtml += "<div style='background-color: #5BC0DE;text-align: center;'>";
                                    strHtml += "<img class='.bottom-bottom' src='/static/ymplant/images/tubiao4/button-bottom.png' style='width: 22px;height: 22px;' alt=''/>";
                                    strHtml += "</div>";
                                    strHtml += "</a>";
                                    strHtml += "</td>";
                                    strHtml += "</tr>";
                                }
                            }
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
                $("#page").html(tableHead + tableFoot + strHtml);
                $("#reportresult").show();

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
            }
        </script>
    <#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>