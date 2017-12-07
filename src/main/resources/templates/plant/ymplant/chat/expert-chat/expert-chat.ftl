<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
    <#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/chat/chat.css?v=${v}"/>
    <script>
        $(document).ready(function(){
            $(".kd-jlu").click(function(){
                $(".kd-spz").toggle();
                $("#record").toggle();
            });

            var div = document.getElementById('records');
            div.scrollTop = div.scrollHeight;

            $(".kd-dji1").click(function(){
                $(".kd-jh2").hide();
                $(".kd-jh1").show();
            });
            $(".kd-dji2").click(function(){
                $(".kd-jh1").hide();
                $(".kd-jh2").show();
            });
        });
    </script>
</head>
<body>
<div class="container2">
    <div class="student row">
        <div class="col-md-2 col-sm-2 col-xs-2"></div>
        <div class="col-md-2 col-sm-2 col-xs-2" style="padding: 0;width: 260px;">
            <div class="kd-hse">
            <#--<input type="text" placeholder="搜索"/>-->
                <div style="color:#fff;font-weight: bold;">联系人列表</div>
            </div>
            <div style="height: 590px;overflow-y: scroll;background: #F6EDEE;">
            <#if chatUsers?? && (chatUsers?size > 0)>
                <#list chatUsers as chatUser>
                    <div class="row kd-yse<#if complete_stu?? && chatUser?? && complete_stu.USER_ID?? && chatUser.RUSER_ID?? && (chatUser.RUSER_ID == complete_stu.USER_ID)> active</#if>">
                        <a href="${ctxPath}/plant/chat/teacher/${chatUser.RUSER_ID}">
                            <div class="col-md-3 col-sm-3 col-xs-3" style="padding-right: 0;padding-left: 25px;">
                                <div class="kd-tpi">
                                    <img src="<#if chatUser.HEADURL??>${chatUser.HEADURL}<#else>/static/ymplant/img/timg.png</#if>" style="width:45px;height: 45px;;" alt=""/>
                                </div>
                            </div>
                            <div class="col-md-7 col-sm-7 col-xs-7">
                                <p style="font-weight: bold;color: #000"><#if chatUser.NICKNAME??>${chatUser.NICKNAME}<#else>暂无</#if></p>
                                <p style="font-size: 12px;">
                                    <img src="/static/ymplant/images/tubiao4/<#if chatUser.SEX??><#if chatUser.SEX=='11'>sex_man.png</#if><#if chatUser.SEX == '12'>sex_woman.png</#if><#else>sex_man.png</#if>" alt="">
                                    <span style="color: #808080;">丨<#if chatUser.PROVINCE_VALUE??>${chatUser.PROVINCE_VALUE}<#else>暂无</#if></span>
                                </p>
                            </div>
                            <div class="col-md-1 col-sm-1 col-xs-1">
                                <span class="badge" style="background-color: #F64630;<#if complete_stu?? && chatUser?? && complete_stu.USER_ID?? && chatUser.RUSER_ID?? && (chatUser.RUSER_ID == complete_stu.USER_ID)> display: none;<#else><#if chatUser.count == 0> display: none;</#if></#if>" id="${chatUser.RUSER_ID}">${chatUser.count}</span>
                            </div>
                        </a>
                    </div>
                </#list>
            </#if>
            </div>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-4" style="background-color: #fff;padding-right:0;height: 100%;width: 730px;">
            <div class="kd-mzi row">
                <div class="col-md-2 col-sm-2 col-xs-2"style="text-align: right">
                <#if student??>
                    <img src="<#if complete_stu?? && complete_stu.HEADURL??>${complete_stu.HEADURL}<#else>/static/ymplant/img/timg.png</#if>" style="width: 50px;height:50px;border-radius: 50%" alt=""/>
                </#if>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <p style="margin-top: 15px;">
                    <#if student??>
                        <span style="color:#787D83;font-weight: bold;"><#if complete_stu?? && complete_stu.NICKNAME??>${complete_stu.NICKNAME}<#else>暂无</#if></span>
                        <span style="color:#9B4143;"><#if student.isOnline?? && (student.isOnline == 'true')>在线<#else>离线</#if></span>
                    </#if>
                    </p>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6" style="text-align: right">
                    <!--<p style="color:#FF7F24;">-->
                    <!--<span>评价：</span>-->
                    <!--<img style="width:100px;" src="/static/ymplant/images/tubiao/6.6.png" alt=""/>-->
                    <!--<span>5</span>-->
                    <!--<span>分</span>-->
                    <!--</p>-->
                <#--<p class="kd-jshu">
                    <input type="button" value="结束聊天"/>
                </p>-->
                </div>
            </div>
            <div class="kd-ltck" id="records">
            <#if chatRecords?? && (chatRecords?size > 0) && Session?? && Session.session_user_key??>
                <#list chatRecords as chatRecord>
                    <#if chatRecord.SUSER_ID == Session.session_user_key.USER_ID>
                        <div style="margin-bottom: 10px;">
                            <div class="kd-bset" style="word-break:break-all">
                                <p style="color:#FC7F26;margin-bottom: 5px;">
                                    <span style="font-weight: bold;">我</span>
                                    <span style="font-weight: bold;">(${chatRecord.CREATETIME})</span>
                                </p>
                                <p style="margin-bottom: 5px;word-break: break-word;">${chatRecord.CONTENT}</p>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </#if>
                    <#if chatRecord.RUSER_ID == Session.session_user_key.USER_ID>
                        <div style="margin-bottom: 10px;">
                            <div class="kd-bse" style="word-break:break-all">
                                <p style="color:#FC7F26;margin-bottom: 5px;">
                                    <span style="font-weight: bold;"><#if complete_stu?? && complete_stu.NICKNAME??>${complete_stu.NICKNAME}<#else>暂无</#if></span>
                                    <span style="font-weight: bold;">(${chatRecord.CREATETIME})</span>
                                </p>
                                <p style="margin-bottom: 5px;word-break: break-word;">${chatRecord.CONTENT}</p>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </#if>
                </#list>
            </#if>
            </div>
            <div class="row" style="border-bottom: 2px solid #EEDEDF;padding: 5px 0;">
                <div class="col-md-2 col-sm-2 col-xs-2">
                <#--<a href="#">
                        <img style="margin-right: 10px" src="/static/ymplant/images/tubiao2/8.1.png" alt=""/>
                    </a>
                    <a href="#">
                        <img style="margin-right: 10px" src="/static/ymplant/images/tubiao2/8.2.png" alt=""/>
                    </a>
                    <a href="#">
                        <img src="/static/ymplant/images/tubiao2/8.3.png" alt=""/>
                    </a>-->
                </div>
                <div class="col-md-10 col-sm-10 col-xs-10" style="text-align: right">
                    <a class="kd-jlu" style="text-decoration: none;" href="javascript:void (0);">消息记录</a>
                </div>
            </div>
            <div class="dhua">
                <textarea name="textarea" style="word-break: break-word;" id="message" onkeydown="return keydown(event);"></textarea>
            </div>
            <div class="kd-fsong">
                <div class="btn-group">
                    <button type="button" class="btn btn-danger kd-fann" id="send">发送</button>
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
        <div class="col-md-2 col-sm-2 col-xs-2 kd-spz" style="padding:0;border-left: 2px solid #808080;height: 640px;background-color: #fff">
            <ul class="nav nav-tabs nav-justified" style="margin-top: 48px;">
                <li role="presentation" class="active"><a href="#notice" class="kd-bxi" data-toggle="tab">注意事项</a></li>
                <li role="presentation"><a href="#stuinfo" class="kd-bxi" data-toggle="tab">学生资料</a></li>
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
                <div role="tabpanel" class="tab-pane" id="stuinfo" style="padding: 20px;">
                    <#--<div class="row">-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5" style="text-align: right">昵称：</div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5"><#if complete_stu?? && complete_stu.NICKNAME??>${complete_stu.NICKNAME}<#else>暂无</#if></div>-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                    <#--</div>-->
                    <#--<div class="row">-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5" style="text-align: right">高考分数：</div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5"><#if exam?? && exam.EXAMSCORE??>${exam.EXAMSCORE}分<#else>暂无</#if></div>-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                    <#--</div>-->
                    <#--<div class="row">-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5" style="text-align: right">考生地区：</div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5"><#if exam?? && exam.EXAMAREA_VALUE??>${exam.EXAMAREA_VALUE}<#else>暂无</#if></div>-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                    <#--</div>-->
                    <#--<div class="row">-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5" style="text-align: right">科类：</div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5"><#if exam?? && exam.MAJORTYPE_VALUE??>${exam.MAJORTYPE_VALUE}<#else>暂无</#if></div>-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                    <#--</div>-->
                    <#--<div class="row">-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5" style="text-align: right">一模成绩：</div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5"><#if exam?? && exam.FIRSTMOCK??>${exam.FIRSTMOCK}分<#else>暂无</#if></div>-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                    <#--</div>-->
                    <#--<div class="row">-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5" style="text-align: right">二模成绩：</div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5"><#if exam?? && exam.SECONDMOCK??>${exam.SECONDMOCK}分<#else>暂无</#if></div>-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                    <#--</div>-->
                    <#--<div class="row">-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5" style="text-align: right">三模成绩：</div>-->
                        <#--<div class="col-md-5 col-sm-5 col-xs-5"><#if exam?? && exam.THIRDMOCK??>${exam.THIRDMOCK}分<#else>暂无</#if></div>-->
                        <#--<div class="col-md-1 col-sm-1 col-xs-1"></div>-->
                    <#--</div>-->
                        <div class="round">
                            <img src="<#if complete_stu?? && complete_stu.HEADURL??>${complete_stu.HEADURL}<#else>/static/ymplant/img/timg.png</#if>" style="width: 100px;height: 100px;" alt="">
                        </div>
                        <p style="text-align: center;font-weight: bold;margin: 10px 0;"><#if complete_stu?? && complete_stu.NICKNAME??>${complete_stu.NICKNAME}<#else>暂无</#if></p>
                        <div class="kd-sheng">
                            <p class="kd-sxia">
                                <span class="kd-jcu">昵&nbsp;&nbsp;&nbsp;&nbsp;称</span>
                                <span style="margin-left: 14px;"><#if complete_stu?? && complete_stu.NICKNAME??>${complete_stu.NICKNAME}<#else>暂无</#if></span>
                            </p>
                            <p>
                                <span class="kd-jcu">高考分数</span>
                                <span><#if exam?? && exam.EXAMSCORE??>${exam.EXAMSCORE}分<#else>暂无</#if></span>
                            </p>
                        </div>
                        <div class="kd-sheng">
                            <p class="kd-sxia">
                                <span class="kd-jcu">考生地区</span>
                                <span><#if exam?? && exam.EXAMAREA_VALUE??>${exam.EXAMAREA_VALUE}<#else>暂无</#if></span>
                            </p>
                            <p class="kd-sxia">
                                <span class="kd-jcu">科&nbsp;&nbsp;&nbsp;&nbsp;类</span>
                                <span style="margin-left: 14px;"><#if exam?? && exam.MAJORTYPE_VALUE??>${exam.MAJORTYPE_VALUE}<#else>暂无</#if></span>
                            </p>
                        </div>
                        <div class="kd-sheng">
                            <p class="kd-sxia">
                                <span class="kd-jcu">一模成绩</span>
                                <span><#if exam?? && exam.FIRSTMOCK??>${exam.FIRSTMOCK}分<#else>暂无</#if></span>
                            </p>
                            <p class="kd-sxia">
                                <span class="kd-jcu">二模成绩</span>
                                <span><#if exam?? && exam.SECONDMOCK??>${exam.SECONDMOCK}分<#else>暂无</#if></span>
                            </p>
                            <p class="kd-sxia">
                                <span class="kd-jcu">三模成绩</span>
                                <span><#if exam?? && exam.THIRDMOCK??>${exam.THIRDMOCK}分<#else>暂无</#if></span>
                            </p>
                        </div>
                </div>
            </div>
        </div>


        <div id="record" class="record col-md-2 col-sm-2 col-xs-2">
            <div class="ltjlu">
                <span>
                    与<#if complete_stu?? && complete_stu.NICKNAME??>${complete_stu.NICKNAME}<#else>暂无</#if>的聊天记录
                </span>
            </div>
            <div class="strong">
        <#if chatRecords?? && (chatRecords?size > 0) && Session?? && Session.session_user_key??>
            <#list chatRecords as chatRecord>
                <#if chatRecord.SUSER_ID == Session.session_user_key.USER_ID>
                    <div class="heah">
                        <span style="font-weight: bold;">我</span>
                        <span style="font-weight: bold;">${chatRecord.CREATETIME}</span>
                        <p class="nhao" style="word-break: break-word;">${chatRecord.CONTENT}</p>
                    </div>
                </#if>
                <#if chatRecord.RUSER_ID == Session.session_user_key.USER_ID>
                    <div class="heah">
                        <span style="font-weight: bold;"><#if complete_stu?? && complete_stu.NICKNAME??>${complete_stu.NICKNAME}<#else>暂无</#if></span>
                        <span style="font-weight: bold;">${chatRecord.CREATETIME}</span>
                        <p class="nhao" style="word-break: break-word;">${chatRecord.CONTENT}</p>
                    </div>
                </#if>
            </#list>
        </#if>
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
<#if student??>
<script language="JavaScript">
    var recId = "${student.USER_ID}";

    $(function () {
        sendRequest(ctxPath + "/plant/chat/api/setread", {SUSER_ID: recId}, "POST", function (res) {
            sendRequest(ctxPath + "/plant/chat/api/getmsgcount", {}, "POST", parent.setMsg);
        });

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
                strHtml += "<span style='font-weight: bold;'>我</span>";
                strHtml += "<span>(" + getCurrentTime() + ")</span>";
                strHtml += "</p>";
                strHtml += "<p style='margin-bottom: 5px;word-break: break-word'>" + $("#message").val() + "</p>";
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
            strHtml += "<span style='font-weight: bold'><#if complete_stu?? && complete_stu.NICKNAME??>${complete_stu.NICKNAME}<#else>暂无</#if></span>";
            strHtml += "<span style='font-weight: bold'>(" + getCurrentTime() + ")</span>";
            strHtml += "</p>";
            strHtml += "<p style='margin-bottom: 5px;word-break: break-word'>" +  + evt.data.substring(evt.data.indexOf("----") + 4) +  + "</p>";
            strHtml += "</div>";
            strHtml += "<div class='clear'></div>";
            strHtml += "</div>";

            $("#records").html($("#records").html() + strHtml);
            var div = document.getElementById('records');
            div.scrollTop = div.scrollHeight;
            sendRequest(ctxPath + "/plant/chat/api/setread", {SUSER_ID: recId}, "POST");
        }else{
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
</body>
</html>