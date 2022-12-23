define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'system.user/index',
        add_url: 'system.user/add',
        edit_url: 'system.user/edit',
        delete_url: 'system.user/delete',
        modify_url: 'system.user/modify',
        export_url: 'system.user/export',
        password_url: 'system.user/password',
    };

    var Controller = {

        index: function () {

            ea.table.render({
                init: init,
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: 'ID'},
                    {field: 'sno', width: 80, title: '编号', edit: 'text'},
                    {field: 'username', minWidth: 80, title: '用户名称'},
                    {field: 'user_number', minWidth: 80, title: '头像'},
                    {field: 'phone', minWidth: 80, title: '手机'},
                    {field: 'zc_card', minWidth: 80, title: '注册证号'},
                    {field: 'depart', minWidth: 80, title: '部门'},
                    {
                        width: 250,
                        title: '操作',
                        templet: ea.table.tool,
                        operat: [
                            'edit',
                            [{
                                text: '设置密码',
                                url: init.password_url,
                                method: 'open',
                                auth: 'password',
                                class: 'layui-btn layui-btn-normal layui-btn-xs',
                            }],
                            'delete'
                        ]
                    }
                ]],
            });

            ea.listen();
        },
        add: function () {
            ea.listen();
        },
        edit: function () {
            ea.listen();
        },
        password: function () {
            ea.listen();
        }
    };
    return Controller;
});