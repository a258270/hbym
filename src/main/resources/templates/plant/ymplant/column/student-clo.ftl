<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/column.css?v=${v}"/>
<script language="JavaScript" src="${ctxPath}/static/ymplant/js/center/center.js?v=${v}"></script>
    <script>
        $(document).ready(function(){
            $(".stration").click(function(){
                $(this).parent().children(".kd-jchu").toggle();
                $(this).parent().children(".stration").toggleClass("red");
            });
        })
    </script>
    <style>
        .red{
            border-right: 3px solid #88BFE6;
        }
    </style>
</head>
<body>
<div id="personal">
    <div class="container">
        <div class="row">
            <!--左边栏 开始-->
            <div class="col-md-3 col-sm-3 col-xs-3 zbl">
                <div class="kd-zxin">
                    个人中心
                </div>
                <div class="round">
                    <img src="<#if completeInfo?? && completeInfo.HEADURL??>${completeInfo.HEADURL}<#else>/static/ymplant/img/timg.png</#if>" style="width: 100%;height: 100%;border-radius: 50%;" alt=""/>
                </div>
                <p class="name"><#if Session.session_user_key?? && Session.session_user_key.USERNAME??>${Session.session_user_key.USERNAME}<#else>暂无</#if></p>
                <p style="color: #C3C3C3;font-weight: bold">用户类型：学生</p>
                <p style="color: #C3C3C3;font-weight: bold">会员类型：普通会员</p>
                <p style="text-align: center;margin: 15px 0">
                    <input type="button" value="升级黄金会员" class="gol"/>
                </p>
                <div class="kd-bkua">
                    <input type="button" class="stration" value="个人资料"/>
                    <img class="xzhu" src="/static/ymplant/images/tubiao/xzhu.png" alt=""/>
                    <div class="kd-jchu">
                        <input class="ster" type="button" data-href="${ctxPath}/plant/user/basicinfo" value="基础信息"/>
                        <input class="ster" type="button" value="考生信息" data-href="${ctxPath}/plant/user/examinee"/>
                    </div>
                </div>
                <div class="kd-bkua">
                    <input type="button" class="stration" value="账户信息"/>
                    <img class="xzhu" src="/static/ymplant/images/tubiao/xzhu.png" alt=""/>
                    <div class="kd-jchu">
                        <input type="button" class="ster" value="我的物品" data-href="${ctxPath}/plant/user/pocket"/>
                        <input type="button" class="ster" value="账户安全" data-href="${ctxPath}/plant/user/account"/>
                        <input type="button" value="账户权限"/>
                    </div>
                </div>
                <#--<div class="kd-bkua">
                    <input type="button" class="stration" value="信息中心"/>
                    <img class="xzhu" src="/static/ymplant/images/tubiao/xzhu.png" alt=""/>
                    <div class="kd-jchu">
                        <input type="button" value="联系人"/>
                        <input type="button" value="消息记录"/>
                        <input type="button" value="模拟填报历史信息"/>
                        <input type="button" value="志愿推荐历史信息"/>
                        <input type="button" value="院校咨询历史信息"/>
                        <input type="button" value="订单查询"/>
                    </div>
                </div>
                <div class="kd-bkua">
                    <input type="button" class="stration" value="收藏管理"/>
                    <img class="xzhu" src="/static/ymplant/images/tubiao/xzhu.png" alt=""/>
                    <div class="kd-jchu">
                        <input type="button" value="收藏院校"/>
                        <input type="button" value="收藏专家"/>
                    </div>
                </div>
                <div class="kd-bkua">
                    <input type="button" class="stration" value="评价管理"/>
                    <img class="xzhu" src="/static/ymplant/images/tubiao/xzhu.png" alt=""/>
                    <div class="kd-jchu">
                        <input type="button" value="评价院校"/>
                    </div>
                </div>-->
            </div>
            <!--左边栏 结束-->
            <div class="col-md-9 col-sm-9 col-xs-9">

                <!--<iframe id="information-teacher" scrolling="no" name="information" src="" frameborder="0" onload="iFrameHeight()" style="width: 100%;" height="150">-->

                <!--</iframe>-->
            </div>
        </div>
    </div>
</div>
</body>
</html>