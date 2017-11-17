<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/mall/mall.css?v=${v}"/>
</head>
<body>
<#include "${ctxPath}/plant/ymplant/top.ftl">
    <div class="kd-base">
        <div class="container">
            <div style="margin-bottom: 30px;">
                <img style="width: 100%;height: 300px;" src="/static/ymplant/images/banner3.jpg" alt=""/>
            </div>
            <!--会员卡 开始-->
            <div class="card row">
                <div class="huiyuan">
                    <h4>会员卡</h4>
                </div>
                <#if hyks?? && (hyks?size > 0)>
                <#list hyks as hyk>
                <div style="margin-bottom: 20px;" class="col-md-4 col-lg-4">
                    <div class="members row">
                        <a href="${ctxPath}/plant/item/details/${hyk.ITEM_ID}">
                            <div class="col-md-6 col-lg-6">
                                <img src="${hyk.IMGURL}" alt="" style="width: 100%"/>
                            </div>
                        </a>
                        <div class="col-md-6 col-lg-6">
                            <p style="font-family: 幼圆;font-weight: bold;margin-bottom: 20px;">${hyk.NAME}</p>
                            <h4 style="font-family: 微软雅黑;margin-bottom: 45px;color:#4E87E1;font-size: 1em">￥${hyk.PRICE}</h4>
                            <#if hyk.STORED??>
                            <a class="collect" href="javascript:void(0);">已收藏</a>
                            <#else>
                            <a class="collect" href="javascript:void(0);" onclick="storeUp('${hyk.ITEM_ID}');">+收藏</a>
                            </#if>
                            <a href="${ctxPath}/plant/item/details/${hyk.ITEM_ID}" class="buy">购买</a>
                        </div>
                    </div>
                </div>
                </#list>
                <#else>
                <div style="margin-bottom: 20px;" class="col-md-4 col-lg-4">
                    <div class="members row">
                        <div class="col-md-6 col-lg-6">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" alt="" style="width: 100%"/>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <p style="font-family: 幼圆;font-weight: bold;margin-bottom: 20px;">暂无信息</p>
                            <h4 style="font-family: 微软雅黑;margin-bottom: 45px;color:#4E87E1;font-size: 1em">暂无信息</h4>
                        </div>
                    </div>
                </div>
                    <div style="margin-bottom: 20px;" class="col-md-4 col-lg-4">
                        <div class="members row">
                            <div class="col-md-6 col-lg-6">
                                <img src="${ctxPath}/static/ymplant/img/timg.png" alt="" style="width: 100%"/>
                            </div>
                            <div class="col-md-6 col-lg-6">
                                <p style="font-family: 幼圆;font-weight: bold;margin-bottom: 20px;">暂无信息</p>
                                <h4 style="font-family: 微软雅黑;margin-bottom: 45px;color:#4E87E1;font-size: 1em">暂无信息</h4>
                            </div>
                        </div>
                    </div>
                    <div style="margin-bottom: 20px;" class="col-md-4 col-lg-4">
                        <div class="members row">
                            <div class="col-md-6 col-lg-6">
                                <img src="${ctxPath}/static/ymplant/img/timg.png" alt="" style="width: 100%"/>
                            </div>
                            <div class="col-md-6 col-lg-6">
                                <p style="font-family: 幼圆;font-weight: bold;margin-bottom: 20px;">暂无信息</p>
                                <h4 style="font-family: 微软雅黑;margin-bottom: 45px;color:#4E87E1;font-size: 1em">暂无信息</h4>
                            </div>
                        </div>
                    </div>
                </#if>
            </div>
            <!--会员卡 结束-->

            <!--专家卡 开始-->
            <div class="card row">
                <div class="huiyuan">
                    <h4>专家卡</h4>
                </div>
            <#if zjks?? && (zjks?size > 0)>
                <#list zjks as zjk>
                    <div style="margin-bottom: 20px;" class="col-md-4 col-lg-4">
                        <div class="members row">
                            <a href="${ctxPath}/plant/item/details/${zjk.ITEM_ID}">
                                <div class="col-md-6 col-lg-6">
                                    <img src="${zjk.IMGURL}" alt="" style="width: 100%"/>
                                </div>
                            </a>
                            <div class="col-md-6 col-lg-6">
                                <p style="font-family: 幼圆;font-weight: bold;margin-bottom: 20px;">${zjk.NAME}</p>
                                <h4 style="font-family: 微软雅黑;margin-bottom: 45px;color:#4E87E1;font-size: 1em">￥${zjk.PRICE}</h4>
                                <#if zjk.STORED??>
                                    <a class="collect" href="javascript:void(0);">已收藏</a>
                                <#else>
                                    <a class="collect" href="javascript:void(0);" onclick="storeUp('${zjk.ITEM_ID}');">+收藏</a>
                                </#if>
                                <a href="${ctxPath}/plant/item/details/${zjk.ITEM_ID}" class="buy">购买</a>
                            </div>
                        </div>
                    </div>
                </#list>
            <#else>
                <div style="margin-bottom: 20px;" class="col-md-4 col-lg-4">
                    <div class="members row">
                        <div class="col-md-6 col-lg-6">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" alt="" style="width: 100%"/>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <p style="font-family: 幼圆;font-weight: bold;margin-bottom: 20px;">暂无信息</p>
                            <h4 style="font-family: 微软雅黑;margin-bottom: 45px;color:#4E87E1;font-size: 1em">暂无信息</h4>
                        </div>
                    </div>
                </div>
                <div style="margin-bottom: 20px;" class="col-md-4 col-lg-4">
                    <div class="members row">
                        <div class="col-md-6 col-lg-6">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" alt="" style="width: 100%"/>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <p style="font-family: 幼圆;font-weight: bold;margin-bottom: 20px;">暂无信息</p>
                            <h4 style="font-family: 微软雅黑;margin-bottom: 45px;color:#4E87E1;font-size: 1em">暂无信息</h4>
                        </div>
                    </div>
                </div>
                <div style="margin-bottom: 20px;" class="col-md-4 col-lg-4">
                    <div class="members row">
                        <div class="col-md-6 col-lg-6">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" alt="" style="width: 100%"/>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <p style="font-family: 幼圆;font-weight: bold;margin-bottom: 20px;">暂无信息</p>
                            <h4 style="font-family: 微软雅黑;margin-bottom: 45px;color:#4E87E1;font-size: 1em">暂无信息</h4>
                        </div>
                    </div>
                </div>
            </#if>
            </div>
            <!--专家卡 结束-->

            <!--咨询卡 开始-->
            <div class="card row">
                <div class="huiyuan">
                    <h4>咨询卡</h4>
                </div>
            <#if zxks?? && (zxks?size > 0)>
                <#list zxks as zxk>
                    <div style="margin-bottom: 20px;" class="col-md-4 col-lg-4">
                        <div class="members row">
                            <a href="${ctxPath}/plant/item/details/${zxk.ITEM_ID}">
                                <div class="col-md-6 col-lg-6">
                                    <img src="${zxk.IMGURL}" alt="" style="width: 100%"/>
                                </div>
                            </a>
                            <div class="col-md-6 col-lg-6">
                                <p style="font-family: 幼圆;font-weight: bold;margin-bottom: 20px;">${zxk.NAME}</p>
                                <h4 style="font-family: 微软雅黑;margin-bottom: 45px;color:#4E87E1;font-size: 1em">￥${zxk.PRICE}</h4>
                                <#if zxk.STORED??>
                                    <a class="collect" href="javascript:void(0);">已收藏</a>
                                <#else>
                                    <a class="collect" href="javascript:void(0);" onclick="storeUp('${zxk.ITEM_ID}');">+收藏</a>
                                </#if>
                                <a href="${ctxPath}/plant/item/details/${zxk.ITEM_ID}" class="buy">购买</a>
                            </div>
                        </div>
                    </div>
                </#list>
            <#else>
                <div style="margin-bottom: 20px;" class="col-md-4 col-lg-4">
                    <div class="members row">
                        <div class="col-md-6 col-lg-6">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" alt="" style="width: 100%"/>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <p style="font-family: 幼圆;font-weight: bold;margin-bottom: 20px;">暂无信息</p>
                            <h4 style="font-family: 微软雅黑;margin-bottom: 45px;color:#4E87E1;font-size: 1em">暂无信息</h4>
                        </div>
                    </div>
                </div>
                <div style="margin-bottom: 20px;" class="col-md-4 col-lg-4">
                    <div class="members row">
                        <div class="col-md-6 col-lg-6">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" alt="" style="width: 100%"/>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <p style="font-family: 幼圆;font-weight: bold;margin-bottom: 20px;">暂无信息</p>
                            <h4 style="font-family: 微软雅黑;margin-bottom: 45px;color:#4E87E1;font-size: 1em">暂无信息</h4>
                        </div>
                    </div>
                </div>
                <div style="margin-bottom: 20px;" class="col-md-4 col-lg-4">
                    <div class="members row">
                        <div class="col-md-6 col-lg-6">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" alt="" style="width: 100%"/>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <p style="font-family: 幼圆;font-weight: bold;margin-bottom: 20px;">暂无信息</p>
                            <h4 style="font-family: 微软雅黑;margin-bottom: 45px;color:#4E87E1;font-size: 1em">暂无信息</h4>
                        </div>
                    </div>
                </div>
            </#if>
            </div>
            <!--咨询卡 结束-->

            <!--充值卡 开始-->
            <div class="card row">
                <div class="huiyuan">
                    <h4>充值卡</h4>
                </div>
            <#if czks?? && (czks?size > 0)>
                <#list czks as czk>
                    <div style="margin-bottom: 20px;" class="col-md-4 col-lg-4">
                        <div class="members row">
                            <a href="${ctxPath}/plant/item/details/${czk.ITEM_ID}">
                                <div class="col-md-6 col-lg-6">
                                    <img src="${czk.IMGURL}" alt="" style="width: 100%"/>
                                </div>
                            </a>
                            <div class="col-md-6 col-lg-6">
                                <p style="font-family: 幼圆;font-weight: bold;margin-bottom: 20px;">${czk.NAME}</p>
                                <h4 style="font-family: 微软雅黑;margin-bottom: 45px;color:#4E87E1;font-size: 1em">￥${czk.PRICE}</h4>
                                <#if czk.STORED??>
                                    <a class="collect" href="javascript:void(0);">已收藏</a>
                                <#else>
                                    <a class="collect" href="javascript:void(0);" onclick="storeUp('${czk.ITEM_ID}');">+收藏</a>
                                </#if>
                                <a href="${ctxPath}/plant/item/details/${czk.ITEM_ID}" class="buy">购买</a>
                            </div>
                        </div>
                    </div>
                </#list>
            <#else>
                <div style="margin-bottom: 20px;" class="col-md-4 col-lg-4">
                    <div class="members row">
                        <div class="col-md-6 col-lg-6">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" alt="" style="width: 100%"/>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <p style="font-family: 幼圆;font-weight: bold;margin-bottom: 20px;">暂无信息</p>
                            <h4 style="font-family: 微软雅黑;margin-bottom: 45px;color:#4E87E1;font-size: 1em">暂无信息</h4>
                        </div>
                    </div>
                </div>
                <div style="margin-bottom: 20px;" class="col-md-4 col-lg-4">
                    <div class="members row">
                        <div class="col-md-6 col-lg-6">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" alt="" style="width: 100%"/>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <p style="font-family: 幼圆;font-weight: bold;margin-bottom: 20px;">暂无信息</p>
                            <h4 style="font-family: 微软雅黑;margin-bottom: 45px;color:#4E87E1;font-size: 1em">暂无信息</h4>
                        </div>
                    </div>
                </div>
                <div style="margin-bottom: 20px;" class="col-md-4 col-lg-4">
                    <div class="members row">
                        <div class="col-md-6 col-lg-6">
                            <img src="${ctxPath}/static/ymplant/img/timg.png" alt="" style="width: 100%"/>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <p style="font-family: 幼圆;font-weight: bold;margin-bottom: 20px;">暂无信息</p>
                            <h4 style="font-family: 微软雅黑;margin-bottom: 45px;color:#4E87E1;font-size: 1em">暂无信息</h4>
                        </div>
                    </div>
                </div>
            </#if>
            </div>
            <!--充值卡 结束-->
        </div>
    </div>
    <script language="JavaScript">
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