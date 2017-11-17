$(function () {
    $('#form').on("change", ":checkbox", function() {
        // 列表复选框
        if ($(this).is("[name='ck_all']")) {
            // 全选
            $(":checkbox", '#form').prop("checked",$(this).prop("checked"));
        }else{
            // 一般复选
            var checkbox = $("#tab :checkbox");
            $(":checkbox[name='ck_all']", '#form').prop('checked', checkbox.length == checkbox.filter(':checked').length);
        }
    });
    $("#form").validate({
        rules:{

        },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                var count = $("#COUNTS").val();
                for(var i = 0; i < count; i++){
                    if($("#MAJOR" + i).val() == ""){
                        showError("所填数据不能为空！");
                        return false;
                    }
                    if($("#YEAR" + i).val() == ""){
                        showError("所填数据不能为空！");
                        return false;
                    }
                    if($("#ARRANGMENT" + i).val() == ""){
                        showError("所填数据不能为空！");
                        return false;
                    }
                    if($("#MAJORTYPE" + i).val() == ""){
                        showError("所填数据不能为空！");
                        return false;
                    }
                    if($("#MAXSCORE" + i).val() == "" && $("#MINSCORE" + i).val() == "" && $("#ENTERCOUNT" + i).val() == ""){
                        showError("所填数据不能为空！");
                        return false;
                    }
                }
                $(form).ajaxSubmit(function (res) {
                    if(res.hasErrors){
                        showError(res.errorMessage);
                        return false;
                    }

                    var index = parent.layer.getFrameIndex(window.name);
                    parent.onTableQuery();
                    parent.layer.close(index);
                });
            }
    });
    $('#YEAR_ID').chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
    $('#ARRANGMENT_ID').chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });

    var count = $("#COUNTS").val();
    for(var j = 0; j < count; j++){
        $("#MAJOR" + j).chosen({
            no_results_text: "没有找到结果！",//搜索无结果时显示的提示
            search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
            allow_single_deselect:true
        });
    }
});

var addmjscore = function () {
    var count = $("#COUNTS").val();
    var innerHtmlStr = "";
    innerHtmlStr += "<div class=\"row cl\" id=\"row" + count + "\">";
    innerHtmlStr += "<label class=\"col-xs-1 col-sm-1 text-c\">";
    innerHtmlStr += "<input type=\"checkbox\" class=\"group-checkable\" value=\"" + count + "\" />";
    innerHtmlStr += "<span></span>";
    innerHtmlStr += "</label>";
    innerHtmlStr += "<label class=\"col-xs-2 col-sm-2 text-c\">";
    innerHtmlStr += "<span class=\"select-box\">";
    innerHtmlStr += "<select class=\"select\" data-placeholder=\"请选择专业名称\" size=\"1\" id=\"MAJOR" + count + "\" name=\"MAJOR" + count + "\">";
    innerHtmlStr += majorStr;
    innerHtmlStr += "</select>";
    innerHtmlStr += "</span>";
    innerHtmlStr += "</label>";
    innerHtmlStr += "<label class=\"col-xs-1 col-sm-1 text-c\">";
    innerHtmlStr += "<span class=\"select-box\">";
    innerHtmlStr += "<select class=\"select\" data-placeholder=\"请选择年份\" size=\"1\" id=\"YEAR" + count + "\" name=\"YEAR" + count + "\">";
    innerHtmlStr += yearStr;
    innerHtmlStr += "</select>";
    innerHtmlStr += "</span>";
    innerHtmlStr += "</label>";
    innerHtmlStr += "<label class=\"col-xs-1 col-sm-1 text-c\">";
    innerHtmlStr += "<span class=\"select-box\">";
    innerHtmlStr += "<select class=\"select\" data-placeholder=\"请选择招生批次\" size=\"1\" id=\"ARRANGMENT" + count + "\" name=\"ARRANGMENT" + count + "\">";
    innerHtmlStr += arrangmentStr;
    innerHtmlStr += "</select>";
    innerHtmlStr += "</span>";
    innerHtmlStr += "</label>";
    innerHtmlStr += "<label class=\"col-xs-1 col-sm-1 text-c\">";
    innerHtmlStr += "<span class=\"select-box\">";
    innerHtmlStr += "<select class=\"select\" data-placeholder=\"请选择文理科\" size=\"1\" id=\"MAJORTYPE" + count + "\" name=\"MAJORTYPE" + count + "\">";
    innerHtmlStr += majortypeStr;
    innerHtmlStr += "</select>";
    innerHtmlStr += "</span>";
    innerHtmlStr += "</label>";
    innerHtmlStr += "<label class=\"col-xs-2 col-sm-2 text-c\"><input type=\"text\" class=\"input-text\" value=\"\" placeholder=\"请输入最高分\" id=\"MAXSCORE" + count + "\" name=\"MAXSCORE" + count + "\"></label>";
    innerHtmlStr += "<label class=\"col-xs-2 col-sm-2 text-c\"><input type=\"text\" class=\"input-text\" value=\"\" placeholder=\"请输入最低分\" id=\"MINSCORE" + count + "\" name=\"MINSCORE" + count + "\"></label>";
    innerHtmlStr += "<label class=\"col-xs-2 col-sm-2 text-c\"><input type=\"text\" class=\"input-text\" value=\"\" placeholder=\"请输入录取数\" id=\"ENTERCOUNT" + count + "\" name=\"ENTERCOUNT" + count + "\"></label>";
    if(count > 0){
        $("#row" + (count - 1)).after(innerHtmlStr);
    }
    else{
        $("#COUNTS").after(innerHtmlStr);
    }
    $("#MAJOR" + count).chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
    count++;
    $("#COUNTS").val(count);
};

