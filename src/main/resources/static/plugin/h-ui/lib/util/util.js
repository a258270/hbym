var getCurrentTime = function () {
    var myDate = new Date();

    return myDate.getFullYear() +
        "-" + (myDate.getMonth() + 1) +
        "-" + myDate.getDate() +
        " " + myDate.getHours() +
        ":" + myDate.getMinutes() +
            ":" + myDate.getSeconds();
};

var toLocalTime = function (time) {
    var myDate = new Date(time);
    var year = myDate.getFullYear();
    var month = myDate.getMonth() + 1;
    var day = myDate.getDate();
    var hour = myDate.getHours();
    var minute = myDate.getMinutes();
    var second = myDate.getSeconds();

    if(month < 10) month = "0" + month;
    if(day < 10) day = "0" + day;
    if(hour < 10) hour = "0" + hour;
    if(minute < 10) minute = "0" + minute;
    if(second < 10) second = "0" + second;

    return myDate.getFullYear() +
        "-" + month +
        "-" + day +
        " " + hour +
        ":" + minute +
        ":" + second;
};

var toLocalDate = function (time) {
    var myDate = new Date(time);
    var year = myDate.getFullYear();
    var month = myDate.getMonth() + 1;
    var day = myDate.getDate();

    if(month < 10) month = "0" + month;
    if(day < 10) day = "0" + day;

    return year +
        "-" + month +
        "-" + day;
}