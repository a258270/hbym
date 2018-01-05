<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/malls/malls.css?v=${v}">
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">

    <div class="mallpage">
        <div class="container">
            <!--高考咨询平台 开始-->
            <div class="row" style="padding: 20px 0">
                <div class="col-md-9 col-sm-9 col-xs-9" style="padding-left: 0">
                    <div class="col-md-5 col-sm-5 col-xs-5">
                        <div style="border: 1px solid #ccc">
                            <img src="${item.IMGURL}" style="width: 100%" alt=""/>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-7 col-xs-7 cip">
                        <p style="font-weight: bold;font-size: 2em;margin:0;">${item.NAME}</p>
                        <p>
                            <span>类型：</span>
                            <a href="#" class="edition">高一版</a>
                            <a href="#" class="edition">高二版</a>
                            <a href="#" class="edition">高三版
                            <span>
                                <#if item.STORED??>
                                    <a href="javascript:void(0);" class="scang">已收藏</a>
                                <#else>
                                    <a href="javascript:void(0);" class="scang" onclick="storeUp('${item.ITEM_ID}');">+收藏</a>
                                </#if>
                            </span>
                        </p>
                        <p>
                            <span>数量：</span>
                            <a href="javascript:void(0);" class="sliang" onclick="dec();">-</a>
                            <input type="text" class="shul" id="count" value="1" />
                            <a href="javascript:void(0);" class="sliang" onclick="add();">+</a>
                        </p>
                        <p>
                            <span>金额：</span>
                            ￥<span style="font-size: 1.3em;color: #E1894A" id="price">${item.PRICE}</span>
                        </p>
                        <p style="margin-top: 32px;">
                            <input type="button" class="now" value="立即购买" onclick="buy();"/>
                            <input type="button" class="cart" value="加入购物车"/>
                        </p>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 30px">
                        <p style="font-size: 1.5em;font-weight: bold;padding: 0 15px;">商品简介</p>
                        <p style="border-top: 2px solid #93BAB9;padding: 15px 30px;text-indent: 2em;">
                            <#--${item.SUMMARY}-->啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                        </p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-5">
                    <div class="account">
                        <p class="accous">我的物品</p>
                        <div class="redx">
                            <p>
                                <span>剩余金币：</span>
                                <span>321个</span>
                            </p>
                            <#--<p>-->
                                <#--<span>院校咨询：</span>-->
                                <#--<span>20次</span>-->
                            <#--</p>-->
                            <#--<p>-->
                                <#--<span>专家咨询：</span>-->
                                <#--<span>200元代金券</span>-->
                            <#--</p>-->
                            <#--<p>-->
                                <#--<span>模拟填报（考前）：</span>-->
                                <#--<span>无限制</span>-->
                            <#--</p>-->
                            <#--<p>-->
                                <#--<span>模拟填报（考后）：</span>-->
                                <#--<span>1次</span>-->
                            <#--</p>-->
                            <#--<p>-->
                                <#--<span>智能推荐志愿：</span>-->
                                <#--<span>3次</span>-->
                            <#--</p>-->
                            <p>
                                <span>模拟填报卡：</span>
                                <span>20次</span>
                            </p>
                            <p>
                                <span>智能推荐卡：</span>
                                <span>200次</span>
                            </p>
                            <p>
                                <span>院校咨询卡：</span>
                                <span>200次</span>
                            </p>
                            <p>
                                <span>性格测试卡（普通版：</span>
                                <span>5次</span>
                            </p>
                            <p>
                                <span>性格测试卡（专业版）：</span>
                                <span>5次</span>
                            </p>
                        </div>
                        <div style="text-align: center;margin-top: 30px">
                            <input type="button" class="czhi" value="金币充值"/>
                        </div>
                    </div>
                </div>
            </div>
            <!--高考咨询平台 结束-->

            <!--功能介绍 开始-->
            <div class="row" style="padding: 0 30px 0 15px;">
                <p class="introduction">功能介绍</p>
                <p style="border-top: 2px solid #93BAB9"></p>
                <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 15px;">
                    <div class="col-md-3 col-sm-3 col-xs-3" style="margin-top: 5px">
                        <img src="/static/ymplant/images/tubiao/5.1.png" style="width: 100%" alt=""/>
                    </div>
                    <div class="col-md-8 col-sm-8 col-xs-8">
                        <p style="font-weight: bold;margin: 0;">功能介绍</p>
                        <p>习近平指出，当前中德关系保持高水平发展势头。</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 15px;">
                    <div class="col-md-3 col-sm-3 col-xs-3" style="margin-top: 5px">
                        <img src="/static/ymplant/images/tubiao/5.2.png" style="width: 100%" alt=""/>
                    </div>
                    <div class="col-md-8 col-sm-8 col-xs-8">
                        <p style="font-weight: bold;margin: 0;">功能介绍</p>
                        <p>习近平指出，当前中德关系保持高水平发展势头。</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 15px;">
                    <div class="col-md-3 col-sm-3 col-xs-3" style="margin-top: 5px">
                        <img src="/static/ymplant/images/tubiao/5.3.png" style="width: 100%" alt=""/>
                    </div>
                    <div class="col-md-8 col-sm-8 col-xs-8">
                        <p style="font-weight: bold;margin: 0;">功能介绍</p>
                        <p>习近平指出，当前中德关系保持高水平发展势头。</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 15px;">
                    <div class="col-md-3 col-sm-3 col-xs-3" style="margin-top: 5px">
                        <img src="/static/ymplant/images/tubiao/5.4.png" style="width: 100%" alt=""/>
                    </div>
                    <div class="col-md-8 col-sm-8 col-xs-8">
                        <p style="font-weight: bold;margin: 0;">功能介绍</p>
                        <p>习近平指出，当前中德关系保持高水平发展势头。</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 15px;">
                    <div class="col-md-3 col-sm-3 col-xs-3" style="margin-top: 5px">
                        <img src="/static/ymplant/images/tubiao/5.5.png" style="width: 100%" alt=""/>
                    </div>
                    <div class="col-md-8 col-sm-8 col-xs-8">
                        <p style="font-weight: bold;margin: 0;">功能介绍</p>
                        <p>习近平指出，当前中德关系保持高水平发展势头。</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 15px;">
                    <div class="col-md-3 col-sm-3 col-xs-3" style="margin-top: 5px">
                        <img src="/static/ymplant/images/tubiao/5.6.png" style="width: 100%" alt=""/>
                    </div>
                    <div class="col-md-8 col-sm-8 col-xs-8">
                        <p style="font-weight: bold;margin: 0;">功能介绍</p>
                        <p>习近平指出，当前中德关系保持高水平发展势头。</p>
                    </div>
                </div>
            </div>
            <!--功能介绍 结束-->

            <!--相关推荐 开始-->
            <div class="row">
                <p class="col-md-12 col-sm-12 col-xs-12 tjan">相关推荐</p>
                <#--<p class="col-md-6 col-sm-6 col-xs-6 qanwan">-->
                    <#--<a href="${ctxPath}/plant/item/mall">前往商城>></a>-->
                <#--</p>-->
                <#--<#if items?? && (items?size > 0)>-->
                <#--<#list items as itemObj>-->
                <#--<div class="col-md-3 col-sm-3 col-xs-3" style="text-align: center;margin-top: 10px;">-->
                    <#--<a href="${ctxPath}/plant/item/details/${itemObj.ITEM_ID}">-->
                        <#--<p>-->
                           <#--<img src="${itemObj.IMGURL}" style="width: 100%" alt=""/>-->
                        <#--</p>-->
                        <#--<p style="font-size: 1.3em;color:#AC3A30;margin: 0">${itemObj.NAME}</p>-->
                        <#--<p style="font-size: 1.2em;color:#BD9773;">￥${itemObj.PRICE}</p>-->
                    <#--</a>-->
                <#--</div>-->
                <#--</#list>-->
                <#--<#else>-->
                <#--<div class="col-md-3 col-sm-3 col-xs-3" style="text-align: center;margin-top: 10px;">-->
                    <#--<a href="javascript:void(0);">-->
                        <#--<p>-->
                            <#--<img src="/static/ymplant/img/timg.png" style="width: 100%" alt=""/>-->
                        <#--</p>-->
                        <#--<p style="font-size: 1.3em;color:#AC3A30;margin: 0">暂无信息</p>-->
                        <#--<p style="font-size: 1.2em;color:#BD9773;">暂无信息</p>-->
                    <#--</a>-->
                <#--</div>-->
                <#--</#if>-->
                <div class="row" style="margin-bottom: 20px;">
                    <div class="col-md-2 col-sm-2 col-xs-2">
                        <div class="mb-card-ku">
                            <img src="/static/ymplant/img/2.png" style="width: 100%" alt="">
                        </div>
                        <p class="mb-introduce">这里是介绍</p>
                        <p class="mb-price">
                            <span>200</span>
                            <span>金币</span>
                        </p>
                        <p style="text-align: center">
                        <#--<input type="button" class="mb-purchase" value="立即购买">-->
                            <a href="javascript:void (0);" class="mb-purchase">立即购买</a>
                        </p>
                    </div>
                </div>
            </div>
            <!--相关推荐 结束-->
        </div>
    </div>
