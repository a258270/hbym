var editorCONTENT;
KindEditor.ready(function(K) {
    editorCONTENT = K.create('textarea[name="CONTENT"]', {
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
            TITLE:{
                required:true,
            },
            SUBTITLE:{
            },
            IMGURL:{
            },
            MSORT:{
                isInteger:true,
            },
            SCHOOL_ID:{
                required:true,
            },
        },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                editorCONTENT.sync();
                if($('#CONTENT').val() == "" || $('#CONTENT').val() == null){
                    showError("内容不能为空！");
                    return false;
                }
                if($('#SCHOOL_ID').val() == "" || $('#SCHOOL_ID').val() == null){
                    showError("所属院校不能为空！");
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

    $("#SCHOOL_ID").chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
});