<?php
/**
 * Created by PhpStorm.
 * User: CMM
 * Date: 2022-12-16
 * Time: 21:12
 */
namespace app\admin\controller\novnc;
use app\admin\model\DeviceHelp;
use app\admin\model\DeviceGroup;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use app\common\controller\AdminController;
use think\App;
use think\facade\Db;


/**
 * Class Device
 * @package app\admin\controller\novnc
 * @ControllerAnnotation(title="分组设置")
 */
class Group extends AdminController
{
    use \app\admin\traits\Curd;


    protected $sort = [
        'sort' => 'desc',
        'id' => 'asc',
    ];

    public function __construct(App $app)
    {
        $this->model = new DeviceGroup();
        parent::__construct($app);
    }


    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->selectList();
            }
            list($page, $limit, $where) = $this->buildTableParames();
            $count = $this->model
                ->where($where)
                ->count();
            $list = $this->model
                ->where($where)
                ->page($page, $limit)
                ->order($this->sort)
                ->select();
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