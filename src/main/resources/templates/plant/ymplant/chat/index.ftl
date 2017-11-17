<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
<iframe src="${url}" style="width: 100%" id="information" onload="iFrameHeight();"scrolling="no"></iframe>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">
<script language="JavaScript">
    function iFrameHeight() {
        var ifm= document.getElementById("information");
        var subWeb = document.frames ? document.frames["information"].document :
                ifm.contentDocument;
        if(ifm != null && subWeb != null) {
            ifm.height = subWeb.body.scrollHeight;
        }
    }
</script>
</body>
</html>