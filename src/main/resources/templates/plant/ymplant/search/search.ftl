<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/search/search.css?v=${v}"/>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/school/library.css?v=${v}"/>
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
    <div class="kd-wzh">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-8 col-xs-8">
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">文章</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">视频</a></li>
                        <#--<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">专业</a></li>-->
                        <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">院校</a></li>
                    </ul>
                    <div class="tab-content">
                        <!--文章开始-->
                        <div class="kd-thuan tab-pane active"  role="tabpanel" id="home">
                        <div class="kd-zdao">
                            <span>共找到相关文章：</span>
                            <span style="color:#CB8B5F;" id="COUNT1">0</span>
                            <span>篇</span>
                        </div>
                        <div class="row kd-bti">
                            <div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0">
                                文章标题
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                创建时间
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                浏览量
                            </div>
                        </div>
                        <div id="page1"></div>
                        <nav style="text-align: center">
                            <div id="pagination1" class="page_div"></div>
                        </nav>
                        </div>
                        <!--文章结束-->
                        <!--视频 开始-->
                        <div class="tab-pane"  role="tabpanel" id="profile">
                            <div class="kd-zdao">
                                <span>共找到相关视频：</span>
                                <span style="color:#CB8B5F;" id="COUNT2">0</span>
                                <span>个</span>
                            </div>
                            <div id="page2"></div>
                            <nav style="text-align: center">
                                <div id="pagination2" class="page_div"></div>
                            </nav>
                        </div>
                        <!--视频 结束-->
                        <!--专业 开始-->
                        <#--<div class="tab-pane" role="tabpanel" id="messages">
                            <div class="kd-zdao">
                                <span>共找到相关专业：</span>
                                <span style="color:#CB8B5F;" id="COUNT3">0</span>
                                <span>个</span>
                            </div>
                            <div id="page3"></div>
                            <div class="kd-gcheng">
                                <span class="kd-bkzk">本</span>
                                <span style="font-weight: bold;font-size: 20px;">电子计算机工程</span>
                                <p style="padding:8px 2px;font-size: 13px;color: #64676E;">本专业培养学生具有扎实的自然科学基础，良好的外语水平，获得科学的、创造性的思维方法及独立从事科学研究能力的基本训练：掌握电子、通信计算机方面的科学基础知识：能从事信息的获取、处理、传输、变换技术、微电子设备的设计与计算机应用系统、电子信息系统的设计、制造、应用和开发的高级工程技术人才。</p>
                            </div>
                            <nav style="text-align: center">
                                <div id="pagination3" class="page_div"></div>
                            </nav>
                        </div>-->
                        <!--专业 结束-->
                        <!--院校 开始-->
                        <div class="tab-pane" role="tabpanel" id="settings">
                            <div class="kd-zdao">
                                <span>共找到相关院校：</span>
                                <span style="color:#CB8B5F;" id="COUNT4">0</span>
                                <span>个</span>
                            </div>
                            <div id="page4" style="padding: 0 15px;"></div>
                            <nav style="text-align: center">
                                <div id="pagination4" class="page_div"></div>
                            </nav>
                        </div>
                        <!--院校 结束-->

                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <#--<p>
                        <img src="/static/ymplant/img/sye/gkdt2.png" style="width:100%;" alt=""/>
                    </p>
                    <div class="kd-dtao">
                        <div class="kd-jji row">
                            <div class="col-md-7 col-sm-7 col-xs-7" style="padding: 0;">
                                <a class="zxhui" style="text-decoration: none;" href="javascript:void(0);">2017年圆梦高招咨询会视频集锦</a>
                            </div>
                            <div class="col-md-5 col-sm-7 col-xs-7" style="padding-right:0;">
                                <span style="color:#929292;">创建于：</span>
                                <span style="color:#929292;">2017-05-05</span>
                            </div>
                            <!--<span>2017年圆梦高招咨询会视频集锦</span>&ndash;&gt;
                            <!--<span style="color:#929292;">创建于：</span>&ndash;&gt;
                            <!--<span style="color:#929292;">2017-05-05</span>&ndash;&gt;
                        </div>
                        <div class="kd-jji row">
                            <div class="col-md-7 col-sm-7 col-xs-7" style="padding: 0;">
                                <a class="zxhui" style="text-decoration: none;" href="javascript:void(0);">2017年圆梦高招咨询会视频集锦</a>
                            </div>
                            <div class="col-md-5 col-sm-7 col-xs-7" style="padding-right:0;">
                                <span style="color:#929292;">创建于：</span>
                                <span style="color:#929292;">2017-05-05</span>
                            </div>
                            <!--<span>2017年圆梦高招咨询会视频集锦</span>&ndash;&gt;
                            <!--<span style="color:#929292;">创建于：</span>&ndash;&gt;
                            <!--<span style="color:#929292;">2017-05-05</span>&ndash;&gt;
                        </div>
                        <div class="kd-jji row">
                            <div class="col-md-7 col-sm-7 col-xs-7" style="padding: 0;">
                                <a class="zxhui" style="text-decoration: none;" href="javascript:void(0);">2017年圆梦高招咨询会视频集锦</a>
                            </div>
                            <div class="col-md-5 col-sm-7 col-xs-7" style="padding-right:0;">
                                <span style="color:#929292;">创建于：</span>
                                <span style="color:#929292;">2017-05-05</span>
                            </div>
                            <!--<span>2017年圆梦高招咨询会视频集锦</span>&ndash;&gt;
                            <!--<span style="color:#929292;">创建于：</span>&ndash;&gt;
                            <!--<span style="color:#929292;">2017-05-05</span>&ndash;&gt;
                        </div>
                        <div class="kd-jji row">
                            <div class="col-md-7 col-sm-7 col-xs-7" style="padding: 0;">
                                <a class="zxhui" style="text-decoration: none;" href="javascript:void(0);">2017年圆梦高招咨询会视频集锦</a>
                            </div>
                            <div class="col-md-5 col-sm-7 col-xs-7" style="padding-right:0;">
                                <span style="color:#929292;">创建于：</span>
                                <span style="color:#929292;">2017-05-05</span>
                            </div>
                            <!--<span>2017年圆梦高招咨询会视频集锦</span>&ndash;&gt;
                            <!--<span style="color:#929292;">创建于：</span>&ndash;&gt;
                            <!--<span style="color:#929292;">2017-05-05</span>&ndash;&gt;
                        </div>
                        <div class="kd-jji row">
                            <div class="col-md-7 col-sm-7 col-xs-7" style="padding: 0;">
                                <a class="zxhui" style="text-decoration: none;" href="javascript:void(0);">2017年圆梦高招咨询会视频集锦</a>
                            </div>
                            <div class="col-md-5 col-sm-7 col-xs-7" style="padding-right:0;">
                                <span style="color:#929292;">创建于：</span>
                                <span style="color:#929292;">2017-05-05</span>
                            </div>
                            <!--<span>2017年圆梦高招咨询会视频集锦</span>&ndash;&gt;
                            <!--<span style="color:#929292;">创建于：</span>&ndash;&gt;
                            <!--<span style="color:#929292;">2017-05-05</span>&ndash;&gt;
                        </div>
                        <div class="kd-jji row">
                            <div class="col-md-7 col-sm-7 col-xs-7" style="padding: 0;">
                                <a class="zxhui" style="text-decoration: none;" href="javascript:void(0);">2017年圆梦高招咨询会视频集锦</a>
                            </div>
                            <div class="col-md-5 col-sm-7 col-xs-7" style="padding-right:0;">
                                <span style="color:#929292;">创建于：</span>
                                <span style="color:#929292;">2017-05-05</span>
                            </div>
                            <!--<span>2017年圆梦高招咨询会视频集锦</span>&ndash;&gt;
                            <!--<span style="color:#929292;">创建于：</span>&ndash;&gt;
                            <!--<span style="color:#929292;">2017-05-05</span>&ndash;&gt;
                        </div>
                        <div class="kd-jji row">
                            <div class="col-md-7 col-sm-7 col-xs-7" style="padding: 0;">
                                <a class="zxhui" style="text-decoration: none;" href="javascript:void(0);">2017年圆梦高招咨询会视频集锦</a>
                            </div>
                            <div class="col-md-5 col-sm-7 col-xs-7" style="padding-right:0;">
                                <span style="color:#929292;">创建于：</span>
                                <span style="color:#929292;">2017-05-05</span>
                            </div>
                            <!--<span>2017年圆梦高招咨询会视频集锦</span>&ndash;&gt;
                            <!--<span style="color:#929292;">创建于：</span>&ndash;&gt;
                            <!--<span style="color:#929292;">2017-05-05</span>&ndash;&gt;
                        </div>
                        <p style="padding: 5px;text-align: right;">
                            <a style="color: #A53D3C;text-decoration: none;" href="javascript:void(0);">
                                更多 >>>
                            </a>
                        </p>
                    </div>
                    <!--专家团 开始&ndash;&gt;
                    <div class="kd-zjtu">
                        <div class="kd-tdui">
                            专家团
                        </div>
                        <div class="kd-tdui" style="border: none;color:#7C7E7D;">
                            <div class="row" style="padding: 10px 0;">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <img src="/static/ymplant/img/zhengjian.png" style="width: 52px;height: 52px;border-radius: 50%;" alt=""/>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <p style="margin-bottom: 10px;">赵铁柱</p>
                                    <p style="font-size: 10px;">
                                        <span>5</span>
                                        <span>年丨</span>
                                        <img src="/static/ymplant/images/tubiao/yhu.png" style="width: 15%" alt=""/>
                                        <span>32</span>
                                    </p>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <p style="color:#AE2F36;font-weight: bold;text-align: center">
                                        <span>¥</span>
                                        <span>500</span>
                                    </p>
                                    <p style="margin-top: 8px;">
                                        <input class="kd-yyue" type="button" value="预 约"/>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="padding: 10px 0;">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <img src="/static/ymplant/img/zhengjian.png" style="width: 52px;height: 52px;border-radius: 50%;" alt=""/>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <p style="margin-bottom: 10px;">赵铁柱</p>
                                    <p style="font-size: 10px;">
                                        <span>5</span>
                                        <span>年丨</span>
                                        <img src="/static/ymplant/images/tubiao/yhu.png" style="width: 15%" alt=""/>
                                        <span>32</span>
                                    </p>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <p style="color:#AE2F36;font-weight: bold;text-align: center">
                                        <span>¥</span>
                                        <span>500</span>
                                    </p>
                                    <p style="margin-top: 8px;">
                                        <input class="kd-yyue" type="button" value="预 约"/>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="padding: 10px 0;">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <img src="/static/ymplant/img/zhengjian.png" style="width: 52px;height: 52px;border-radius: 50%;" alt=""/>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <p style="margin-bottom: 10px;">赵铁柱</p>
                                    <p style="font-size: 10px;">
                                        <span>5</span>
                                        <span>年丨</span>
                                        <img src="/static/ymplant/images/tubiao/yhu.png" style="width: 15%" alt=""/>
                                        <span>32</span>
                                    </p>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <p style="color:#AE2F36;font-weight: bold;text-align: center">
                                        <span>¥</span>
                                        <span>500</span>
                                    </p>
                                    <p style="margin-top: 8px;">
                                        <input class="kd-yyue" type="button" value="预 约"/>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="padding: 10px 0;">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <img src="/static/ymplant/img/zhengjian.png" style="width: 52px;height: 52px;border-radius: 50%;" alt=""/>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <p style="margin-bottom: 10px;">赵铁柱</p>
                                    <p style="font-size: 10px;">
                                        <span>5</span>
                                        <span>年丨</span>
                                        <img src="/static/ymplant/images/tubiao/yhu.png" style="width: 15%" alt=""/>
                                        <span>32</span>
                                    </p>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <p style="color:#AE2F36;font-weight: bold;text-align: center">
                                        <span>¥</span>
                                        <span>500</span>
                                    </p>
                                    <p style="margin-top: 8px;">
                                        <input class="kd-yyue" type="button" value="预 约"/>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>-->
                    <!--专家团 结束-->
                        <a href="${ctxPath}/plant/report/report">
                            <img src="/static/ymplant/images/tubiao3/2-1.jpg" style="width:100%;" alt="">
                        </a>
                    <a href="${ctxPath}/plant/school/online">
                        <img src="/static/ymplant/images/tubiao3/2-2.jpg" style="width:100%;" alt="">
                    </a>
                </div>
            </div>
        </div>
    </div>
