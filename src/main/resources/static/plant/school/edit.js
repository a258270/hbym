$(function () {
    $("input[type=file]").change(function(){$(this).parents(".sp-uploader").find(".sp-filename").val($(this).val());});
    $("input[type=file]").each(function(){
        if($(this).val()==""){$(this).parents(".sp-uploader").find(".sp-filename").val("请选择文件");}
    });
    $("#form").validate({
        rules:{
                HEADURL:{
            },
        NAME:{
                required:true,
            },
        PROVINCE:{
                required:true,
            },
        SCTYPE:{
                required:true,
            },
        SUBJECTTYPE:{
                required:true,
            },
        CREATEDATE:{
            },
        PHONE:{
            },
        EMAIL:{
            },
        ADDRESS:{
            },
        WEBSITE:{
            },
        SCWEBSITE:{
            },
        SCCODE:{
            },
        SUBJECTION:{
            },
        LON:{
                isNumber:true,
            },
        LAT:{
                isNumber:true,
            },
        MSORT:{
            required:true,
            isInteger:true,
        },
        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function(form){
            if($("#PROVINCE").val() == null || $("#PROVINCE").val() == ""){
                showError("省份不能为空！");
                return false;
            }
            if($("#SCTYPE").val() == null || $("#SCTYPE").val() == ""){
                showError("学校类型不能为空！");
                return false;
            }
            if($("#SUBJECTTYPE").val() == null || $("#SUBJECTTYPE").val() == ""){
                showError("学科类型不能为空！");
                return false;
            }
            if($("#ARRANGMENT").val() == null || $("#ARRANGMENT").val() == ""){
                showError("学历层次不能为空！");
                return false;
            }
            if($("#HASMAJOR").val() == null || $("#HASMAJOR").val() == ""){
                showError("拥有专业不能为空！");
                return false;
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
    $("#PROVINCE").chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
    $("#SCTYPE").chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
    $("#SUBJECTTYPE").chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
    $("#ARRANGMENT").chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
    $("#HASMAJOR").chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
    $("#SCPROPERTY").chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });

});