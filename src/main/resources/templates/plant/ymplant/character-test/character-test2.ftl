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
        <h3 style="margin-bottom: 50px;">MBTI职业性格测试题--专业版</h3>
        <div class="problem">
            <p style="font-size: 18px;">哪一个答案能最贴切的描绘你一般的感受或行为？</p>
            <div>
                <p>1、当你要外出一整天，你会</p>
                <form>
                    <input class="choice" type="submit" value="A 计划你要做什么和在什么时候做"/>
                </form>
                <form>
                    <input class="choice" type="submit" value="B 说去就去"/>
                </form>
                <!--进度条 开始-->
                <div style="margin-top: 100px;">
                    <div class="left" style="font-size: 18px;">0</div>
                    <div class="progress">
                        <div class="progress-bar progress-bar-danger change" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                            <div class="move">
                                <div class="content-number">
                                    60
                                    <div class="triangle"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="left">93</div>
                    <div class="clear"></div>
                </div>

                <!--进度条 结束-->
            </div>
        </div>
    </div>
</div>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>