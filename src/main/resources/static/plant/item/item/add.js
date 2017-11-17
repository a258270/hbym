$(function () {
    $("input[type=file]").change(function(){$(this).parents(".sp-uploader").find(".sp-filename").val($(this).val());});
    $("input[type=file]").each(function(){
        if($(this).val()==""){$(this).parents(".sp-uploader").find(".sp-filename").val("请选择文件");}
    });
    $("#form").validate({
        rules:{
            NAME:{
                required:true,
            },
            PRICE:{
                required:true,
                isNumber:true,
            },
            SUMMARY:{
                required:true,
            },
            ISSALE:{
                required:true,
            },
            ITEMTYPE:{
                required:true,
            },
            ITEMPROPERTY:{
                required:true,
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
                if($('#ISSALE').val() == "" || $('#ISSALE').val() == null){
                    showError("是否上架不能为空！");
                    return false;
                }
                if($('#ITEMTYPE').val() == "" || $('#ITEMTYPE').val() == null){
                    showError("商品分类不能为空！");
                    return false;
                }
                if($('#ITEMPROPERTY').val() == "" || $('#ITEMPROPERTY').val() == null){
                    showError("商品属性不能为空！");
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
    $('#ISSALE').chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
    $('#ITEMTYPE').chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
    $('#ITEMPROPERTY').chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
});