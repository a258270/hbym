var sendRequest = function (url, param, ajaxType, successFn, errorFn) {
    url = ctxPath + url;
    if(url.indexOf("?") > 0) {
        url += "&ajax=true";
    }
    else{
        url += "?ajax=true";
    }
    param = param ? param : {};
    ajaxType = ajaxType ? ajaxType : "POST";
    //needFormPostCfg = needFormPostCfg ? needFormPostCfg : true;
    var loader;
    if(typeof(layer) != "undefined")
        loader = layer.load(0);
    return $.ajax({
        type : ajaxType,
        url : url,
        data : param,
        dataType : "json",
        success : function (res) {
            if(typeof(layer) != "undefined")
                layer.close(loader);
            if(res.errorCode == "-1"){
                location.replace(ctxPath + "/login");
                return false;
            }
            if(res.hasErrors){
                showError(res.errorMessage);
                return false;
            }
            if(typeof (successFn) != "undefined"){
                successFn(res);
            }
        },
        error : function (res) {
            layer.close(loader);
            showError("系统出错，请稍后重试，或联系管理员！");
            if(typeof (errroFn) != "undefined"){
                errorFn(res);
            }
        }
    });
};

var showError = function (message, url) {
    if(typeof(layer) != "undefined"){
        if(url) {
            layer.alert(message, {
                icon: 2,
                yes: function (index, layero) {
                    top.location.href = ctxPath + "/plant/user/center?p=" + url;
                    layer.close(index);
                }
            });
        }else{
            layer.alert(message, {icon: 2});
        }
    }

    else
        alert(message);
};

var showSuccess = function (message) {
    if(typeof(layer) != "undefined"){
        layer.alert(message, {icon: 1});
    }
    else
        alert(message);
};

var tableQuery = function (obj, params) {
    var url = obj.fnSettings().sAjaxSource;
    var paramInUrl = "";
    for(var name in params) {
        paramInUrl += "&" + name + "=" + params[name];
    }
    if(url.indexOf("?") == -1){
        url += "?ajax=true&now=" + Math.random();
    }
    else{
        url = url.substring(0, url.indexOf("?")) + "?ajax=true&now=" + Math.random();
    }

    url += paramInUrl;
    obj.fnSettings().sAjaxSource = url;
    obj.fnDraw();
};

var showWindow = function (title, url, width, height) {
    if(typeof (width) == "undefined" || width == null) {
        width = $(window).width() / 2;
    }
    if(typeof (height) == "undefined" || height == null) {
        height = $(window).height() / 2;
    }
    /*layer_show(title, url, width, height);*/
    //以下代码为layer_show方法源码，脱离h-ui依赖，所以特此独立写
    if (title == null || title == '') {
        title=false;
    };
    if (url == null || url == '') {
        url="404.html";
    };
    layer.open({
        type: 2,
        area: [width+'px', height +'px'],
        fix: false, //不固定
        maxmin: true,
        shade:0.4,
        title: title,
        content: url
    });
};

var getLocalTime = function (nS) {
    if(typeof (nS) == "undefined" || nS == null)
        return "";
    var now = new Date(nS);
    var year=now.getFullYear();
    var month=now.getMonth()+1;
    var date=now.getDate();
    var hour=now.getHours();
    var minute=now.getMinutes();
    var second=now.getSeconds();
    return   year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;
};


function myBrowser(){
    var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
    var isOpera = userAgent.indexOf("Opera") > -1;
    if (isOpera) {
        return "Opera"
    }; //判断是否Opera浏览器
    if (userAgent.indexOf("Firefox") > -1) {
        return "FF";
    } //判断是否Firefox浏览器
    if (userAgent.indexOf("Chrome") > -1){
        return "Chrome";
    }
    if (userAgent.indexOf("Safari") > -1) {
        return "Safari";
    } //判断是否Safari浏览器
    if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera) {
        return "IE";
    }; //判断是否IE浏览器
}