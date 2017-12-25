<!DOCTYPE html>
<html>
<head>
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/center.css?v=${v}"/>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/center.css?v=${v}"/>

    <link rel="stylesheet" type="text/css" href="${ctxPath}/static/plugin/h-ui/h-ui/css/H-ui.min.css?v=${v}" />
    <link rel="stylesheet" type="text/css" href="${ctxPath}/static/plugin/h-ui/h-ui.admin/css/H-ui.admin.css?v=${v}" />
    <link rel="stylesheet" type="text/css" href="${ctxPath}/static/plugin/h-ui/lib/Hui-iconfont/1.0.8/iconfont.css?v=${v}" />
    <link rel="stylesheet" type="text/css" href="${ctxPath}/static/plugin/h-ui/h-ui.admin/skin/default/skin.css?v=${v}" id="skin" />
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/kindeditor/kindeditor-all-min.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/kindeditor/lang/zh-CN.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/kindeditor/plugins/code/prettify.js?v=${v}"></script>
    <link rel="stylesheet" type="text/css" href="${ctxPath}/static/plugin/h-ui/lib/kindeditor/themes/default/default.css?v=${v}" />
    <link rel="stylesheet" type="text/css" href="${ctxPath}/static/plugin/h-ui/lib/kindeditor/plugins/code/prettify.css?v=${v}" />
    <link rel="stylesheet" type="text/css" href="${ctxPath}/static/plugin/h-ui/lib/simpleuploader/simpleuploader.css?v=${v}" />
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/layer/2.4/layer.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/h-ui/js/H-ui.min.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/h-ui.admin/js/H-ui.admin.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/jquery.tips/jquery.tips.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/jquery.validation/1.14.0/jquery.validate.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/jquery.validation/1.14.0/validate-methods.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/jquery.validation/1.14.0/messages_zh.js?v=${v}"></script>
</head>
<script language="JavaScript">
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
                MSORT:{
                    isInteger:true,
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
                $(form).ajaxSubmit(function (res) {
                    if(res.hasErrors){
                        showError(res.errorMessage);
                        return false;
                    }

                    var index = parent.layer.getFrameIndex(window.name);
                    parent.getDatas();
                    parent.layer.close(index);
                });
            }
        });
    });
</script>
<body class="corresponding">
<#--<div class="lan" style="height: 100%">
    <p>视频上传</p>
    <form action="${ctxPath}/admin/menu/api/add" method="post" class="form form-horizontal" id="form">
</div>-->

<article class="page-container">
    <form action="${ctxPath}/admin/school/api/addarticle" method="post" enctype="multipart/form-data" class="form form-horizontal" id="form">
        <input type="hidden" name="SCHOOL_ID" value="" />
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>标题：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入标题" id="TITLE" name="TITLE">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">副标题：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入副标题" id="SUBTITLE" name="SUBTITLE">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">封面图片：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <div class=" sp-uploader sp-blue">
                    <input type="text" class="sp-filename" readonly/>
                    <input type="button" class="sp-button" value="选择文件"/>
                    <input type="file" name="IMGURL" size="1"/>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">排序序号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入排序序号" id="MSORT" name="MSORT">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>内容：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea id="CONTENT" name="CONTENT" class="textarea" cols="100" rows="8"></textarea>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit" value="提交">
            </div>
        </div>
    </form>
</article>
</body>
</html>