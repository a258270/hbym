<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/major/library.css?v=${v}">
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
    <div id="zyxq">

        <div class="container">
        <#if major??>
            <!--学科 专业代码 开始-->
            <div class="quantity row" style="border-top: 2px solid #333;padding-top: 10px;margin-bottom: 20px">
                <div class="col-md-8 col-sm-8 col-xs-8" style="color: #01C3D9;font-size: 35px;font-weight: bold">${major.NAME}</div>
                <div class="col-md-2 col-sm-2 col-xs-2" style="color: #FB4F6A;">
                    <p style="font-size: 18px;margin-bottom: 7px;">专业代码:${major.CODE}</p>
                    <p>
                        <img src="/static/ymplant/img/sye/tubiao/heat.png" style="width: 20px;height: 20px;" alt="">
                        :${major.VIEWCOUNT}</p>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-2" style="color: #FB4F6A;padding-top: 30px;"></div>
            </div>
            <!--学科 专业代码 结束-->

            <!--专业介绍板块 开始-->
            <div class="courses">

                <div class="row">
                    <div class="col-md-8 col-sm-8 col-xs-8">
                        <!--专业介绍 开始-->
                        <div class="introducetwo">
                            <div class="introduce">
                                专业介绍
                                <img class="introdu" src="/static/ymplant/img/sye/tubiao/introdu.png" style="width:22px;height: 22px;" alt="">
                            </div>
                            <div style="padding: 0 20px;">
                            ${major.SUMMARY}
                            </div>
                        </div>
                        <div class="main"">
                            <div class="introduce" style="margin-top: 20px">
                                主要课程
                                <img class="introdu" src="/static/ymplant/img/sye/tubiao/curriculum.png" style="width:22px;height: 22px;" alt="">
                            </div>
                            <#--<div class="row" style="padding-left: 30px;line-height: 3">-->
                            <#--</div>-->
                            <p style="padding: 0 20px;"><#if major.hasClasses??>${major.hasClasses}<#else>暂无信息</#if></p>
                        </div>
                </div>
                        <!--专业介绍 结束-->
                    <div class="col-md-4 col-sm-4 col-xs-4">
                        <div style="width: 100%;margin-bottom: 10px;">
                            <a href="${ctxPath}/plant/report/report">
                                <img src="/static/ymplant/images/tubiao3/2-1.jpg" style="width: 100%;" alt=""/>
                            </a>
                        </div>
                        <div style="width: 100%;margin-bottom: 10px">
                            <a href="${ctxPath}/plant/school/online">
                                <img src="/static/ymplant/images/tubiao3/2-2.jpg" style="width: 100%;" alt=""/>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!--专业介绍板块 结束-->

            <!--开设院校 开始-->
            <#--<div class="open">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="introduce">
                            <span>开设院校</span>
                        </div>
                        <table style="width: 100%" class="yuxao">
                            <tr style="background-color: #E9F3FD">
                                <td>名称</td>
                                <td>地区</td>
                                <td>类别</td>
                                <td>层次</td>
                                <td>隶属</td>
                                <td>操作</td>
                            </tr>
                            <tr>
                                <td>西南大学</td>
                                <td>重庆</td>
                                <td>综合</td>
                                <td>本一</td>
                                <td>教育部</td>
                                <td>
                                    <a href="#">
                                        院校详情
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>西南大学</td>
                                <td>重庆</td>
                                <td>综合</td>
                                <td>本一</td>
                                <td>教育部</td>
                                <td>
                                    <a href="#">
                                        院校详情
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>西南大学</td>
                                <td>重庆</td>
                                <td>综合</td>
                                <td>本一</td>
                                <td>教育部</td>
                                <td>
                                    <a href="#">
                                        院校详情
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>西南大学</td>
                                <td>重庆</td>
                                <td>综合</td>
                                <td>本一</td>
                                <td>教育部</td>
                                <td>
                                    <a href="#">
                                        院校详情
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>西南大学</td>
                                <td>重庆</td>
                                <td>综合</td>
                                <td>本一</td>
                                <td>教育部</td>
                                <td>
                                    <a href="#">
                                        院校详情
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>西南大学</td>
                                <td>重庆</td>
                                <td>综合</td>
                                <td>本一</td>
                                <td>教育部</td>
                                <td>
                                    <a href="#">
                                        院校详情
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>西南大学</td>
                                <td>重庆</td>
                                <td>综合</td>
                                <td>本一</td>
                                <td>教育部</td>
                                <td>
                                    <a href="#">
                                        院校详情
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>西南大学</td>
                                <td>重庆</td>
                                <td>综合</td>
                                <td>本一</td>
                                <td>教育部</td>
                                <td>
                                    <a href="#">
                                        院校详情
                                    </a>
                                </td>
                            </tr>
                            <tr style="height: 30px;"></tr>
                        </table>
                    </div>
                </div>
            </div>-->

            <!--开设院校 结束-->
        <#else>
            暂无信息
        </#if>
        </div>

    </div>
<#if major??>
    <script language="JavaScript">
        $(function () {
            sendRequest(ctxPath + "/plant/major/api/addview", {DIC_ID: "${major.DIC_ID}"}, "POST");
        });
    </script>
</#if>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>