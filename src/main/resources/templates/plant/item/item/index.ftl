<!DOCTYPE html>
<html>
<head>
<#include "${ctxPath}/base/include/head.ftl" />
<#include "${ctxPath}/base/include/jurisdiction.ftl" />
    <!-- 页面独有文件 -->
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/datatables/1.10.0/jquery.dataTables.min.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plant/item/item/index.js?v=${v}"></script>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span> 商品管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="text-c">
        商品名称：
            <input type="text" class="input-text" style="width:150px" placeholder="请输入商品名称" id="NAME">
            
            
        单价：
            <input type="text" class="input-text" style="width:150px" placeholder="请输入单价" id="PRICE">
        是否上架：
            <select class="chosen-select select" style="width:150px;height: 31px;" size="1" id="ISSALE">
                <option value="" selected>不限</option>
                <option value="1">是</option>
                <option value="0">否</option>
            </select>
        商品分类：
            <select class="chosen-select select" style="width:150px;height: 31px;" size="1" id="ITEMTYPE">
                <option value="" selected>不限</option>
                <#list ITEMTYPEs as ITEMTYPE>
                <option value="${ITEMTYPE.DIC_ID}">${ITEMTYPE.NAME}</option>
                </#list>
            </select>
        商品属性：
            <select class="chosen-select select" style="width:150px;height: 31px;" size="1" id="ITEMPROPERTY">
                <option value="" selected>不限</option>
                <#list ITEMPROPERTYs as ITEMPROPERTY>
                <option value="${ITEMPROPERTY.DIC_ID}">${ITEMPROPERTY.NAME}</option>
                </#list>
            </select>
        <button type="button" class="btn btn-success radius" onclick="onTableQuery();"><i class="Hui-iconfont">&#xe665;</i> 查询</button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <#if QX.DEL_QX == 'true'><a href="javascript:;" onclick="batchdel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a></#if>
            <#if QX.ADD_QX == 'true'><a href="javascript:;" onclick="add()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 新增</a></#if>
        </span>
    </div>
    <div class="mt-20">
        <table id="tab" class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <th class="center">
                <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                    <input type="checkbox" name="ck_all" class="group-checkable" data-set="#sample_1 .checkboxes" />
                    <span></span>
                </label>
            </th>
            <th class="text-c">商品名称</th>
            <th class="text-c">单价</th>
            <th class="text-c">是否上架</th>
            <th class="text-c">商品分类</th>
            <th class="text-c">商品属性</th>
            <th class="text-c">排序</th>
            <th class="text-c">操作</th>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>