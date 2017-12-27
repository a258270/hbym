<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/chat/chat.css?v=${v}"/>
    <script src="${ctxPath}/static/ymplant/js/starscore/starScore.js?v=${v}"></script>
    <script src="${ctxPath}/static/ymplant/js/chat/chat.js"></script>
    <script>
        $(document).ready(function(){
            $(".kd-jlu").click(function(){
                $(".kd-spz").toggle();
                $("#record").toggle();
                document.getElementById('records_right').scrollTop = document.getElementById('records_right').scrollHeight;
            });

            scoreFun($("#startone"))
            scoreFun($("#starttwo"),{
                fen_d:22,//每一个a的宽度
                ScoreGrade:5//a的个数5
            });
            //显示分数
            $(".atar_Show p").each(function(index, element) {
                var num=$(this).attr("tip");
                var www=num*2*16;//
                $(this).css("width",www);
                $(this).parent(".atar_Show").siblings("span").text(num+"分");
            });

        });
    </script>
    <script>
        $(document).ready(function(){

            $(".kd-dji1").click(function(){
                $(".kd-jh2").hide();
                $(".kd-jh1").show();
            });
            $(".kd-dji2").click(function(){
                $(".kd-jh1").hide();
                $(".kd-jh2").show();
            });
            $(".emoticon").click(function(){
                $(".expression").toggle();
            })
        })

    </script>
