$(function () {
    var editorINTRODUCTION;
    var editorContentINTRODUCTION;
    KindEditor.ready(function(K) {
        editorContentINTRODUCTION = $('#SUMMARY').val();
        editorINTRODUCTION = K.create('textarea[name="INTRODUCTION"]', {
            cssPath : ctxPath + '/static/plugin/h-ui/lib/kindeditor/plugins/code/prettify.css',
            uploadJson : ctxPath + '/admin/kindfile/upload',
            fileManagerJson : ctxPath + '/admin/kindfile/manager',
            allowFileManager : true,
            width:"100%"
        });
        prettyPrint();
        editorINTRODUCTION.text(editorContentINTRODUCTION);
    });

    var editorFACULTY;
    var editorContentFACULTY;
    KindEditor.ready(function(K) {
        editorContentFACULTY = $('#SUMMARY').val();
        editorFACULTY = K.create('textarea[name="FACULTY"]', {
            cssPath : ctxPath + '/static/plugin/h-ui/lib/kindeditor/plugins/code/prettify.css',
            uploadJson : ctxPath + '/admin/kindfile/upload',
            fileManagerJson : ctxPath + '/admin/kindfile/manager',
            allowFileManager : true,
            width:"100%"
        });
        prettyPrint();
        editorFACULTY.text(editorContentFACULTY);
    });

    $("#form").validate({
        rules:{
        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function(form){
            editorINTRODUCTION.sync();
            editorFACULTY.sync();
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