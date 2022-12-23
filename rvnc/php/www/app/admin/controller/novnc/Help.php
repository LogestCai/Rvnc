<?php
/**
 * Created by PhpStorm.
 * User: CMM
 * Date: 2022-12-16
 * Time: 21:12
 */
namespace app\admin\controller\novnc;
use app\admin\model\DeviceHelp;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use app\common\controller\AdminController;
use think\App;
use think\facade\Db;
use think\facade\Log;


/**
 * Class Device
 * @package app\admin\controller\novnc
 * @ControllerAnnotation(title="求助管理")
 */
class Help extends AdminController
{
    protected  $taskList = [
        ['id'=>'1','name'=>'重启电脑'],
        ['id'=>'2','name'=>'重启远程模块'],
        ['id'=>'3','name'=>'关闭应用程序操作'],
        ['id'=>'4','name'=>'CMD指令'],
    ];
    use \app\admin\traits\Curd;
    public function __construct(App $app)
    {
        $this->model = new DeviceHelp();
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
            //$where[] = ['delete_time','is not ' ,'null'];
            $count = Db::table('hrp_v_device_help')
                ->where($where)
                ->where('delete_time','null')
                ->count();
            $list = Db::table('hrp_v_device_help')
                ->where($where)
                ->where('delete_time','null')
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
     * @NodeAnotation(title="下发任务")
     */
    public function task($id){
        $deviceId = Db::table('hrp_device_help')->where('id',$id)->value('device_id');
        $deviceModel =new \app\admin\model\Device();
        $row = $deviceModel
            ->find($deviceId);
        if ($this->request->isAjax()) {
            $post = $this->request->post();
            //$post['register_time'] = $post['register_time']? strtotime($post['register_time']):time();
            $rule = [
                'type|任务类型'=>'require'
            ];
            $this->validate($post, $rule);
            $taskData = [];
            $successFlag =false;
            $msg ="";
            if($post['type']=='4')
            {
                //执行cmd命令
                if($post['command']=='')return show(0,'Cmd命令不能为空！');
                $url = "http://".$row->ip.":9999/ExecCmd?key=".$post['command'];
                $taskData['type']=4;
                $taskData['command']=$post['command'];
                $taskData['name']='CMD命令';
                $cmdRest = requestGet($url);
                Log::write("curl请求返回为".json_encode($cmdRest));
                $msg .=$cmdRest['msg'];
                $successFlag=$cmdRest['code']==1?true:false;

            }elseif($post['type']=='3')
            {
                //执行cmd命令
                if($post['command']=='')return show(0,'关闭程序进程名称不能为空！');
                $url = "http://".$row->ip.":9999/StopProcess?key=".$post['command'];
                $taskData['type']=3;
                $taskData['command']=$post['command'];
                $taskData['name']='关闭应用程序';
                $cmdRest = requestGet($url);
                Log::write("curl请求返回为".json_encode($cmdRest));
                $msg .=$cmdRest['msg'];
                $successFlag=$cmdRest['code']==1?true:false;
            }else
            {
                $opName = $post['type']==1?'RestartComputer':'RestartVnc';
                $url = "http://".$row->ip.":9999/".$opName;

                $taskData['type']=$post['type'];
                $taskData['command']=$opName;
                $taskData['name']=$opName;
                $cmdRest = requestGet($url);
                Log::write("curl请求返回为".json_encode($cmdRest));
                $msg .=$cmdRest['msg'];
                $successFlag=$cmdRest['code']==1?true:false;
            }
            if($successFlag)
            {
                return show(1,'操作成功！'.$msg);
            }else{
                //执行被动任务
                $taskModel =new DeviceTask();
                $where=[];
                $where['type']=$post['type'];
                $where['command']=$taskData['command'];
                $where['name']=$taskData['name'];
                $where['device_id']=$row->id;
                $where['receive']=0;
                $rest = $taskModel->where($where)->findOrEmpty();
                if(!$rest->isEmpty())
                {
                    $taskData['device_id']=$row->id;
                    $taskModel->create($taskData);
                    return show(1,'添加被动任务成功！【'.$taskData['name'].'--'.$taskData['command'].'】');
                }else
                {
                    return show(0,'添加被动任务失败！已存在未执行的任务【'.$taskData['name'].'--'.$taskData['command'].'】');
                }
            }



        }
        $row = $row->getOrigin();



        $formData = [
//

        ];
        $formService = [
            ['field'=>'type','type'=>'select','title'=>'下发任务','data'=>$this->taskList],
        ];
        $this->assign('formData',$formData);
        $this->assign('formService',$formService);
        $this->assign('row',$row);
        return $this->fetch();
    }


}