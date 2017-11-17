<!DOCTYPE html>
<html>
<head>
<#include "${ctxPath}/base/include/head.ftl" />
<#include "${ctxPath}/base/include/jurisdiction.ftl" />
    <!-- 页面独有文件 -->
    <script type="text/javascript" src="${ctxPath}/static/base/js/user/expert/edit.js?v=${v}"></script>
</head>
<body>
<article class="page-container">
    <form action="${ctxPath}/admin/expert/api/edit/${expert.USER_ID}" method="post" class="form form-horizontal" id="form">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${expert.USERNAME}" placeholder="请输入用户名" disabled>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">联系电话：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="<#if complete.PHONE??>${complete.PHONE}</#if>" placeholder="请输入联系电话" id="PHONE" name="PHONE">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">密码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text" value="" placeholder="请输入密码" id="PASSWORD" name="PASSWORD">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">确认密码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text" value="" placeholder="请输入确认密码" id="REPASSWORD" name="REPASSWORD">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>姓名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${complete.NICKNAME}" placeholder="请输入姓名" id="NICKNAME" name="NICKNAME">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="chosen-select select" size="1" name="SEX" id="SEX">
                <#list sexObjs as sexObj>
                    <option value="${sexObj.DIC_ID}" <#if sexObj.DIC_ID == complete.SEX>selected</#if>>${sexObj.NAME}</option>
                </#list>
				</select>
				</span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>咨询价格：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${complete.PRICE?c}" placeholder="请输入咨询价格" id="PRICE" name="PRICE">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>工作年限：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="chosen-select select" size="1" name="JOBDATE" id="JOBDATE">
                <#list joblifeObjs as joblifeObj>
                    <option value="${joblifeObj.DIC_ID}" <#if joblifeObj.DIC_ID == complete.JOBDATE>selected</#if>>${joblifeObj.NAME}</option>
                </#list>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属角色：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				专家
				</span>
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