<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/inside/inside.css?v=${v}"/>
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
    <div class="kd-pages">
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-9 col-xs-9" style="padding-right: 50px;">
                    <div class="announcement">详情
                    </div>
                    <div id="page"></div>

                    <nav>
                        <div id="pagination" class="page fl" style="text-align: center;"></div>
                    </nav>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-3">
                    <div class="kd-mni">
                        <a href="${ctxPath}/plant/report/report">
                        <img src="/static/ymplant/images/tubiao3/2-1.jpg" style="width:100%;" alt="">
                        </a>
                    </div>
                    <div class="kd-mni">
                        <a href="${ctxPath}/plant/school/online">
                        <img src="/static/ymplant/images/tubiao3/2-2.jpg" style="width:100%;" alt="">
                        </a>
                    </div>
                    <div class="kd-mni">
                        <a href="${ctxPath}/plant/expert/index">
                        <img src="/static/ymplant/images/tubiao3/2-3.jpg" style="width:100%;" alt="">
                        </a>
                    </div>
                </div>
        </div>
    </div>
<script language="JavaScript">
    $(function () {
        getDatas();
    });
    function getDatas() {
        <#if flag?? && (flag == 'news')>
            sendRequest(ctxPath + "/plant/news/api/getnews", {NEWSTYPE: "${type}"}, "POST", function (res) {
                if(res.hasErrros){
                    showError(res.errorMessage);
                    return false;
                }
                setPage(res.data.results);
                $("#pagination").pagination({
                    currentPage: (res.data.pageNumber + 1),
                    totalPage: res.data.totalPage,
                    callback: function (current) {
                        var param = {};
                        param.currentPage = current;

                        param.NEWSTYPE = "${type}";
                        sendRequest(ctxPath + "/plant/news/api/getnews", param, "POST", function (res) {
                            if(res.hasErrros){
                                showError(res.errorMessage);
                                return false;
                            }
                            setPage(res.data.results);
                        });
                    }
                });
            });
        </#if>
        <#if flag?? && (flag == 'article')>
            sendRequest(ctxPath + "/plant/article/api/getarticles", {SCHOOL_ID: "${type}"}, "POST", function (res) {
                if(res.hasErrros){
                    showError(res.errorMessage);
                    return false;
                }
                setPage(res.data.results);
                $("#pagination").pagination({
                    currentPage: (res.data.pageNumber + 1),
                    totalPage: res.data.totalPage,
                    callback: function (current) {
                        var param = {};
                        param.currentPage = current;

                        param.SCHOOL_ID = "${type}";
                        sendRequest(ctxPath + "/plant/article/api/getarticles", param, "POST", function (res) {
                            if(res.hasErrros){
                                showError(res.errorMessage);
                                return false;
                            }
                            setPage(res.data.results);
                        });
                    }
                });
            });
        </#if>
    };

    function setPage(list) {
        var strHtml = "";
        for(var i = 0; i < list.length; i++){
            var obj = list[i];
            <#if flag?? && (flag == 'news')>
            strHtml += "<div class='row' style='margin-bottom:10px;border-bottom: 1px dashed #DADADA'>";
            strHtml += "<div class='col-md-1 col-sm-1 col-xs-1' style='margin-bottom: 2px'>";
            strHtml += "<div class='notic'>标题</div>";
            strHtml += "</div>";
            strHtml += "<div class='col-md-8 col-ms-8 col-xs-8' style='padding: 0'>";
            strHtml += "<a href='${ctxPath}/plant/news/details/" + obj.NEWS_ID + "' style='text-decoration: none;' target='_blank'>";
            strHtml += "<span>" + obj.TITLE + "</span>";
            strHtml += "</a>";
            strHtml += "</div>";
            strHtml += "<div class='col-md-3 col-sm-3 col-xs-3' style='text-align: right'>";
            strHtml += toLocalTime(obj.CREATETIME);
            strHtml += "</div>";
            strHtml += "</div>";
            </#if>
        }

        $("#page").html(strHtml);
    }
</script>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>