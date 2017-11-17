var editorSUMMARY;
KindEditor.ready(function(K) {
    editorSUMMARY = K.create('textarea[name="SUMMARY"]', {
        cssPath : ctxPath + '/static/plugin/h-ui/lib/kindeditor/plugins/code/prettify.css',
        uploadJson : ctxPath + '/admin/kindfile/upload',
        fileManagerJson : ctxPath + '/admin/kindfile/manager',
        allowFileManager : true,
        width:"100%"
    });
    prettyPrint();
});
$(function () {
    $("#form").validate({
        rules:{
            DIC_ID:{
                required:true,
            },
            VIEWCOUNT:{
                required:true,
                isInteger:true,
            },
        },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                editorSUMMARY.sync();
                if($('#SUMMARY').val() == "" || $('#SUMMARY').val() == null){
                    showError("简介不能为空！");
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