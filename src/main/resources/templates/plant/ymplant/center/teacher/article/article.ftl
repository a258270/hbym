<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/center.css?v=${v}"/>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/scbaisc.css?v=${v}"/>
    <link rel="stylesheet" href="/static/plugin/h-ui/lib/chosen.jquery/chosen.min.css?v=${v}"/>
    <script src="/static/plugin/h-ui/lib/chosen.jquery/chosen.jquery.min.js?v=${v}"></script>
</head>
<body class="corresponding">
    <div class="lan" style="height: 100%">
    <p>文章管理</p>
    <div class="row wzh">
        <div class="col-md-10 col-sm-10 col-xs-10">
            <input type="button" class="kd-schu" value="批量删除" onclick="batchDelete();">
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
            <input class="xji" type="button" value="+ 新增" onclick="showWindow('新增文章', '${ctxPath}/plant/teacher/addarticle', $(window).width() * 0.875, $(window).height() * 0.875);"/>
        </div>
        <#--<div class="col-md-3 col-sm-3 col-xs-3">
            <select style="padding: 5px;">
                <option value="">全部</option>
                <option value="">上传时间（从新到旧）</option>
                <option value="">观看次数（从多到少）</option>
                <option value="">观看次数（从少到多）</option>
                <option value="">全部视频</option>
                <option value="">已发布</option>
                <option value="">未发布</option>
            </select>
        </div>-->
    </div>
    <div class="row jtu">
        <div class="col-md-1 col-sm-1 col-xs-1" style="text-align: center;">
            <input type='checkbox' id="reverse" value="全选"/>
        </div>
        <div class="col-md-5 col-sm-5 col-xs-5" style="text-align: center;">
            标题
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: center;">
            上传时间
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: center;">
            浏览量
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: center;">
            操作
        </div>
    </div>
    <div id="page"></div>
</div>
    <script language="JavaScript">
        $(function () {
            $("#reverse").click(function () {
                $(":checkbox").each(function () {
                    $(this).prop("checked", $("#reverse").prop("checked"));
                });
            });

            getDatas();
            parent.layer.close(parent.loader);
        });

        var getDatas = function () {
            sendRequest(ctxPath + "/plant/teacher/api/getarticles", {}, "POST", function (res) {
                if(res.hasErrros){
                    showError(res.errorMessage);
                    return false;
                }

                setPage(res.results);
                $("#pagination").pagination({
                    currentPage: (res.pageNumber + 1),
                    totalPage: res.totalPage,
                    callback: function (current) {
                        var param = {};
                        /*param.currentPage = current;

                        if($("#BMAJOR").attr("class") == "active"){
                            param.CODE = "BMAJOR";
                        }
                        if($("#ZMAJOR").attr("class") == "active"){
                            param.CODE = "ZMAJOR";
                        }*/
                        sendRequest(ctxPath + "/plant/teacher/api/getarticles", param, "POST", function (res) {
                            if(res.hasErrros){
                                showError(res.errorMessage);
                                return false;
                            }
                            setPage(res.results);
                        });
                    }
                });
            });
        };

        var setPage = function (list) {
            var strHtml = "";

            for(var i = 0; i < list.length; i++){
                var obj = list[i];

                strHtml += "<div class='row offline'>";
                strHtml += "<div class='col-md-1 col-sm-1 col-xs-1'>";
                strHtml += "<input type='checkbox' class='ck' value='" + obj.ARTICLE_ID + "'/>";
                strHtml += "</div>";
                strHtml += "<div class='col-md-5 col-sm-5 col-xs-5'>";
                strHtml += "<p style='font-weight: bold;text-align: center'>";
                strHtml += "<a href='#'>" + obj.TITLE + "</a>";
                strHtml += "</p>";
                strHtml += "</div>";
                strHtml += "<div class='col-md-3 col-sm-3 col-xs-3'>";
                strHtml += "<p style='text-align: center'><span>" + toLocalDate(obj.CREATETIME) + "</span></p>";
                strHtml += "</div>";
                strHtml += "<div class='col-md-1 col-sm-1 col-xs-1'>";
                strHtml += "<span style='margin-right: 10px;color: #9D9797;font-size: 10px;text-align: center'><i class='glyphicon glyphicon-eye-open'></i>" + obj.VIEWCOUNT + "</span>";
                strHtml += "</div>";
                strHtml += "<div class='col-md-2 col-sm-2 col-xs-2'>";
                strHtml += "<a href='#' onclick='showWindow(\"编辑文章\", \"/plant/teacher/edit_article/" + obj.ARTICLE_ID + "\", $(window).width() * 0.875, $(window).height() * 0.875);'>编辑</a>";
                strHtml += "<a href='#' onclick='deleteArticle(\"" + obj.ARTICLE_ID + "\");'>删除</a>";
                strHtml += "</div>";
                strHtml += "</div>";
            }

            $("#page").html(strHtml);
        };

        function deleteArticle(id) {
            layer.confirm("确定要删除该记录？", {
                btn: ["是", "否"]
            }, function(index) {
                sendRequest(ctxPath + "/plant/teacher/api/removeArticles", {ARTICLE_ID: id}, "POST", function (res) {
                    if(res.hasErrros){
                        showError(res.errorMessage);
                        return false;
                    }

                    getDatas();
                    showSuccess("删除成功！");
                });
            });
        }

        function batchDelete() {
            var checkboxs = $(".ck");
            var batchremoves = "";
            checkboxs.each(function () {
                if($(this).prop("checked")) {
                    batchremoves += $(this).val() + ","
                }
            });

            if(batchremoves == "") {
                showError("请选择至少一项");
                return false;
            }

            layer.confirm("确定要删除这些信息？", {
                btn: ["是", "否"]
            }, function(index) {
                layer.close(index);
                batchremoves = batchremoves.substring(0, batchremoves.length - 1);
                sendRequest(ctxPath + "/plant/teacher/api/removeArticles", {ARTICLE_ID : batchremoves}, "POST", function (res) {
                    if(res.hasErrros){
                        showError(res.errorMessage);
                        return false;
                    }

                    getDatas();
                    showSuccess("删除成功！");
                });
            });
        }
    </script>
</body>
</html>