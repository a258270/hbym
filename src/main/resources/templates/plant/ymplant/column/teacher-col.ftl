<!DOCTYPE html>
<html>
<head lang="en">
    !-- 公共引入 -->
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
            <div class="col-md-2 col-xs-2 zbl">
                <div class="kd-zxin">
                    个人中心
                </div>
                <div class="round">
                    <img src="<#if complete?? && complete.HEADURL??>${complete.HEADURL}<#else>${ctxPath}/static/ymplant/img/timg.png</#if>" style="width: 100%;height: 100%;border-radius: 50%;" alt=""/>
                </div>
                <p class="name"><#if Session?? && Session.session_user_key?? && Session.session_user_key.USERNAME??>${Session.session_user_key.USERNAME}<#else>暂无信息</#if></p>
                <p style="color: #C3C3C3;font-weight: bold">用户类型：教师</p>
                <#--<p style="color: #C3C3C3;font-weight: bold">会员类型：普通会员</p>
                <p style="text-align: center;margin: 15px 0">
                    <input type="button" value="升级黄金会员" class="gol"/>
                </p>-->
                <div class="kd-bkua">
                    <input type="button" class="stration" value="后台管理"/>
                    <img class="xzhu" src="/static/ymplant/images/tubiao/xzhu.png" alt=""/>
                    <div class="kd-jchu">
                        <input class="ster" type="button" value="院校资料" data-href="${ctxPath}/plant/teacher/management"/>
                        <input class="ster" type="button" value="文章管理" data-href="${ctxPath}/plant/teacher/article"/>
                        <input class="ster" type="button" value="图片管理" data-href="${ctxPath}/plant/teacher/picture"/>
                        <input class="ster" type="button" value="视频管理" data-href="${ctxPath}/plant/teacher/video"/>
                    </div>
                </div>
                <div class="kd-bkua">
                    <input type="button" class="stration" value="个人资料"/>
                    <img class="xzhu" src="/static/ymplant/images/tubiao/xzhu.png" alt=""/>
                    <div class="kd-jchu">
                        <input class="ster" type="button" value="基础资料" data-href="${ctxPath}/plant/teacher/basic"/>
                    </div>
                </div>
                <div class="kd-bkua">
                    <input type="button" class="stration" value="账户信息"/>
                    <img class="xzhu" src="/static/ymplant/images/tubiao/xzhu.png" alt=""/>
                    <div class="kd-jchu">
                        <input class="ster" type="button" value="我的物品"/>
                        <input class="ster" type="button" value="账户安全" data-href="${ctxPath}/plant/user/account"/>
                        <#--<input type="button" value="账户权限"/>-->
                    </div>
                </div>
                <div class="kd-bkua">
                    <input type="button" class="stration" value="信息中心"/>
                    <img class="xzhu" src="/static/ymplant/images/tubiao/xzhu.png" alt=""/>
                    <div class="kd-jchu">
                        <input class="ster" type="button" value="联系人" data-href="${ctxPath}/plant/teacher/person"/>
                        <#--<input type="button" value="消息记录"/>-->
                    </div>
                </div>
            </div>
            <!--左边栏 结束-->
            <div class="col-md-10 col-xs-10">

                <iframe id="information" scrolling="no" name="information" src="${ctxPath}/plant/user/basicinfo" frameborder="0" onload="iFrameHeight()" style="width: 100%;">

                </iframe>
            </div>
        </div>
    </div>
</div>
</body>
</html>