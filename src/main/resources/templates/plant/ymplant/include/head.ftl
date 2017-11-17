<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="viewport" content="target-densitydpi=device-dpi, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="icon" type="image/x-icon" href="/static/favicon.ico">
<title>${baseSetting.title}</title>

<script type="text/javascript" src="${ctxPath}/static/plugin/jquery/jquery-1.11.1.min.js?v=${v}"></script>
<link href="${ctxPath}/static/ymplant/css/bootstrap.css?v=${v}" rel="stylesheet">
<script src="${ctxPath}/static/ymplant/js/bootstrap.js?v=${v}"></script>
<link rel="stylesheet" href="${ctxPath}/static/ymplant/css/header.css?v=${v}"/>
<link rel="stylesheet" href="${ctxPath}/static/ymplant/css/footer.css?v=${v}"/>
<script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/jquery.validation/1.14.0/jquery.validate.js?v=${v}"></script>
<script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/jquery.validation/1.14.0/validate-methods.js?v=${v}"></script>
<script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/jquery.validation/1.14.0/messages_zh.js?v=${v}"></script>

<script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/layer/2.4/layer.js?v=${v}"></script>
<script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/util/util.js?v=${v}"></script>
<link rel="stylesheet" href="${ctxPath}/static/plugin/h-ui/lib/jquerypagination/css/jquery.pagination.css?v=${v}" />
<script src="${ctxPath}/static/plugin/h-ui/lib/jquerypagination/js/jquery.pagination.min.js?v=${v}"></script>

<link rel="stylesheet" href="${ctxPath}/static/ymplant/css/drag/drag.css?v=${v}">
<script src="${ctxPath}/static/ymplant/js/drag/drag.js?v=${v}"></script>

<script src="${ctxPath}/static/base/include/app_service.js?v=${v}"></script>
<script language="JavaScript">
    var ctxPath = "${ctxPath}";
    $(function () {
        sendRequest(ctxPath + "/plant/chat/api/getmsgcount", {}, "POST", setMsg);
        $("#regBtn").click(function () {
            if($("#agreebox").prop("checked")){
                sendRequest(ctxPath + "/plant/api/toregist", {USERNAME: $("#REG_USERNAME").val(), PASSWORD: $("#REG_PASSWORD").val(), REPASSWORD: $("#REG_REPASSWORD").val(), CODE: $("#REG_CODE").val(), PHONE: $("#REG_PHONE").val()}, "POST", function (res) {
                    if(res.hasErrors){
                        showError(res.errorMessage);
                        return false;
                    }

                    sendRequest(ctxPath + "/plant/api/tologin", {USERNAME: $("#REG_USERNAME").val(), PASSWORD: $("#REG_PASSWORD").val()}, "POST", function (res) {
                        if(res.hasErrors){
                            showError(res.errorMessage);
                            return false;
                        }

                        window.location.href = ctxPath + "/plant/index";
                    });
                });
            }
            else{
                showError("您没有同意服务条款，无法进行注册");
            }

        });
        $("#logBtn").click(function () {
            if(document.getElementById("drag").innerText != "验证通过") {showError("请进行滑动验证！");return false;}
            sendRequest(ctxPath + "/plant/api/tologin", {USERNAME: $("#LOG_USERNAME").val(), PASSWORD: $("#LOG_PASSWORD").val(), CODE: $("#LOG_CODE").val()}, "POST", function (res) {
                if(res.hasErrors){
                    showError(res.errorMessage);
                    return false;
                }

                window.location.href = ctxPath + "/plant/index";
            });
        });
        /*$("#exitBtn").click(function () {
            sendRequest(ctxPath + "/plant/api/toexit", {}, "POST", function(res){
                if(res.hasErrors){
                    showError(res.errorMessage);
                    return false;
                }

                window.location.href = ctxPath + "/plant/index";
            });
        });*/
    });


<#if Session?? && Session.session_user_key?? && Session.session_user_key.USER_ID??>
    var socket;
    if(window.WebSocket){
        socket = new WebSocket('ws://www.gaokgh.com.cn/plant/chat/${Session.session_user_key.USER_ID}');
    }else{
        showError("您的浏览器版本过低，在线咨询功能会受限，请更换浏览器！");
    }
    socket.onmessage = function (evt) {
        //var recId = evt.data.substring(0, evt.data.indexOf("----"));
        sendRequest(ctxPath + "/plant/chat/api/getmsgcount", {}, "POST", setMsg);
        //$("#msgcount").text(parseInt($("#msgcount").text()) + 1);
    };
</#if>
</script>
<script language="JavaScript">
    var codeCountTop = 0;
    var codeTimerTop = null;
    var getSMSCodeTop = function () {
        sendRequest(ctxPath + "/plant/user/api/chkused", {USERNAME: $("#REG_PHONE").val()}, "POST", function (res) {
            if (res.data) {
                showError("该手机号已经被使用，请更换！");
                return false;
            }

            sendRequest(ctxPath + "/plant/user/api/getsmscode", {PHONE: $("#REG_PHONE").val()}, "POST", function (res) {
                if(res.hasErrors){
                    showError(res.errorMessage);
                    return false;
                }

                $("#codeBtnTop").hide();
                $("#afterBtnTop").show();
                codeTimerTop = setInterval("goCountTop()", 1000);
                showSuccess("发送成功！");
            });
        });
    };

    var goCountTop = function () {
        if(codeCountTop == 60){
            clearInterval(codeTimerTop);
            $("#codeBtnTop").show();
            $("#afterBtnTop").hide();
            codeCountTop = 0;
            codeTimerTop = null;
            ("#afterBtnTop").val("60秒后重试");
            return;
        }
        codeCountTop++;
        $("#afterBtnTop").val((60 - codeCountTop) + "秒后重试");
    };

    var setMsg = function (res) {
        if(res.hasErrors)
            return false;

        if(isNaN(parseInt(res.data))) {
            res.data = 0;
        }

        var count = res.data;
        var countObj = "";
        if(count > 99) countObj = "99+";
        else countObj = count;

        $("#msgcount").html(countObj);

        if(count <= 0){
            $(".kd-ydx").hide();
        }
        else{
            $(".kd-ydx").html(countObj);
            $(".kd-ydx").show();
        }
    };
</script>
