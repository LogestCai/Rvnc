<?php
/**
 * Created by PhpStorm.
 * User: CMM
 * Date: 2022-12-16
 * Time: 21:12
 */
namespace app\admin\controller\novnc;
use app\admin\model\DeviceHelp;
use app\admin\model\DeviceRepair;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use app\common\controller\AdminController;
use think\App;
use think\facade\Db;


/**
 * Class Device
 * @package app\admin\controller\novnc
 * @ControllerAnnotation(title="设备报修")
 */
class Repair extends AdminController
{
    use \app\admin\traits\Curd;


    protected  $repairStatus = [
        ['id'=>'0','name'=>'已申请'],
        ['id'=>'1','name'=>'已安排'],
        ['id'=>'2','name'=>'已处理'],
        ['id'=>'-1','name'=>'已作废'],
        ['id'=>'3','name'=>'暂时无法处理'],
    ];
    public function __construct(App $app)
    {
        $this->model = new DeviceRepair();
        parent::__construct($app);
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
            list($page, $limit, $where) = $this->buildTableParames();
            $count = Db::table('hrp_v_device_repair')
                ->where($where)
                ->count();
            $list = Db::table('hrp_v_device_repair')
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

    /**
     * @NodeAnotation(title="修改")
     */
    public function edit($id){
        $row = Db::table('hrp_v_device_repair')->where('id',$id)
            ->find();


        if ($this->request->isAjax()) {
            $post = $this->request->post();
            //$post['register_time'] = $post['register_time']? strtotime($post['register_time']):time();
            $rule = [];
            $this->validate($post, $rule);
//

            $save =Db::table('hrp_device_repair')->where(['id'=>$id])->update($post);

            $save ? $this->success('保存成功') : $this->error('保存失败');
        }


        $formData = [
//            ['field'=>'id','type'=>'input','lay-verify'=>'required','title'=>'id','readonly'=>'readonly','value'=>$row['id']],
//            ['field'=>'UUID','type'=>'input','lay-verify'=>'required','readonly'=>'readonly','title'=>'UUID','value'=>$row['UUID']],
//            ['field'=>'ip','type'=>'input','title'=>'ip地址','value'=>$row['ip']],
//            ['field'=>'device_name','type'=>'input','title'=>'设备名称','value'=>$row['device_name']],
//            ['field'=>'location','type'=>'input','title'=>'位置','value'=>$row['location']]

        ];
        $formService = [
            ['field'=>'status','type'=>'select','title'=>'状态','value'=>$row['status'],'data'=>$this->repairStatus],
//            ['field'=>'need_visit','type'=>'radio','title'=>'是否需要回访','value'=>$row['need_visit'],'data'=>[['id'=>'1','name'=>'是'],['id'=>'0','name'=>'否']]],
//            ['field'=>'next_visit_time','type'=>'date','title'=>'回访时间','value'=>$row['next_visit_time']],
           ['field'=>'mark','type'=>'textarea','title'=>'备注','value'=>$row['mark']],
        ];
        $this->assign('formData',$formData);
        $this->assign('formService',$formService);
        $this->assign('row',$row);
        return $this->fetch();
    }


}