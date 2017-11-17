var tab;
$(function () {
    tab = $("#tab").dataTable({
        "bProcessing" : true, //DataTables载入数据时，是否显示‘进度’提示
        "bServerSide" : true, //是否启动服务器端数据导入
        "bStateSave" : false, //是否打开客户端状态记录功能,此功能在ajax刷新纪录的时候不会将个性化设定回复为初始化状态
        "aLengthMenu" : [pageNumber, pageNumber * 2, pageNumber * 4, pageNumber * 6], //更改显示记录数选项
        "iDisplayLength" : pageNumber, //默认显示的记录数
        "bAutoWidth" : false, //是否自适应宽度
        //"bScrollInfinite" : false, //是否启动初始化滚动条
        "bScrollCollapse" : true, //是否开启DataTables的高度自适应，当数据条数不够分页数据条数的时候，插件高度是否随数据条数而改变
        "bPaginate" : true, //是否显示（应用）分页器
        "bInfo" : true, //是否显示页脚信息，DataTables插件左下角显示记录数
        "bSort" : false, //是否启动各个字段的排序功能
        "bFilter" : false, //是否启动过滤、搜索功能
        "columns" : [
        {
        className: "td-checkbox",
        orderable : false,
        bSortable : false,
        data : "SCHOOL_ID",
        sClass : "text-c",
        render : function(data, type, row, meta) {
        var content = '<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">';
            content += '    <input type="checkbox" class="group-checkable" value="' + data + '" />';
            content += '    <span></span>';
            content += '</label>';
        return content;
        }
        },
        {
            "data" : "NAME",
            "className" : "text-c",
        },
        {
            "data" : "PROVINCE_VALUE",
            "className" : "text-c"
        },
        {
            "data" : "SCTYPE_VALUE",
            "className" : "text-c"
        },
        {
        "data" : "HANDLE",
        "className" : "text-c",
        "render" : function (data, type, row, meta) {
            var innerStr = "";
            if(EDIT_QX) {
                innerStr += "<a title='编辑基础信息' href='javascript:;' onclick='editBasic(\"" + row.SCHOOL_ID + "\")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe647;</i></a>";
            }
            if(ADD_QX) {
                innerStr += "<a title='添加专业分数' href='javascript:;' onclick='addMjScore(\"" + row.SCHOOL_ID + "\")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe604;</i></a>";
            }
            if(ADD_QX) {
                innerStr += "<a title='添加院校分数' href='javascript:;' onclick='addScScore(\"" + row.SCHOOL_ID + "\")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe603;</i></a>";
            }
            if(EDIT_QX) {
                innerStr += "<a title='编辑' href='javascript:;' onclick='edit(\"" + row.SCHOOL_ID + "\")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6df;</i></a>";
            }
            if(DEL_QX) {
                innerStr += "<a title='删除' href='javascript:;' onclick='del(\"" + row.SCHOOL_ID + "\")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6e2;</i></a>";
            }
            return innerStr;
            }
        }
        ],

        "sAjaxSource" : ctxPath + "/admin/school/api/getschools?now=" + new Date().getTime(),
        //服务器端，数据回调处理
        "fnServerData" : function(sSource, aDataSet, fnCallback) {
                $.ajax({
                    "dataType" : 'json',
                    "type" : "POST",
                    "url" : sSource,
                    "data" : aDataSet,
                    "success" : fnCallback
                });
            },
            drawCallback : function() {
                // 取消全选
                $(":checkbox[name='ck_all']").prop('checked', false);
            },
        });

        $('#tab').on("change", ":checkbox", function() {
            // 列表复选框
            if ($(this).is("[name='ck_all']")) {
            // 全选
            $(":checkbox", '#tab').prop("checked",$(this).prop("checked"));
            }else{
                // 一般复选
                var checkbox = $("tbody :checkbox", '#tab');
                $(":checkbox[name='ck_all']", '#tab').prop('checked', checkbox.length == checkbox.filter(':checked').length);
            }
        });

    $("#PROVINCE").chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
    $("#SCTYPE").chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
    $("#SUBJECTTYPE").chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
});

//请求接口的处理函数
var successFn = function (res) {
    onTableQuery();
};

//新增院校信息
var add = function () {
    showWindow("新增院校信息", ctxPath + "/admin/school/add");
};

//批量删除
var batchdel = function () {
    var checkboxs = $("tbody :checkbox", '#tab');
    var batchremoves = "";
    checkboxs.each(function () {
        if($(this).prop("checked")) {
            batchremoves += $(this).val() + ","
        }
    });

    if(batchremoves == "") {
        showError("请选择至少一项");
        return false;
    }

    layer.confirm("确定要批量删除？", {
        btn: ["是", "否"]
    }, function(index) {
        layer.close(index);
        batchremoves = batchremoves.substring(0, batchremoves.length - 1);
        sendRequest(ctxPath + "/admin/school/api/batchremoves", {batchremoves : batchremoves}, "POST", successFn);
    });
};

//列表查询
var onTableQuery = function () {
    var params = {};
    params.NAME = $('#NAME').val();
    params.PROVINCE = $('#PROVINCE').val();
    params.SCTYPE = $('#SCTYPE').val();
    params.SUBJECTTYPE = $('#SUBJECTTYPE').val();
    tableQuery(tab, params);
};

//编辑院校信息
var edit = function (id) {
    showWindow("编辑院校信息", ctxPath + "/admin/school/edit/" + id);
};

//删除院校信息
var del = function (id) {
    layer.confirm("确定要删除？", {
        btn: ["是", "否"]
        }, function(index) {
        layer.close(index);
        sendRequest(ctxPath + "/admin/school/api/batchremoves", {batchremoves : id}, "POST", successFn);
    });
};

//学校分数
var addScScore = function (id) {
    showWindow("新增学校分数", ctxPath + "/admin/scscore/add/" + id);
};

//专业分数
var addMjScore = function (id) {
    showWindow("新增专业分数", ctxPath + "/admin/mjscore/add/" + id, $(window).width() - 100);
};

//编辑基本信息
var editBasic = function (id) {
    showWindow("编辑基础信息", ctxPath + "/admin/school/edit/basic/" + id);
};