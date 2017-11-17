<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/search/search.css?v=${v}"/>
</head>
<body>
<div class="kd-dkua">
    <p>
        <span>模版：</span>
        <select style="width: 150px;" id="selectTemplate">
            <option value="">默认</option>
            <option value="">模版一</option>
            <option value="">模版二</option>
        </select>
        <input class="kd-bafa" type="button" value="新增" style="margin-right: 10px;margin-left: 100px;" onclick="add();">
        <input class="kd-bafa" type="button" value="删除" onclick="remove();">
    </p>
    <textarea name="textarea" id="input1" onpropertychange="try{textCounter(this,1000)}catch(e){}" onkeypress="return keypress(event);" onkeydown="return keydown(event)"></textarea>
    <p style="text-align: center;">
        <input class="kd-bafa" type="button" value="保存"/>
        <#--<input class="kd-bafa" type="button" value="发送"/>-->
    </p>
</div>
<script language="JavaScript">
    function add() {
        layer.prompt({title: '请输入模板名', formType: 0, maxlength: 10}, function(text, index){
            $("#selectTemplate").html($("#selectTemplate").html() + "<option value='22'>" + text + "</option>")
            $("#selectTemplate").val("22");
            layer.close(index);
        });
    }

    function remove() {
        var optionValue = $("#selectTemplate").find("option:selected").text();
        layer.confirm('是否确定删除 ' + optionValue + "？", function(index){
            layer.close(index);
        });
    }
</script>
</body>
</html>