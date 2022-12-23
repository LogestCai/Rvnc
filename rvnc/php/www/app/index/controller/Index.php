<?php

namespace app\index\controller;


use app\admin\model\CommCommunity;
use app\admin\model\SystemAdmin;
use app\admin\model\SystemQuick;
use app\BaseController;
use app\common\controller\AdminController;
use think\App;
use think\facade\Db;
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
        return $this->fetch();
    }


    public function list(){
        //return json(['message'=>'showmessage']);
        $row = Db::table('hrp_article')->where(['id' => 192])->find();
        $this->assign('row',$row);
        return $this->fetch();
        return $this->fetch();
    }


    public function page($id)
    {
        if($id!=''){
            $row = Db::table('hrp_article')->where(['id' => $id])->find();
            $this->assign('row',$row);
        }

        return $this->fetch();
    }


}
