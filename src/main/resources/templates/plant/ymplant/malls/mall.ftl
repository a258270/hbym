<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/malls/malls.css?v=${v}">
    <script>
        $(document).ready(function(){
            $("#saoma").click(function(){
                $("#sma").hide();
                $("#czhi").show();
            });
            $("#wangyin").click(function(){
                $("#czhi").hide();
                $("#sma").show();
            })
        })
    </script>
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">

    <div class="mall">
        <div class="container">
            <!--顶部 banner 开始-->
            <div class="kd-banner">
                <img src="/static/ymplant/images/banner3.jpg" style="width: 100%;height: 300px" alt=""/>
            </div>
            <!--顶部 banner 结束-->
            <!--金币充值 开始-->
            <div class="gold">
                <div class="row" style="padding: 20px 0">
                    <div class="col-md-8">
                        <img src="/static/ymplant/images/tubiao/czhi.png" style="width: 100%" alt=""/>
                    </div>
                    <!--金币充值 隐藏 显示 开始-->
                    <div class="col-md-4 col-sm-4 col-xs-4">
                        <div class="chongz" id="sma">
                            <div class="row">
                                <div class="col-md-8 col-sm-8 col-xs-8">
                                    <div class="title">金币充值</div>
                                    <p>
                                        <span>我的余额:</span>
                                        <span>0金币</span>
                                    </p>
                                    <p>
                                       <span>充值账号：</span>
                                        <input type="text" style="width: 55%;border-radius: 4px;border: 1px solid #BBBBBB"/>
                                    </p>
                                    <p>
                                        <span>确认账号：</span>
                                        <input type="text" style="width: 55%;border-radius: 4px;border: 1px solid #BBBBBB"/>
                                    </p>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-4-" style="padding: 0">
                                    <img src="/static/ymplant/images/tubiao/gold.png" style="width: 100%" alt=""/>
                                </div>
                            </div>
                            <div class="face">
                                <p>
                                    <span>充值面值：</span>
                                    <a href="#" class="xze">100</a>
                                    <a href="#" class="xze">50</a>
                                    <a href="#" class="xze">10</a>
                                    <select>
                                        <option>其他面值</option>
                                        <option>200</option>
                                        <option>300</option>
                                        <option>400</option>
                                        <option>500</option>
                                    </select>
                                </p>
                                <p>
                                    <span>充值卡面值：</span>
                                    <input type="text" placeholder="请输入充值码" style="width:35%;"/>
                                </p>
                                <p>
                                    <span>实际价格：</span>
                                    <span style="color: #FF7401;font-size: 1.3em;font-weight: bold">￥49</span>
                                </p>
                                <p style="text-align: center">
                                    <input type="button" id="saoma" value="扫码充值" class="czq" style="margin-right: 30px"/>
                                    <input type="button" value="网银充值" class="czq"/>
                                </p>
                            </div>
                        </div>
                        <div class="ewima" id="czhi">
                            <img src="/static/ymplant/images/tubiao/code.png" alt=""/>
                            <p style="margin:15px 0;">请打开手机微信扫描二维码</p>
                            <input type="button" id="wangyin" value="网银充值" class="czq">
                        </div>
                    </div>
                    <!--金币充值 隐藏 显示 结束-->

                </div>
            </div>
            <!--金币充值 结束-->

            <!--活动套餐 开始-->
            <div class="package">
                <div class="activity">活动套餐</div>
                <div class="row">
                    <#if items?? && (items?size > 0)>
                    <#list items as item>
                    <article class="col-md-3 col-sm-3 col-xs-3 malld">
                        <figure>
                            <a href="${ctxPath}/plant/item/details/${item.ITEM_ID}">
                                <img src="${item.IMGURL}" alt="${item.NAME}">
                            </a>
                            <figcaption>
                                    <span class="package-price thbg-color df">
                                        ￥${item.PRICE}
                                    </span>
                                    <span class="fd">
                                    </span>
                                <div class="kd-bottomelement">
                                    <h5>
                                        <a href="${ctxPath}/plant/item/details/${item.ITEM_ID}">${item.NAME}</a>
                                    </h5>
                                    <div class="days-counter">
                                        <br>
                                        <a href="${ctxPath}/plant/item/details/${item.ITEM_ID}" class="zzz">购买</a>
                                    </div>
                                </div>
                            </figcaption>
                        </figure>
                    </article>
                    </#list>
                    <#else>
                        <article class="col-md-3 col-sm-3 col-xs-3 malld">
                            <figure>
                                <a href="javascript:void(0);">
                                    <img src="/static/ymplant/img/timg.png" alt="暂无信息">
                                </a>
                                <figcaption>
                                    <span class="package-price thbg-color df">
                                        暂无信息
                                    </span>
                                    <span class="fd">
                                    </span>
                                    <div class="kd-bottomelement">
                                        <h5>
                                            <a href="javascript:void(0);">暂无信息</a>
                                        </h5>
                                        <div class="days-counter">
                                            <br>
                                            <a href="javascript:void(0);" class="zzz">购买</a>
                                        </div>
                                    </div>
                                </figcaption>
                            </figure>
                        </article>
                    </#if>
                </div>
            </div>

            <!--活动套餐 结束-->

        </div>
    </div>

    <#include "${ctxPath}/plant/ymplant/bottom.ftl">
</body>
</html>