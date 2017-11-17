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
    sendRequest(ctxPath + "/plant/teacher/api/getvideos", {}, "POST", function (res) {
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
                sendRequest(ctxPath + "/plant/teacher/api/getvideos", param, "POST", function (res) {
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

        strHtml += "<div class='row gli'>";
        strHtml += "<div class='col-md-1 col-sm-1 col-xs-1' style='text-align: center;'>";
        strHtml += "<input type='checkbox' class='ck' value='" + obj.VIDEO_ID + "'/>";
        strHtml += "</div>";
        strHtml += "<div class='col-md-4 col-sm-4 col-xs-4' style='text-align: center;'>";
        strHtml += "<p style='margin-bottom: 10px;font-weight: bold;'>" + obj.TITLE + "</p>";
        strHtml += "</div>";
        strHtml += "<div class='col-md-2 col-sm-2 col-xs-2' style='text-align: center;'>";
        strHtml += "<p style='margin-bottom: 10px;color:#979B9E;'><span>" + toLocalDate(obj.CREATETIME) + "</span></p>";
        strHtml += "</div>";
        strHtml += "<div class='col-md-2 col-sm-2 col-xs-2' style='text-align: center;'>";
        if(obj.ISVAL)
            strHtml += "<p style='color:#979B9E;'><span>已审核</span></p>";
        else
            strHtml += "<p style='color:#979B9E;'><span>未审核</span></p>";
        strHtml += "</div>";
        strHtml += "<div class='col-md-1 col-sm-1 col-xs-1' style='text-align: center;'>";
        strHtml += "<span style='color: #9D9797;margin-bottom: 10px;font-size: 10px;'><i class='glyphicon glyphicon-eye-open' style='margin-right: 5px;'></i>" + obj.VIEWCOUNT + "</span><br/>";
        strHtml += "</div>";
        strHtml += "<div class='col-md-2 col-sm-2 col-xs-2' style='text-align: center;'>";
        strHtml += "<a href='#' onclick='showWindow(\"编辑视频\", \"/plant/teacher/edit_video/" + obj.VIDEO_ID + "\", $(window).width() * 0.875, $(window).height() * 0.875);'>编辑</a>";
        strHtml += "<a href='#' onclick='deleteVideo(\"" + obj.VIDEO_ID + "\");'>删除</a>";
        strHtml += "</div>";
        strHtml += "</div>";
    }

    $("#page").html(strHtml);
};

function deleteVideo(id) {
    layer.confirm("确定要删除该记录？", {
        btn: ["是", "否"]
    }, function(index) {
        sendRequest(ctxPath + "/plant/teacher/api/removeVideos", {VIDEO_ID: id}, "POST", function (res) {
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
        sendRequest(ctxPath + "/plant/teacher/api/removeVideos", {VIDEO_ID : batchremoves}, "POST", function (res) {
            if(res.hasErrros){
                showError(res.errorMessage);
                return false;
            }

            getDatas();
            showSuccess("删除成功！");
        });
    });
}