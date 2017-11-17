<!DOCTYPE html>
<html lang="en">
<head>
<#include "${ctxPath}/base/include/head.ftl">
<#include "${ctxPath}/plant/include/head.ftl">
<script src="${ctxPath}/static/plant/include/top.js?v=${v}"></script>
<script src="${ctxPath}/static/plant/user/userinfo_stu.js?v=${v}"></script>
</head>
<body>
<#include "${ctxPath}/plant/include/top.ftl">
<!--// Sub Header //-->
<div class="kd-subheader">
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="subheader-info">
                    <h1>个人中心</h1>
                    <!-- <p>Morbi euismod euismod consectetur. Donec pharetra, lacus at convallis maximus, arcu quam accumsan diam, et aliquam odio elit gravida mi</p> -->
                </div>
                <div class="kd-breadcrumb">
                    <ul>
                        <li><a href="院校咨询.html">院校咨询</a></li>
                        <li><a href="模拟填报.html">模拟填报</a></li>
                        <li><a href="名师咨询.html">名师咨询</a></li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</div>
<!--// Sub Header //-->

<!--// Content //-->
<div class="kd-content">


    <!--// Page Section //-->
    <section class="kd-pagesection" style=" padding: 30px 0px 0px 0px; margin: 0px 0px 0px 0px; ">
        <div class="container">
            <div class="col-md-9">
                <div class="widget kd-userinfo-widget">
                    <div style="width:300px;float:left;text-align:center">
                        <img src="${ctxPath}/static/plant/plugin/extraimages/team1.jpg" style="width:150px; height:150px; border-radius:50%; overflow:hidden;"/><br/><br/>
                        <button type="button" class="btn btn-info">更换头像</button>
                    </div>
                    <div style="float:left;padding-left:150px">
                        <div class="kd-widget-title"><h2>个人资料</h2><input type="button" name="chongzhi" value="编辑" style="border-radius:6px;width:50px;background-color: #FFFFFF;" onclick="toComplete();"/></div>
                        <p><span>姓名:</span><#if completeInfo?? && completeInfo.NAME??>${completeInfo.NAME}</#if></p>
                        <p><span>性别:</span><#if completeInfo?? && completeInfo.SEX_VALUE??>${completeInfo.SEX_VALUE}</#if></p>
                        <p><span>出生日期:</span><#if completeInfo?? && completeInfo.BIRTHDAY??>${completeInfo.BIRTHDAY}</#if></p>
                        <p><span>文/理:</span><#if completeInfo?? && completeInfo.MAJORTYPE_VALUE??>${completeInfo.MAJORTYPE_VALUE}</#if></p>
                        <p><span>考试地区:</span><#if completeInfo?? && completeInfo.EXAMAREA_VALUE??>${completeInfo.EXAMAREA_VALUE}</#if></p>
                        <p><span>我的成绩:</span><#if completeInfo?? && completeInfo.EXAMSCORE??>${completeInfo.EXAMSCORE}</#if></p>
                        <p><span>身份证号:</span><#if completeInfo?? && completeInfo.IDCARD??>${completeInfo.IDCARD}</#if></p>
                        <p><span>电话:</span><#if completeInfo?? && completeInfo.PHONE??>${completeInfo.PHONE}</#if></p>
                        <p><span>邮箱:</span><#if completeInfo?? && completeInfo.EMAIL??>${completeInfo.EMAIL}</#if></p>
                        <p><span>我的金币:</span><a>300</a><input type="button" name="chongzhi" value="充值" style="border-radius:6px;background-color:#1D95DC;color:#fff;border-color:#1D95DC;width:50px"/></p>
                    </div>

                    <div>
                        <div class="kd-services kd-services-grid">
                            <div class="row">
                                <div style="background-color:#DFF0D8;height:30px">
                                    <caption>
                                        <a style="padding-left:2%;font-size:20px">院校咨询历史信息</a>
                                        <input id="but" type="button" value="点开" onclick="xian('but','but2','tab1')" style="float:right;padding-right:20px"/>
                                        <input id="but2" type="button" value="收起" onclick="yin('but','but2','tab1')" style="float:right;padding-right:20px;display:none"/>
                                    </caption>
                                </div>
                                <div id="tab1" style="display:none">
                                    <table class="table table-hover">
                                        <tr style="background-color:#F5F5F5">
                                            <td>学校名称</td>
                                            <td>咨询时间</td>
                                            <td>咨询人员</td>
                                            <td>操作</td>
                                        </tr>
                                        <tr>
                                            <td>向日葵幼儿园</td>
                                            <td>2017.7.12/12:30:21</td>
                                            <td>王大壮</td>
                                            <td>
                                                <input type="button" name="chongzhi" value="详细" style="border-radius:6px;background-color:#1D95DC;color:#fff;border-color:#1D95DC;width:50px"/>
                                                <input type="button" name="chongzhi" value="再次咨询" style="border-radius:6px;background-color:#1D95DC;color:#fff;border-color:#1D95DC;width:70px"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>向日葵幼儿园</td>
                                            <td>2017.7.12/12:30:21</td>
                                            <td>王大壮</td>
                                            <td>
                                                <input type="button" name="chongzhi" value="详细" style="border-radius:6px;background-color:#1D95DC;color:#fff;border-color:#1D95DC;width:50px"/>
                                                <input type="button" name="chongzhi" value="再次咨询" style="border-radius:6px;background-color:#1D95DC;color:#fff;border-color:#1D95DC;width:70px"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>向日葵幼儿园</td>
                                            <td>2017.7.12/12:30:21</td>
                                            <td>王大壮</td>
                                            <td>
                                                <input type="button" name="chongzhi" value="详细" style="border-radius:6px;background-color:#1D95DC;color:#fff;border-color:#1D95DC;width:50px"/>
                                                <input type="button" name="chongzhi" value="再次咨询" style="border-radius:6px;background-color:#1D95DC;color:#fff;border-color:#1D95DC;width:70px"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>向日葵幼儿园</td>
                                            <td>2017.7.12/12:30:21</td>
                                            <td>王大壮</td>
                                            <td>
                                                <input type="button" name="chongzhi" value="详细" style="border-radius:6px;background-color:#1D95DC;color:#fff;border-color:#1D95DC;width:50px"/>
                                                <input type="button" name="chongzhi" value="再次咨询" style="border-radius:6px;background-color:#1D95DC;color:#fff;border-color:#1D95DC;width:70px"/>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="pagination-wrap">
                                        <div class="pagination">
                                            <a href="#"><i class="fa fa-angle-double-left"></i></a>
                                            <span>1</span>
                                            <a href="#">2</a>
                                            <a href="#">3</a>
                                            <a href="#">4</a>
                                            <a href="#">5</a>
                                            <a href="#">6</a>
                                            <a href="#"><i class="fa fa-angle-double-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="kd-services kd-services-grid">
                            <div class="row">
                                <div  style="background-color:#D9EDF7;height:30px">
                                    <caption>
                                        <a style="padding-left:2%;font-size:20px">专家咨询历史信息</a>
                                        <input id="butzj" type="button" value="点开" onclick="xian('butzj','butzj2','tab2')" style="float:right;padding-right:20px"/>
                                        <input id="butzj2" type="button" value="收起" onclick="yin('butzj','butzj2','tab2')" style="float:right;padding-right:20px;display:none"/>
                                    </caption>
                                </div>
                                <div id="tab2" style="display:none">
                                    <table class="table table-hover">
                                        <tr style="background-color:#F5F5F5">
                                            <td>学校名称</td>
                                            <td>咨询时间</td>
                                            <td>咨询人员</td>
                                            <td>操作</td>
                                        </tr>
                                        <tr>
                                            <td>向日葵幼儿园</td>
                                            <td>2017.7.12/12:30:21</td>
                                            <td>王大壮</td>
                                            <td>
                                                <input type="button" name="chongzhi" value="详细" style="border-radius:6px;background-color:#1D95DC;color:#fff;border-color:#1D95DC;width:50px"/>
                                                <input type="button" name="chongzhi" value="再次咨询" style="border-radius:6px;background-color:#1D95DC;color:#fff;border-color:#1D95DC;width:70px"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>向日葵幼儿园</td>
                                            <td>2017.7.12/12:30:21</td>
                                            <td>王大壮</td>
                                            <td>
                                                <input type="button" name="chongzhi" value="详细" style="border-radius:6px;background-color:#1D95DC;color:#fff;border-color:#1D95DC;width:50px"/>
                                                <input type="button" name="chongzhi" value="再次咨询" style="border-radius:6px;background-color:#1D95DC;color:#fff;border-color:#1D95DC;width:70px"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>向日葵幼儿园</td>
                                            <td>2017.7.12/12:30:21</td>
                                            <td>王大壮</td>
                                            <td>
                                                <input type="button" name="chongzhi" value="详细" style="border-radius:6px;background-color:#1D95DC;color:#fff;border-color:#1D95DC;width:50px"/>
                                                <input type="button" name="chongzhi" value="再次咨询" style="border-radius:6px;background-color:#1D95DC;color:#fff;border-color:#1D95DC;width:70px"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>向日葵幼儿园</td>
                                            <td>2017.7.12/12:30:21</td>
                                            <td>王大壮</td>
                                            <td>
                                                <input type="button" name="chongzhi" value="详细" style="border-radius:6px;background-color:#1D95DC;color:#fff;border-color:#1D95DC;width:50px"/>
                                                <input type="button" name="chongzhi" value="再次咨询" style="border-radius:6px;background-color:#1D95DC;color:#fff;border-color:#1D95DC;width:70px"/>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="pagination-wrap">
                                        <div class="pagination">
                                            <a href="#"><i class="fa fa-angle-double-left"></i></a>
                                            <span>1</span>
                                            <a href="#">2</a>
                                            <a href="#">3</a>
                                            <a href="#">4</a>
                                            <a href="#">5</a>
                                            <a href="#">6</a>
                                            <a href="#"><i class="fa fa-angle-double-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="kd-services kd-services-grid">
                            <div class="row">
                                <div  style="background-color:#DFF0D8;height:30px">
                                    <caption>
                                        <a style="padding-left:2%;font-size:20px">模拟填报志愿历史信息</a>
                                        <input id="butmn" type="button" value="点开" onclick="xian('butmn','butmn2','tab3')" style="float:right;padding-right:20px"/>
                                        <input id="butmn2" type="button" value="收起" onclick="yin('butmn','butmn2','tab3')" style="float:right;padding-right:20px;display:none"/>
                                    </caption>
                                </div>
                                <div id="tab3" style="display:none">
                                    <table class="table table-hover">
                                        <tr style="background-color:#F5F5F5">
                                            <td>概率</td>
                                            <td>院校名称</td>
                                            <td>地区</td>
                                            <td>专业</td>
                                            <td>2017计划招生人数</td>
                                            <td>2016招生人数</td>
                                            <td>志愿顺序</td>
                                        </tr>
                                        <tr>
                                            <td>80%</td>
                                            <td>幸福小学</td>
                                            <td>河北</td>
                                            <td>计算机</td>
                                            <td>未知</td>
                                            <td>100人</td>
                                            <td>志愿A</td>
                                        </tr>
                                        <tr>
                                            <td>80%</td>
                                            <td>幸福小学</td>
                                            <td>河北</td>
                                            <td>计算机</td>
                                            <td>未知</td>
                                            <td>100人</td>
                                            <td>志愿A</td>
                                        </tr>
                                        <tr>
                                            <td>80%</td>
                                            <td>幸福小学</td>
                                            <td>河北</td>
                                            <td>计算机</td>
                                            <td>未知</td>
                                            <td>100人</td>
                                            <td>志愿A</td>
                                        </tr>
                                        <tr>
                                            <td>80%</td>
                                            <td>幸福小学</td>
                                            <td>河北</td>
                                            <td>计算机</td>
                                            <td>未知</td>
                                            <td>100人</td>
                                            <td>志愿A</td>
                                        </tr>
                                        <tr>
                                            <td>80%</td>
                                            <td>幸福小学</td>
                                            <td>河北</td>
                                            <td>计算机</td>
                                            <td>未知</td>
                                            <td>100人</td>
                                            <td>志愿A</td>
                                        </tr>
                                    </table>
                                    <div class="pagination-wrap">
                                        <div class="pagination">
                                            <a href="#"><i class="fa fa-angle-double-left"></i></a>
                                            <span>1</span>
                                            <a href="#">2</a>
                                            <a href="#">3</a>
                                            <a href="#">4</a>
                                            <a href="#">5</a>
                                            <a href="#">6</a>
                                            <a href="#"><i class="fa fa-angle-double-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="kd-services kd-services-grid">
                            <div class="row">
                                <div  style="background-color:#D9EDF7;height:30px">
                                    <caption>
                                        <a style="padding-left:2%;font-size:20px">我的物品</a>
                                        <input id="butwp" type="button" value="点开" onclick="xian('butwp','butwp2','tab4')" style="float:right;padding-right:20px"/>
                                        <input id="butwp2" type="button" value="收起" onclick="yin('butwp','butwp2','tab4')" style="float:right;padding-right:20px;display:none"/>
                                    </caption>
                                </div>
                                <div id="tab4" style="display:none">
                                    <table class="table table-hover">
                                        <tr style="background-color:#F5F5F5">
                                            <td>物品名称</td>
                                            <td>购买时间</td>
                                            <td>单价</td>
                                            <td>数量</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#" style="color:#E7170A">VIP会员（高三版）</a></td>
                                            <td>2017.2.3</td>
                                            <td>300</td>
                                            <td>1张</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#" style="color:#E7170A">VIP会员（高三版）</a></td>
                                            <td>2017.2.3</td>
                                            <td>300</td>
                                            <td>1张</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#" style="color:#E7170A">VIP会员（高三版）</a></td>
                                            <td>2017.2.3</td>
                                            <td>300</td>
                                            <td>1张</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#" style="color:#E7170A">VIP会员（高三版）</a></td>
                                            <td>2017.2.3</td>
                                            <td>300</td>
                                            <td>1张</td>
                                        </tr>
                                    </table>
                                    <div class="pagination-wrap">
                                        <div class="pagination">
                                            <a href="#"><i class="fa fa-angle-double-left"></i></a>
                                            <span>1</span>
                                            <a href="#">2</a>
                                            <a href="#">3</a>
                                            <a href="#">4</a>
                                            <a href="#">5</a>
                                            <a href="#">6</a>
                                            <a href="#"><i class="fa fa-angle-double-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="kd-services kd-services-grid">
                            <div class="row">
                                <div>
                                    <p><h1>专家推荐</h1></p>
                                </div>
                                <article class="col-md-3">
                                    <figure><a href="名师资料.html"><img src="${ctxPath}/static/plant/plugin/extraimages/team2.jpg" alt=""></a></figure>
                                    <div class="kd-serviceinfo">
                                        <h2><a href="名师资料.html">王大锤</a></h2>
                                        <p>个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介</p>
                                        <a href="名师资料.html" class="kd-readmore thbg-colorhover">向他咨询</a>
                                    </div>
                                </article>
                                <article class="col-md-3">
                                    <figure><a href="名师资料.html"><img src="${ctxPath}/static/plant/plugin/extraimages/team3.jpg" alt=""></a></figure>
                                    <div class="kd-serviceinfo">
                                        <h2><a href="名师资料.html">李狗蛋</a></h2>
                                        <p>个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介</p>
                                        <a href="名师资料.html" class="kd-readmore thbg-colorhover">向他咨询</a>
                                    </div>
                                </article>
                                <article class="col-md-3">
                                    <figure><a href="名师资料.html"><img src="${ctxPath}/static/plant/plugin/extraimages/team4.jpg" alt=""></a></figure>
                                    <div class="kd-serviceinfo">
                                        <h2><a href="名师资料.html">张小花</a></h2>
                                        <p>个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介</p>
                                        <a href="名师资料.html" class="kd-readmore thbg-colorhover">向他咨询</a>
                                    </div>
                                </article>
                                <article class="col-md-3">
                                    <figure><a href="名师资料.html"><img src="${ctxPath}/static/plant/plugin/extraimages/team1.jpg" alt=""></a></figure>
                                    <div class="kd-serviceinfo">
                                        <h2><a href="名师资料.html">赵老四</a></h2>
                                        <p>个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介个人简介</p>
                                        <a href="名师资料.html" class="kd-readmore thbg-colorhover">向他咨询</a>
                                    </div>
                                </article>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="widget widget_search">
                    <div class="kd-widget-title"><h2>新闻搜索</h2></div>
                    <form>
                        <input type="text" placeholder="请输入要搜索的内容">
                        <input type="submit" value="">
                        <i class="fa fa-search"></i>
                    </form>
                </div>


                <div class="widget widget-blogpost">
                    <div class="kd-widget-title"><h2>公告</h2></div>
                    <ul>
                        <li>
                            <figure><a href="公告详情.html"><img src="${ctxPath}/static/plant/plugin/extraimages/widget1.jpg" alt=""></a></figure>
                            <div class="kd-post-info">
                                <h6><a href="公告详情.html">第九届咨询会须知</a></h6>
                                <time datetime="2008-02-14 20:00">2017.07.12</time>
                            </div>
                        </li>
                        <li>
                            <figure><a href="公告详情.html"><img src="${ctxPath}/static/plant/plugin/extraimages/widget1.jpg" alt=""></a></figure>
                            <div class="kd-post-info">
                                <h6><a href="公告详情.html">第九届咨询会活动路线</a></h6>
                                <time datetime="2008-02-14 20:00">2017.07.12</time>
                            </div>
                        </li>
                        <li>
                            <figure><a href="公告详情.html"><img src="${ctxPath}/static/plant/plugin/extraimages/widget1.jpg" alt=""></a></figure>
                            <div class="kd-post-info">
                                <h6><a href="公告详情.html">第九届咨询会活动安排</a></h6>
                                <time datetime="2008-02-14 20:00">2017.07.12</time>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="widget widget_categories">
                    <div class="kd-widget-title"><h2>高考资料</h2></div>
                    <ul>
                        <li><a href="#">招生政策</a> (25)</li>
                        <li><a href="#">招生政策</a> (45)</li>
                        <li><a href="#">招生政策</a> (5)</li>
                        <li><a href="#">招生政策</a> (2)</li>
                        <li><a href="#">招生政策</a> (25)</li>
                        <li><a href="#">招生政策</a> (25)</li>
                        <li><a href="#">招生政策</a> (45)</li>
                    </ul>
                </div>

                <div class="widget kd-gallery-widget">
                    <div class="kd-widget-title"><h2>精彩瞬间</h2></div>
                    <ul>
                        <li><a href="往届活动.html"><img src="${ctxPath}/static/plant/plugin/extraimages/widget-gallery1.jpg" alt=""></a></li>
                        <li><a href="往届活动.html"><img src="${ctxPath}/static/plant/plugin/extraimages/widget-gallery2.jpg" alt=""></a></li>
                        <li><a href="往届活动.html"><img src="${ctxPath}/static/plant/plugin/extraimages/widget-gallery3.jpg" alt=""></a></li>
                        <li><a href="往届活动.html"><img src="${ctxPath}/static/plant/plugin/extraimages/widget-gallery5.jpg" alt=""></a></li>
                        <li><a href="往届活动.html"><img src="${ctxPath}/static/plant/plugin/extraimages/widget-gallery6.jpg" alt=""></a></li>
                        <li><a href="往届活动.html"><img src="${ctxPath}/static/plant/plugin/extraimages/widget-gallery2.jpg" alt=""></a></li>
                        <li><a href="往届活动.html"><img src="${ctxPath}/static/plant/plugin/extraimages/widget-gallery3.jpg" alt=""></a></li>
                        <li><a href="往届活动.html"><img src="${ctxPath}/static/plant/plugin/extraimages/widget-gallery5.jpg" alt=""></a></li>
                    </ul>
                </div>
                <div class="widget widget_tag">
                    <div class="kd-widget-title"><h2>活动地点</h2></div>
                    <div class="kd-tag">
                        <a href="#">保定</a>
                        <a href="#">辛集</a>
                        <a href="#">正定</a>
                        <a href="#">枣强</a>
                        <a href="#">邢台</a>
                        <a href="#">沧州</a>
                    </div>
                </div>
            </div>
        </div>
