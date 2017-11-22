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
            <span>模板：</span>
            <select style="width: 150px;">
                <#if templates?? && (templates?size > 0)>
                    <#list templates as template>
                        <option value="${template.TEMPLATE_ID}">${template.TITLE}</option>
                    </#list>
                </#if>
            </select>
        </p>
        <textarea name="textarea" onkeyup="checkLen(this)" id="CONTENT" onpropertychange="try{checkLen(this)}catch(e){}"><#if templates?? && (templates?size > 0)><#list templates as template><#if template_index == 0 && template.CONTENT??>${template.CONTENT}</#if></#list></#if></textarea>
        <div>您还可以输入 <span id="count">60</span> 个文字</div>
        <p style="text-align: center;">
            <#--<input class="kd-bafa" style="margin-right:80px;;" type="button" value="保存"/>-->
            <input class="kd-bafa" type="button" value="发送" onclick="sendInvite();"/>
        </p>
    </div>
<script language="JavaScript">
    function sendInvite() {
        sendRequest(ctxPath + "/plant/teacher/api/sendinvite", {batchSend: parent.batchSend, content: $("#CONTENT").val()}, "POST", function (res) {
            if(res.hasErrors){
                showError(res.errorMessage);
                return false;
            }

            parent.showSuccess("发送成功！");
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        });
    }
</script>
</body>
</html>