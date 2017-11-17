var getSMSCode = function () {

};

var toRegist = function () {
    $("#registForm")[0].reset();
    $("#registerModalbox").modal("show");
};

var registSuccessFn = function (res) {
    showSuccess("注册成功，请登录");
    $("#registerModalbox").modal("hide");
};

var loginSuccessFn = function (res) {
    window.location.reload();
};

var regist = function () {
    sendRequest(ctxPath + "/plant/api/toregist", {USERNAME: $("#reg_phone").val(), PASSWORD: $("#reg_password").val(), REPASSWORD: $("#reg_repassword").val(), CODE: $("#reg_code").val(), VIPCODE: $("#reg_vipcode").val()}, "POST", registSuccessFn)
};

var toLogin = function () {
    $("#loginForm")[0].reset();
    $("#loginModalbox").modal("show");
};

var login = function () {
    sendRequest(ctxPath + "/plant/api/tologin", {USERNAME: $("#login_phone").val(), PASSWORD: $("#login_password").val()}, "POST", loginSuccessFn);
};

var exit = function () {
    location.replace(ctxPath + "/logout");
};

var toUserCenter = function () {
    location.replace(ctxPath + "/plant/user/tocomplete");
};