<script>
    $(function () {
        getDatas1();
        getDatas2();
        getDatas4();
    });

    function getDatas1() {
        sendRequest(ctxPath + "/plant/news/api/getnews", {TITLE: "${CONTENT}"}, "POST", function (res) {
            if(res.hasErrros){
                showError(res.errorMessage);
                return false;
            }
            $("#COUNT1").text(res.data.totalRecord);
            setPage1(res.data.results);
            $("#pagination1").pagination({
                currentPage: (res.data.pageNumber + 1),
                totalPage: res.data.totalPage,
                callback: function (current) {
                    var param = {};
                    param.currentPage = current;

                    param.TITLE = "${CONTENT}";
                    sendRequest(ctxPath + "/plant/news/api/getnews", param, "POST", function (res) {
                        if(res.hasErrros){
                            showError(res.errorMessage);
                            return false;
                        }
                        $("#COUNT1").text(res.data.totalRecord);
                        setPage1(res.data.results);
                    });
                }
            });
        });
    };

    function setPage1(list) {
        var strHtml = "";
        for(var i = 0; i < list.length; i++){
            var obj = list[i];
            strHtml += "<div class='row kd-btit'>";
            strHtml += "<div class='col-md-5 col-sm-5 col-xs-5 kd-bse' style='text-align: left'>";
            strHtml += "<a href='${ctxPath}/plant/news/details/" + obj.NEWS_ID + "' target='_blank' title='" + obj.TITLE + "'>" + obj.TITLE + "</a>";
            strHtml += "</div>";
            strHtml += "<div class='col-md-4 col-sm-4 col-xs-4'>";
            strHtml += "<span>" + toLocalDate(obj.CREATETIME) + "</span>";
            strHtml += "</div>";
            strHtml += "<div class='col-md-3 col-sm-3 col-xs-3'>";
            strHtml += "<span><i class='glyphicon glyphicon-eye-open'></i>&nbsp;" + obj.VIEWCOUNT + "</span>";
            strHtml += "</div>";
            strHtml += "</div>";
        }

        $("#page1").html(strHtml);
    }

    function getDatas2() {
        sendRequest(ctxPath + "/plant/news/api/getnews", {TITLE: "${CONTENT}", NEWSTYPE: "621yynn9i8"}, "POST", function (res) {
            if(res.hasErrros){
                showError(res.errorMessage);
                return false;
            }
            $("#COUNT2").text(res.data.totalRecord);
            setPage2(res.data.results);
            $("#pagination2").pagination({
                currentPage: (res.data.pageNumber + 1),
                totalPage: res.data.totalPage,
                callback: function (current) {
                    var param = {};
                    param.currentPage = current;

                    param.TITLE = "${CONTENT}";
                    sendRequest(ctxPath + "/plant/news/api/getnews", param, "POST", function (res) {
                        if(res.hasErrros){
                            showError(res.errorMessage);
                            return false;
                        }
                        $("#COUNT2").text(res.data.totalRecord);
                        setPage2(res.data.results);
                    });
                }
            });
        });
    };

    function setPage2(list) {
        var strHtml = "";
        strHtml += "<div class='row'>";
        for(var i = 0; i < list.length; i++){
            var obj = list[i];

            strHtml += "<div class='col-md-4 col-sm-4 col-xs-4'>";
            strHtml += "<a href='${ctxPath}/plant/news/details/" + obj.NEWS_ID + "' style='text-decoration: none;' target='_blank'>";
            strHtml += "<div class='kd-bkua'>";
            strHtml += "<p>";
            strHtml += "<img src='" + obj.IMGURL + "' style='width:217px;height: 163px;' alt=''/>";
            strHtml += "</p>";
            strHtml += "<p class='kd-yshi' style='border-bottom: 1px dashed #EAEAEA;'>";
            strHtml += "<span>" + obj.TITLE + "</span>";
            strHtml += "</p>";

            strHtml += "<p class='kd-yshi' style='color: #C3C3C3;'>";
            strHtml += "<span style='margin-right: 30px;'>" + toLocalDate(obj.CREATETIME) + "</span>";
            strHtml += "<i class='glyphicon glyphicon-expand'></i>";
            strHtml += "<span>&nbsp;" + obj.VIEWCOUNT + "</span>";
            strHtml += "</p>";
            strHtml += "</div>";
            strHtml += "</a>";
            strHtml += "</div>";
        }
        strHtml += "</div>";
        $("#page2").html(strHtml);
    }

    function getDatas4() {
        sendRequest(ctxPath + "/plant/school/api/getschool", {NAME: "${CONTENT}", NEWSTYPE: "641yynn9i8"}, "POST", function (res) {
            if(res.hasErrros){
                showError(res.errorMessage);
                return false;
            }
            $("#COUNT4").text(res.data.totalRecord);
            setPage4(res.data.results);
            $("#pagination4").pagination({
                currentPage: (res.data.pageNumber + 1),
                totalPage: res.data.totalPage,
                callback: function (current) {
                    var param = {};
                    param.currentPage = current;

                    param.NAME = "${CONTENT}";
                    sendRequest(ctxPath + "/plant/school/api/getschool", param, "POST", function (res) {
                        if(res.hasErrros){
                            showError(res.errorMessage);
                            return false;
                        }
                        $("#COUNT4").text(res.data.totalRecord);
                        setPage4(res.data.results);
                    });
                }
            });
        });
    };

    function setPage4(list) {
        var strHtml = "";
        for(var i = 0; i < list.length; i++){
            var school = list[i];
            strHtml += "<div class='university row'>";
            strHtml += "<a href='" + ctxPath + "/plant/school/details/" + school.SCHOOL_ID + "' target='_blank'>";
            strHtml += "<div class='col-xs-2 col-md-2 col-lg-2' style='min-width: 120px;' '>";
            strHtml += "<img style='width: 100px;height: 100px;' src='" + school.HEADURL + "' alt=''/>";
            strHtml += "</div>";
            strHtml += "<div class='col-xs-10 col-md-10 col-lg-10'>";
            strHtml += "<ul>";
            strHtml += "<li class='table_title'>";
            strHtml += school.NAME;
            strHtml += "&nbsp;&nbsp;";
            for(var j = 0; j < school.properties.length; j++) {
                var property = school.properties[j];
                strHtml += "<span class='kd-" + property.DIC_ID + "' title='" + property.NAME + "'></span>";
            }
            strHtml += "</li>";
            strHtml += "<li style='color: #636363'>";
            strHtml += "<ul class='property_table'>";

            strHtml += "<li class='table_body' style='width: 30%'>";
            strHtml += "隶属：" + school.SUBJECTION;
            strHtml += "</li>";

            strHtml += "<li class='table_body' style='width: 20%'>";
            strHtml += "地区：" + school.PROVINCE_VALUE;
            strHtml += "</li>";

            strHtml += "<li class='table_body' style='width: 20%'>";
            if(school.SCTYPE_VALUE == null)
                strHtml += "学校性质：暂无";
            else
                strHtml += "学校性质：" + school.SCTYPE_VALUE;
            strHtml += "</li>";

            strHtml += "<li class='table_body' style='width: 20%'>";
            if(school.CREATEDATE == null)
                strHtml += "创建时间：暂无";
            else
                strHtml += "创建时间：" + school.CREATEDATE + "年";
            strHtml += "</li>";

            strHtml += "<div class='clear'></div>";
            strHtml += "</ul>";
            strHtml += "</li>";
            strHtml += "<li>";


            for(var j = 0; j < school.subjecttypes.length; j++) {
                var subjecttype = school.subjecttypes[j];
                strHtml += "<span class='kd-" + subjecttype.DIC_ID + "' title='" + subjecttype.NAME + "'></span>";
            }
            strHtml += "</li>";
            strHtml += "</ul>";
            strHtml += "</div>";
            strHtml += "</a>";
            strHtml += "</div>";
            /*strHtml += "<div class='col-md-3' style='margin-top: 5px;'>";
            if(school.STOREUP){
                strHtml += "<button class='shou'>已收藏</button>";
            }
            else{
                strHtml += "<button class='ceshi' onclick=storeUp('" + school.SCHOOL_ID + "');>收藏</button>";
            }
            strHtml += "</div>";*/
            strHtml += "</div>";
        }

        $("#page4").html(strHtml);
    }
</script>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>