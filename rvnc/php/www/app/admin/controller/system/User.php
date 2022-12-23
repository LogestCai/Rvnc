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

namespace app\admin\controller\system;

use app\admin\model\SystemUser;
use app\admin\model\SystemNode;
use app\admin\service\TriggerService;
use app\common\constants\MenuConstant;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use app\common\controller\AdminController;
use think\App;

/**
 * Class Menu
 * @package app\admin\controller\system
 * @ControllerAnnotation(title="菜单管理",auth=true)
 */
class User extends AdminController
{

    use \app\admin\traits\Curd;

    protected $sort = [
        //'sort' => 'desc',
        'id'   => 'asc',
    ];

    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new SystemUser();
    }

    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            if (input('selectFieds')) {
                return $this->selectList();
            }
            $count = $this->model->count();
           // var_dump( $this->sort);exit;
            list($page, $limit, $where) = $this->buildTableParames();
            $list = $this->model->where($where)->order($this->sort)->limit($page, $limit)->select();
            $data = [
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $list,
            ];
            return json($data);
        }
        return $this->fetch();
    }




}