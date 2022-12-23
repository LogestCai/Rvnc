define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'novnc.group/index',
        add_url: 'novnc.group/add',
        edit_url: 'novnc.group/edit',
        delete_url: 'novnc.group/delete',
        export_url: 'novnc.group/export',
        modify_url: 'novnc.group/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: 'ID'},
                    {field: 'name', minWidth: 80, title: '分类名称'},
                    {field: 'mark', minWidth: 80, title: '备注信息'},
                    {field: 'sort', width: 80, title: '排序', edit: 'text'},

                    {field: 'create_time', minWidth: 80, title: '创建时间', search: 'range'},
                    {width: 250, title: '操作', templet: ea.table.tool}
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
    };
    return Controller;
});