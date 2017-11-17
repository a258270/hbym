<!DOCTYPE html>
<html>
<head>
<#include "${ctxPath}/base/include/head.ftl" />
<#include "${ctxPath}/base/include/jurisdiction.ftl" />
    <!-- 页面独有文件 -->
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/datatables/1.10.0/jquery.dataTables.min.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plant/card/card/index.js?v=${v}"></script>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span> 库存管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="text-c">
        地区：
        <select class="chosen-select select" style="width:150px;height: 31px;" size="1" id="PROVINCE_ID">
            <option value="" selected>不限</option>
            <#list provinces as province>
                <option value="${province.CODE}">${province.NAME}</option>
            </#list>
        </select>
        类型：
        <select class="chosen-select select" style="width:150px;height: 31px;" size="1" id="TYPE_ID">
            <option value="" selected>不限</option>
        <#list types as type>
            <option value="${type.CODE}">${type.NAME}</option>
        </#list>
        </select>
        用途：
        <select class="chosen-select select" style="width:150px;height: 31px;" size="1" id="PURPOSE_ID">
            <option value="" selected>不限</option>
            <#list purposes as purpose>
                <option value="${purpose.CODE}">${purpose.NAME}</option>
            </#list>
        </select>
        是否销售：
        <select class="chosen-select select" style="width:150px;height: 31px;" size="1" id="ISSALED">
            <option value="" selected>不限</option>
            <option value="1">是</option>
            <option value="0">否</option>
        </select>
        是否使用：
        <select class="chosen-select select" style="width:150px;height: 31px;" size="1" id="ISUSED">
            <option value="" selected>不限</option>
            <option value="1">是</option>
            <option value="0">否</option>
        </select>
        <button type="button" class="btn btn-success radius" onclick="onTableQuery();"><i class="Hui-iconfont">&#xe665;</i> 查询</button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <#if QX.DEL_QX == 'true'><a href="javascript:;" onclick="batchdel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a></#if>
            <#if QX.EDIT_QX == 'true'><a href="javascript:;" onclick="batchedit()" class="btn btn-warning radius"><i class="Hui-iconfont">&#xe676;</i> 标记销售</a></#if>
            <#if QX.ADD_QX == 'true'><a href="javascript:;" onclick="add()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 新增</a></#if>
            <#if QX.ADD_QX == 'true'><a href="javascript:;" onclick="excel()" class="btn btn-success radius"><i class="Hui-iconfont">&#xe644;</i> 导出Excel</a></#if>
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
            <th class="text-c">卡号</th>
            <th class="text-c">地区</th>
            <th class="text-c">类型</th>
            <th class="text-c">用途</th>
            <th class="text-c">是否销售</th>
            <th class="text-c">是否使用</th>
            <th class="text-c">创建时间</th>
            <th class="text-c">到期时间</th>
            <th class="text-c">操作</th>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>