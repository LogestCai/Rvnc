define(["jquery", "easy-admin","miniTab"], function ($, ea,miniTab) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'novnc.device/index',
        //add_url: 'novnc.device/add',
        edit_url: 'novnc.device/edit',
        task_url: 'novnc.device/task',
        ttt_url: 'https://www.52qcg.cn',
        detail_url: 'novnc.device/detail',
        delete_url: 'novnc.device/delete',
        export_url: 'novnc.device/export',
        modify_url: 'novnc.device/modify',
        stock_url: 'novnc.device/stock',
        publish_url: 'novnc.device/publish',
        vnc_url: 'novnc.device/vnc'
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
                    // {type: "checkbox"},
                    {
                        minWidth: 180,
                        title: '操作',
                        templet: ea.table.tool,
                        //fixed:'left',
                        operat: [
                            [{
                                text: '编辑',
                                title: '终端修改',
                                url: init.edit_url,
                                method: 'open',
                                auth: 'edit',
                                class: 'layui-btn layui-btn-xs layui-btn-success',
                            },
                                {
                                    text: '下发任务',
                                    title: '下发任务',
                                    url: init.task_url,
                                    method: 'open',
                                    auth: 'task',
                                    class: 'layui-btn layui-btn-xs layui-btn-danger'

                                },
                                {
                                    text: '远程',
                                    title: '远程链接',
                                    url: init.vnc_url,
                                    method: 'jump',
                                    auth: 'vnc',
                                    class: 'layui-btn layui-btn-xs layui-btn-normal',
                                    type:'_black'
                                }
                            ]
                        ]
                    },
                    {field: 'id', width: 100, title: 'ID',sort:'true'},
                    {field: 'device_name', minWidth: 100, title: '设备名称',sort:'true'},
                    {field: 'ip', minWidth: 70, title: 'ip地址'},
                    {field: 'location', minWidth: 90, title: '位置',search:false},
                    {field: 'UUID', minWidth: 70, title: 'uuid',search:false},
                    {field: 'ips', minWidth: 70, title: 'ips',search:false},
                    {field: 'computer_name', minWidth: 100, title: '主机名称',search:false},
                    {field: 'group', minWidth: 100, title: '分组'}


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
            var tree = layui.tree;


            //模拟数据1

           // 加载服务端数据树状分组数据
            $.ajax({
                url:'/admin/test/getGroupInfoTree',
                type:'post',
                dataType:'json',
                //async:false,
                success:function(e){
                    if(e.code==1)
                    {
                        var data_tree=e.data;
                        //无连接线风格
                        tree.render({
                            elem: '#group-item'
                            ,data: data_tree
                            ,accordion:true
                            ,showLine: true  //是否开启连接线
                            ,onlyIconControl: true  //是否仅允许节点左侧图标控制展开收缩
                            ,click: function(obj){
                                console.log(obj.data); // 得到当前点击的节点数据
                                group = obj.data.id;
                                //console.log();
                                //设置cgroup的值
                                if(group=="1")
                                {
                                    $("#c-group").val("");
                                }
                                else
                                {
                                    $("#c-group").val(obj.data.id);
                                }

                                //table.reload("currentTableRenderId");
                                // //loadData();
                                var formList = document.querySelectorAll("[lay-submit]");
                                console.log(formList);
                                if (formList.length > 0) {
                                    $.each(formList, function (i, v) {
                                        v.click();
                                    });
                                }

                            }
                        });

                       }
                }
            });


            /// ===============树的搜索功能
            // treeId: tree所在的容器的id
// filter: 对应的搜索框的selector或者dom对象
// callback: 回调 参数(树节点jquery对象, 输入框对象, 匹配到的节点数量)
            tree.syncLayuiTreeFilter = function (treeId, filter, callback) {
                let treeElem = $('#' + treeId), filterElem = $(filter);
                if (!filterElem.length || !filterElem.length) {
                    return;
                }
                // 搜索框的监听事件按实际需求来
                filterElem.unbind('change').change(function () {
                    let that = this; //this;
                    let value = $(that).val().trim();
                    let HIDE = 'layui-hide';
                    let hintClass = 'search_hit';
                    // 先恢复现场
                    treeElem.find('.' + HIDE).removeClass(HIDE);
                    treeElem.find('.' + hintClass).removeClass(hintClass)
                    // 如果有值筛选开始
                    if (value) {
                        $.each(treeElem.find('.layui-tree-txt'), function (index, elem) {
                            elem = $(elem);
                            let textTemp = elem.text();
                            if (textTemp.indexOf(value) === -1) {
                                // 不存在就隐藏
                                elem.closest('.layui-tree-set').addClass(HIDE)
                            } else {
                                // 命中就添加一个class
                                elem.addClass(hintClass)
                            }
                        });
                        $.each(treeElem.find('.' + hintClass), function (index, elem) {
                            elem = $(elem);
                            // 取消隐藏所有父节点
                            elem.parents('.layui-tree-set').removeClass(HIDE);
                            // 展开所有父节点
                            elem.parents('.layui-tree-set').each(function (i, item) {
                                if (!$(item).hasClass('layui-tree-spread')) {
                                    $(item).find('.layui-tree-iconClick :first').click();
                                }
                            });
                        });
                    }
                    typeof callback === 'function' && callback.call(that, treeElem, filterElem, treeElem.find('.' + hintClass).length);
                });
            };

            tree.syncLayuiTreeFilter('group-item','#keywords',function (treeElem, filterElem, hitNumbers) {
                console.log('hitNumbers', hitNumbers);
                //layer.msg('找到' + hitNumbers + '个节点');
            });




            // =============================点击修改样式================================
            // 树点击样式修改
            $("body").on("click", ".layui-tree-txt", function () {
                $(".layui-tree-entry").removeClass("current");
                $(this).parent().parent().addClass("current");
            });


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