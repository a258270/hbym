// 表情 开始
$(document).ready(function () {
    var package="";
    for(var key in EmojiObj.map){
        package += "<img class='put' src='/static/ymplant/images/expression/" + EmojiObj.map[key] + "'>";
//                    console.log(EmojiObj.map[key]);
    }
    $(".dd1").html(package);
    $(".put").click(function(){
        var curSrc = $(this).attr("src");//获取src
        curSrc = curSrc.replace("/static/ymplant/images/expression/","");//整理出value
        for(var key in EmojiObj.map){//从上到下依次找value相同的项
            //判断value跟我整理的value一致不一致
            //如果一致择输出key
            //如果不一致 找下一个
            if(EmojiObj.map[key] == curSrc){
                // console.log("`1");
                $("#message").val($("#message").val() + key);
            }
        }
    });
});

var EmojiObj = {
    path: '../../images/faces/',
    map: {
        '[):]': 'ee_1.png',
        '[:D]': 'ee_2.png',
        '[;)]': 'ee_3.png',
        '[:-o]': 'ee_4.png',
        '[:p]': 'ee_5.png',
        '[(H)]': 'ee_6.png',
        '[:@]': 'ee_7.png',
        '[:s]': 'ee_8.png',
        '[:$]': 'ee_9.png',
        '[:(]': 'ee_10.png',
        '[:\'(]': 'ee_11.png',
        '[:|]': 'ee_12.png',
        '[(a)]': 'ee_13.png',
        '[8o|]': 'ee_14.png',
        '[8-|]': 'ee_15.png',
        '[+o(]': 'ee_16.png',
        '[<o)]': 'ee_17.png',
        '[|-)]': 'ee_18.png',
        '[*-)]': 'ee_19.png',
        '[:-#]': 'ee_20.png',
//                    '[del]': 'del.png',
        '[:-*]': 'ee_21.png',
        '[^o)]': 'ee_22.png',
        '[8-)]': 'ee_23.png',
        '[(|)]': 'ee_24.png',
        '[(u)]': 'ee_25.png',
        '[(S)]': 'ee_26.png',
        '[(*)]': 'ee_27.png',
        '[(#)]': 'ee_28.png',
        '[(R)]': 'ee_29.png',
        '[({)]': 'ee_30.png',
        '[(})]': 'ee_31.png',
        '[(k)]': 'ee_32.png',
        '[(F)]': 'ee_33.png',
        '[(D)]': 'ee_34.png',
        '[:\'(]': 'ee_11.png',
        '[:|]': 'ee_12.png',
        '[(a)]': 'ee_13.png',
        '[8o|]': 'ee_14.png',
        '[(D)]': 'ee_35.png',
        '[:s]': 'ee_8.png',
//                    '[del]': 'del.png'
    }
};

var parseEmoji = function (msg) {
    if (typeof EmojiObj === 'undefined' || typeof EmojiObj.map === 'undefined') {
        return msg;
    } else {
        var emoji = EmojiObj,
            reg = null;
        var msgList = [];
        var objList = [];
        for (var face in emoji.map) {
            if (emoji.map.hasOwnProperty(face)) {
                while (msg.indexOf(face) > -1) {
                    msg = msg.replace(face, "^" + emoji.map[face] + "^");
                }
            }
        }
        var ary = msg.split('^');
        var reg = /^e.*g$/;
        for (var i = 0; i < ary.length; i++) {
            if (ary[i] != '') {
                msgList.push(ary[i])
            }
        }
        for (var i = 0; i < msgList.length; i++) {
            if (reg.test(msgList[i])) {
                var obj = {};
                obj['data'] = msgList[i];
                obj['type'] = 'emoji';
                objList.push(obj);
            } else {
                var obj = {};
                obj['data'] = msgList[i];
                obj['type'] = 'txt';
                objList.push(obj);
            }
        }
        return objList;
    }
};
// 表情 结束