</div>
</section>
<!--// Page Section //-->

</div>
<!--// Content //-->

<!-- Modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="completemodalbox" data-backdrop="static">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">完善个人信息</h4>
                </div>
                <form action="${ctxPath}/plant/user/api/tocomplete" method="post" id="completeForm">
                    <div class="modal-body">
                        <div class="input-group">
                            <span class="input-group-addon" id="sizing-addon2" style="background-color: #FFFFFF;color: #000000">姓名</span>
                            <input type="text" class="form-control" placeholder="请输入姓名" id="NAME" name="NAME" <#if completeInfo?? && completeInfo.NAME??>value="${completeInfo.NAME}" </#if>>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="sizing-addon2" style="background-color: #FFFFFF;color: #000000">性别</span>
                            <select class="form-control" id="SEX" name="SEX">
                                <option value="">请选择</option>
                                <#list SEXs as SEX>
                                    <option value="${SEX.DIC_ID}"<#if completeInfo?? && completeInfo.SEX?? && completeInfo.SEX == SEX.DIC_ID> selected</#if>>${SEX.NAME}</option>
                                </#list>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="sizing-addon2" style="background-color: #FFFFFF;color: #000000">出生日期</span>
                            <input type="text" class="form-control input-text Wdate" onClick="WdatePicker({ dateFmt:'yyyy-MM-dd' })" placeholder="请选择出生日期" readonly id="BIRTHDAY" name="BIRTHDAY"<#if completeInfo?? && completeInfo.BIRTHDAY??>value="${completeInfo.BIRTHDAY}" </#if>>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="sizing-addon2" style="background-color: #FFFFFF;color: #000000">文/理</span>
                            <select class="form-control" id="MAJORTYPE" name="MAJORTYPE">
                                <option value="">请选择</option>
                            <#list MAJORTYPEs as MAJORTYPE>
                                <option value="${MAJORTYPE.DIC_ID}"<#if completeInfo?? && completeInfo.MAJORTYPE?? && completeInfo.MAJORTYPE == MAJORTYPE.DIC_ID> selected</#if>>${MAJORTYPE.NAME}</option>
                            </#list>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="sizing-addon2" style="background-color: #FFFFFF;color: #000000">考试地区</span>
                            <select class="form-control" id="EXAMAREA" name="EXAMAREA">
                                <option value="">请选择</option>
                            <#list CITYs as CITY>
                                <option value="${CITY.DIC_ID}"<#if completeInfo?? && completeInfo.EXAMAREA?? && completeInfo.EXAMAREA == CITY.DIC_ID> selected</#if>>${CITY.NAME}</option>
                            </#list>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="sizing-addon2" style="background-color: #FFFFFF;color: #000000">高考成绩</span>
                            <input type="text" class="form-control" placeholder="请输入高考成绩" id="EXAMSCORE" name="EXAMSCORE" <#if completeInfo?? && completeInfo.EXAMSCORE??>value="${completeInfo.EXAMSCORE}" </#if>>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="sizing-addon2" style="background-color: #FFFFFF;color: #000000">身份证号</span>
                            <input type="text" class="form-control" placeholder="请输入身份证号" id="IDCARD" name="IDCARD" <#if completeInfo?? && completeInfo.IDCARD??>value="${completeInfo.IDCARD}" </#if>>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="sizing-addon2" style="background-color: #FFFFFF;color: #000000">电话</span>
                            <input type="text" class="form-control" placeholder="请输入电话号码" id="PHONE" name="PHONE" <#if completeInfo?? && completeInfo.PHONE??>value="${completeInfo.PHONE}" </#if>>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="sizing-addon2" style="background-color: #FFFFFF;color: #000000">邮箱</span>
                            <input type="text" class="form-control" placeholder="请输入邮箱地址" id="EMAIL" name="EMAIL" <#if completeInfo?? && completeInfo.EMAIL??>value="${completeInfo.EMAIL}" </#if>>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary">保存</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>