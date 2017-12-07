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
            <h3 style="margin-bottom: 50px;">MBTI职业性格测试报告</h3>
            <div class="report">
                <span>
                    <img src="/static/ymplant/images/tubiao5/mbyi-${RESULT_1}.png" alt=""/>
                </span>
                <span>
                    <img src="/static/ymplant/images/tubiao5/mbyi-${RESULT_2}.png" alt=""/>
                </span>
                <span>
                    <img src="/static/ymplant/images/tubiao5/mbyi-${RESULT_3}.png" alt=""/>
                </span>
                <span>
                    <img src="/static/ymplant/images/tubiao5/mbyi-${RESULT_4}.png" alt=""/>
                </span>
                <div class="clear"></div>
                <p style="margin: 20px;">根据《MBTI职业性格测试》分析得出，您属于<span style="color: #FF7F27;">${result.RESULT_ID}</span>类型，具体分析报告如下：</p>
            </div>
            <div class="block">
                <div class="duction">
                    性格介绍
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/introduction.png" alt=""/>
                </div>
                <div class="content">
                    ${result.INTRODUCE}
                </div>
            </div>
            <div class="block">
                <div class="duction">
                    适合领域
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/field.png" alt=""/>
                </div>
                <div class="content">
                    <#if result.FIELD?? && result.FIELD != ''><p class="indent">${result.FIELD}</p><#else><p class="features">无明显领域特征</p></#if>
                </div>
            </div>
            <div class="block">
                <div class="duction">
                    适合职业
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/occupation.png" alt=""/>
                </div>
                <div class="content">
                    <#if result.JOB?? && result.JOB != ''><p class="indent">${result.JOB}</p><#else><p class="features">无明显职业特征</p></#if>
                </div>
            </div>
            <div class="block">
                <div class="duction special" style="padding: 5px 0 5px 50px;">
                    适合专业
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/occupation.png" alt=""/>
                    <ul class="nav nav-tabs" id="kd-xzhong" style="background-color: #33C9B5;" role="tablist">
                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">本科</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">专科</a></li>
                    </ul>
                </div>
                <div class="content tab-content">
                    <!--本科 开始-->
                    <table  role="tabpanel" id="home" class="tab-form tab-pane active">
                        <#list bmajors as bmajor>
                            <tr>
                                <#list bmajor as bmajorObj>
                                    <td style="text-align: center;">${bmajorObj.NAME}</td>
                                </#list>
                            </tr>
                        </#list>
                    </table>
                    <!--本科 结束-->
                    <!--专科 开始-->
                    <table  role="tabpanel" id="profile" class="tab-form tab-pane">
                    <#list zmajors as zmajor>
                        <tr>
                            <#list zmajor as zmajorObj>
                                <td style="text-align: center;">${zmajorObj.NAME}</td>
                            </#list>
                        </tr>
                    </#list>
                    </table>
                    <!--专科 结束-->
                </div>
            </div>
            <div class="block">
                <div class="duction">
                    团队中的表现
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/performance.png" alt=""/>
                </div>
                <div class="content">
                <#if result.CONTRIBUTION?? && result.CONTRIBUTION != ''><p class="indent">${result.CONTRIBUTION}</p><#else><p class="features">无明显团队中的表现</p></#if>
                </div>
            </div>
            <div class="block">
                <div class="duction">
                    管理风格
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/administration.png" alt=""/>
                </div>
                <div class="content">
                <#if result.LEADERSHIP?? && result.LEADERSHIP != ''><p class="indent">${result.LEADERSHIP}</p><#else><p class="features">无明显管理风格</p></#if>
                </div>
            </div>
            <div class="block">
                <div class="duction">
                    学习风格
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/administration.png" alt=""/>
                </div>
                <div class="content">
                <#if result.STUDY?? && result.STUDY != ''><p class="indent">${result.STUDY}</p><#else><p class="features">无明显学习风格</p></#if>
                </div>
            </div>
            <div class="block">
                <div class="duction">
                    解决问题的方式
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/solve.png" alt=""/>
                </div>
                <div class="content">
                <#if result.SOLVE?? && result.SOLVE != ''><p class="indent">${result.SOLVE}</p><#else><p class="features">无明显解决问题的方式</p></#if>
                </div>
            </div>
            <div class="block">
                <div class="duction">
                    适合的工作环境
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/science.png" alt=""/>
                </div>
                <div class="content">
                <#if result.ENVIRONMENT?? && result.ENVIRONMENT != ''><p class="indent">${result.ENVIRONMENT}</p><#else><p class="features">无明显适合的工作环境</p></#if>
                </div>
            </div>
            <div class="block">
                <div class="duction">
                    潜在缺点
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/shortcoming.png" alt=""/>
                </div>
                <div class="content">
                <#if result.BLEMISH?? && result.BLEMISH != ''><p class="indent">${result.BLEMISH}</p><#else><p class="features">无明显潜在缺点</p></#if>
                </div>
            </div>
            <div class="block">
                <div class="duction">
                    发展建议
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/development.png" alt=""/>
                </div>
                <div class="content">
                <#if result.PROPOSAL?? && result.PROPOSAL != ''><p class="indent">${result.PROPOSAL}</p><#else><p class="features">无明显潜在缺点</p></#if>
                </div>
            </div>
        </div>
    </div>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>