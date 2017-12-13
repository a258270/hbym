<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/center.css?v=${v}"/>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/center.css?v=${v}"/>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/scbaisc.css?v=${v}"/>
    <link rel="stylesheet" href="/static/plugin/h-ui/lib/chosen.jquery/chosen.min.css?v=${v}"/>
    <script src="/static/plugin/h-ui/lib/chosen.jquery/chosen.jquery.min.js?v=${v}"></script>
</head>
<body class="corresponding">
<div class="lan" style="height: 875px">
    <p>文章管理</p>
    <div class="row online">
        <div class="col-md-7 col-sm-7 col-xs-7">
            <input type="button" class="kd-schu" value="批量删除" onclick="batchDelete();">
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
            <input class="pict" type="button" value="上传图片" onclick="showWindow('上传图片', '${ctxPath}/plant/teacher/upload_image');"/>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-3">
            <#--<select style="padding: 5px;">
                <option value="">全部</option>
                <option value="">上传时间（从新到旧）</option>
                <option value="">观看次数（从多到少）</option>
                <option value="">观看次数（从少到多）</option>
                <option value="">全部视频</option>
                <option value="">已发布</option>
                <option value="">未发布</option>
            </select>-->
        </div>
    </div>
    <div class="row" style="padding: 0 15px;">
        <div id="page"></div>
        <nav style="text-align: center;">
            <div id="pagination" class="page fl"></div>
        </nav>
    </div>
</div>
<script language="JavaScript">
    $(function () {
        getDatas();
        parent.layer.close(parent.loader);
    });

    var getDatas = function () {
        sendRequest(ctxPath + "/plant/teacher/api/getimages", {}, "POST", function (res) {
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
                    sendRequest(ctxPath + "/plant/teacher/api/getimages", param, "POST", function (res) {
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

            strHtml += "<div class='col-md-2 col-sm-2 col-xs-2 pdi'>";
            strHtml += "<input type='checkbox' class='ck' value='" + obj.IMAGE_ID + "'/>";
            strHtml += "<img src='" + obj.URL + "' style='width: 100%;height: 100%;' alt=''/>";
            strHtml += "</div>";
        }

        $("#page").html(strHtml);
    };

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
            sendRequest(ctxPath + "/plant/teacher/api/removeImages", {IMAGE_ID : batchremoves}, "POST", function (res) {
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