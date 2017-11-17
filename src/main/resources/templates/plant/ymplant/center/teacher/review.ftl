<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/teacher/center.css?v=${v}">
</head>
<body>
<div class="lan">
    <p>资料审核</p>
    <div class="row">
        <div class="col-md-2 col-sm-2 col-xs-2" style="padding: 20px;text-align: center">
        </div>
        <div class="col-md-10 col-sm-10 col-xs-10" style="padding: 20px">
            <div class="row">
                <div class="col-md-2 col-sm-2 col-xs-2">
                    <img src="/static/ymplant/img/jinggao.png" style="width: 80%;margin-bottom: 10px" alt="">
                </div>
                <div class="col-md-10 col-sm-10 col-xs-10" style="padding-left: 0">
                    <span style="float: left;margin-right: 10px">资料完整度</span>
                    <div class="progress" style="border-radius: 50px;">
                                    <span class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;background-color: #00C3D5">
                                        60%
                                    </span>
                    </div>
                </div>
                <p style="padding-left: 30px;">
                                    <span style="margin-right: 20px">
                                        <img src="/static/ymplant/img/4-1.png" style="width:4%;" alt=""/>
                                        实名未认证
                                    </span>
                                    <span style="margin-right: 20px">
                                        <img src="/static/ymplant/img/4-2.png" style="width:4%;" alt=""/>
                                        实名未认证
                                    </span>
                                    <span style="margin-right: 20px">
                                        <img src="/static/ymplant/img/4-3.png" style="width:4%;" alt=""/>
                                        绑定邮箱
                                    </span>
                                    <span>
                                        <img src="/static/ymplant/img/4-4.png" style="width:4%;" alt=""/>
                                        交易密码未设置
                                    </span>
            </div>
            </p>
            <p style="border-bottom:1px solid #CECECE;padding: 20px 0">
                <span>上传工作证：</span>
                <input style="outline: none;border-radius: 5px;border:1px solid #CECECE" type="text"/>
                <button style="    border: 1px solid #000;background-color: #F6F6F6;border-radius: 4px;margin:0 10px;">上传</button>
                <span style="color: #00CCCB;font-size: .5em">已上传，正在审核</span>
            </p>
            <p style="border-bottom:1px solid #CECECE;padding: 20px 0">
                <span>上传学校证明：</span>
                <input style="outline: none;border-radius: 5px;border:1px solid #CECECE" type="text"/>
                <button style="    border: 1px solid #000;background-color: #F6F6F6;border-radius: 4px;margin:0 10px;">上传</button>
                <span style="color: #00CCCB;font-size: .5em">已上传，正在审核</span>
            </p>
            <p style="border-bottom:1px solid #CECECE;padding: 20px 0">
                <span>教师资格证号：</span>
                <input style="outline: none;border-radius: 5px;border:1px solid #CECECE" type="text"/>
                <span style="color: #00CCCB;font-size: .5em">（注：没有教师资格证可不填）</span>
            </p>
            <p style="border-bottom:1px solid #CECECE;padding: 20px 0">
                <span>上传资格证：</span>
                <input style="outline: none;border-radius: 5px;border:1px solid #CECECE" type="text"/>
                <button style="    border: 1px solid #000;background-color: #F6F6F6;border-radius: 4px;margin:0 10px;">上传</button>
                <span style="color: #00CCCB;font-size: .5em">已上传，正在审核</span>
            </p>

            <p class="baocun" style="margin-left:160px;margin-top: 60px;">
                <button>保存修改</button>
            </p>
        </div>
    </div>
</div>
</body>
</html>