<script language="JavaScript">
    function dec() {
        if(isNaN($("#count").val())) $("#count").val("1");

        if($("#count").val() > 1) $("#count").val($("#count").val() - 1);

        $("#price").text($("#count").val() * ${item.PRICE});
    }

    function add() {
        if(isNaN($("#count").val())) $("#count").val("1");

        $("#count").val(parseInt($("#count").val()) + 1);

        $("#price").text($("#count").val() * ${item.PRICE});
    }

    $(function () {
        $("#count").change(function () {
            $("#price").text($(this).val() * ${item.PRICE});
        });
    });

    function buy() {
        layer.confirm('您确定要购买' + $("#count").val() + '件，总共花费' + $("#count").val() * ${item.PRICE} + '元', {
            btn: ['确定','取消'], //按钮
            title: "提示"
        }, function(){
            sendRequest(ctxPath + "/plant/item/api/buy", {ITEM_ID: "${item.ITEM_ID}", COUNT: $("#count").val()}, "POST", function(res){
                if(res.hasErrors){
                    showError(res.errorMessage);
                    return false;
                }

                showSuccess("购买成功！");
            });
        });
    }

    var storeUp = function (id) {
        sendRequest(ctxPath + "/plant/item/api/storeup/" + id, {}, "POST", function (res) {
            if(res.hasErrors){
                showError(res.errorMessage);
                return false;
            }

            showSuccess("收藏成功！");
        });
    };
</script>

<#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>