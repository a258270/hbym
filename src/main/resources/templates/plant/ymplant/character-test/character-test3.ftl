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
                    <img src="/static/ymplant/images/tubiao5/mbyi-e.png" alt=""/>
                </span>
                <span>
                    <img src="/static/ymplant/images/tubiao5/mbyi-s.png" alt=""/>
                </span>
                <span>
                    <img src="/static/ymplant/images/tubiao5/mbyi-t.png" alt=""/>
                </span>
                <span>
                    <img src="/static/ymplant/images/tubiao5/mbyi-j.png" alt=""/>
                </span>
                <div class="clear"></div>
                <p style="margin: 20px;">根据《MBTI职业性格测试》分析得出，您属于<span style="color: #FF7F27;">ESTJ</span>类型，具体分析报告如下：</p>
            </div>
            <div class="block">
                <div class="duction">
                    性格介绍
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/introduction.png" alt=""/>
                </div>
                <div class="content">
                    <p class="indent">ESTJ高效率地工作，自我负责，监督他人工作，合理分配和处置资源，主次分明，井井有条，能制定和遵守规则，多喜欢在制度健全、等级分明、比较稳定的企业工作，倾向于选择较为务实的业务，以有形产品为主，喜欢工作中带有和人接触、交流的成分，但不以态度取胜：不特别强调工作的行业或兴趣，多以职业角度看待每一份工作。</p>
                    <p class="indent">ESTJ型的人很善于完成任务，他们喜欢操纵局势和促使事情发生，他们具有责任感信守他们的承诺。他们喜欢条理性并且能记住和组织安排许多细节。他们及时和尽可能高效率地、系统地开始达到目标。</p>
                    <p class="indent">ESTJ型的人被迫做决定。他们常常以自己过去的经历为基础得出结论。他们很客观，有条理性和分析能力，以及很强的推理能力。事实上，除了符合逻辑外，其他没有什么可以使他们信服。</p>
                    <p class="indent">同时，ESTJ型的人又很现实、有头脑、讲求实际。他们更感兴趣的是“真实的事物”，而不是诸如抽象的想法和理论等无形的东西。他们往往对那些认为没有实用价值的东西不感兴趣。他们知道自己周围将要发生的事情，而首要关心的则是目前。</p>
                    <p class="indent">因为ESTJ型的人依照一套固定的规则生活，所以他们坚持不懈和值得依赖。他们往往很传统，有兴趣维护现存的制度。虽然对于他们来说，感情生活和社会活动并不像生活的其他方面那样重要，但是对于亲情关系，他们却固守不变。他们不但能很轻松地判断别人，而且还是条理分明的纪律执行者。</p>
                    <p class="indent">ESTJ型的人直爽坦率，友善合群。通常他们会很容易地了解事物，这是因为他们相信“你看到的便是你得到的”。</p>
                </div>
            </div>
            <div class="block">
                <div class="duction">
                    适合领域
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/field.png" alt=""/>
                </div>
                <div class="content">
                    <p class="features">无明显领域特征</p>
                    <!--<p class="indent">有特征 显示indent 这个class 没有显示features</p>-->
                </div>
            </div>
            <div class="block">
                <div class="duction">
                    适合职业
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/occupation.png" alt=""/>
                </div>
                <div class="content">
                    <table class="tab-form">
                        <tr>
                            <td>大、中型外资企业员工</td>
                            <td>业务经理</td>
                            <td>中层经理</td>
                            <td>多分布在财务</td>
                        </tr>
                        <tr>
                            <td>营运</td>
                            <td>物流采购</td>
                            <td>销售管理</td>
                            <td>项目管理</td>
                        </tr>
                        <tr>
                            <td>工厂管理</td>
                            <td>人事行政部门</td>
                            <td>职业经理人</td>
                            <td>各类中小型企业主管和业主</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="block">
                <div class="duction special" style="padding: 5px 0 5px 50px;">
                    适合专业
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/occupation.png" alt=""/>
                    <ul class="nav nav-tabs" id="kd-xzhong" style="background-color: #33C9B5;" role="tablist">
                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">本一</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">本二</a></li>
                    </ul>
                </div>
                <div class="content tab-content">
                    <!--本科 开始-->
                    <table  role="tabpanel" id="home" class="tab-form tab-pane active">
                        <tr>
                            <td>国际金融</td>
                            <td>金融管理</td>
                            <td>互联网金融</td>
                            <td>国际经济与贸易</td>
                        </tr>
                        <tr>
                            <td>工商管理</td>
                            <td>行政管理</td>
                            <td>公共事业管理</td>
                            <td>酒店管理</td>
                        </tr>
                        <tr>
                            <td>旅游管理</td>
                            <td>会展经济与管理</td>
                            <td>采购管理</td>
                            <td>人力资源管理</td>
                        </tr>
                        <tr>
                            <td>经济学</td>
                            <td>经济统计学</td>
                            <td>财政学</td>
                            <td>税收学</td>
                        </tr>
                        <tr>
                            <td>金融学</td>
                            <td>金融工程</td>
                            <td>会计学</td>
                            <td>财务管理</td>
                        </tr>
                        <tr>
                            <td>房地产开发与管理</td>
                            <td>管理科学</td>
                            <td>市场营销</td>
                            <td>资产评估</td>
                        </tr>
                        <tr>
                            <td>物业管理</td>
                            <td>文化产业管理</td>
                            <td>保险学</td>
                            <td>统计学</td>
                        </tr>
                        <tr>
                            <td>信息资源管理</td>
                            <td>软件工程</td>
                            <td>网络工程</td>
                            <td>网络工程</td>
                        </tr>
                        <tr>
                            <td>信息管理与信息系统</td>
                            <td>工程管理</td>
                            <td>工程造价</td>
                            <td>国际商务</td>
                        </tr>
                        <tr>
                            <td>审计学</td>
                            <td>药学</td>
                            <td>药物制剂</td>
                            <td>中药学</td>
                        </tr>
                    </table>
                    <!--本科 结束-->
                    <!--专科 开始-->
                    <table  role="tabpanel" id="profile" class="tab-form tab-pane">
                        <tr>
                            <td>商务管理</td>
                            <td>工商企业管理</td>
                            <td>连锁经营管理</td>
                            <td>财务管理</td>
                        </tr>
                        <tr>
                            <td>金融管理</td>
                            <td>行政管理</td>
                            <td>人力资源管理</td>
                            <td>财政</td>
                        </tr>
                        <tr>
                            <td>税务</td>
                            <td>资产评估与管理</td>
                            <td>国际金融</td>
                            <td>投资与理财</td>
                        </tr>
                        <tr>
                            <td>会计</td>
                            <td>房地产经营与管理</td>
                            <td>房地产检测与估计</td>
                            <td>市场管理与服务</td>
                        </tr>
                        <tr>
                            <td>市场营销</td>
                            <td>品牌代理经营</td>
                            <td>信托与租赁</td>
                            <td></td>
                        </tr>
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
                    <ul style="padding-left: 20px;">
                        <li class="indent">事先察觉、指出、修正不足之处</li>
                        <li class="indent">以逻辑的、客观的方式评论规划</li>
                        <li class="indent">组织规划、生产、人力要素，实现组织目标</li>
                        <li class="indent">监督工作以确保任务正确完成</li>
                        <li class="indent">以逐步进行的方式坚持到底领导模式</li>
                        <li class="indent">直接领导，快速管理</li>
                        <li class="indent">运用过去经验解决问题</li>
                        <li class="indent">直接、明确地识别问题的核心</li>
                        <li class="indent">决策和执行决策非常迅速</li>
                        <li class="indent">传统型领导，尊重组织内部的等级和组织获得的成就学习模式</li>
                        <li  class="indent">积极主动型，学习间接经验，采用结构化的学习方式</li>
                        <li class="indent">实际型，关注他们能运用的学习内容</li>
                    </ul>
                </div>
            </div>
            <div class="block">
                <div class="duction">
                    管理风格
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/administration.png" alt=""/>
                </div>
                <div class="content">
                    <ul style="padding-left: 20px;">
                        <li class="indent">直接领导，快速管理</li>
                        <li class="indent">运用过去经验解决问题</li>
                        <li class="indent">直接、明确地识别问题的核心</li>
                        <li class="indent">决策和执行决策非常迅速</li>
                        <li class="indent">传统型领导，尊重组织内部的等级和组织获得的成就</li>
                    </ul>
                </div>
            </div>
            <div class="block">
                <div class="duction">
                    学习风格
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/administration.png" alt=""/>
                </div>
                <div class="content">
                    <ul style="padding-left: 20px;">
                        <li class="indent">积极主动型，学习间接经验，采用结构化的学习方式</li>
                        <li class="indent">实际型，关注他们能运用的学习内容 </li>
                    </ul>
                </div>
            </div>
            <div class="block">
                <div class="duction">
                    解决问题的方式
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/solve.png" alt=""/>
                </div>
                <div class="content">
                    <ul style="padding-left: 20px;">
                        <li class="indent">喜欢根据相关的事实和细节进行逻辑分析，从而控 制情境</li>
                        <li class="indent">为达到理想结果，会考虑更广阔的前景以及对人们和自己的影响</li>
                    </ul>
                </div>
            </div>
            <div class="block">
                <div class="duction">
                    适合的工作环境
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/science.png" alt=""/>
                </div>
                <div class="content">
                    <ul style="padding-left: 20px;">
                        <li class="indent">喜欢与努力工作、有坚定决心把工作做好的人共事</li>
                        <li class="indent">任务型定向的环境</li>
                        <li class="indent">有组织和组织结构的环境</li>
                        <li class="indent">有团队计划的环境</li>
                        <li class="indent">提供稳定性和预测性的环境</li>
                        <li class="indent">致力于绩效和生产性的环境</li>
                        <li class="indent">奖励完成目标的环境</li>
                    </ul>
                </div>
            </div>
            <div class="block">
                <div class="duction">
                    潜在缺点
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/shortcoming.png" alt=""/>
                </div>
                <div class="content">
                    <ul style="padding-left: 20px;">
                        <li class="indent">决策太迅速，也给他人施以同样的压力</li>
                        <li class="indent">不能察觉变革的需要，因为相信一切都在正常运作</li>
                        <li class="indent">在完成任务过程中，忽视人际间的小细节</li>
                        <li class="indent">长期忽视自己的感受和准则，可能会被自己的情感击跨</li>
                    </ul>
                </div>
            </div>
            <div class="block">
                <div class="duction">
                    发展建议
                    <img class="small-icons" src="/static/ymplant/images/tubiao5/development.png" alt=""/>
                </div>
                <div class="content">
                    <ul style="padding-left: 20px;">
                        <li class="indent">决策之前需考虑各种因素，包括人的因素</li>
                        <li class="indent">需要促使自己看到他人要求变革而获得的利益</li>
                        <li class="indent">需做特别的努力学会赞赏别人</li>
                        <li class="indent">需从工作中抽点时间考虑和识别自己的情感和价值观</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>