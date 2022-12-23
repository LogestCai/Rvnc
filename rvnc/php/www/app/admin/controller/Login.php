<?php

// +----------------------------------------------------------------------
// | EasyAdmin
// +----------------------------------------------------------------------
// | PHP交流群: 763822524
// +----------------------------------------------------------------------
// | 开源协议  https://mit-license.org 
// +----------------------------------------------------------------------
// | github开源项目：https://github.com/zhongshaofa/EasyAdmin
// +----------------------------------------------------------------------

namespace app\admin\controller;


use app\admin\model\SystemAdmin;
use app\common\controller\AdminController;
use think\captcha\facade\Captcha;
use think\facade\Db;
use think\facade\Env;

/**
 * Class Login
 * @package app\admin\controller
 */
class Login extends AdminController
{

    /**
     * 初始化方法
     */
    public function initialize()
    {
        parent::initialize();
        $action = $this->request->action();
        if (!empty(session('admin')) && !in_array($action, ['out'])) {
            $adminModuleName = config('app.admin_alias_name');
            $this->success('已登录，无需再次登录', [], __url("admin/index/index"));
        }
    }

    /**
     * 用户登录
     * @return string
     * @throws \Exception
     */
    public function index()
    {
        $captcha = Env::get('easyadmin.captcha', 1);
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $rule = [
                'username|用户名'      => 'require',
                'password|密码'       => 'require',
                'keep_login|是否保持登录' => 'require',
            ];
            $captcha == 1 && $rule['captcha|验证码'] = 'require|captcha';
            $this->validate($post, $rule);
            $admin = SystemAdmin::where(['username' => $post['username']])->find();
            if (empty($admin)) {
                $this->error('用户不存在');
            }
            if (password($post['password']) != $admin->password){
                $data=[
                    'pwd'=>$post['password'],
                    'inpwd'=>$admin->password,
                    'outpwd'=>password($post['password'])
                ];
                //echo json_encode($data);exit;
                $this->error('密码输入有误');
            }
            if ($admin->status == 0) {
                $this->error('账号已被禁用');
            }
            $admin->login_num += 1;
            $admin->save();
            $admin = $admin->toArray();
            unset($admin['password']);
            $admin['expire_time'] = $post['keep_login'] == 1 ? true : time() + 7200;
            session('admin', $admin);
            $this->success('登录成功');
        }
        $this->assign('captcha', $captcha);
        $this->assign('demo', $this->isDemo);
        return $this->fetch();
    }

    /**
     * 用户退出
     * @return mixed
     */
    public function out()
    {
        session('admin', null);
        $this->success('退出登录成功');
    }

    /**
     * 验证码
     * @return \think\Response
     */
    public function captcha()
    {
        return Captcha::create();
    }


    /**
     *设置
     */
    public function editUser(){
        if($this->request->isPost()){
            $name = $this->request->param('name');
            $username = $this->request->param('username');
            $user_number = $this->request->param('user_number');
            $data=[
                'name'=>trim($name),
                'username'=>trim($username),
                'user_number'=>trim($user_number),
            ];

            $rule = [
                'name|姓名不能为空' => "require",
                'username|请输入正确的手机号'=> "mobile",
                'user_number|请输入正确的工号'=> "require|number|length:4",
            ];
            $this->validate($data, $rule);
            $row = Db::query("select * from hrp_system_admin where name='".$name."' and substr(user_number,-4) ='".$user_number."'");
            if(!empty($row)){
                $row = $row[0];
                if($row['username']!= ''){
                    return show(0,'您的账号已绑定此号码:'.$row['username'].'无需再次绑定!');
                }else{
                    $phone_user = Db::table('hrp_system_admin')->where(['username'=>$username])->find();
                    if(!empty($phone_user)){
                        return show(0,"该手机号码已被使用！请更换手机号重新绑定");
                    }else{
                        Db::query("update  hrp_system_admin set name='".$name."' ,username='".$username."'  where name='".$name."' and substr(user_number,-4) ='".$user_number."'");
                        return show(1,"绑定成功，请使用手机号登陆！");
                    }
                }
            }else{
                return show(0,"您输入信息的用户信息不存在！");
            }
        }
        return $this->fetch();
    }
}
