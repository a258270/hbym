<!DOCTYPE html>
<html>
<head>
<#include "${ctxPath}/base/include/head.ftl" />
<#include "${ctxPath}/base/include/jurisdiction.ftl" />
    <!-- 页面独有文件 -->
    <script type="text/javascript" src="${ctxPath}/static/plant/item/item/edit.js?v=${v}"></script>
</head>
<body>
<article class="page-container">
    <form action="${ctxPath}/admin/item/api/edit" method="post" enctype="multipart/form-data" class="form form-horizontal" id="form">
        <input type="hidden" name="ITEM_ID" value="${item.ITEM_ID}" />
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品名称：</label>
                <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" <#if item.NAME??>value="${item.NAME}"<#else>value=""</#if> placeholder="请输入商品名称" id="NAME" name="NAME">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">主图：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <div id="preview_IMGURL">
                        <img id="imghead_IMGURL" border="0" src="${ctxPath}${item.IMGURL}" width="150" height="150" onclick="$('#IMGURL').click();">
                    </div>
                    <input type="file" onchange="previewImage(this, 150, 150)" style="display: none;" id="IMGURL" name="IMGURL">
                    <input type="button" class="btn btn-primary radius" width="90" height="90" onclick="$('#IMGURL').click();" value="选择图片">
                </div>
            </div>

            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>单价：</label>
                <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" <#if item.PRICE??>value="${item.PRICE?c}"<#else>value=""</#if> placeholder="请输入单价" id="PRICE" name="PRICE">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>简介：</label>
                <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" <#if item.SUMMARY??>value="${item.SUMMARY}"<#else>value=""</#if> placeholder="请输入简介" id="SUMMARY" name="SUMMARY">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>是否上架：</label>
                <div class="formControls col-xs-8 col-sm-9">
                        <select class="chosen-select select" size="1" id="ISSALE" name="ISSALE">
                            <#if item.ISSALE??>
                                <option value="">无</option>
                                <#if item.ISSALE>
                                <option value="1" selected>是</option>
                                <option value="0">否</option>
                                <#else>
                                <option value="1">是</option>
                                <option value="0" selected>否</option>
                                </#if>
                            <#else>
                                <option value="" selected>无</option>
                                <option value="1">是</option>
                                <option value="0">否</option>
                            </#if>
                        </select>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品分类：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <select class="chosen-select select" size="1" id="ITEMTYPE" name="ITEMTYPE">
                        <#if item.ITEMTYPE??>
                        <option value="">无</option>
                        <#list ITEMTYPEs as ITEMTYPE>
                        <#if ITEMTYPE.DIC_ID == item.ITEMTYPE>
                        <option value="${ITEMTYPE.DIC_ID}" selected>${ITEMTYPE.NAME}</option>
                        <#else>
                        <option value="${ITEMTYPE.DIC_ID}">${ITEMTYPE.NAME}</option>
                        </#if>
                        </#list>
                        <#else>
                        <option value="">无</option>
                        <#list ITEMTYPEs as ITEMTYPE>
                            <option value="${ITEMTYPE.DIC_ID}">${ITEMTYPE.NAME}</option>
                        </#list>
                        </#if>
                    </select>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品属性：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <select class="chosen-select select" size="1" id="ITEMPROPERTY" name="ITEMPROPERTY">
                        <#if item.ITEMPROPERTY??>
                        <option value="">无</option>
                        <#list ITEMPROPERTYs as ITEMPROPERTY>
                        <#if ITEMPROPERTY.DIC_ID == item.ITEMPROPERTY>
                        <option value="${ITEMPROPERTY.DIC_ID}" selected>${ITEMPROPERTY.NAME}</option>
                        <#else>
                        <option value="${ITEMPROPERTY.DIC_ID}">${ITEMPROPERTY.NAME}</option>
                        </#if>
                        </#list>
                        <#else>
                        <option value="">无</option>
                        <#list ITEMPROPERTYs as ITEMPROPERTY>
                            <option value="${ITEMPROPERTY.DIC_ID}">${ITEMPROPERTY.NAME}</option>
                        </#list>
                        </#if>
                    </select>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>排序：</label>
                <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" <#if item.MSORT??>value="${item.MSORT?c}"<#else>value=""</#if> placeholder="请输入排序" id="MSORT" name="MSORT">
                </div>
            </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit" value="提交">
            </div>
        </div>
    </form>
</article>
</body>
</html>