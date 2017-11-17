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
                data : "CARD_ID",
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
                "data" : "NUMBER",
                "className" : "text-c",
            },
            {
                "data" : "PROVINCE_VALUE",
                "className" : "text-c",
            },
            {
                "data" : "TYPE_VALUE",
                "className" : "text-c",
            },
            {
                "data" : "PURPOSE_VALUE",
                "className" : "text-c",
            },
            {
                "data" : "ISSALED",
                "className" : "text-c",
                "render" : function (data, type, row, meta) {
                    if(data){
                        return "是";
                    }
                    return "否";
                }
            },
            {
                "data" : "ISUSED",
                "className" : "text-c",
                "render" : function (data, type, row, meta) {
                    if(data){
                        return "是";
                    }
                    return "否";
                }
            },
            {
                "data" : "CREATETIME",
                "className" : "text-c",
                "render" : function (data, type, row, meta) {
                    return toLocalTime(data);
                }
            },
            {
                "data" : "OVERDUETIME",
                "className" : "text-c",
                "render" : function (data, type, row, meta) {
                    return toLocalTime(data);
                }
            },
            {
                "data" : "HANDLE",
                "className" : "text-c",
                "render" : function (data, type, row, meta) {
                    var innerStr = "";
                    if(DEL_QX) {
                        innerStr += "<a title='删除' href='javascript:;' onclick='del(\"" + row.CARD_ID + "\")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6e2;</i></a>";
                    }
                    return innerStr;
                }
            }
        ],

        "sAjaxSource" : ctxPath + "/admin/card/api/getcards?now=" + new Date().getTime(),
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
    $('#PROVINCE_ID').chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
    $('#TYPE_ID').chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
    $('#PURPOSE_ID').chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
    $('#ISSALED').chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
    $('#ISUSED').chosen({
        no_results_text: "没有找到结果！",//搜索无结果时显示的提示
        search_contains:true,   //关键字模糊搜索，设置为false，则只从开头开始匹配
        allow_single_deselect:true
    });
});

//请求接口的处理函数
var successFn = function (res) {
    onTableQuery();
};

//新增商品卡
var add = function () {
    showWindow("新增商品卡", ctxPath + "/admin/card/add");
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
        sendRequest(ctxPath + "/admin/card/api/batchremoves", {batchremoves : batchremoves}, "POST", successFn);
    });
};

var batchedit = function () {
    var checkboxs = $("tbody :checkbox", '#tab');
    var batchedits = "";
    checkboxs.each(function () {
        if($(this).prop("checked")) {
            batchedits += $(this).val() + ","
        }
    });

    if(batchedits == "") {
        showError("请选择至少一项");
        return false;
    }

    layer.confirm("确定要批量标记？", {
        btn: ["是", "否"]
    }, function(index) {
        layer.close(index);
        batchedits = batchedits.substring(0, batchedits.length - 1);
        sendRequest(ctxPath + "/admin/card/api/batchedits", {batchedits : batchedits}, "POST", successFn);
    });
};
//列表查询
var onTableQuery = function () {
    var params = {};
    params.PROVINCE_ID = $('#PROVINCE_ID').val();
    params.TYPE_ID = $('#TYPE_ID').val();
    params.PURPOSE_ID = $('#PURPOSE_ID').val();
    params.ISSALED = $('#ISSALED').val();
    params.ISUSED = $('#ISUSED').val();
    tableQuery(tab, params);
};

//删除商品卡
var del = function (id) {
    layer.confirm("确定要删除？", {
        btn: ["是", "否"]
    }, function(index) {
        layer.close(index);
        sendRequest(ctxPath + "/admin/card/api/batchremoves", {batchremoves : id}, "POST", successFn);
    });
};

var excel = function () {
    showWindow("导出商品卡", ctxPath + "/admin/card/excel");
};