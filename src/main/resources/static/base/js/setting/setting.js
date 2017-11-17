$(function () {
    $("#form").validate({
        rules:{
            title:{
                required:true,
            },
            pageNumber:{
                required:true,
                isIntGtZero:true,
            },
            sc_head:{
                required:true,
            },
            kindfile_path:{
                required:true,
            },
            phone:{
                required:true,
            },
            email:{
                required:true,
            },
            address:{
                required:true,
            },
            aboutus:{
                required:true,
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
                parent.location.reload();
                parent.layer.close(index);
            });

        }
    });
});