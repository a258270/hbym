<!DOCTYPE html>
<html>
<head lang="en">
    <#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/center.css?v=${v}"/>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/center.css?v=${v}"/>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/scbaisc.css?v=${v}"/>
    <script type="text/javascript" src="${ctxPath}/static/plant/user/video/video.js?v=${v}"></script>
</head>
<body class="corresponding">
    <div class="lan" style="height: 100%">
    <p>视频管理</p>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center">
            <img src="/static/ymplant/images/tubiao2/bdsc.png" style="width: 100px;height:100px;" alt=""/>
            <div style="margin: 30px 0;">
                <input class="upload" type="button" onclick="showWindow('上传视频', '${ctxPath}/plant/teacher/upload_video', $(window).width() * 0.875, $(window).height() * 0.875);" value="上传视频"/>
            </div>
        </div>
        <#--<div class="col-md-6 col-sm-6 col-xs-6" style="text-align: center">
            <img src="/static/ymplant/images/tubiao2/wlsc.png" style="width: 100px;height:100px;" alt=""/>
            <div style="margin: 30px 0;">
                <input class="upload" type="button" value="网络视频"/>
            </div>
        </div>-->
        <div class="col-md-6 col-sm-6 col-xs-6">
            <input class="kd-schu" type="button" value="批量删除" onclick="batchDelete();">
        </div>
        <#--<div class="col-md-6 col-sm-6 col-xs-6" style="text-align: right">
            <select style="padding: 5px;">
                <option value="">上传时间（从新到旧）</option>
                <option value="">观看次数（从多到少）</option>
                <option value="">观看次数（从少到多）</option>
                <option value="">全部视频</option>
                <option value="">已发布</option>
                <option value="">未发布</option>
            </select>
        </div>-->
    </div>
    <div class="row jtu">
        <div class="col-md-1 col-sm-1 col-xs-1" style="text-align: center;">
            <input type='checkbox' id="reverse" value="全选"/>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: center;">
            标题
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: center;">
            上传时间
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: center;">
            状态
        </div>
        <div class="col-md-1 col-sm-1 col-xs-1" style="text-align: center;">
            浏览量
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: center;">
            操作
        </div>
    </div>
    <div id="page"></div>

    <!--分页 开始-->
    <nav style="text-align: center">
        <div id="pagination" class="page fl"></div>
    </nav>
    <!--分页 结束-->
</div>
</body>
</html>