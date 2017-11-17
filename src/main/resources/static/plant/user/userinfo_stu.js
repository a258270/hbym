$(function () {
    $("#completeForm").validate({
        rules:{
            IDCARD: {
                isIdCardNo: true
            },
            PHONE: {
                isTel: true
            },
            EMAIL: {
                email: true
            },
            EXAMSCORE: {
                isInteger: true
            }
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

                location.replace(location.href);
            });

        }
    });
});

var toComplete = function () {
    $("#completemodalbox").modal("show");
};