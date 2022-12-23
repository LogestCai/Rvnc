define(["easy-admin"], function (ea) {

    var Controller = {
        index: function () {

            if (top.location !== self.location) {
                top.location = self.location;
            }

            $('.bind-password').on('click', function () {
                if ($(this).hasClass('icon-5')) {
                    $(this).removeClass('icon-5');
                    $("input[name='password']").attr('type', 'password');
                } else {
                    $(this).addClass('icon-5');
                    $("input[name='password']").attr('type', 'text');
                }
            });

            $('.icon-nocheck').on('click', function () {
                if ($(this).hasClass('icon-check')) {
                    $(this).removeClass('icon-check');
                } else {
                    $(this).addClass('icon-check');
                }
            });
            
            $('.login-tip').on('click', function () {
                $('.icon-nocheck').click();
            });

            ea.listen(function (data) {
                data['keep_login'] = $('.icon-nocheck').hasClass('icon-check') ? 1 : 0;
                return data;
            }, function (res) {
                ea.msg.success(res.msg, function () {
                    let form = document.getElementById('salary-form');
                    form.reset();
                    $("#salary-form").addClass('layui-hide');
                    let html = '<div class="item line-mid"> <p>员工姓名：' + res.data.name + '</p></div>';
                     html += '<div class="item line-mid"> <p>身份证号：' + res.data.idcard + '</p></div>';
                     html += '<div class="item line-mid"> <p>工资月份：202103</p></div>';
                     html += '<div class="item line-mid"> <p>实发工资：' + res.data.true_salary + '</p></div>';
                     html += '<div class="item line-mid"> <p>基本工资：' + res.data.base_salary + '</p></div>';
                     html += '<div class="item line-mid"> <p>绩效工资：' + res.data.jx_salary + '</p></div>';
                     html += '<div class="layui-form-item" style="text-align:center; width:100%;height:100%;margin:0px;"> <button class="login-btn" lay-submit>继续查询</button>  </div>';
                     $("#dis-content").empty();
                     $("#dis-content").append(html);
                     $("#salary-content").removeClass('layui-hide');

                })
            }, function (res) {
                ea.msg.error(res.msg, function () {
                    $('#refreshCaptcha').trigger("click");
                });
            });

        },
    };
    return Controller;
});
