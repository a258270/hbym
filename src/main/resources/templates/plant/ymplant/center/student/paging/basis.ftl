<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <!-- 公共引入 -->
    <#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/center.css?v=${v}"/>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/h-ui/js/H-ui.min.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/h-ui.admin/js/H-ui.admin.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/take_photo/takephoto.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/My97DatePicker/4.8/WdatePicker.js?v=${v}"></script>
</head>
<script language="JavaScript">
    $(function () {
        parent.layer.close(parent.loader);
        $("#completeForm").validate({
            rules:{
            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                $(form).ajaxSubmit(function (res) {
                    if(res.hasErrors){
                        showError(res.errorMessage);
                        return false;
                    }
                    parent.showSuccess("修改成功！");
                    top.location.href = ctxPath + "/plant/user/center";
                });
            }
        });
    });
</script>
<body>

<div class="lan">
    <p>基础信息</p>
    <form action="${ctxPath}/plant/user/api/tocomplete" method="post" enctype="multipart/form-data" id="completeForm">
    <div class="row">
        <div class="col-md-3 col-xs-3" style="padding: 20px 45px;text-align: center">
            <#--<img src="/static/ymplant/img/1.png" style="width: 100%;margin-bottom: 10px" alt=""/>-->
            <div id="preview_HEADURL" style="margin-bottom: 20px;">
                <img id="imghead_HEADURL" border="0" src="<#if basicInfo?? && basicInfo.HEADURL??>${basicInfo.HEADURL}<#else>${ctxPath}/static/ymplant/img/timg.png</#if>" width="150" height="150" onclick="$('#IMGURL').click();">
            </div>
            <input type="file" onchange="previewImage(this,150,150)" style="display: none" id="HEADURL" name="HEADURL">
            <input type="button" class="toxang " value="更换头像" width="90" height="90" onclick="$('#HEADURL').click()">
            <#--<button style="padding: 2px 10px;background-color: #fff;border:1px solid #00C3D5;border-radius: 4px">更换头像</button>-->
        </div>
        <div class="col-md-9 col-xs-9" style="padding: 20px 100px 20px 20px">
            <div>
                <span style="float: left;margin-right: 10px">资料完整度</span>
                <div class="progress" style="border-radius: 50px;width: 80%">
                    <span class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${completeCount}" aria-valuemin="0" aria-valuemax="100" style="width: ${completeCount}%;background-color: #00C3D5">
                        ${completeCount}%
                    </span>
                </div>
            </div>
            <p>
                <span style="margin-right: 20px">
                    <img src="${ctxPath}/static/ymplant/images/<#if isRealName == 'true'>1<#else>2</#if>.png" style="width:4%;" alt=""/>
                    实名<#if isRealName == 'true'>已<#else>未</#if>认证
                </span>
                <span style="margin-right: 20px">
                    <img src="${ctxPath}/static/ymplant/images/<#if isPhone == 'true'>3<#else>4</#if>.png" style="width:3%;" alt=""/>
                    手机<#if isPhone == 'true'>已<#else>未</#if>绑定
                </span>
                <span style="margin-right: 20px">
                    <img src="${ctxPath}/static/ymplant/images/<#if isEmail == 'true'>8<#else>9</#if>.png" style="width:4%;" alt=""/>
                    邮箱<#if isEmail == 'true'>已<#else>未</#if>绑定
                </span>
                <span>
                    <img src="${ctxPath}/static/ymplant/images/<#if isTrade == 'true'>6<#else>5</#if>.png" style="width:4%;" alt=""/>
                    交易密码<#if isTrade == 'true'>已<#else>未</#if>设置
                </span>
            </p>
            <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                <span>昵称：</span>
                <input style="outline: none;border-radius: 5px;border:1px solid #CECECE" type="text" id="NICKNAME" name="NICKNAME" <#if basicInfo?? && basicInfo.NICKNAME??>value="${basicInfo.NICKNAME}"</#if>/>
            </p>
            <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                <span>真实姓名：<#if basicInfo?? && basicInfo.NAME??>${basicInfo.NAME}<#else>暂无</#if></span>
                <span style="margin-left: 30px">是否公开：</span>
                <input type="checkbox" name="NAMESECRET" <#if basicInfo?? && basicInfo.NAMESECRET?? && !basicInfo.NAMESECRET>checked</#if> />
            </p>
            <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                <span>性别:</span>
                <#if basicInfo?? && basicInfo.SEX??>
                <label class="radio-inline">
                    <input type="radio" name="SEX" id="SEXMAN" value="11" <#if basicInfo.SEX == '11'>checked</#if>> 男
                </label>
                <label class="radio-inline">
                    <input type="radio" name="SEX" id="SEXWOMAN" value="12" <#if basicInfo.SEX == '12'>checked</#if>> 女
                </label>
                <#else>
                <label class="radio-inline">
                    <input type="radio" name="SEX" id="SEXMAN" value="11" checked> 男
                </label>
                <label class="radio-inline">
                    <input type="radio" name="SEX" id="SEXWOMAN" value="12"> 女
                </label>
                </#if>
                <span style="margin-left: 30px">是否公开：</span>
                <input type="checkbox" name="SEXSECRET" <#if basicInfo?? && basicInfo.SEXSECRET?? && !basicInfo.SEXSECRET>checked</#if> />
            </p>
            <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                <span>出生日期：<input type="text" onClick="WdatePicker({ dateFmt:'yyyy-MM-dd' })" placeholder="请选择出生日期" id="BIRTHDAY" name="BIRTHDAY" class="Wdate" value="<#if basicInfo?? && basicInfo.BIRTHDAY??>${basicInfo.BIRTHDAY}</#if>" readOnly></span>
                <span style="margin-left: 30px">是否公开：</span>
                <input type="checkbox" name="BIRTHDAYSECRET" <#if basicInfo?? && basicInfo.BIRTHDAYSECRET?? && !basicInfo.BIRTHDAYSECRET>checked</#if> />
            </p>
            <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                <span>邮箱：</span>
                <span><#if isEmail == 'true'>已<#else>未</#if>设置</span>
                <#if isEmail != 'true'>
                <span style="margin-left: 30px">
                    <a href="${ctxPath}/plant/user/binding/email" style="color: #4B33ED">立即设置</a>
                </span>
                </#if>
            </p>
            <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                <span>手机号码：</span>
                <span><#if isPhone == 'true'>已<#else>未</#if>设置</span>

                <span style="margin-left: 30px">
                    <a href="${ctxPath}/plant/user/binding/phone" style="color: #4B33ED"><#if isPhone != 'true'>立即<#else>更改</#if>设置</a>
                </span>

            </p>
            <p style="margin-bottom:20px;border-bottom:1px solid #CECECE;padding: 20px 10px">
                <span>身份证号：</span>
                <span><#if isRealName == 'true'>已<#else>未</#if>设置</span>
                <#if isRealName != 'true'>
                <span style="margin-left: 30px">
                    <a href="${ctxPath}/plant/user/binding/idcard" style="color: #4B33ED">立即设置</a>
                </span>
                </#if>
            </p>
            <p class="baocun" style="margin-left:160px">
                <input class="kd-xgai" type="submit" value="保存修改">
            </p>
        </div>
    </div>
    </form>
</div>

</body>
</html>