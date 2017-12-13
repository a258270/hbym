<!DOCTYPE html>
<html>
<head lang="en">
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
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/take_photo/takephoto.js?v=${v}"></script>
</head>
<script language="JavaScript">
    $(function () {
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
    <form action="${ctxPath}/plant/teacher/api/upload_image" method="post" class="form form-horizontal" id="form">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图片标题：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入图片标题" id="TITLE" name="TITLE">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>上传图片：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <div id="preview_IMGURL">
                    <img id="imghead_IMGURL" border="0" src="${ctxPath}/static/ymplant/img/timg.png" width="150" height="150" onclick="$('#IMGURL').click();">
                </div>
                <input type="file" onchange="previewImage(this, 150, 150)" style="display: none;" id="IMGURL" name="IMGURL">
                <input type="button" class="btn btn-primary radius" width="90" height="90" onclick="$('#IMGURL').click();" value="选择图片">
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