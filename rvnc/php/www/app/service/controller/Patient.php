<?php
/**
 * Created by PhpStorm.
 * User: CMM
 * Date: 2022-07-12
 * Time: 07:41
 */


namespace app\service\controller;



use app\admin\traits\Curd;
use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;
use think\facade\Db;
use think\facade\Env;
/**
 * Class Patient
 * @package app\admin\controller\mall
 * @ControllerAnnotation(title="患者管理")
 */
class Patient extends AdminController
{
    public function __construct(App $app)
    {
        parent::__construct($app);
       // $this->model = new Articles();
        $this->assign('version',time());
    }



    use Curd;
    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        $rest = Db::connect('oracle')->table('doc_vt员工档案')->limit(10)->select()->toArray();
        var_dump($rest);exit;
        return $this->fetch();
    }






}
