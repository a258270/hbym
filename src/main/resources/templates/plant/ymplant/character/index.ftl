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
            <h3>MBTI职业性格测试题-测试前须知</h3>
            <p>1、参加测试的人员请务必诚实、独立地回答问题，只有如此，才能得到有效的结果。</p>
            <p>2、《性格分析报告》展示的是你的性格倾向，而不是你的知识、技能、经验。</p>
            <p>3、MBTI提供的性格类型描述仅供测试者确定自己的性格类型之用，性格类型没有好坏，只有不同。每一种性格特征都有其价值和优点，也有缺点和需要注意的地方。清楚地了解自己的性格优劣势，有利于更好地发挥自己的特长，而尽可能的在为人处事中避免自己性格中的劣势，更好地和他人相处，更好地作重要的决策。</p>
            <p>4、本测试分为四部分，共93题；需时约18分钟。所有题目没有对错之分，请根据自己的实际情况选择。只要你是认真、真实地填写了测试问卷，那么通常情况下你都能得到一个确实和你的性格相匹配的类型。希望你能从中或多或少地获得一些有益的信息。</p>
            <div style="text-align: center;margin-top: 50px;margin-bottom: 100px;">
                <a class="simple-but" href="${ctxPath}/plant/character/simple">简单版</a>

                <a class="simple-but" href="${ctxPath}/plant/character/pro">专业版</a>

            </div>
            <h3>MBTI职业性格测试简介</h3>
            <p>心理学中，性格指一个人在一定情况下所作行为反应的特质，即人们在生活、工作中独特的行为表现，包括思考方式、决策方式等。</p>
            <p>世界上关于性格理论的划分有很多种，本测评采用目前国际上最流行、在企业中应用最广泛的MBTI理论。</p>
            <p>MBTI全名MyersBriggsTypeIndicator.是人类性格的外在状态模式。</p>
            <p>MBTI的人格类型分为四个维度，每个维度有两个方向，共计八个方面，即共有八种人格特点，具体如下：</p>
            <table>
                <tr>
                    <td style="padding-right: 30px;padding-left: 30px;">·态度倾向(我们与世界相互作用方式):</td>
                    <td style="padding-right: 5px;">外向Extraversion(E)</td>
                    <td style="padding-right: 5px;"><----------------------------></td>
                    <td>内向Introversion(I)</td>
                </tr>
                <tr>
                    <td style="padding-left: 30px;">·接受信息(我们获取信息的主要方式):</td>
                    <td>感觉Sensing(S)</td>
                    <td><----------------------------></td>
                    <td>直觉iNtuition(N)</td>
                </tr>
                <tr>
                    <td style="padding-left: 30px;">·处理信息(我们的决策方式):</td>
                    <td>思考Thinking(T)</td>
                    <td><----------------------------></td>
                    <td>情感Feeling(F)</td>
                </tr>
                <tr>
                    <td style="padding-left: 30px;">·行动方式(我们的做事方式):</td>
                    <td>判断Judging(J)</td>
                    <td><----------------------------></td>
                    <td>知觉Perceiving(P)</td>
                </tr>
            </table>
            <p>在以上四个维度上，每个人都会有自己天生就具有的倾向性，也就是说，处在两个方向分界点的这边或那边，我们称之为“偏好”。例如：如果你落在外向的那边，称为“你具有外向的偏好”；如果你落在内向的那边，称为“你具有内向的偏好”。</p>
            <p>在现实生活中，每个维度的两个方面你都会用到，只是其中的一个方面你用的更频繁、更舒适，就好像每个人都会用到左手和右手，习惯用左手的人是左撇子，习惯用右手的人是右撇子。同样，在四个维度上你用的最频繁、最熟练的那种方式就是你在这个维度上的偏好，而这四个偏好加以组合，就形成了你的人格类型，它反映了你在一系列心理过程和行为方式上的特点。</p>
        </div>
        <script>
            <#--ls:前台提示-->
                <#if message??>
                    showError("${message}");
                </#if>

        </script>
    </div>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">


</body>
</html>