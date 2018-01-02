<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/character-test/character-test.css?v=${v}">
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
<div class="container">
    <img src="/static/ymplant/img/chaeacter.png" style="width: 100%;" alt=""/>
    <div class="mbti">
        <h3 style="margin-bottom: 50px;">MBTI职业性格测试题--<#if flag == 'simple'>简单版</#if><#if flag == 'pro'>专业版</#if></h3>
        <#if subject??>
        <div class="problem">
            <p style="font-size: 18px;">哪一个答案能最贴切的描绘你一般的感受或行为？</p>
            <div>
                <p>${subject.MBTI_ID}、${subject.TITLE}</p>
                <form>
                    <#--<input class="choice btnA" type="submit" value="A ${subject.OPTION_A}"/>-->
                    <a href="javascript:void (0);" class="choice btnA">A&nbsp;&nbsp; ${subject.OPTION_A}</a>
                </form>
                <form>
                    <#--<input class="choice btnB" type="submit" value="B ${subject.OPTION_B}"/>-->
                    <a href="javascript:void (0);" class="choice btnB">B &nbsp;&nbsp;${subject.OPTION_B}</a>
                </form>
                <!--进度条 开始-->
                <div style="margin-top: 100px;">
                    <div class="left" style="font-size: 18px;">0</div>
                    <div class="progress">
                        <div class="progress-bar progress-bar-danger change" role="progressbar" aria-valuenow="${subject.MBTI_ID}" aria-valuemin="0" aria-valuemax="100" style="width: ${subject.MBTI_ID / mbtiCount * 100}%;">
                            <div class="move">
                                <div class="content-number">
                                    ${subject.MBTI_ID}
                                    <div class="triangle"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="left">${mbtiCount}</div>
                    <div class="clear"></div>
                </div>

                <!--进度条 结束-->
            </div>
        </div>
        </#if>
    </div>
</div>
<script language="JavaScript">
    <#if message??>
        showError("${message}");
    </#if>
    <#if subject??>
        $(function () {
            $(".btnA").click(function () {
                sendRequest("/plant/character/api/answer/${subject.MBTI_TYPE}", {answer: "A"}, "POST", function(res){
                    if(res.hasErrors){
                        showError(res.errorMessage);
                        return false;
                    }

                    window.location.reload();
                });
            });

            $(".btnB").click(function () {
                sendRequest("/plant/character/api/answer/${subject.MBTI_TYPE}", {answer: "B"}, "POST", function(res){
                    if(res.hasErrors){
                        showError(res.errorMessage);
                        return false;
                    }

                    window.location.reload();
                });
            });
        });
    </#if>
</script>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>