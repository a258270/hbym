$(function () {
    $("#form").validate({
        rules:{
            YEAR_ID: {
                required: true,
            }
        },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                layer.confirm("请确认所上传的文件是由模板制作，否则将导致失败，是否确认上传？", {
                    btn: ["是", "否"]
                }, function(index) {
                    $(form).ajaxSubmit(function (res) {
                        if(res.hasErrors){
                            showError(res.errorMessage);
                            return false;
                        }

                        showSuccess("上传成功！");
                    });
                });
            }
    });
});