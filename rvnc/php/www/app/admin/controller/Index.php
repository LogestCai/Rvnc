<?php

namespace app\admin\controller;


use app\admin\model\SystemAdmin;
use app\admin\model\SystemQuick;
use app\admin\model\SystemUser;
use app\common\controller\AdminController;
use think\App;
use think\facade\Env;

class Index extends AdminController
{

    /**
     * 后台主页
     * @return string
     * @throws \Exception
     */
    public function index()
    {
        return $this->fetch('', [
            'admin' => session('admin'),
        ]);
    }

    /**
     * 后台欢迎页
     * @return string
     * @throws \Exception
     */
    public function welcome()
    {
        $quicks = SystemQuick::field('id,title,icon,href')
            ->where(['status' => 1])
            ->order('sort', 'desc')
            ->limit(8)
            ->select();
        $this->assign('quicks', $quicks);
        return $this->fetch();
    }

    /**
     * 修改管理员信息
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function editAdmin()
    {
        $id = session('admin.id');
        $row = (new SystemAdmin())
            ->withoutField('password')
            ->find($id);
        empty($row) && $this->error('用户信息不存在');
        if ($this->request->isAjax()) {
            $post = $this->request->post();
            $this->isDemo && $this->error('演示环境下不允许修改');
            $rule = [];
            $this->validate($post, $rule);
            try {
                $save = $row
                    ->allowField(['head_img', 'phone', 'remark', 'update_time'])
                    ->save($post);
            } catch (\Exception $e) {
                $this->error('保存失败');
            }
            $save ? $this->success('保存成功') : $this->error('保存失败');
        }
        $this->assign('row', $row);
        return $this->fetch();
    }

    /**
     * 修改密码
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function editPassword()
    {
        $id = session('admin.id');
        $row = (new SystemAdmin())
            ->withoutField('password')
            ->find($id);
        if (!$row) {
            $this->error('用户信息不存在');
        }
        if ($this->request->isAjax()) {
            $post = $this->request->post();
            $this->isDemo && $this->error('演示环境下不允许修改');
            $rule = [
                'password|登录密码'       => 'require',
                'password_again|确认密码' => 'require',
            ];
            $this->validate($post, $rule);
            if ($post['password'] != $post['password_again']) {
                $this->error('两次密码输入不一致');
            }

            // 判断是否为演示站点
            $example = Env::get('easyadmin.example', 0);
            $example == 1 && $this->error('演示站点不允许修改密码');

            try {
                $save = $row->save([
                    'password' => password($post['password']),
                ]);
            } catch (\Exception $e) {
                $this->error('保存失败');
            }
            if ($save) {
                $this->success('保存成功');
            } else {
                $this->error('保存失败');
            }
        }
        $this->assign('row', $row);
        return $this->fetch();
    }


    public function getUser(){
        $model = new SystemUser();
        $data =[];
        //$sql="select *from inf_vd_patient_visit where sJZH='00082815'";
        $sql='Select 系统序号 as "sno",名称 as "name",编码 as "user_number",身份证号 as "id_card",性别 as "sex",接入手机号码 as "phone", 隶属科室 "depart" ,登录口令"password",资格证书编号 "zg_card",执业证号 "zy_card" From DOC_VT员工档案 where 系统序号!=1 order by  系统序号 desc ';
        $conn = oci_connect('ambase','ambase','10.87.230.205/orcl','UTF8');
        $stid=oci_parse($conn,$sql);
        if($stid){
            $result=oci_execute($stid);
        }
        while (($row = oci_fetch_assoc($stid)) != false) {
            $data[] = $row;
            $model->create($row);
        }

        var_dump($data);
        oci_free_statement($stid);
        oci_close($conn);
        echo '成功了！';

    }

    function dumps($inf){
        if(is_string($inf)){
            echo $inf;
        }else{
            var_dump($inf);
        }
    }

    /**
     * 学习测试用
     */
    public function test(){
        $str = ' ".jdfhef974348@#2!';
        $this->dumps(addslashes($str));

    }

}
