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
            LINKSITE:{
                required:true,
            },
            LOGO:{
                required:true,
            },
            MSORT:{
                isIntGteZero:true,
            },
        },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
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