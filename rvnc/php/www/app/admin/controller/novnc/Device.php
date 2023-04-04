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

namespace app\admin\controller\novnc;


use app\admin\model\Device as Model;
use app\admin\model\DeviceGroup;
use app\admin\model\DeviceTask;
use app\common\controller\AdminController;
use app\common\tool\JzylbInterfaceTest;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;
use think\cache\driver\Redis;
use think\facade\Db;
use think\facade\Env;
use think\facade\Log;

/**
 * Class Device
 * @package app\admin\controller\novnc
 * @ControllerAnnotation(title="远程管理")
 */
class Device extends AdminController
{

    use \app\admin\traits\Curd;

    protected $sort = [
        'sort' => 'desc',
        'id'   => 'desc'
    ];

    protected  $taskList = [
        ['id'=>'1','name'=>'重启电脑'],
        ['id'=>'2','name'=>'重启远程模块'],
        ['id'=>'3','name'=>'关闭应用程序操作'],
        ['id'=>'4','name'=>'CMD指令'],
    ];




    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new Model();

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

    /**
     * @NodeAnotation(title="添加数据")
     */
    public function add(){
        if ($this->request->isAjax()) {
            $post = $this->request->post();
            //$post['register_time'] = $post['register_time']? strtotime($post['register_time']):time();
            $rule = [];
            $this->validate($post, $rule);
            try {
                $this->model->create_user = session('admin.name');
                $save = $this->model->save($post);


            } catch (\Exception $e) {
                $this->error('保存失败:'.$e->getMessage());
            }
            $save ? $this->success('保存成功') : $this->error('保存失败');
        }
        $formData = [
            ['field'=>'register_time','type'=>'datetime','lay-verify'=>'required','title'=>'登记时间','value'=>''],
            ['field'=>'name','type'=>'input','lay-verify'=>'required','title'=>'用户姓名','value'=>''],
            ['field'=>'ident_card','type'=>'input','title'=>'身份证','value'=>''],
            ['field'=>'in_depart','type'=>'input','lay-verify'=>'required','title'=>'登记科室','value'=>''],
            ['field'=>'phone','type'=>'input','lay-verify'=>'required','title'=>'联系电话','value'=>''],
            ['field'=>'mz_doctor','type'=>'input','lay-verify'=>'required','title'=>'门诊医生','value'=>''],
            ['field'=>'sZYH','type'=>'input','title'=>'住院号','value'=>''],
            ['field'=>'art_result','type'=>'input','title'=>'核酸结果','value'=>''],



        ];

        $formService=[
            ['field'=>'kzyz_rate','type'=>'radio','title'=>'开住院证','value'=>'','data'=>$this->myd_score],
            ['field'=>'hsjc_rate','type'=>'radio','title'=>'核酸检测','value'=>'','data'=>$this->myd_score],
            ['field'=>'kffw_rate','type'=>'radio','title'=>'客服服务','value'=>'','data'=>$this->myd_score],
            ['field'=>'xxdd_rate','type'=>'radio','title'=>'休息等待','value'=>'','data'=>$this->myd_score],
            ['field'=>'blry_rate','type'=>'radio','title'=>'办理入院','value'=>'','data'=>$this->myd_score],
            ['field'=>'zyqj_rate','type'=>'radio','title'=>'住院期间','value'=>'','data'=>$this->myd_score],
            ['field'=>'blcy_rate','type'=>'radio','title'=>'办理出院','value'=>'','data'=>$this->myd_score],
            ['field'=>'suggest','type'=>'textarea','title'=>'意见','value'=>''],
            ['field'=>'advice','type'=>'textarea','title'=>'建议','value'=>''],
            ['field'=>'mark','type'=>'textarea','title'=>'备注','value'=>''],
        ];
        $this->assign('formService',$formService);
        $this->assign('formData',$formData);

        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="修改")
     */
    public function edit($id){
        $row = $this->model
            ->find($id);


        if ($this->request->isAjax()) {
            $post = $this->request->post();
            //$post['register_time'] = $post['register_time']? strtotime($post['register_time']):time();
            $rule = [];
            $this->validate($post, $rule);
//

            $save =$row->where(['id'=>$id])->update($post);
            if($post['ip']!='' && $post['ip']!=$row->ip){
                $redis = new Redis(config('cache.stores.redis'));
                $redis->set($post['UUID'], '{"host":"'.$post['ip'].':5901"}');
            }
            $save ? $this->success('保存成功') : $this->error('保存失败');
        }
        $row = $row->getOrigin();
        $groupModel = new DeviceGroup();
        $groupData = $groupModel->getPidMenuList();
        $groupCurrentData =[];
        if(!empty($groupData))
        {
           foreach ($groupData as $v)
           {
               $groupCurrentData[] = ['id'=>$v['id'],'name'=>$v['title']];
           }
        }

        $formData = [
            ['field'=>'id','type'=>'input','lay-verify'=>'required','title'=>'id','readonly'=>'readonly','value'=>$row['id']],
            ['field'=>'UUID','type'=>'input','lay-verify'=>'required','readonly'=>'readonly','title'=>'UUID','value'=>$row['UUID']],

            ['field'=>'ip','type'=>'input','title'=>'ip地址','value'=>$row['ip']],
            ['field'=>'device_name','type'=>'input','title'=>'设备名称','value'=>$row['device_name']],
            ['field'=>'location','type'=>'input','title'=>'位置','value'=>$row['location']]

        ];
        $formService = [
            ['field'=>'group','type'=>'select','title'=>'分组','value'=>$row['group'],'data'=>$groupCurrentData],
//            ['field'=>'need_visit','type'=>'radio','title'=>'是否需要回访','value'=>$row['need_visit'],'data'=>[['id'=>'1','name'=>'是'],['id'=>'0','name'=>'否']]],
//            ['field'=>'next_visit_time','type'=>'date','title'=>'回访时间','value'=>$row['next_visit_time']],
//            ['field'=>'next_visit_mark','type'=>'input','title'=>'下次回访备注','value'=>$row['next_visit_mark']],
        ];
        $this->assign('formData',$formData);
        $this->assign('formService',$formService);
        $this->assign('row',$row);
        return $this->fetch();
    }


