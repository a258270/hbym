<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
    <#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/center.css?v=${v}">
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/library/library.css?v=${v}"/>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/util/util.js?v=${v}"></script>
    <script src="${ctxPath}/static/ymplant/js/starscore/starScore.js?v=${v}"></script>
</head>
<body class="corresponding">

<div class="lan" style="height: 875px">
    <p>联系人</p>
    <div class="row" style="margin-left: 30px;margin-top: 30px;">
        <div class="col-md-10">
            <div style="margin-bottom:30px">
                <span style="font-weight: bold">
                    <input type="text" placeholder="请输入学生姓名" style="outline: none;border-radius: 5px;border: 1px solid #CECECE;padding: 0 5px;" id="NAME"/>
                    <a href="javascript:void(0);" onclick="getDatas();">
                        <i class="glyphicon glyphicon-search" style="color: #1ECADA"></i>
                    </a>

                </span>
            </div>
            <table class="tbe">

            </table>
            <div id="pagination" class="page_div"></div>
        </div>
    </div>
    <script language="JavaScript">
        $(function () {
            getDatas();
            parent.layer.close(parent.loader);
        });

        function getDatas() {
            var dataParam = {NAME: $("#NAME").val()};
            sendRequest(ctxPath + "/plant/teacher/api/getpersons", dataParam, "POST", function (res) {
                if(res.hasErrros){
                    showError(res.errorMessage);
                    return false;
                }
                $("#COUNT").text(res.data.totalRecord);
                setPage(res.data.results);
                $("#pagination").pagination({
                    currentPage: (res.data.pageNumber + 1),
                    totalPage: res.data.totalPage,
                    callback: function (current) {
                        var param = {};
                        param.currentPage = current;

                        param.NAME = $("#NAME").val();
                        sendRequest(ctxPath + "/plant/school/api/getschools", param, "POST", function (res) {
                            if(res.hasErrros){
                                showError(res.errorMessage);
                                return false;
                            }
                            $("#COUNT").text(res.data.totalRecord);
                            setPage(res.data.results);
                        });
                    }
                });
            });
        }
        function setPage(list) {
            var tbTitle = "<tr id='zy'><td></td><td>姓名</td><td>地址</td><td>分数</td><td>评价</td><td>时间</td><td>操作</td></tr>";
            var strHtml = "";

            strHtml += tbTitle;
            if(list.length <= 0) {
                strHtml += "<tr><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>";
            }

            for (var i = 0; i < list.length; i++) {
                var person = list[i];

                strHtml += "<tr>";
                strHtml += "<td><input type='checkbox'/></td>";
                strHtml += "<td>";
                strHtml += person.NICKNAME;
                strHtml += "</td>";
                strHtml += "<td>";
                strHtml += person.EXAMAREA_VALUE;
                strHtml += "</td>";
                strHtml += "<td>";
                strHtml += person.EXAMSCORE;
                strHtml += "分</td>";
                strHtml += "<td><div class='atar_Show'><p tip='" + person.chatscore + "' style='width: 160px;'></p></div></td>";
                strHtml += "<td>";
                strHtml += toLocalTime(person.CHATCREATETIME);
                strHtml += "</td>";
                strHtml += "<td>";
                strHtml += "<a target='_blank' href='${ctxPath}/plant/chat/page/teacher/" + person.USER_ID + "'>详情</a></td>";
                strHtml += "</tr>";
            }

            $(".tbe").html(strHtml);
            setStar();
        }

        function toDelChat(id) {
            layer.confirm("确定要删除该记录？", {
                btn: ["是", "否"]
            }, function(index) {
                sendRequest("${ctxPath}/plant/chat/api/todel", {USER_ID: id}, "POST", function (res) {
                    if(res.hasErrors) {
                        showError(res.errorMessage);
                        return false;
                    }

                    window.location.reload();
                });
            });

        }

        function setStar() {
            $(".atar_Show p").each(function(index, element) {
                var num=$(this).attr("tip");
                var www=num*2*16;//
                $(this).css("width",www);
                $(this).parent(".atar_Show").siblings("span").text(num+"分");
            });
        }
    </script>
</div>
</body>
</html>