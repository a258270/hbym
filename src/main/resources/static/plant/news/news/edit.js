        var editorCONTENT;
        var editorContentCONTENT;
KindEditor.ready(function(K) {
    editorContentCONTENT = $('#CONTENT').val();
    editorCONTENT = K.create('textarea[name="CONTENT"]', {
        cssPath : ctxPath + '/static/plugin/h-ui/lib/kindeditor/plugins/code/prettify.css',
        uploadJson : ctxPath + '/admin/kindfile/upload',
        fileManagerJson : ctxPath + '/admin/kindfile/manager',
        allowFileManager : true,
        width:"100%"
    });
    prettyPrint();
    KE.text("CONTENT", editorContentCONTENT);
});
$(function () {
    $("input[type=file]").change(function(){$(this).parents(".sp-uploader").find(".sp-filename").val($(this).val());});
    $("input[type=file]").each(function(){
        if($(this).val()==""){$(this).parents(".sp-uploader").find(".sp-filename").val("请选择文件");}
    });
    $("#form").validate({
        rules:{
        TITLE:{
                required:true,
            },
        SUBTITLE:{
            },
        IMGURL:{
            },
        NEWSTYPE:{
                required:true,
            },
        MSORT:{
                isInteger:true,
            },
        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function(form){
            if($('#NEWSTYPE').val() == "" || $('#NEWSTYPE').val() == null){
                showError("新闻分类不能为空！");
                return false;
            }
            editorCONTENT.sync();
            if($('#CONTENT').val() == "" || $('#CONTENT').val() == null){
            showError("内容不能为空！");
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
    $('#NEWSTYPE').chosen({
    no_results_text: "没有找到结果！",//搜索无结果时显示的提示
    search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
    allow_single_deselect:true
    });
});