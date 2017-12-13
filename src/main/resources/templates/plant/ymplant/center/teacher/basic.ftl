<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 公共引入 -->
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/h-ui/js/H-ui.min.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/h-ui.admin/js/H-ui.admin.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/take_photo/takephoto.js?v=${v}"></script>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/center.css?v=${v}">
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/lib/My97DatePicker/4.8/WdatePicker.js?v=${v}"></script>
</head>
<body class="corresponding">
<div class="lan">
    <p>基础信息</p>
    <div class="row">
        <form action="${ctxPath}/plant/teacher/api/basic" id="form" method="post" enctype="multipart/form-data">
            <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 30px 100px 20px 100px;">
                <div>
                    <span style="float: left;margin-right: 10px;color: #00C3D5;font-size: 20px;font-weight: bold;font-family: 幼圆;margin-top: -5px;">资料完整度</span>
                    <div class="progress" style="border-radius: 50px;">
                    <span class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${completeCount}" aria-valuemin="0" aria-valuemax="100" style="width: ${completeCount}%;background-color: #00C3D5">
                        ${completeCount}%
                    </span>
                    </div>
                </div>
                <p style="padding-right: 20px;text-align: right;">
                <span style="margin-right: 20px">
                    <img src="${ctxPath}/static/ymplant/images/<#if isRealName == 'true'>2<#else>1</#if>.png" style="width:4%;" alt=""/>
                    实名<#if isRealName == 'true'>已<#else>未</#if>认证
                </span>
                    <span style="margin-right: 20px">
                    <img src="${ctxPath}/static/ymplant/images/<#if isPhone == 'true'>4<#else>3</#if>.png" style="width:3%;" alt=""/>
                    手机<#if isPhone == 'true'>已<#else>未</#if>绑定
                </span>
                    <span style="margin-right: 20px">
                    <img src="${ctxPath}/static/ymplant/images/<#if isEmail == 'true'>6<#else>5</#if>.png" style="width:4%;" alt=""/>
                    邮箱<#if isEmail == 'true'>已<#else>未</#if>绑定
                </span>
                    <span>
                    <img src="${ctxPath}/static/ymplant/images/<#if isTrade == 'true'>8<#else>7</#if>.png" style="width:4%;" alt=""/>
                    交易密码<#if isTrade == 'true'>已<#else>未</#if>设置
                </span>
                </p>
            </div>
        <div class="col-md-9 col-sm-9 col-xs-9" style="padding: 0px 20px 50px 95px;">

            <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                <span>昵称：</span>
                <input style="outline: none;width:120px;border-radius: 5px;border:1px solid #CECECE;margin-left: 39px;" type="text" name="NICKNAME" value="<#if complete?? && complete.NICKNAME??>${complete.NICKNAME}</#if>"/>
            </p>
            <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                <span>真实姓名：</span><span style="margin-left: 15px;"><#if complete?? && complete.NAME??>${complete.NAME}<#else>暂无</#if></span>
                <span style="float: right;">
                    <span style="margin-left: 30px">是否公开：</span>
                    <input type="checkbox" name="NAMESECRET" <#if complete?? && complete.NAMESECRET?? && !complete.NAMESECRET>checked</#if>/>
                </span>
            </p>
            <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                <span>性别：</span>
                <#--<label class="radio-inline">-->
                    <#--<input type="radio" name="SEX" id="SEX1" value="11" <#if complete?? && complete.SEX?? && complete.SEX == '11'>checked</#if>> 男-->
                <#--</label>-->
                <#--<label class="radio-inline">-->
                    <#--<input type="radio" name="SEX" id="SEX2" value="12" <#if complete?? && complete.SEX?? && complete.SEX == '12'>checked</#if>> 女-->
                <#--</label>-->
                <#if complete?? && complete.SEX??>
                <select class="radio-inline" name="SEX" style="padding: 0 10px;width: 120px;margin-left: 39px;">
                    <option value="11" <#if complete.SEX == '11'>selected</#if>>男</option>
                    <option value="12" <#if complete.SEX == '12'>selected</#if>>女</option>
                </select>
                <#else>
                <select name="SEX" class="radio-inline" style="padding: 0 10px;margin-left: 39px;">
                    <option value="11" selected>男</option>
                    <option value="12">女</option>
                </select>
                </#if>
                <span style="float: right;">
                    <span style="margin-left: 30px">是否公开：</span>
                    <input type="checkbox" name="SEXSECRET" <#if complete?? && complete.SEXSECRET?? && !complete.SEXSECRET>checked</#if>/>
                </span>
            </p>
            <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                <span>出生日期：<input style="width: 120px;margin-left: 15px;" type="text" onClick="WdatePicker({ dateFmt:'yyyy-MM-dd' })" placeholder="请选择出生日期" id="BIRTHDAY" name="BIRTHDAY" class="Wdate" value="<#if complete?? && complete.BIRTHDAY??>${complete.BIRTHDAY}</#if>" readOnly></span>
                <span style="float: right;">
                    <span style="margin-left: 30px">是否公开：</span>
                    <input type="checkbox" name="BIRTHDAYSECRET" <#if complete?? && complete.BIRTHDAYSECRET?? && !complete.BIRTHDAYSECRET>checked</#if>/>
                </span>
            </p>
            <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                <span>邮箱：</span>
                <span style="margin-left: 39px;"><#if isEmail == 'true'><#if complete?? && complete.EMAIL??>${complete.EMAIL?substring(0,2)}*******</#if><#else>未设置</#if></span>
            <#if isEmail != 'true'>
                <span style="margin-left: 30px">
                    <a href="${ctxPath}/plant/user/binding/email" style="color: #4B33ED">立即设置</a>
                </span>
            </#if>
            </p>
            <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                <span>手机号码：</span>
                <span style="margin-left: 15px;"><#if isPhone == 'true'><#if complete?? && complete.PHONE??>${complete.PHONE?substring(0, 3)}****${complete.PHONE?substring(7, 11)}</#if><#else>未设置</#if></span>

                <span style="margin-left: 30px">
                    <a href="${ctxPath}/plant/user/binding/phone" style="color: #4B33ED"><#if isPhone != 'true'>立即<#else>更改</#if>设置</a>
                </span>

            </p>
            <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                <span>身份证号：</span>
                <span style="margin-left: 15px;"><#if isRealName == 'true'><#if complete?? && complete.IDCARD??>${complete.IDCARD?substring(0, 3)}***********${complete.IDCARD?substring(15, 18)}</#if><#else>未设置</#if></span>
            <#if isRealName != 'true'>
                <span style="margin-left: 30px">
                    <a href="${ctxPath}/plant/user/binding/idcard" style="color: #4B33ED">立即设置</a>
                </span>
            </#if>
            </p>
            <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                <span>院校名称：</span><span style="margin-left: 15px;"><#if complete?? && complete.SCNAME??>${complete.SCNAME}<#else>暂无</#if></span>
            </p>
            <p style="margin-bottom:20px;border-bottom:1px solid #CECECE;padding: 20px 10px">
                <span>工作年限：</span><span style="margin-left: 15px;"><#if complete?? && complete.JOBDATE_VALUE??>${complete.JOBDATE_VALUE}<#else>暂无</#if></span>
            </p>
            <p class="baocun" style="margin-left:245px;margin-top: 50px;">
                <input class="kd-xgai" type="submit" value="保存修改"/>
            </p>
        </div>
        <div class="col-md-3 col-xs-3 col-xs-3" style="text-align: center">
                <div id="preview_HEADURL" style="margin-bottom: 20px;">
                    <img id="imghead_HEADURL" border="0" src="<#if complete?? && complete.HEADURL??>${complete.HEADURL}<#else>${ctxPath}/static/ymplant/img/timg.png</#if>" width="130" height="130" onclick="$('#IMGURL').click();">
                </div>
                <input type="file" onchange="previewImage(this,150,150)" style="display: none;" id="HEADURL" name="HEADURL">
                <input type="button" class="toxang " value="更换头像" width="90" height="90" onclick="$('#HEADURL').click()">
            </div>
        </form>
    </div>
<script language="JavaScript">
    $(function () {
        parent.layer.close(parent.loader);
        $("#form").validate({
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
                    top.location.reload();
                });
            }
        });
    });
</script>
</div>
</body>
</html>