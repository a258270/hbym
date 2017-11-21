<!DOCTYPE html>
<html>
<head lang="en">

    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/search/search.css?v=${v}"/>
    <script>
        $(function() {
            $("#tions").click(function() {
                $("input[name='checkname']").each(function() {
                    $(this).prop("checked", true);
                });
            });

            $("#tions2").click(function() {
                $("input[name='checkname']").each(function() {
                    $(this).prop("checked", false);
                });
            });
        });
    </script>
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
    <div class="kd-pli">
        <div class="container">
            <!--导航 开始-->
            <div style="padding: 30px 15px;border-bottom: 1px solid #7F7F7F">
                <input style="width: 80px;margin: 0;" class="kd-yshi" id="MINSCORE" type="text" placeholder="最低分"/>
                <span>--</span>
                <input style="width: 80px;" class="kd-yshi" id="MAXSCORE" type="text" placeholder="最高分"/>
                地区:<select style="width: 150px;" class="kd-yshi" id="EXAMAREA">
                    <option value="">不限</option>
                    <#list provinces as province>
                        <option value="${province.DIC_ID}">${province.NAME}</option>
                    </#list>
                </select>
                科类:<select style="width:80px;" class="kd-yshi" id="MAJORTYPE">
                    <option value="">不限</option>
                    <#list majortypes as majortype>
                        <option value="${majortype.DIC_ID}">${majortype.NAME}</option>
                    </#list>
                </select>
                性别:<select class="kd-yshi" id="SEX">
                    <option value="">不限</option>
                    <#list sexs as sex>
                        <option value="${sex.DIC_ID}">${sex.NAME}</option>
                    </#list>
                </select>
                年龄:<select class="kd-yshi" id="BIRTH">
                    <option value="">不限</option>
                    <option value="14-16">14-16</option>
                    <option value="16-18">16-18</option>
                    <option value="18-24">18-24</option>
                </select>
                <input class="kd-cz" type="button" value="查找" onclick="getDatas()"/>
            </div>
            <!--导航 结束-->
            <!--查找到的学生 开始-->
            <div class="kd-zxs">
                <#--<select class="kd-yshi">-->
                    <#--<option value="" selected disabled>批量操作</option>-->
                    <#--<option value="">发送邀请（全部）</option>-->
                    <#--<option value="">发送邀请（已选中）</option>-->
                    <#--<option value="">发送邀请（未选中）</option>-->
                <#--</select>-->
                    <input class="kd-yshi" id="tions" type="button" value="全选">
                    <input class="kd-yshi" id="tions2" type="button" value="全不选">
                    <input class="kd-yshi" type="button" value="批量邀请" onclick="send();">
                <input class="kd-bji" type="button" value="编辑信息" onclick="editTemplate();"/>
                <div class="row" style="padding: 15px 0;" id="page">

                </div>
                <nav style="text-align: center">
                    <div id="pagination" class="page_div"></div>
                </nav>
            </div>
            <!--查找到的学生 结束-->
        </div>
    </div>
    <#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
<script language="JavaScript">
    var batchSend = "";
    $(function(){
        getDatas();
    });
    function editTemplate() {
        showWindow("编辑模板", ctxPath + "/plant/teacher/template", 500, 395);
    }

    var getDatas = function () {
        sendRequest(ctxPath + "/plant/teacher/api/searchstus", getParam(), "POST", function (res) {
            if(res.hasErrros){
                showError(res.errorMessage);
                return false;
            }

            setPage(res.data.results);
            $("#pagination").pagination({
                currentPage: (res.data.pageNumber + 1),
                totalPage: res.data.totalPage,
                callback: function (current) {
                    sendRequest(ctxPath + "/plant/teacher/api/searchstus", getParam(), "POST", function (res) {
                        if(res.hasErrros){
                            showError(res.errorMessage);
                            return false;
                        }
                        setPage(res.data.results);
                    });
                }
            });
        });
    };

    var getParam = function () {
        var param = {};
        param.MINSCORE = $("#MINSCORE").val();
        param.MAXSCORE = $("#MAXSCORE").val();
        param.EXAMAREA = $("#EXAMAREA").val();
        param.MAJORTYPE = $("#MAJORTYPE").val();
        param.SEX = $("#SEX").val();
        param.BIRTH = $("#BIRTH").val();
        return param;
    };

    var setPage = function (list) {
        var strHtml = "";
        for(var i = 0; i < list.length; i++) {
            var obj = list[i];
            strHtml += "<div class='col-md-3 col-sm-3 col-xs-3'>";
            strHtml += "<div class='row' style='padding-bottom: 15px;'>";
            strHtml += "<div class='col-md-4 col-sm-4 col-xs-4' style='padding-right: 0;'>";
            strHtml += "<img class='kd-tpan' src='" + obj.HEADURL + "' alt=''/>";
            strHtml += "</div>";
            strHtml += "<div class='col-md-6 col-sm-6 col-xs-6' style='padding-right: 0;'>";
            strHtml += "<p style='color: #333;margin-bottom:7px;'>" + obj.NICKNAME + "</p>";
            strHtml += "<p style='margin-bottom:7px;'>";
            if(obj.SEX == '11') {
                strHtml += "<span style='border-right: 1px solid #C1ABC1;padding-right: 10px;'><img src='/static/ymplant/images/tubiao4/sex_man.png' /></span>";
            }
            else if(obj.SEX == '12'){
                strHtml += "<span style='border-right: 1px solid #C1ABC1;padding-right: 10px;'><img src='/static/ymplant/images/tubiao4/sex_woman.png' /></span>";
            }
            else{
                strHtml += "<span style='border-right: 1px solid #C1ABC1;padding-right: 10px;'><img src='/static/ymplant/images/tubiao4/sex_man.png' /></span>";
            }

            strHtml += "<span style='border-right: 1px solid #C1ABC1;padding-right: 10px;'>" + obj.EXAMAREA_VALUE + "</span>";
            strHtml += "<span>"+ obj.EXAMSCORE +"分</span>";
            strHtml += "</p>";
            strHtml += "<input class='kd-yqin' type='button' value='邀请' onclick='invite(\"" + obj.USER_ID + "\")'/>";
            strHtml += "</div>";
            strHtml += "<div class='col-md-2 col-sm-2 col-xs-2' style='padding-left: 0;'>";
            strHtml += "<input type='checkbox' name='checkname' value='" + obj.USER_ID + "'/>";
            strHtml += "</div>";
            strHtml += "</div>";
            strHtml += "</div>";
        }

        $("#page").html(strHtml);
    };

    var send = function () {
        var checkboxes = $(":checkbox", '#page');
        batchSend = "";
        checkboxes.each(function () {
            if($(this).prop("checked")){
                batchSend += $(this).val() + ",";
            }
        });

        if(batchSend == "") {
            showError("请选择至少一名学生！");
            return false;
        }

        batchSend = batchSend.substring(0, batchSend.length - 1);

        showWindow("发送邀请", ctxPath + "/plant/teacher/send", 500, 395);
    };
</script>
</html>