    /**
     * @NodeAnotation(title="远程")
     */
    public function vnc($id)
    {
        $info=[];
        $rest = $this->model->find($id);
        $rest = $rest->getOrigin();
        if(!empty($rest))
        {
            $info = [
                'host'=>Env::get('proxy.host_ip','10.87.230.199'),
                'port'=>Env::get('proxy.host_port','6080'),
                'path'=>'websockify/?token='.$rest['UUID'],
                //'path'=>'websockify/?target1'
            ];
        }

        $this->assign('info',$info);
        return $this->fetch();
    }
    /**
     * @NodeAnotation(title="下发任务")
     */
    public function task($id){
        $row = $this->model
            ->find($id);
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

            }
            elseif($post['type']=='3')
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
//            ['field'=>'id','type'=>'input','lay-verify'=>'required','title'=>'id','readonly'=>'readonly','value'=>$row['id']],
//            ['field'=>'UUID','type'=>'input','lay-verify'=>'required','readonly'=>'readonly','title'=>'UUID','value'=>$row['UUID']],
//
//            ['field'=>'ip','type'=>'input','title'=>'ip地址','value'=>$row['ip']],
//            ['field'=>'device_name','type'=>'input','title'=>'设备名称','value'=>$row['device_name']],
//            ['field'=>'location','type'=>'input','title'=>'位置','value'=>$row['location']]

        ];
        $formService = [
            ['field'=>'type','type'=>'select','title'=>'下发任务','data'=>$this->taskList],
//            ['field'=>'need_visit','type'=>'radio','title'=>'是否需要回访','value'=>$row['need_visit'],'data'=>[['id'=>'1','name'=>'是'],['id'=>'0','name'=>'否']]],
            //['field'=>'commamd','type'=>'input','title'=>'指令','value'=>''],
//            ['field'=>'next_visit_mark','type'=>'input','title'=>'下次回访备注','value'=>$row['next_visit_mark']],
        ];
        $this->assign('formData',$formData);
        $this->assign('formService',$formService);
        $this->assign('row',$row);
        return $this->fetch();
    }


    public function getTask()
    {
        if ($this->request->isPost())
        {
            $post = $this->request->post();
            $taskModel = new DeviceTask();
            $rest = $taskModel->where(['device_id'=>$post['id'],'receive'=>0])->select();

            if($rest->isEmpty())
            {
                return show(0,'不存在有效任务');
            }
            return show(1,'获取数据成功',$rest);

        }
    }

    public function setTask()
    {
        if ($this->request->isPost())
        {
            $post = $this->request->post();
            $taskModel = new DeviceTask();
            $taskModel->where(['id'=>$post['id'],'receive'=>0])->update(['receive'=>1,'receive_time'=>date('Y-M-D H:i:s')]);
            return show(1,'获取数据成功',$rest);

        }
    }


}
