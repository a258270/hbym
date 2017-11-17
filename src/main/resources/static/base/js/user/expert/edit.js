$(function () {
    $("#JOBDATE").chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
    $("#form").validate({
        rules:{
            PHONE:{
                isPhone:true,
            },
            NICKNAME:{
                required:true,
            },
            JOBTYPE:{
                required:true,
            },
            PRICE:{
                required:true,
                isNumber:true,
            }
        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function(form){
            if($("#JOBDATE").val() == "" || $("#JOBDATE").val() == null){
                showError("工作年限不能为空！");
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
});