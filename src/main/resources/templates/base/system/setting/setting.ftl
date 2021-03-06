<!DOCTYPE html>
<html>
<head>
<#include "${ctxPath}/base/include/head.ftl" />
<#include "${ctxPath}/base/include/jurisdiction.ftl" />
    <!-- 页面独有文件 -->
    <script type="text/javascript" src="${ctxPath}/static/base/js/setting/setting.js?v=${v}"></script>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span> 系统设置 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<article class="page-container">
    <form action="${ctxPath}/admin/setting/api/edit" method="post" class="form form-horizontal" id="form">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>系统名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${baseSetting.title}" placeholder="请输入系统名称" id="title" name="title">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>即时通讯端口：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${baseSetting.messageport?c}" placeholder="请输入即时通讯端口" id="messageport" name="messageport">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>默认分页数量：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${baseSetting.pageNumber?c}" placeholder="请输入默认分页数量" id="pageNumber" name="pageNumber">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>院校标志路径：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${baseSetting.sc_head}" placeholder="请输入院校标志路径" id="sc_head" name="sc_head">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>富文本文件路径：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${baseSetting.kindfile_path}" placeholder="请输入富文本文件路径" id="kindfile_path" name="kindfile_path">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>文件上传路径：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${baseSetting.upload_path}" placeholder="请输入文件上传路径" id="upload_path" name="upload_path">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>院校视频路径：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${baseSetting.scvideo_path}" placeholder="请输入院校视频路径" id="scvideo_path" name="scvideo_path">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>院校图片路径：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${baseSetting.scimage_path}" placeholder="请输入院校图片路径" id="scimage_path" name="scimage_path">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系电话：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${baseSetting.phone}" placeholder="请输入联系电话" id="phone" name="phone">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${baseSetting.email}" placeholder="请输入邮箱" id="email" name="email">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${baseSetting.address}" placeholder="请输入地址" id="address" name="address">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>关于我们：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea id="aboutus" name="aboutus" class="textarea" cols="100" rows="8">${baseSetting.aboutus}</textarea>
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