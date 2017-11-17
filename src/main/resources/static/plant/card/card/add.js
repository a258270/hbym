$(function () {
    $("#form").validate({
        rules:{
            COUNT:{
                required:true,
                isInteger:true,
            },
        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function(form){
            if($('#PROVINCE_ID').val() == "" || $('#PROVINCE_ID').val() == null){
                showError("地区不能为空！");
                return false;
            }
            if($('#TYPE_ID').val() == "" || $('#TYPE_ID').val() == null){
                showError("类型不能为空！");
                return false;
            }
            if($('#PURPOSE_ID').val() == "" || $('#PURPOSE_ID').val() == null){
                showError("用途不能为空！");
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
    $('#PROVINCE_ID').chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
    $('#TYPE_ID').chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
    $('#PURPOSE_ID').chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
});