var removemjscore = function () {
    var checkboxs = $("#tab :checkbox");
    var batchremoves = [];
    checkboxs.each(function () {
        if($(this).prop("checked")) {
            if($(this).val() != "")
                batchremoves.push($(this).val());
        }
    });

    if(batchremoves.length <= 0) {
        showError("请选择至少一项");
        return false;
    }

    layer.confirm("确定要批量删除？", {
        btn: ["是", "否"]
    }, function(index) {
        layer.close(index);

        var count = $("#COUNTS").val();
        var countTmp = 0;
        for(var i = 0; i < count; i++) {
            var flag = false;
            for(var j = 0; j < batchremoves.length; j++) {
                if( i == batchremoves[j]){
                    flag = true;
                }
            }

            if(flag) {
                $("#row" + i).remove();
            }
            else{
                $(":checkbox", '#row' + i).val(countTmp);
                $("#row" + i).attr("id", "row" + countTmp);

                $("#MAJOR" + i).attr("name", "MAJOR" + countTmp);
                $("#MAJOR" + i).attr("id", "MAJOR" + countTmp);

                $("#MAJOR" + i + "_chosen").attr("id", "MAJOR" + countTmp + "_chosen");
                $("#MAJOR" + countTmp).chosen({
                    no_results_text: "没有找到结果！",//搜索无结果时显示的提示
                    search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
                    allow_single_deselect:true
                });

                $("#YEAR" + i).attr("name", "YEAR" + countTmp);
                $("#YEAR" + i).attr("id", "YEAR" + countTmp);

                $("#ARRANGMENT" + i).attr("name", "ARRANGMENT" + countTmp);
                $("#ARRANGMENT" + i).attr("id", "ARRANGMENT" + countTmp);

                $("#MAJORTYPE" + i).attr("name", "MAJORTYPE" + countTmp);
                $("#MAJORTYPE" + i).attr("id", "MAJORTYPE" + countTmp);

                $("#MAXSCORE" + i).attr("name", "MAXSCORE" + countTmp);
                $("#MAXSCORE" + i).attr("id", "MAXSCORE" + countTmp);

                $("#MINSCORE" + i).attr("name", "MINSCORE" + countTmp);
                $("#MINSCORE" + i).attr("id", "MINSCORE" + countTmp);

                $("#ENTERCOUNT" + i).attr("name", "ENTERCOUNT" + countTmp);
                $("#ENTERCOUNT" + i).attr("id", "ENTERCOUNT" + countTmp);

                countTmp++;
            }
        }
        $("#COUNTS").val(countTmp);
    });
};