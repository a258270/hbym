<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/search/search.css?v=${v}"/>
    <script language="JavaScript">
        function checkLen(obj) {
            var maxChars = 60;//最多字符数
            if (obj.value.length > maxChars)  obj.value = obj.value.substring(0,maxChars);
            var curr = maxChars - obj.value.length;
            document.getElementById("count").innerHTML = curr.toString();
        }

        $(document).ready(function(){
            checkLen(document.getElementById("CONTENT"));
        });
    </script>
</head>
<body>
<div class="kd-dkua">
    <p>
        <span>模版：</span>
        <select style="width: 150px;" id="selectTemplate">
        <#if templates?? && (templates?size > 0)>
            <#list templates as template>
                <option value="${template.TEMPLATE_ID}" <#if template_index == 0>selected</#if>>${template.TITLE}</option>
            </#list>
        </#if>
        </select>
        <input class="kd-bafa" type="button" value="新增" style="margin-right: 10px;margin-left: 100px;" onclick="add();">
        <input class="kd-bafa" type="button" value="删除" onclick="remove();">
    </p>
    <textarea name="textarea" onkeyup="checkLen(this)" id="CONTENT"><#if templates?? && (templates?size > 0)><#list templates as template><#if template_index == 0 && template.CONTENT??>${template.CONTENT}</#if></#list></#if></textarea>
    <div>您还可以输入 <span id="count">60</span> 个文字</div>
    <p style="text-align: center;">
        <input class="kd-bafa" type="button" value="保存" onclick="saveTemplate();"/>
        <#--<input class="kd-bafa" type="button" value="发送"/>-->
    </p>
</div>
<script language="JavaScript">
    $(function () {
       $("#selectTemplate").change(function () {
           sendRequest(ctxPath + "/plant/teacher/api/detailstemplate", {TEMPLATE_ID: $(this).val()}, "POST", function (res) {
               if(res.hasErrors) {
                   showError(res.errorMessage);
                   return false;
               }
               if(res.CONTENT) {
                    $("#CONTENT").val(res.CONTENT);
               }
               else{
                   $("#CONTENT").val("");
               }
           });
       });
    });
    function add() {
        layer.prompt({title: '请输入模板名', formType: 0, maxlength: 10}, function(text, index){
            sendRequest(ctxPath + "/plant/teacher/api/addtemplate", {TITLE: text}, "POST", function (res) {
                if(res.hasErrors) {
                    showError(res.errorMessage);
                    return false;
                }

                $("#selectTemplate").html($("#selectTemplate").html() + "<option value='" + res.TEMPLATE_ID + "' selected>" + text + "</option>")
                $("#selectTemplate").val(res.TEMPLATE_ID);
                $("#CONTENT").val("");
                layer.close(index);
            });

        });
    }

    function remove() {
        var optionValue = $("#selectTemplate").find("option:selected").text();
        layer.confirm('是否确定删除 ' + optionValue + "？", function(index){
            sendRequest(ctxPath + "/plant/teacher/api/removetemplate", {TEMPLATE_ID: $("#selectTemplate").val()}, "POST", function (res) {
                if(res.hasErrors) {
                    showError(res.errorMessage);
                    return false;
                }

                /*var x=document.getElementById("selectTemplate");
                x.remove(x.selectedIndex);*/
                layer.close(index);
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            });
        });
    }

    <#if !(templates?? && (templates?size > 0))>
        showError("您当前无可用模板，请点击新增按钮以增加新的模板！");
    </#if>

    function saveTemplate() {
        if($("#CONTENT").val() != "") {
            sendRequest(ctxPath + "/plant/teacher/api/edittemplate", {TEMPLATE_ID: $("#selectTemplate").val(), CONTENT: $("#CONTENT").val()}, "POST", function (res) {
                if(res.hasErrors) {
                    showError(res.errorMessage);
                    return false;
                }

                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            });
        }
    }
</script>
</body>
</html>