</head>
<body>
<div class="container2">
    <div class="student row">
        <div class="col-md-2 col-sm-2 col-xs-2"></div>
        <div class="col-md-2 col-sm-2 col-xs-2" style="padding: 0;width: 260px;">
            <div class="kd-hse">
                <#--<input type="text" placeholder="搜索"/>-->
                联系人列表
            </div>
            <div style="height: 585px;overflow-y: scroll;background: #F6EDEE;">
            <#if teachers?? && (teachers?size > 0)>
                <#list teachers as teacher>
                    <div class="row kd-yse<#if complete_tea?? && teacher?? && complete_tea.USER_ID?? && teacher.RUSER_ID?? && (teacher.RUSER_ID == complete_tea.USER_ID)> active</#if>">
                        <a href="${ctxPath}/plant/chat/student/${teacher.RUSER_ID}">
                            <div class="col-md-3 col-sm-3 col-xs-3" style="padding-left: 20px;">
                                <div class="kd-tpi">
                                    <img src="<#if teacher.TEAHEADURL??>${teacher.TEAHEADURL}<#else>${ctxPath}/static/ymplant/img/timg.png</#if>" style="width:40px;height: 40px;" alt=""/>
                                </div>
                            </div>
                            <div class="col-md-7 col-sm-7 col-xs-7">
                                <p style="font-weight: bold;color: #000"><#if teacher?? && teacher.TEANICKNAME??>${teacher.TEANICKNAME}<#else>暂无</#if></p>
                                <p style="font-size: 10px;color: #857F81"><#if teacher?? && teacher.school?? && teacher.school.NAME??>${teacher.school.NAME}<#else>暂无信息</#if></p>
                            </div>
                            <div class="col-md-1 col-sm-1 col-xs-1" id="badgearea">
                                <span class="badge" style="background-color: #F64630;<#if complete_tea?? && teacher?? && complete_tea.USER_ID?? && teacher.RUSER_ID?? && (teacher.RUSER_ID == complete_tea.USER_ID)> display: none;<#else><#if teacher.count == 0> display: none;</#if></#if>" id="${teacher.RUSER_ID}">${teacher.count}</span>
                            </div>
                        </a>
                    </div>
                </#list>
            </#if>
            </div>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-4" style="background-color: #fff;padding-right: 0;width: 37.8%;">
            <div class="kd-mzi row">
                <div class="col-md-2 col-sm-2 col-xs-2"style="text-align: right">
                    <img src="<#if complete_tea?? && complete_tea.HEADURL??>${complete_tea.HEADURL}<#else>${ctxPath}/static/ymplant/img/timg.png</#if>" style="width: 50px;height:50px;border-radius: 50%" alt=""/>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">

                    <p style="margin-bottom: 8px;">
                        <span style="color:#787D83;font-weight: bold;"><#if complete_tea?? && complete_tea.NICKNAME??>${complete_tea.NICKNAME}<#else>暂无</#if></span>
                    <#if teacher??><span style="color:#9B4143;"><#if teacher.isOnline?? && (teacher.isOnline == 'true')>在线<#else>离线</#if></span></#if>
                    </p>
                    <#if teacher??><p><#if complete_tea?? && complete_tea.SCNAME??>${complete_tea.SCNAME}</#if></p></#if>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6" style="text-align: right">
                    <#if teacher??>
                    <span>评价：</span>
                    <div style="color:#FF7F24;float: right">
                        <span>评价：</span>
                        <div class="atar_Show">
                            <p tip="<#if totalscore??>${totalscore}<#else>5</#if>"></p>
                        </div>
                    </div>
                    <p class="kd-jshu" style="clear: both;">
                        <input type="button" class="btn kd-pjia" style="color: #fff;" data-toggle="modal" data-target=".bs-example-modal-lg"  value="评价"/>
                    </p>
                    <!--模态框 开始-->
                    <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content" style="padding: 30px;width: 570px;margin: 0 auto;">
                                <div class="row">
                                    <div class="col-md-1 col-sm-1 col-xs-1"></div>
                                    <div class="col-md-2 col-sm-2 col-xs-2">
                                        <img src="<#if complete_tea?? && complete_tea.HEADURL??>${complete_tea.HEADURL}<#else>${ctxPath}/static/ymplant/img/timg.png</#if>" style="width:59px;height: 59px;border-radius: 50%;" alt=""/>
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;line-height: 2.2">
                                        <p style="font-weight: bold"><#if complete_tea?? && complete_tea.NICKNAME??>${complete_tea.NICKNAME}<#else>暂无</#if></p>
                                        <p style="font-size: 10px;">
                                            <span style="color: #FA83B9"><#if complete_tea?? && complete_tea.JOBDATE_VALUE??>${complete_tea.JOBDATE_VALUE}<#else>暂无</#if></span>
                                            <span>丨</span>
                                            <span style="color: #FA83B9"><#if complete_tea?? && complete_tea.JOBTYPE??>${complete_tea.JOBTYPE}<#else>暂无</#if></span>
                                        </p>
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-xs-4" style="line-height: 2;">
                                        <p style="text-align: left;">
                                            <span style="color:#7F7F7F;">总评价：</span>
                                            <span style="color:#ED1C24;"><#if totalscore??>${totalscore}<#else>5</#if>分</span>
                                        </p>
                                        <#--<p style="text-align: left;">
                                            <span style="color:#7F7F7F;">收 藏：</span>
                                            <span style="color:#ED1C24;">3.6W</span>
                                        </p>-->
                                    </div>
                                    <#--<div class="col-md-2 col-sm-2 col-xs-2" style="display: none;">-->
                                        <#--<input type="button" value="收藏">-->
                                    <#--</div>-->
                                    <div class="col-md-1 col-sm-1 col-xs-1"></div>
                                </div>
                                <#--评价 开始-->
                                <div class="kd-fwu">
                                    <p class="kd-fwpj">服务评价</p>
                                    <#--星星 开始-->
                                    <#--<div class="content">-->
                                        <div id="starttwo" class="block clearfix" style="margin: 0 auto">
                                            <div class="star_score"></div>
                                            <p style="float:left;">您的评分：<span class="fenshu"></span> 分</p>
                                            <div class="attitude"></div>
                                        </div>
                                    <#--</div>-->
                                <#--星星 结束-->
                                </div>
                                <#--评价 结束-->
                                <textarea name="textarea" id="CONTENT" class="kd-pjnr"></textarea>
                                <div style="padding-top: 20px;text-align: center">
                                    <input class="kd-qre" style="margin-right: 170px" type="button" value="确定" onclick="toEvaluate();">
                                    <input class="kd-qre" type="button" value="取消" id="identifier" data-dismiss="modal">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--模态框 结束-->
                    </#if>
                </div>
            </div>
            <div class="kd-ltck" id="records">

            </div>
            <div class="row" style="border-bottom: 2px solid #EEDEDF;padding: 5px 0;">
                <div class="col-md-2 col-sm-2 col-xs-2 bqing">
                    <a href="javascript:void (0);" class="emoticon">
                        <img style="margin-right: 10px" src="/static/ymplant/images/tubiao2/8.1.png" alt=""/>
                        <div class="expression">
                            <div class="classic">经典表情</div>
                            <table>
                                <tbody>
                                <tr>
                                    <td class="b-spacing">
                                        <a href="javascript:void(0);" class="dd1">
                                            <img class="put" src="" alt="">
                                        </a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </a>
                    <#--<a href="#">-->
                        <#--<img style="margin-right: 10px" src="/static/ymplant/images/tubiao2/8.2.png" alt=""/>-->
                    <#--</a>-->
                    <#--<a href="#">-->
                        <#--<img src="/static/ymplant/images/tubiao2/8.3.png" alt=""/>-->
                    <#--</a>-->

                    <#--表情框 开始-->

                    <#--表情框 结束-->
                </div>
                <div class="col-md-10 col-sm-10 col-xs-10" style="text-align: right">
                    <a class="kd-jlu" style="text-decoration: none;" href="javascript:void (0);">消息记录</a>
                </div>
            </div>
            <div class="dhua">
                <textarea name="textarea" id="message" style="word-break: break-word;" onkeydown="return keydown(event);"></textarea>
            </div>
            <div class="kd-fsong">
                <div class="btn-group">
                    <button type="button" class="btn kd-fann" id="send" style="color: #fff">发送</button>
                    <button style="color: #fff" type="button" class="btn dropdown-toggle kd-fann" id="kd-fannt" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>
                    </button>
                    <ul class="dropdown-menu">
                        <li class="kd-xdui">
                            <span class="kd-jdui">
                                <img class="kd-jh1" src="/static/ymplant/images/tubiao3/dgou.png" alt="">
                            </span>
                            <a class="kd-dji1" href="javascript:void(0);">按Enter键发送消息</a>
                        </li>
                        <li class="kd-xdui">
                            <span class="kd-jdui">
                                <img class="kd-jh2" src="/static/ymplant/images/tubiao3/dgou.png" alt="" style="display: none;">
                            </span>
                            <a class="kd-dji2" href="javascript:void(0);">按Ctrl+Enter键发送消息</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2 kd-spz" style="padding:0;border-left: 2px solid #808080;height: 635px;background-color: #fff">
            <ul class="nav nav-tabs nav-justified" style="margin-top: 48px;">
                <li role="presentation" class="active"><a href="#notice" class="kd-bxi" data-toggle="tab">注意事项</a></li>
                <li role="presentation"><a href="#teainfo" class="kd-bxi" data-toggle="tab">老师资料</a></li>
            </ul>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="notice">
                    <div style="padding: 30px;line-height: 2;font-size:12px;color: #999;">
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;聊天内容不得违反国家的法律法规，不得发布、传播含有下列内容的信息：</p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;(1)危害国家安全，破坏国家统一的；</p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;(2)危害民族团结、宣传邪教的；</p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;(3)散布谣言、色情、赌博、暴力的；</p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;(4)侮辱或者诽谤他人，侵害他人合法权益的；</p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;(5)含有法律、法规禁止的其他内容的。</p>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="teainfo" style="padding: 20px;">
                    <#--<div class="row">-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                        <#--<div class="col-md-3 col-sm-3 col-xs-3" style="padding-right: 0;font-weight: bold;">昵称</div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0"><#if complete_tea?? && complete_tea.NICKNAME??>${complete_tea.NICKNAME}<#else>暂无</#if></div>-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                    <#--</div>-->
                    <#--<div class="row">-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                        <#--<div class="col-md-3 col-sm-3 col-xs-3" style="padding-right: 0;font-weight: bold;">所属院校</div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0"><#if complete_tea?? && complete_tea.SCNAME??>${complete_tea.SCNAME}<#else>暂无</#if></div>-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                    <#--</div>-->
                    <#--<div class="row">-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                        <#--<div class="col-md-3 col-sm-3 col-xs-3" style="padding-right: 0;font-weight: bold;">性别</div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0"><#if complete_tea?? && complete_tea.SEX_VALUE??>${complete_tea.SEX_VALUE}<#else>暂无</#if></div>-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                    <#--</div>-->
                    <#--<div class="row">-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                        <#--<div class="col-md-3 col-sm-3 col-xs-3" style="padding-right: 0;font-weight: bold;">工作年限</div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0"><#if complete_tea?? && complete_tea.JOBDATE_VALUE??>${complete_tea.JOBDATE_VALUE}<#else>暂无</#if></div>-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                    <#--</div>-->
                    <#--<div class="row">-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                        <#--<div class="col-md-3 col-sm-3 col-xs-3" style="padding-right: 0;font-weight: bold;">职务</div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0"><#if complete_tea?? && complete_tea.JOBTYPE??>${complete_tea.JOBTYPE}<#else>暂无</#if></div>-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                    <#--</div>-->

                    <div class="round">
                        <img src="<#if complete_tea?? && complete_tea.HEADURL??>${complete_tea.HEADURL}<#else>${ctxPath}/static/ymplant/img/timg.png</#if>" style="width: 100px;height: 100px;" alt="">
                    </div>
                    <p style="text-align: center;font-weight: bold;margin: 10px 0;"><#if complete_tea?? && complete_tea.NICKNAME??>${complete_tea.NICKNAME}<#else>暂无</#if></p>
                    <div class="kd-sheng">
                        <p class="kd-sxia">
                            <span class="kd-jcu">昵&nbsp;&nbsp;&nbsp;&nbsp;称</span>
                            <span style="margin-left: 14px;"><#if complete_tea?? && complete_tea.NICKNAME??>${complete_tea.NICKNAME}<#else>暂无</#if></span>
                        </p>
                        <p>
                            <span class="kd-jcu">性&nbsp;&nbsp;&nbsp;&nbsp;别</span>
                            <span style="margin-left: 14px;"><#if complete_tea?? && complete_tea.SEX_VALUE??>${complete_tea.SEX_VALUE}<#else>暂无</#if></span>
                        </p>
                    </div>
                    <div class="kd-sheng">
                        <p class="kd-sxia">
                            <span class="kd-jcu">就职院校</span>
                            <span><#if complete_tea?? && complete_tea.SCNAME??>${complete_tea.SCNAME}<#else>暂无</#if></span>
                        </p>
                        <p class="kd-sxia">
                            <span class="kd-jcu">职&nbsp;&nbsp;&nbsp;&nbsp;务</span>
                            <span style="margin-left: 14px"><#if complete_tea?? && complete_tea.JOBTYPE??>${complete_tea.JOBTYPE}<#else>暂无</#if></span>
                        </p>
                        <p>
                            <span class="kd-jcu">工作年限</span>
                            <span><#if complete_tea?? && complete_tea.JOBDATE_VALUE??>${complete_tea.JOBDATE_VALUE}<#else>暂无</#if></span>
                        </p>
                    </div>
                    <div class="kd-sheng">
                        <p class="kd-sxia">
                            <span class="kd-jcu">咨询人次</span>
                            <span><#if teacherChatCount??>${teacherChatCount?c}<#else>0</#if><span>人</span></span>
                        </p>
                        <div>
                            <span style="font-weight: bold;">综合评价</span>
                            <div style="color:#FF7F24;float: right">
                                <span>评价：</span>
                                <div class="atar_Show">
                                    <p tip="<#if totalscore??>${totalscore}<#else>5</#if>"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="record" class="record col-md-2 col-sm-2 col-xs-2" style="height: 635px;">
            <div class="ltjlu">
                <span>
                    与<#if complete_tea?? && complete_tea.NICKNAME??>${complete_tea.NICKNAME}<#else>暂无</#if>的聊天记录
                </span>
            </div>
            <div class="strong" id="records_right">

            </div>
            <#--<div class="fye">
                <a href="#">
                    <span>上一页</span>
                </a>
                <a href="#">
                    <span>&lt;&lt;</span>
                </a>
                <a href="#">
                    <span>1</span>
                </a>
                <a href="#">
                    <span>2</span>
                </a>
                <a href="#">
                    <span>3</span>
                </a>
                <a href="#">
                    <span>4</span>
                </a>
                <a href="#">
                    <span>5</span>
                </a>
                <a href="#">
                    <span>&gt;&gt;</span>
                </a>
                <a href="#">
                    <span>下一页</span>
                </a>

            </div>-->
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2"></div>
    </div>
