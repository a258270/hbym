$(function () {
    $("#form").validate({
        rules:{
                SCHOOL_ID:{
                required:true,
            },
        YEAR_ID:{
                required:true,
            },
        ARRANGMENT_ID:{
                required:true,
            },
        MAXSCORE:{
                required:true,
                isNumber:true,
            },
        MINSCORE:{
                required:true,
                isNumber:true,
            },
        ENTERCOUNT:{
                required:true,
                isInteger:true,
            },
        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function(form){
            if($('#YEAR_ID').val() == "" || $('#YEAR_ID').val() == null){
                showError("年份不能为空！");
                return false;
            }
            if($('#ARRANGMENT_ID').val() == "" || $('#ARRANGMENT_ID').val() == null){
                showError("招生批次不能为空！");
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
});