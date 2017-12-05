<!DOCTYPE html>
<html>
<head lang="en">
<#include "${ctxPath}/plant/ymplant/include/head.ftl">
    <!-- 单独引入 -->
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/h-ui/js/H-ui.min.js?v=${v}"></script>
    <script type="text/javascript" src="${ctxPath}/static/plugin/h-ui/h-ui.admin/js/H-ui.admin.js?v=${v}"></script>
    <link rel="stylesheet" href="${ctxPath}/static/ymplant/css/center/center.css?v=${v}"/>
    <script language="JavaScript" src="${ctxPath}/static/ymplant/js/center/center.js?v=${v}"></script>
</head>
<script language="JavaScript">
    $(function () {
        parent.layer.close(parent.loader);
        $("#examineeForm").validate({
            rules:{
            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                layer.confirm("每年6月23日至9月1日期间仅允许填写一次高考成绩，其余时间不限次数，是否继续？", {
                    btn: ["是", "否"]
                }, function(index) {
                    $(form).ajaxSubmit(function (res) {
                        if(res.hasErrors){
                            showError(res.errorMessage);
                            return false;
                        }
                        parent.showSuccess("修改成功！");
//                       window.location.href = ctxPath + "/plant/user/basicinfo";
                            parent.$(".ster").each(function(){
                                if($(this).attr("data-href") == "${ctxPath}/plant/user/basicinfo"){
                                    $(this).addClass("kd-lhtai");
                                    window.location.href = ctxPath + "/plant/user/basicinfo";
                                }
                                else{
                                    $(this).removeClass("kd-lhtai");
                                }
                            });
                    });
                });
            }
        });
    });
</script>
<body>
    <div class="lan" style="height: 854px">
    <p>考生信息</p>
    <form action="${ctxPath}/plant/user/api/examinee" method="post" id="examineeForm">
        <div class="row" style="margin-left: 30px;">
            <div class="col-md-9" style="padding: 20px 100px 20px 20px">
                <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                    <span style="margin-right: 25px;">考试类型:</span>
                    <#--<label class="radio-inline">-->
                        <#--<input type="radio" name="MAJORTYPE" id="MAJORTYPE${MAJORTYPE_index}" value="${MAJORTYPE.DIC_ID}" <#if examinee?? && examinee.MAJORTYPE?? && examinee.MAJORTYPE == MAJORTYPE.DIC_ID>checked="true"</#if>> ${MAJORTYPE.NAME}-->
                    <#--</label>-->
                    <#--<select name="MAJORTYPE" id="MAJORTYPE${MAJORTYPE_index}">-->
                        <#--<option value="${MAJORTYPE.DIC_ID}" <#if examinee?? && examinee.MAJORTYPE?? && examinee.MAJORTYPE == MAJORTYPE.DIC_ID>selected="true"</#if>>${MAJORTYPE.NAME}</option>-->
                    <#--</select>-->
                    <select name="MAJORTYPE" id="MAJORTYPE" style="border-radius: 5px;width: 100px;">
                        <option disabled>请选择...</option>
                    <#list MAJORTYPEs as MAJORTYPE>
                        <option value="${MAJORTYPE.DIC_ID}" <#if examinee?? && examinee.MAJORTYPE?? && examinee.MAJORTYPE == MAJORTYPE.DIC_ID>selected="true"</#if>>${MAJORTYPE.NAME}</option>
                    </#list>
                    </select>
                </p>
                <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                    <span>考试所在地：</span>
                    <select style="border-radius: 5px;width: 100px;" class="xuexiaomingcheng" name="EXAMAREA">
                        <option disabled>请选择...</option>
                    <#list PROVINCEs as PROVINCE>
                        <#if examinee?? && examinee.EXAMAREA?? && PROVINCE.DIC_ID == examinee.EXAMAREA>
                            <option value="${PROVINCE.DIC_ID}" selected>${PROVINCE.NAME}</option>
                        <#else>
                            <option value="${PROVINCE.DIC_ID}">${PROVINCE.NAME}</option>
                        </#if>
                    </#list>
                    </select>
                </p>
                <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                    <span style="margin-right: 15px;">高考成绩：</span>
                    <input type="number" style="outline: none;border-radius: 5px;border: 1px solid #CECECE;width: 100px;" min="0" id="EXAMSCORE" name="EXAMSCORE" <#if examinee?? && examinee.EXAMSCORE??>value="${examinee.EXAMSCORE}" </#if> /> <span style="color: #ab0000">该成绩用于模拟填报、智能推荐等相关功能</span>
                </p>
                <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                    <span style="margin-right: 55px;">年级:</span>
                    <#--<label class="radio-inline">-->
                        <#--<input type="radio" name="GRADE" id="GRADE${GRADE_index}" value="${GRADE.DIC_ID}" <#if examinee?? && examinee.GRADE?? && examinee.GRADE == GRADE.DIC_ID>checked="true"</#if>> ${GRADE.NAME}-->
                    <#--</label>-->
                    <select name="GRADE" id="GRADE" style="border-radius: 5px;width: 100px;">
                        <option disabled>请选择...</option>
                        <#list GRADEs as GRADE>
                            <option value="${GRADE.DIC_ID}" <#if examinee?? && examinee.GRADE?? && examinee.GRADE == GRADE.DIC_ID>selected="true"</#if>>${GRADE.NAME}</option>
                        </#list>
                    </select>
                </p>
                <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                    <span style="margin-right: 17px;">一模成绩：</span>
                    <input type="number" style="outline: none;border-radius: 5px;border: 1px solid #CECECE;width: 100px;" min="0" id="FIRSTMOCK" name="FIRSTMOCK" <#if examinee?? && examinee.FIRSTMOCK??>value="${examinee.FIRSTMOCK}" </#if> /> <span style="color: #ab0000">该成绩用于高校检索查询</span>
                </p>
                <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                    <span style="margin-right: 17px;">二模成绩：</span>
                    <input type="number" style="outline: none;border-radius: 5px;border: 1px solid #CECECE;width: 100px;" min="0" id="SECONDMOCK" name="SECONDMOCK" <#if examinee?? && examinee.SECONDMOCK??>value="${examinee.SECONDMOCK}" </#if> /> <span style="color: #ab0000">该成绩用于高校检索查询</span>
                </p>
                <p style="border-bottom:1px solid #CECECE;padding: 20px 10px">
                    <span style="margin-right: 17px;">三模成绩：</span>
                    <input type="number" style="outline: none;border-radius: 5px;border: 1px solid #CECECE;width: 100px;" min="0" id="THIRDMOCK" name="THIRDMOCK" <#if examinee?? && examinee.THIRDMOCK??>value="${examinee.THIRDMOCK}" </#if> /> <span style="color: #ab0000">该成绩用于高校检索查询</span>
                </p>
                <p class="baocun" style="margin-top:20px">
                    <input class="kd-xgai" style="margin: 0 auto" type="submit" value="保存修改" />
                </p>
            </div>
        </div>
    </form>
</div>
</body>
</html>