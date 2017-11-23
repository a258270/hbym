<div class="topcontainer">
<script language="JavaScript">
    if (window != top) {top.location.href = location.href;}
</script>
<div class="kd-syse">
    <div class="container">
        <div class="row">
            <div style="padding: 5px 5px 5px 15px" class="col-md-5 col-sm-5 col-xs-5">
                <div style="font-size: 10px">
                    <img src="/static/ymplant/img/slogan.png" style="height: 20px;" alt="">
                    <span class="colleges">
                        <span>我是高校丨我是专家</span>
                    </span>
                </div>
                <div class="colleges">

                </div>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-3">
                <form action="${ctxPath}/plant/news/search" method="post">
                    <input type="text" class="sou" name="CONTENT" placeholder="搜索从这里开始...">
                <#--<input class="suo" type="submit" value="">-->
                <#--<i class="glyphicon glyphicon-search kd-ydong"></i>-->
                    <button class="suo" type="submit">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </form>

            </div>
            <div class="col-md-2 col-sm-2 col-xs-2">
                <a href="#" class="tbi">
                    <img src="${ctxPath}/static/ymplant/img/sye/s.1.png" alt=""/>
                    <span>手机APP</span>
                </a>
                <span class="tbi">
                    <img src="${ctxPath}/static/ymplant/img/sye/s.2.png" alt=""/>
                    <span>微信</span>
                    <div class="qrcode">
                        <img src="${ctxPath}/static/ymplant/images/tubiao4/qrcode.jpg" alt="">
                        <p>请打开手机微信，扫一扫</p>
                    </div>
                </span>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2">
                <ul class="row">
                    <li class="col-md-12 col-sm-12 col-xs-12 disp">
                    <#if Session.session_user_key?? && Session.session_user_key.USERNAME??>
                        <div class="kd-dbut">
                            <img src="<#if Session.session_complete_key?? && Session.session_complete_key.HEADURL??>${Session.session_complete_key.HEADURL}<#else>/static/ymplant/img/timg.png</#if>" style="width: 40px;height:40px;border-radius: 50%" alt=""/>
                            <span class="badge kd-ydx">0</span>
                        </div>
                        <ul class="eject row">
                            <li class="col-md-4 col-sm-4 col-xs-4">
                                <a href="<#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'>${ctxPath}/plant/user/center</#if><#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'm9bxdt9g36'>${ctxPath}/plant/teacher/center</#if>">
                                    <img src="<#if Session.session_complete_key?? && Session.session_complete_key.HEADURL??>${Session.session_complete_key.HEADURL}<#else>/static/ymplant/img/timg.png</#if>" style="width: 50px;height: 50px;border-radius: 50%" alt=""/>
                                </a>
                            </li>
                            <li class="col-md-8 col-sm-8 col-xs-8">
                                <a style="color:#333;" href="<#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'>${ctxPath}/plant/user/center</#if><#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'm9bxdt9g36'>${ctxPath}/plant/teacher/center</#if>">
                                    <p style="margin-bottom: 5px;font-weight: bold;"><#if Session.session_complete_key?? && Session.session_complete_key.NICKNAME??>${Session.session_complete_key.NICKNAME}<#else>暂无</#if></p>
                                </a>
                                <a href="${ctxPath}/plant/user/center?p=authority">
                                    <input class="ordinary" type="button" style="font-size: 10px;background-color:<#if Session.session_user_key?? && Session.session_user_key.OVERDUETIME??>#FE7F2A;<#else>#2DC473;</#if>" value="<#if Session.session_user_key?? && Session.session_user_key.OVERDUETIME??>黄金会员<#else>普通会员</#if>"/>
                                </a>
                            </li>
                        <#--<#if Session.session_user_key?? && !Session.session_user_key.OVERDUETIME?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'>
                        <li class="col-md-12 col-sm-12 col-xs-12"  style="margin-top: 20px">
                            <a class="gold" href="javascript:void(0);" style="text-decoration: none;">升级黄金会员</a>
                        </li>
                        </#if>-->
                            <li class="col-md-12 col-sm-12 col-xs-12">
                                <a class="goldw" style="text-decoration: none;margin-top: 20px;" href="<#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'>${ctxPath}/plant/user/center</#if><#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'm9bxdt9g36'>${ctxPath}/plant/teacher/center</#if>">个人中心</a>
                            </li>
                            <li class="col-md-12 col-sm-12 col-xs-12">
                                <#if Session.session_user_key?? && Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'm9bxdt9g36'><a class="goldwt" href="${ctxPath}/plant/teacher/search">学生库</a></#if>
                            </li>
                            <li class="col-md-12 col-sm-12 col-xs-12">
                                <#if Session.session_user_key?? && Session.session_user_key.USER_ID??><a class="goldwt" href="${ctxPath}/plant/message/index">消息(<span id="msgcount">0</span>)</a></#if>
                            </li>
                            <li class="col-md-12 col-sm-12 col-xs-12">
                                <a class="goldwt" href="${ctxPath}/plant/api/toexit">安全退出</a>
                            </li>
                        </ul>
                    <#else>
                        <div style="padding-top: 5px;">
                            <ul class="kd-userinfo">
                                <li class="c1" style="margin:0;">
                                    <a class="btn btn-lg" data-toggle="modal" data-target="#myModala">
                                        注册
                                    </a>
                                    <span style="color: #fff">丨</span>
                                    <div class="modal fade" id="myModala" tabindex="-1" role="dialog">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content" style="width: 500px;">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                                                    <h2>学生注册</h2>
                                                    <!--<h4 class="modal-title" id="myModalLabel">Modal title</h4>-->
                                                </div>
                                                <form>
                                                    <p>
                                                        <i class="glyphicon glyphicon-user huahao">
                                                            <input class="kd-kdu" type="text" placeholder="请输入用户名" name="USERNAME" id="REG_USERNAME"/>
                                                        </i>
                                                    </p>
                                                    <p>
                                                        <i class="glyphicon glyphicon-earphone huahao">
                                                            <input class="kd-kdu" type="text" placeholder="请输入手机号码" name="PHONE" id="REG_PHONE"/>
                                                        </i>
                                                    </p>
                                                    <p>
                                                        <i class="glyphicon glyphicon-envelope huahao">
                                                            <input class="kd-kdu" type="text" placeholder="请输入验证码" style="width: 61%;" name="CODE" id="REG_CODE"/>
                                                            <input type="button" value="获取验证码" class="kd-hqu" id="codeBtnTop" onclick="getSMSCodeTop();"/>
                                                            <input type="button" class="kd-hqu" style="display: none;"id="afterBtnTop" value="60秒后重试" />
                                                        </i>
                                                    </p>
                                                    <p>
                                                        <i class="glyphicon glyphicon-lock huahao">
                                                            <input class="kd-kdu" type="password" placeholder="请输入密码" name="PASSWORD" id="REG_PASSWORD"/>
                                                        </i>
                                                    </p>
                                                    <p>
                                                        <i class="glyphicon glyphicon-lock huahao">
                                                            <input class="kd-kdu" type="password" placeholder="再次输入密码" name="REPASSWORD" id="REG_REPASSWORD"/>
                                                        </i>
                                                    </p>
                                                    <p style="font-size: 11px;margin-bottom: 15px;">
                                                        <input type="checkbox" id="agreebox">我已阅读并同意遵守
                                                        <a href="${ctxPath}/plant/clause" target="_blank">《${baseSetting.title}会员服务条款》</a>
                                                    </p>
                                                    <p class="wangjimima" style="text-align: center">
                                                        <input type="button" value="立即注册" id="regBtn" class="queren"/>
                                                    </p>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                                <li class="c1" style="margin: 0">
                                    <a class="btn btn-lg" data-toggle="modal" data-target="#myModal">
                                        登录
                                    </a>

                                    <!-- Modal -->
                                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content" style="width: 500px;">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h2>欢迎登陆</h2>
                                                    <!--<h4 class="modal-title" id="myModalLabel">Modal title</h4>-->
                                                </div>
                                                <form action="${ctxPath}/plant/api/tologin" method="post" id="logForm">
                                                    <p style="margin: 0 auto;width: 300px;">
                                                        <i class="glyphicon glyphicon-user huahao">
                                                            <input class="kd-kdu" type="text" placeholder="请输入用户名/手机号" name="USERNAME" id="LOG_USERNAME"/>
                                                        </i>
                                                    </p>
                                                    <p style="margin: 0 auto;width: 300px;">
                                                        <i class="glyphicon glyphicon-lock huahao">
                                                            <input class="kd-kdu" type="password" placeholder="请输入密码" name="PASSWORD" id="LOG_PASSWORD"/>
                                                        </i>
                                                    </p>
                                                <#--滑动验证 开始-->
                                                    <div style=" margin-bottom:30px;">
                                                        <div id="drag" style="margin: 0 auto"></div></div>
                                                    <script type="text/javascript">
                                                        $('#drag').drag();
                                                    </script>
                                                <#--滑动验证 结束-->
                                                    <p class="wangjimima" style="text-align: center">
                                                        <a href="${ctxPath}/plant/user/forget" class="queren">忘记密码？</a>
                                                        <input type="button" value="确 定" id="logBtn" class="queren"/>
                                                    </p>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </#if>
                    </li>
                </ul>
            </div>
            <div class="col-md-5 col-sm-5 col-xs-5" style="margin: -10px;padding-left: 25px;">
                <p class="plan"><img src="${ctxPath}/static/ymplant/images/logo.png" style="height: 100%; width: auto;" /></p>
            </div>
            <div class="col-md-7 col-sm-7 col-xs-7" style="padding: 15px;margin: -10px;">
                <ul class="gation">
                    <li class="nal">
                        <a class="colour<#if curPage?? && curPage == 'index'> nav-active</#if>" href="/">网站首页</a>
                    </li>
                    <li class="nalism">
                        <a class="bse colour<#if curPage?? && curPage == 'report'> nav-active</#if>" href="javascript:void (0);">模拟填报</a>
                        <ul class="notice">
                            <li>
                                <a href="<#if !Session.session_user_key??>javascript:showError('请先登录账号');<#else><#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'><#if Session.session_user_key.OVERDUETIME??>${ctxPath}/plant/report/report<#else>javascript:showError('您当前不是黄金会员，点击确定前往激活页面', 'authority');</#if><#else>javascript:showError('请确认账号为学生身份');</#if></#if>">模拟填报</a>
                            </li>
                            <li>
                                <a href="<#if !Session.session_user_key??>javascript:showError('请先登录账号');<#else><#if Session.session_user_key.ROLE_ID?? && Session.session_user_key.ROLE_ID == 'sja4gc59bg'><#if Session.session_user_key.OVERDUETIME??>${ctxPath}/plant/report/index<#else>javascript:showError('您当前不是黄金会员，点击确定前往激活页面', 'authority');</#if><#else>javascript:showError('请确认账号为学生身份');</#if></#if>">智能推荐</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nal">
                        <a class="colour<#if curPage?? && curPage == 'online'> nav-active</#if>" href="${ctxPath}/plant/school/online">院校咨询</a>
                    </li>
                    <li class="nal">
                        <a class="colour<#if curPage?? && curPage == 'pertde'> nav-active</#if>" href="javascript:void(0);">名师指导</a>
                    <#--${ctxPath}/plant/expert/index-->
                    </li>
                    <li class="nalism">
                        <a class="bse colour<#if curPage?? && curPage == 'library'> nav-active</#if>" href="javascript:void (0);">信息库</a>
                        <ul class="notice">
                            <li>
                                <a class="colour" href="${ctxPath}/plant/school/library">院校库</a>
                            </li>
                            <li>
                                <a class="colour" href="${ctxPath}/plant/major/index">专业库</a>
                            </li>
                        </ul>
                    </li>
                    <!--<li class="nalism">-->
                    <!--新闻中心-->
                    <!--<ul class="notice">-->
                    <!--<li>-->
                    <!--<a href="#"></a>-->
                    <!--</li>-->
                    <!--</ul>-->
                    <!--</li>-->
                <#--<li class="nalism left">
                    新闻中心
                    <ul class="notice">
                        <li>
                            <a href="#">公告</a>
                        </li>
                        <li>
                            <a href="#">高考动态</a>
                        </li>
                        <li>
                            <a href="#">往届活动</a>
                        </li>
                    </ul>
                </li>-->
                    <li class="nal">
                        <a class="colour<#if curPage?? && curPage == 'news'> nav-active</#if>" href="${ctxPath}/plant/news/core">新闻中心</a>
                    </li>
                    <div class="clear"></div>
                </ul>
            </div>
        </div>
    </div>
</div>