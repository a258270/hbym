<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/center.css"/>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/center.css"/>

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

    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/video/js/video.min.js?v=${v}"></script>
    <link rel="stylesheet" type="text/css" href="${ctxPath}/static/plugin/h-ui/lib/video/css/video-js.css?v=${v}" />
</head>
<script language="JavaScript">
    var editorSUMMARY;
    var editorContentSUMMARY;
    KindEditor.ready(function(K) {
        editorContentSUMMARY = $('#SUMMARY').val();
        editorSUMMARY = K.create('textarea[name="SUMMARY"]', {
            cssPath : ctxPath + '/static/plugin/h-ui/lib/kindeditor/plugins/code/prettify.css',
            uploadJson : ctxPath + '/admin/kindfile/upload',
            fileManagerJson : ctxPath + '/admin/kindfile/manager',
            allowFileManager : true,
            width:"100%"
        });
        prettyPrint();
        editorSUMMARY.text(editorContentSUMMARY);
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
                var loader = layer.load(0);
                $(form).ajaxSubmit(function (res) {
                    layer.close(loader);
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
    <form action="${ctxPath}/plant/teacher/api/edit_video/${video.VIDEO_ID}" method="post" class="form form-horizontal" id="form">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>视频标题：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${video.TITLE}" placeholder="请输入视频标题" id="TITLE" name="TITLE">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>视频文件：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <#--<video id="my-video" class="video-js" controls preload="auto" width="400" height="400" data-setup="{}">
                    <source src="${video.URL}" type="video/mp4">
                </video>-->
                    <video src="${video.URL}" width="550" height="400" autostart="false" loop="true" controls="controls" preload="">
                        您的浏览器不支持视频播放
                    </video>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>简介：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea id="SUMMARY" name="SUMMARY" class="textarea" cols="100" rows="8">${video.SUMMARY}</textarea>
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