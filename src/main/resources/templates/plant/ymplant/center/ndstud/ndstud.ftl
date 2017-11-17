<!DOCTYPE html>
<html>
<head lang="en">

    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/ndstud/ndstud.css?v=${v}"/>
</head>
<body>
    <div class="kd-pli">
        <div class="container">
            <!--导航 开始-->
            <div style="padding: 30px 15px;border-bottom: 1px solid #7F7F7F">
                <input style="width: 80px;margin: 0;" class="kd-yshi" type="text" placeholder="最高分"/>
                <span>--</span>
                <input style="width: 80px;" class="kd-yshi" type="text" placeholder="最高分"/>
                <select style="width: 150px;" class="kd-yshi">
                    <option value="">北京</option>--
                    <option value="">天津</option>
                    <option value="">河北</option>
                    <option value="">河南</option>
                </select>
                <select style="width:80px;" class="kd-yshi">
                    <option value="" selected disabled>文/理</option>
                    <option value="">文科</option>
                    <option value="">理科</option>
                </select>
                <select class="kd-yshi">
                    <option value="" selected disabled>年龄</option>
                    <option value="">男</option>
                    <option value="">女</option>
                </select>
                <select class="kd-yshi">
                    <option value="" selected disabled>年龄</option>
                    <option value="">18</option>
                    <option value="">19</option>
                    <option value="">20</option>
                    <option value="">21</option>
                </select>
                <input class="kd-yshi" type="checkbox"/>在线
                <input class="kd-cz" type="button" value="查找"/>
            </div>
            <!--导航 结束-->
            <!--查找到的学生 开始-->
            <div class="kd-zxs">
                <select class="kd-yshi">
                    <option value="" selected disabled>批量操作</option>
                    <option value="">发送邀请（全部）</option>
                    <option value="">发送邀请（已选中）</option>
                    <option value="">发送邀请（未选中）</option>
                </select>
                <input class="kd-bji" type="button" value="编辑信息"/>
                <div class="row" style="padding: 15px 0;">
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="row" style="padding-bottom: 15px;">
                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0;">
                                <img class="kd-tpan" src="/static/ymplant/img/2.png" alt=""/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right: 0;">
                                <p style="color: #333;margin-bottom:7px;">昵称王大壮</p>
                                <p style="margin-bottom:7px;">
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">图</span>
                                    <span style="border-right: 1px solid #C1ABC1;padding-right: 10px;">江苏</span>
                                    <span>661</span>
                                </p>
                                <input class="kd-yqin" type="button" value="邀请"/>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0;">
                                <input type="checkbox"/>
                            </div>
                        </div>
                    </div>
                </div>
                <nav style="text-align: center">
                    <ul class="pagination">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <!--查找到的学生 结束-->
        </div>
    </div>
</body>
</html>