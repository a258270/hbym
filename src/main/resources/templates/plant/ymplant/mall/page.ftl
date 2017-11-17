<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/mall/page.css?v=${v}"/>
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
    <div class="kd-page">
        <div class="container">
            <div style="margin-bottom: 30px;">
                <img style="width: 100%;height: 300px;" src="/static/ymplant/images/banner3.jpg" alt=""/>
            </div>
            <div class="detail">
                <div class="xiangxi" style="text-align: center">
                    <span>详 &nbsp;细</span>
                </div>
                <#if item??>
                <div class="row">
                    <div class="col-md-9 col-sm-9 col-xs-9" style="padding-left: 45px">
                        <div class="row" style="margin-bottom: 40px;margin-top: 25px">
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <div class="gmai">
                                    <img src="${item.IMGURL}" style="width:100%" alt=""/>
                                </div>
                            </div>
                            <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left: 80px">
                                <div>
                                    <h3 style="font-family: 幼圆;font-weight: bold;margin-bottom: 20px;">${item.NAME}</h3>
                                    <h4 style="font-family: 微软雅黑;margin-bottom: 20px;">￥${item.PRICE}</h4>
                                    <p style="margin-bottom: 20px">
                                        <span>数量：</span>
                                        <input type="number" style="border-radius: 4px;border: 1px solid #BBBBBB;width: 10%;" value="1" min="1" id="COUNT" name="COUNT"/>
                                    </p>
                                    <p style="margin-bottom: 20px;">
                                        <span>金额：</span>
                                        <span id="totalPrice">${item.PRICE}</span>
                                    </p>
                                    <p style="text-align: right;padding-right: 80px;">
                                        <#if item.STORED??>
                                            <a class="collect" href="javascript:void(0);">已收藏</a>
                                        <#else>
                                            <a class="collect" href="javascript:void(0);" onclick="storeUp('${item.ITEM_ID}');">+收藏</a>
                                        </#if>
                                        <a href="javascript:void(0);" onclick="buy();" class="buy" style="margin-left: 20px">购买</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="abstract" style="margin-top: 85px;">
                            <h3 style="font-weight:bold;margin-bottom: 10px;font-size: 1.5em">商品简介</h3>
                            <div style="width: 91%;border-top: 1px solid #4AD8DC;padding: 30px;">
                                <ul class="jianjie">
                                    ${item.SUMMARY}
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <div class="account" style="line-height: 2;font-weight: bold">
                            <div class="zhanghu" style="margin-bottom: 20px;">
                                <h3 style="font-weight: bold">我的账户</h3>
                                <ul style="margin-left: 25px;">

                                    <li>会员卡（${hykBuyNumber}）</li>
                                    <li>咨询卡（${zxkBuyNumber}）</li>
                                    <li>专家卡（${zjkBuyNumber}）</li>
                                    <li>充值卡（${czkBuyNumber}）</li>
                                </ul>
                            </div>
                            <div class="zhanghu">
                                <h3 style="font-weight: bold">我的收藏</h3>
                                <ul style="margin-left: 25px;">
                                    <li>会员卡（${hykInterNumber}）</li>
                                    <li>咨询卡（${zxkInterNumber}）</li>
                                    <li>专家卡（${zjkInterNumber}）</li>
                                    <li>充值卡（${czkInterNumber}）</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                </#if>
        </div>

        <div class="recommend row">
            <div class="col-md-6 col-lg-6" style="font-weight:bold;margin-bottom: 10px;font-size: 1.5em;padding-left: 45px">相关推荐</div>
            <div class="col-md-6 col-lg-6" style="text-align: right;font-size: 1.5em;font-weight:bold;">
                <a href="${ctxPath}/plant/item/mall">更多>></a>
            </div>
        </div>
        <div class="xiangguan row">
            <#if items?? && (items?size > 0)>
            <#list items as item>
            <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 40px 65px 0 65px;">
                <a href="${ctxPath}/plant/item/details/${item.ITEM_ID}">
                <img src="${item.IMGURL}" style="width: 100%;margin-bottom: 20px;" alt="点击查看${item.NAME}"/>
                <div style="text-align:center;line-height:2;">
                    <h4 style="margin-bottom: 5px;">${item.NAME}</h4>
                    <h4>￥${item.PRICE}</h4>
                </div>
                </a>
            </div>
            </#list>
            <#else>
                <div class="col-md-4" style="padding: 40px;">
                    <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;margin-bottom: 20px;" alt="暂无信息"/>
                    <div style="margin-left: 50px;line-height:2;">
                        <h4 style="margin-bottom: 5px;">暂无信息</h4>
                    </div>
                </div>
                <div class="col-md-4" style="padding: 40px;">
                    <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;margin-bottom: 20px;" alt="暂无信息"/>
                    <div style="margin-left: 50px;line-height:2;">
                        <h4 style="margin-bottom: 5px;">暂无信息</h4>
                    </div>
                </div>
                <div class="col-md-4" style="padding: 40px;">
                    <img src="${ctxPath}/static/ymplant/img/timg.png" style="width: 100%;margin-bottom: 20px;" alt="暂无信息"/>
                    <div style="margin-left: 50px;line-height:2;">
                        <h4 style="margin-bottom: 5px;">暂无信息</h4>
                    </div>
                </div>
            </#if>
        </div>
        </div>
        <script language="JavaScript">
            $(function () {
               $("#COUNT").change(function () {
                   if($(this).val() > 0){
                       $("#totalPrice").text($(this).val() * ${item.PRICE});
                   }
               });
            });
            var storeUp = function (id) {
                sendRequest(ctxPath + "/plant/item/api/storeup/" + id, {}, "POST", function (res) {
                    if(res.hasErrors){
                        showError(res.errorMessage);
                        return false;
                    }

                    showSuccess("收藏成功！");
                });
            };
            
            var buy = function () {
                sendRequest(ctxPath + "/plant/item/api/buy", {ITEM_ID: "${item.ITEM_ID}"}, "POST", function(res){
                    if(res.hasErrors){
                        showError(res.errorMessage);
                        return false;
                    }
                    showSuccess("购买成功！");
                });
            };
        </script>
    <#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>