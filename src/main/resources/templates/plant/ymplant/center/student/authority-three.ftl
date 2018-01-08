<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/center.css?v=${v}"/>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/center.css?v=${v}"/>
    <link rel="stylesheet" href="/static/plugin/h-ui/lib/chosen.jquery/chosen.min.css?v=${v}"/>
    <script src="/static/plugin/h-ui/lib/chosen.jquery/chosen.jquery.min.js?v=${v}"></script>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/student/belongings.css?v=${v}"/>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/drag/drag.css?v=${v}"/>
    <script src="${ctxPath}/static/ymplant/js/drag/drag.js?v=${v}"></script>
</head>
<body class="corresponding">
<div class="lan" style="height: 100%">
    <p>账户权限</p>
    <div class="zxng">
        <div style="font-weight: bold;margin-bottom: 20px;">
            尊敬的<span style="color:#FFC90E;"> <#if Session.session_user_key?? && Session.session_user_key.OVERDUETIME?? && Session.session_user_key.CARD_PURPOSE=='UB'>黄金会员<#else><#if Session.session_user_key?? && Session.session_user_key.OVERDUETIME?? && Session.session_user_key.CARD_PURPOSE=='UC'>黑卡会员<#else><#if Session.session_user_key?? && Session.session_user_key.OVERDUETIME?? && Session.session_user_key.CARD_PURPOSE=='UA'>白银会员<#else>普通会员</#if></#if></#if> </span>，您可享受到如下服务：
        </div>
        <div class="row" style="padding: 10px 15px;margin-bottom: 10px;">
            <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: center">
                <img src="/static/ymplant/images/tubiao2/9-1.png" style="width: 70%;height: 70%" alt=""/>
                <div style="color:#BC7A76;font-weight: bold">模拟填报</div>
            </div>
            <div class="col-md-10 col-sm-10 col-xs-10">
                <div style="padding: 5px;color:#22B14C;font-weight: bold;line-height: 2">
                    模拟真实的志愿填报系统，根据历史大数据+本平台独有的智能算法，帮您分析出您所心仪的志愿录取成功率。
                </div>
            </div>
        </div>
        <div class="row" style="padding: 10px 15px;margin-bottom: 10px;">
            <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: center">
                <img src="/static/ymplant/images/tubiao2/9-2.png" style="width: 70%;height: 70%" alt=""/>
                <div style="color:#BC7A76;font-weight: bold">智能推荐</div>
            </div>
            <div class="col-md-10 col-sm-10 col-xs-10">
                <div style="padding: 5px;color:#22B14C;font-weight: bold;line-height: 2">
                    根据您的综合指标，在多条件下通过平台自主研发的智能志愿推荐系统，给您推荐出最适合您的专业与院校，在不浪费分数，选择喜欢的专业前提下，保证您的录取成功率。
                </div>
            </div>
        </div>
        <div class="row" style="padding: 10px 15px;margin-bottom: 10px;">
            <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: center">
                <img src="/static/ymplant/images/tubiao2/9-3.png" style="width: 70%;height: 70%" alt=""/>
                <div style="color:#BC7A76;font-weight: bold">院校咨询</div>
            </div>
            <div class="col-md-10 col-sm-10 col-xs-10">
                <div style="padding: 5px;color:#22B14C;font-weight: bold;line-height: 2">
                    上百所大学院校招生办公室老师入驻平台，为您答疑解惑，帮您解答本校招生政策，学校环境，师资力量等等您最关心的问题。
                </div>
            </div>
        </div>
        <div class="row" style="padding: 10px 15px;margin-bottom: 10px;">
            <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: center">
                <img src="/static/ymplant/images/tubiao2/9-4.png" style="width: 70%;height: 70%" alt=""/>
                <div style="color:#BC7A76;font-weight: bold">专家咨询</div>
            </div>
            <div class="col-md-10 col-sm-10 col-xs-10">
                <div style="padding: 5px;color:#22B14C;font-weight: bold;line-height: 2">
                    数十位多年从事高考志愿规划的专家入驻平台，为您层层把关，保证您顺利进入自己喜欢的学校，选择到自己喜欢的专业。
                </div>
            </div>
        </div>
        <div class="row" style="padding: 10px 15px;margin-bottom: 10px;">
            <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: center">
                <img src="/static/ymplant/images/tubiao2/9-5.png" style="width: 70%;height: 70%" alt=""/>
                <div style="color:#BC7A76;font-weight: bold">百校问答</div>
            </div>
            <div class="col-md-10 col-sm-10 col-xs-10">
                <div style="padding: 5px;color:#22B14C;font-weight: bold;line-height: 2">
                    上千位一线教师为您答疑解惑，通过问题悬赏帮您快速准确地解决您所关心的问题。
                </div>
            </div>
        </div>
        <div class="row" style="padding: 10px 15px;margin-bottom: 10px;">
            <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: center">
                <img src="/static/ymplant/images/tubiao2/9-6.png" style="width: 70%;height: 70%" alt=""/>
                <div style="color:#BC7A76;font-weight: bold">性格测试</div>
            </div>
            <div class="col-md-10 col-sm-10 col-xs-10">
                <div style="padding: 5px;color:#22B14C;font-weight: bold;line-height: 2">
                    通过专业测评，帮您准确定位您的个人才华，推荐出最适合您的专业与未来的发展方向。
                </div>
            </div>
        </div>
        <div class="row" style="padding: 10px 15px;margin-bottom: 10px;">
            <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: center">
                <img src="/static/ymplant/images/tubiao2/9-7.png" style="width: 70%;height: 70%" alt=""/>
                <div style="color:#BC7A76;font-weight: bold">无限视频</div>
            </div>
            <div class="col-md-10 col-sm-10 col-xs-10">
                <div style="padding: 5px;color:#22B14C;font-weight: bold;line-height: 2">
                    无限制观看平台特邀高考志愿填报专家，职业生涯规划专家，大学招办老师等录制的各类音视频资源。帮助您顺利入学的同事更加精准的完成自己的职业生涯规划。
                </div>
            </div>
        </div>
        <div class="row" style="padding: 10px 15px;margin-bottom: 10px;">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div style="font-size: 30px;color:#22B14C;font-weight: bold;text-align: center;">更多精品功能，敬请期待！</div>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div style="font-size: 10px;line-height: 3;text-align: center;">（注：部分功能暂时内测阶段暂未开放，请您谅解。）</div>
            </div>
        </div>
    </div>
</div>
<script language="JavaScript">
    $(function () {
        parent.layer.close(parent.loader);
    });
</script>
</body>
</html>