</div>
<script language="JavaScript">
    function keydown(e) {
        var keyCode = e.keyCode || e.which || e.charCode;
        var ctrlKey = e.ctrlKey || e.metaKey;

        if ($(".kd-jh1").css("display") == "none" && ctrlKey && keyCode == 13) {//按键信息对象以参数的形式传递进来了
            //此处编写用户敲回车后的代码
            $("#send").click();
            return false;
        }

        if ($(".kd-jh2").css("display") == "none" && keyCode == 13) {//按键信息对象以参数的形式传递进来了
            //此处编写用户敲回车后的代码
            $("#send").click();
            return false;
        }
    }
</script>
<#if teacher??>
<script language="JavaScript">
    var recId = "${teacher.USER_ID}";
    $(function () {
        <#if Session?? && Session.session_user_key?? && Session.session_user_key.USER_ID??>
        sendRequest("/plant/chat/api/getrecs",{RUSER_ID: recId},"POST",function(obj){
            var strHtml = "";
            var strHtml_right = "";
            for (var i = 0; i < obj.data.length;i++){
                var record = obj.data[i];
                if(record.SUSER_ID == "${Session.session_user_key.USER_ID}"){
                    strHtml +="<div style='margin-bottom: 10px;'>";
                    strHtml +="<div class='kd-bset' style='word-break:break-all'>";
                    strHtml +="<p style='color:#FC7F26;margin-bottom: 5px;'>";
                    strHtml +="<span style='font-weight: bold;'>我：</span>";
                    strHtml +="<span style='font-weight: bold;'>（" + toLocalTime(record.CREATETIME) + "）</span>";
                    strHtml +="</p>";
                    strHtml +="<p style='margin-bottom: 5px;word-break: break-word;'>" + parseContent(parseEmoji(record.CONTENT)) + "</p>";
                    strHtml +="</div>";
                    strHtml +="<div class='clear'></div>";
                    strHtml +="</div>";
//                右侧循环
                    strHtml_right +="<div class='heah'>";
                    strHtml_right +="<span style='font-weight: bold;'>我：</span>";
                    strHtml_right +="<span style='font-weight: bold;'>" + toLocalTime(record.CREATETIME) + "</span>";
                    strHtml_right += "<p class='nhao' style='word-break: break-word;'>" + parseContent(parseEmoji(record.CONTENT)) + "</p>";
                    strHtml_right +="</div>";
            }
                if(record.RUSER_ID == "${Session.session_user_key.USER_ID}"){
                strHtml +="<div style='margin-bottom: 10px;'>";
                strHtml +="<div class='kd-bse' style='word-break:break-all'>";
                strHtml +="<p style='color:#FC7F26;margin-bottom: 5px;'>";
                strHtml +="<span style='font-weight: bold;'><#if complete_stu?? && complete_stu.NICKNAME??>${complete_stu.NICKNAME}<#else>暂无</#if>：</span>";
                strHtml +="<span>（" + toLocalTime(record.CREATETIME) + "）</span>";
                strHtml +="</p>";
                strHtml +="<p style='margin-bottom: 5px;word-break: break-word;'>" + parseContent(parseEmoji(record.CONTENT)) + "</p>";
                strHtml +="</div>";
                strHtml +="<div class='clear'></div>";
                strHtml +="</div>";
//                右侧循环
                    strHtml_right +="<div class='heah'>";
                    strHtml_right += "<span style='font-weight: bold;'><#if complete_stu?? && complete_stu.NICKNAME??>${complete_stu.NICKNAME}<#else>暂无</#if>：</span>";
                    strHtml_right +="<span>" + toLocalTime(record.CREATETIME) + "</span>";
                    strHtml_right += "<p class='nhao' style='word-break: break-word;'>" + parseContent(parseEmoji(record.CONTENT)) + "</p>";
                    strHtml_right +="</div>";
                }
                $("#records").html(strHtml);
                $("#records_right").html(strHtml_right);


                document.getElementById('records').scrollTop = document.getElementById('records').scrollHeight;
                    sendRequest(ctxPath + "/plant/chat/api/setread", {SUSER_ID: recId}, "POST", function (res) {
                        sendRequest(ctxPath + "/plant/chat/api/getmsgcount", {}, "POST", parent.setMsg);
                    });
            }
        });
        </#if>

        $("#send").click(function () {
            if(recId == "") {showError("请选择聊天对象！");return false;}

            if($("#message").val() == "") {
                showError("发送的消息不能为空！");
                return false;
            }

            sendRequest(ctxPath + "/plant/chat/api/sendMessage", {USER_ID: recId, MESSAGE: $("#message").val()}, "POST", function (res) {
                if(res.hasErrors){
                    showError(res.errorMessage);
                    return false;
                }

                var strHtml = "";
                strHtml += "<div style='margin-bottom: 10px;'>";
                strHtml += "<div class='kd-bset' style='word-break:break-all'>";
                strHtml += "<p style='color:#FC7F26;margin-bottom: 5px;'>";
                strHtml += "<span style='font-weight: bold;'>我：</span>";
                strHtml += "<span style='font-weight: bold;'>（" + getCurrentTime() + "）</span>";
                strHtml += "</p>";
                strHtml += "<p style='margin-bottom: 5px;word-break: break-word'>" + parseContent(parseEmoji($("#message").val())) + "</p>";
                strHtml += "</div>";
                strHtml += "<div class='clear'></div>";
                strHtml += "</div>";

                $("#records").html($("#records").html() + strHtml);

                $("#message").val("");

                var div = document.getElementById('records');
                div.scrollTop = div.scrollHeight;
            });
        });
    });

    socket.onmessage = function (evt) {
        if(evt.data.substring(0, evt.data.indexOf("----")) == recId) {
            var strHtml = "";

            strHtml += "<div style='margin-bottom: 10px;'>";
            strHtml += "<div class='kd-bse' style='word-break:break-all'>";
            strHtml += "<p style='color:#FC7F26;margin-bottom: 5px;'>";
            strHtml += "<span><#if complete_tea?? && complete_tea.NICKNAME??>${complete_tea.NICKNAME}<#else>暂无</#if>：</span>";
            strHtml += "<span>（" + getCurrentTime() + "）</span>";
            strHtml += "</p>";
            strHtml += "<p style='margin-bottom: 5px;word-break: break-word'>" + parseContent(parseEmoji(evt.data.substring(evt.data.indexOf("----") + 4)))  + "</p>";
            strHtml += "</div>";
            strHtml += "<div class='clear'></div>";
            strHtml += "</div>";

            $("#records").html($("#records").html() + strHtml);
            var div = document.getElementById('records');
            div.scrollTop = div.scrollHeight;
            sendRequest(ctxPath + "/plant/chat/api/setread", {SUSER_ID: recId}, "POST");
        }
        else{
            var targetObj = $("#" + recId);
            var number = targetObj.text();
            if(number != "99+"){
                number++;
                if(number > 99) number = "99+";
            }

            targetObj.text(number);
            targetObj.show();
        }
    };

    function toEvaluate() {
        var score = parseInt($(".fenshu").text());
        if(isNaN(score)){
            showError("请填写分数！");
            return false;
        }

        if($("#CONTENT").val() == "") {
            showError("请填写评价内容！");
            return false;
        }

        sendRequest(ctxPath + "/plant/chatscore/api/add", {TEACHER_ID: "${teacher.USER_ID}", SCORE: score, CONTENT: $("#CONTENT").val()}, "POST", function (res) {
            if(res.hasErrors) {
                showError(res.errorMessage);
                return false;
            }

            showSuccess("评价完成！");
            $("#myModal").modal("hide");
        });
    }
</script>
<#else>
<script language="JavaScript">
    $(function () {
        socket.onmessage = function (evt) {
            var targetObj = $("#" + evt.data.substring(0, evt.data.indexOf("----")));
            var number = targetObj.text();
            if(number != "99+"){
                number++;
                if(number > 99) number = "99+";
            }

            targetObj.text(number);
            targetObj.show();
        };


        $("#send").click(function () {
            showError("请选择聊天对象！");return false;
        });
    });

</script>
</#if>
<script language="JavaScript">
    function parseContent(list) {
        var strHtmlTmp = "";
        for(var j = 0; j < list.length; j++) {
            var element = list[j];
            if(element.type == "txt") {
                strHtmlTmp += element.data;
            }
            else if(element.type == "emoji") {
                strHtmlTmp += "<img class='put' src='/static/ymplant/images/expression/" + element.data + "'>";
            }
        }

        return strHtmlTmp;
    }
</script>
<#if error??>
    <script language="JavaScript">
        showError("${error}"<#if url??>, "${url}"</#if>);
    </script>
</#if>
</body>
</html>