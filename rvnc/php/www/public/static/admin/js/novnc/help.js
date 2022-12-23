define(["jquery", "easy-admin","miniTab"], function ($, ea,miniTab) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'novnc.help/index',
        //add_url: 'novnc.help/add',
        edit_url: 'novnc.help/edit',
        task_url: 'novnc.help/task',
        ttt_url: 'https://www.52qcg.cn',
        detail_url: 'novnc.help/detail',
        delete_url: 'novnc.help/delete',
        export_url: 'novnc.help/export',
        modify_url: 'novnc.help/modify',
        stock_url: 'novnc.help/stock',
        publish_url: 'novnc.help/publish',
        vnc_url: '/aadmin/test/vnc'
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
                    ,'delete'//, 'export'
                ],
                cols: [[
                     {type: "checkbox"},
                    {
                        minWidth: 70,
                        title: '操作',
                        templet: ea.table.tool,
                        //fixed:'left',
                        operat: [
                            [
                                {
                                    text: '下发任务',
                                    title: '下发任务',
                                    url: init.task_url,
                                    method: 'open',
                                    auth: 'task',
                                    class: 'layui-btn layui-btn-xs layui-btn-danger'

                                }
                            ]
                        ]
                    },
                    {field: 'id', width: 80, title: 'ID',sort:'true'},
                    {field: 'remote', width: 90, title: '远程',templet:function (d) {
                        return get_remote(d.device_id);
                    }},
                    {field: 'device_name', minWidth: 100, title: '设备名称',sort:'true'},
                    {field: 'ip', minWidth: 70, title: 'ip地址'},
                    {field: 'location', minWidth: 90, title: '位置',search:false},
                    {field: 'UUID', minWidth: 70, title: 'uuid'},
                    {field: 'ips', minWidth: 70, title: 'ips',search:false},
                    {field: 'computer_name', minWidth: 100, title: '主机名称',search:false},
                    {field: 'create_time', minWidth: 120, title: '申请时间'}


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