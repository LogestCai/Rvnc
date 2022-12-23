define(["jquery", "easy-admin","miniTab"], function ($, ea,miniTab) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'novnc.repair/index',
        //add_url: 'novnc.repair/add',
        edit_url: 'novnc.repair/edit',
        task_url: 'novnc.repair/task',
        ttt_url: 'https://www.52qcg.cn',
        detail_url: 'novnc.repair/detail',
        delete_url: 'novnc.repair/delete',
        export_url: 'novnc.repair/export',
        modify_url: 'novnc.repair/modify',
        stock_url: 'novnc.repair/stock',
        publish_url: 'novnc.repair/publish',
        vnc_url: '/admin/test/vnc'
    };
    var table = layui.table;



    var Controller = {
        index: function () {
            var group =1;
            //var options =;
            ea.table.render({
                init: init,
                //height:'full-50',
                skin:''
                ,even: true //开启隔行背景
                // ,size: 'sm' //小尺寸的表格
                , defaultToolbar:['filter', 'print',  {
                    title: '搜索',
                    layEvent: 'TABLE_SEARCH',
                    icon: 'layui-icon-search',
                    extend: 'data-table-id="currentTableRenderId"'
                }]
                ,where: {group: group, id: 123}
                ,toolbar: ['refresh'
                    // [{
                    //     text: '添加',
                    //     url: init.add_url,
                    //     method: 'open',
                    //     auth: 'add',
                    //     class: 'layui-btn layui-btn-normal layui-btn-sm',
                    //     icon: 'fa fa-plus ',
                    //     //extend: 'data-full="true"',
                    // }],
                    //,'delete', 'export'
                ],
                cols: [[
                    // {type: "checkbox", minWidth: 30},
                    {
                        minWidth: 70,
                        title: '操作',
                        templet: ea.table.tool,
                        //fixed:'left',
                        operat: [
                            [
                                {
                                    text: '编辑',
                                    title: '修改',
                                    url: init.edit_url,
                                    method: 'open',
                                    auth: 'edit',
                                    class: 'layui-btn layui-btn-xs layui-btn-success',
                                }
                            ]
                        ]
                    },
                    {field: 'id', width: 60, title: 'ID',sort:'true'},
                    {field: 'location', minWidth: 90, title: '位置',search:false},
                    //{field: 'remote', minWidth: 90, title: '远程',templet:function(d){return  get_remote(d.report_device_id.toString());}},
                    {field: 'repair_device_name', minWidth: 100, title: '设备名称',sort:'true'},
                    {field: 'problem_name', minWidth: 100, title: '问题名称',sort:'true'},
                    {field: 'problem_description', minWidth: 100, title: '问题描述',sort:'true'},
                    {field: 'accepted_user', minWidth: 70, title: '接单人'},
                    {field: 'accepted_time', minWidth: 120, title: '接单时间'},
                    {field: 'create_time', minWidth: 120, title: '上报时间'},
                    {field: 'status_name', minWidth: 70, title: '状态'},
                    {field: 'report_user_phone', minWidth: 70, title: '联系电话',search:false},
                   // {field: 'report_device_id', minWidth: 100, title: '报告主机id',search:false},
                   // {field: 'repair_device_id', minWidth: 100, title: '故障主机id',search:false}

                ]]


                // 表格渲染完成后设置背景色
                // done: function(res){
                // var that = $("#currentTable").siblings();
                // res.data.forEach(function (item, index) {
                //     if (item.patient_sex === '男') {
                //         var tr = that.find(".layui-table-box tbody tr[data-index='" + index + "']");
                //         tr.css("background-color", "#c3f1c6");
                //     }
                // });
                // }


            });

            //loadData();
            function get_remote(i)
            {
                console.log(i);
                return '<a href="/admin/test/vnc?id='+i+'"  target="_blank" class="layui-badge layui-bg-blue">远程</a>';
            }

            function get_service_score(i){
                if (i === 1) {
                    return '<span class="layui-badge layui-bg-blue">满意</span>';
                }else if(i === 2) {
                    return '<span class="layui-badge layui-bg-green">基本满意</span>';
                } else if(i ===3) {
                    return '<span class="layui-badge layui-badge-black">不满意</span>';
                }else{
                    return '未评价';
                }
            }
            function get_is_visited(i){
                if (i === 1) {
                    return '<span class="layui-badge layui-bg-red">是</span>';
                }else if(i === 0) {
                    return '<span class="layui-badge layui-bg-black">否</span>';
                } else{
                    return '<span class="layui-badge layui-bg-black">否</span>';
                }
            }

            function get_patient_type(i){
                if (i === 1) {
                    return '<span class="layui-badge layui-bg-green">普通</span>';
                }else if(i === 2) {
                    return '<span class="layui-badge layui-bg-blue">重要</span>';
                } else if(i ===3) {
                    return '<span class="layui-badge layui-bg-red">特殊</span>';
                }else{
                    return '未分类';
                }
            }


            ea.listen();

            miniTab.listen();
        },


        add: function () {
            ea.listen();
        },
        edit: function () {
            ea.listen();
        },
        visit: function () {

            ea.listen();
        },
        stock: function () {
            ea.listen();
        },
        task:function(){
            ea.listen();
        },
        publish:function(){
            ea.listen();
            // layui.config({
            //     base: '/static/js/'
            // }).use('index', function () {
            //     var inputTags = layui.inputTags;
            //     inputTags.render({
            //         elem:'#inputTags',//定义输入框input对象
            //         content: ['标题一','标题二'],//默认标签
            //         aldaBtn: true,//是否开启获取所有数据的按钮
            //         done: function(value){ //回车后的回调
            //             console.log(value)
            //         }
            //     })
            // })


        }
    };
    return Controller;
});