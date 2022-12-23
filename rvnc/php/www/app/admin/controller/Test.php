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


use app\admin\model\Device;
use app\admin\model\DeviceHelp;
use app\admin\model\DeviceProblem;
use app\admin\model\DeviceRepair;
use app\admin\model\DeviceTask;
use app\admin\model\SystemAdmin;
use app\common\controller\AdminController;
use app\common\tool\JzylbInterface;
use app\common\tool\JzylbInterfaceTest;
use app\common\tool\PhpOci;
use Matrix\Exception;
use think\captcha\facade\Captcha;
use think\cache\driver\Redis;
use think\facade\Db;
use think\facade\Env;
use think\facade\Log;

/**
 * Class Login
 * @package app\admin\controller
 */
class Test extends AdminController
{


    public function getGroupInfoTree()
    {
        $post = $this->request->post();

        if($this->request->isPost())
        {
            $order = ['sort'=>'desc','id'=>'asc'];
            //$keywords = $post['keywords'];
            $where=[];
            //$where[] = ['name','like','%'.$keywords.'%'];
            //$where[] = ['pid','=',1];
            $rest = Db::table('hrp_device_group')->fieldRaw('id,pid,name as title')->where($where)->where('delete_time','null')->order($order)->select()->toArray();
            if(!empty($rest))
            {
                $tmpdata = getTree($rest);
                return show(1,"获取成功！",$tmpdata);
            }else{
                return show(0,'未查询到数据！');
            }

        }
        return show(0,'获取分组信息失败！');
    }
    public function getRepairRecord ()
    {

        if ($this->request->isPost())
        {
            $post = $this->request->post();
            //$problemModel = new DeviceProblem();
            $status=$post['status'];
            $where=[];
            $where[] = ['status','=',$post['status']];
            $where[] = ['problem_type','=',$post['type']];
            $where[] = ['create_time','>=',$post['start_time']];
            $where[] = ['create_time','<=',$post['end_time']];

            $rest = Db::table('hrp_v_device_repair')->where($where)->order('create_time desc')->select();
            if(!$rest->isEmpty())
            {
                return show(1,'获取常见问题成功！',$rest);
            }
            return show(0,'获取常见问题失败！未查询到常见问题信息！');

        }
        return show(0,'无效的请求!');
    }
    public function getOftenProblem ()
    {

        if ($this->request->isPost())
        {
            $post = $this->request->post();
            $problemModel = new DeviceProblem();
            $repairType=$post['repair_type'];
            $rest = $problemModel->whereRaw("repair_type in ($repairType)")->order("repair_type")->select();
            if(!$rest->isEmpty())
            {
                return show(1,'获取设备信息成功！',$rest);
            }
            return show(0,'获取设备信息失败！！未查询到有效终端信息！');

        }
        return show(0,'无效的请求!');
    }
    public function sendDeviceRepair ()
    {
        if ($this->request->isPost())
        {
            $post = $this->request->post();
            $repairModel = new DeviceRepair();
            Log::write($post);
            $rule = [
                'report_device_id|上报设备id'=>'require|number',
                'repair_device_id|故障设备id'=>'require',
                //'problem_type|报修'=>'require',
                'report_user_phone|报修人联系电话'=>'require|mobile',

            ];
            $this->validate($post, $rule);
            if(!isset($post['problem_type'])||empty($post['problem_type']))
            {
                return show(0,'报修问题不能为空！');
            }
            foreach ($post['problem_type'] as $v)
            {
                if($v['problem_type']!='')
                {
                    $repairData =[];
                    $repairData['report_device_id']=$post['report_device_id'];
                    $repairData['repair_device_id']=$post['repair_device_id'];
                    $repairData['problem_type']=$v['problem_type'];
                    $repairData['report_user_phone']=$post['report_user_phone'];
                    $repairData['problem_description']=$post['problem_description'];
                    $existsRepair = $repairModel->where(['repair_device_id'=>$post['repair_device_id'],'problem_type'=>$v['problem_type']])->whereRaw("status in (0,1)")->findOrEmpty();
                    if($existsRepair->isEmpty())
                    {
                        $repairModel->create($repairData);
                    }

                }
            }
            return show(1,'申请维修信息发送成功！');

        }
        return show(0,'无效的请求!');
    }
    public function sendHelpInfo()
    {
        if ($this->request->isPost())
        {
            $post = $this->request->post();
            $taskModel = new Device();
            $rest = $taskModel->where(['UUID'=>$post['UUID']])->find();
            if(!$rest->isEmpty())
            {
                $helpMode = new DeviceHelp();
                $helpData =[];
                $helpData['device_id']=$rest->id;
                $helpMode->create($helpData);
                return show(1,'发送求助信息成功！');
            }
            return show(0,'发送求助信息失败！未查询到有效终端信息！');

        }
        return show(0,'无效的请求!');
    }
    public function getDeviceInfos ()
    {

        if ($this->request->isPost())
        {
            $post = $this->request->post();
            $taskModel = new Device();
            $keywords=$post['keywords'];
            $where=[];
            if(isset($post['group']))
            {
                $where[] = ['group','=',$post['group']];
                $where[] = ['device_name','like','%'.$keywords.'%'];
            }elseif (isset($post['expect_id']))
            {
                $where[] = ['id','NOT IN',$post['expect_id']];
                $where[] = ['device_name','like','%'.$keywords.'%'];
            }else
            {
                $where[] = ['id','=',$post['id']];
                $where[] = ['device_name','like','%'.$keywords.'%'];
            }

            $rest = $taskModel->where($where)->select();
            if(!$rest->isEmpty())
            {
                return show(1,'获取设备信息成功！',$rest);
            }
            return show(0,'获取设备信息失败！！未查询到有效终端信息！');

        }
        return show(0,'无效的请求!');
    }

    public function getGlobalPreventProcess()
    {
        return show(1,"获取成功！",config('app.prevent_process'));
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
            date_default_timezone_set('PRC');
            //echo date('Y-m-d H:i:s');
            $post = $this->request->post();
            $taskModel = new DeviceTask();
            $taskModel->where(['id'=>$post['id'],'receive'=>0])->update(['receive'=>1,'receive_time'=>date('Y-m-d H:i:s')]);
            return show(1,'设置任务状态成功！');

        }
    }

    public function  getValidIp()
    {
        $ips = $this->request->param('ips');
        $ips = @explode('|',$ips);
        //var_dump($ips);exit;
        if(!empty($ips))
        {
            foreach($ips as $vv)
            {
                $rest = pingTest($vv);
                if($rest['code']==1)
                {
                    return show(1,'验证ip成功！',['ip'=>$vv]);
                }
            }
        }
        return show(0,'不存在有效的ip地址！');
    }

    public function testt()
    {
        $redis = new Redis(config('cache.stores.redis'));
        $redis->set('target1', '{"host":"192.168.17.231:5901"}');
        $pasa = $redis->get('target1');
        dd($pasa);
    }

    public function getDeviceInfo()
    {
        $model = new Device();
        $post = $this->request->post();
        if($this->request->isPost())
        {
            $uuid = $post['UUID'];
            $rest = $model->where(['UUID'=>$uuid])->findOrEmpty();
            //$rest=$rest->getOrigin();
            if(!$rest->isEmpty())
            {

                return show(1,"获取成功！",$rest);
            }
            else
            {
                return show(0,"未获取到有效数据",$rest);
            }
        }
    }

    public function getGroupInfo()
    {
        $post = $this->request->post();

        if($this->request->isPost())
        {
            $keywords = $post['keywords'];
            $where=[];
            $where[] = ['name','like','%'.$keywords.'%'];
            $where[] = ['pid','=',1];
            $rest = Db::table('hrp_device_group')->where($where)->select()->toArray();
            if(!empty($rest))
            {
                return show(1,"获取成功！",$rest);
            }else{
                return show(0,'未查询到数据！');
            }

        }
        return show(0,'获取分组信息失败！');
    }

    public function setDeviceInfo()
    {
        $model = new Device();

        $post = $this->request->post();

        if($this->request->isPost())
        {
            $uuid = $post['UUID'];
            $rest = $model->where(['UUID'=>$uuid])->findOrEmpty();
            //$rest = $rest->getOrigin();
            if(!$rest->isEmpty())
            {

                ///Log::write("获取数据成功！");
                //Log::write($rest);
                $model->where(['UUID'=>$uuid])->update($post);
            }
            else
            {
                $model->create($post);
            }
            return show(1,'设置成功！',$post);
        }

    }


    public function setRedis()
    {
        $post = $this->request->post();
        if(!empty($post['key']))
        {
            if($post['ip']=='')
            {
                $model =new Device();
                $rest = $model->where(['UUID'=>$post['key']])->findOrEmpty();
                if(!$rest->isEmpty())
                {
                    $post['ip']= $rest['ip'];
                }
            }
            //$rest = $rest->getOrigin();

            $redis = new Redis(config('cache.stores.redis'));
            $redis->set($post['key'], '{"host":"'.$post['ip'].':5901"}');
        }
        return show(1,'设置成功！');


    }

    public function vnc($id)
    {

        $info=[];
        $rest = Db::table('hrp_device')->find($id);
        //$rest = $rest->getOrigin();
        if(!empty($rest))
        {
            $info = [
                'host'=>Env::get('proxy.host_ip','10.87.230.199'),
                'port'=>Env::get('proxy.host_port','6080'),
                'path'=>'websockify/?token='.$rest['UUID'],
                //'path'=>'websockify/?target1'
            ];
            $this->assign('info',$info);
            return $this->fetch();
        }else
        {
            return show(0,'请求参数出错！');
        }


    }


    /**
     * title="下发任务"
     */
    public function task($id){
        $model =new Device();
        $row = $model
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

    /**
     * 初始化方法
     */
    public function initialize()
    {
        parent::initialize();
        $action = $this->request->action();
//        if (!empty(session('admin')) && !in_array($action, ['out'])) {
//            $adminModuleName = config('app.admin_alias_name');
//            $this->success('已登录，无需再次登录', [], __url("@{$adminModuleName}"));
//        }
    }

    /**
     * 用户登录
     * @return string
     * @throws \Exception
     */
    public function index()
    {
        return json(['code'=>1,'message'=>'今日【方便门诊】挂号类别已经超过上限10个！请选择其他挂号类别。']);

        $type = $this->request->get('type','search');
        $captcha = Env::get('easyadmin.captcha', 1);
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $rule = [
                'idcard|身份证号'      => 'require',
                'name|姓名'       => 'require'
            ];
            $captcha == 1 && $rule['captcha|验证码'] = 'require|captcha';
            $this->validate($post, $rule);
            $admin = Db::table('hrp_cw_salary')->where(['name' => $post['name'],'idcard'=>$post['idcard']])->find();
            //var_dump($admin);exit;
            if (empty($admin)) {
                $this->error('未查询到工资信息');
            }
            $data = [
              'code'=>1,
              'msg'=>'查询成功',
              'data'=>$admin
            ];
            return json($data);
        }
        $this->assign('captcha', $captcha);
        $this->assign('demo', $this->isDemo);
        $this->assign('type', $type);
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
     * 显示首页信息
     * @return mixed
     */
    public function showPage(){
        //return json(['message'=>'showmessage']);
        $row = Db::table('hrp_article')->where(['id' => 192])->find();
        $this->assign('row',$row);
        return $this->fetch();
    }

    public function showYbdata1(){
        if($this->request->isAjax()){
            //var_dump($this->request->param());exit;
            $params = $this->request->param();
            $page   = $params['page'];
            $limit  = $params['limit'];
            $where = " where A.隶属机构i='1'";
            if(isset($params['项目类别']) && $params['项目类别']!=''){
                $where .= " and 项目类别='".$params['项目类别']."'";
            }
            if(isset($params['项目名称'])&&$params['项目名称']!=''){
                $where .= " and 项目名称 like '%".$params['项目名称']."%'";
            }
            if(isset($params['项目编码'])&&$params['项目编码']!=''){
                $where .= " and 项目编码 ='".$params['项目编码']."'";
            }
            $db = PhpOci::getInstance();
            $sql_total ="select count(*)  total from INF_TCZSYB_中心药诊材目录 A ".$where;
            $sql = "select t2.* from (select rownum r,t1.* from (select *from ( select rowidtochar(rowid)  id, A.*from INF_TCZSYB_中心药诊材目录 A ".$where." ) T ) t1 where rownum<=".$page*$limit.") t2 where t2.r>".($page-1)*$limit;
            //$sql = "select *from inf_tczsyb_二级代码目录 where 代码类别='剂型'";
            $data = $db->findAll($sql);
            $count = $db->findOne($sql_total);
            //var_dump($sql);exit;
            $rest = [
                'code'=> 0,
                'msg'=> '获取数据成功',
                'count'=> $count['TOTAL'],
                'data'=> $data
            ];
            return $rest;
        }
        return $this->fetch();
    }

    public function showYbdata(){
        if($this->request->isAjax()){
            //var_dump($this->request->param());exit;
            $params = $this->request->param();
            $page   = $params['page'];
            $limit  = $params['limit'];
            $where = " where 1=1 ";
//            if(isset($params['项目类别']) && $params['项目类别']!=''){
//                $where .= " and 项目类别='".$params['项目类别']."'";
//            }
            if(isset($params['医保通用名'])&&$params['医保通用名']!=''){
                $where .= " and 医保通用名 like '%".$params['医保通用名']."%'";
            }
            if(isset($params['医疗目录编码'])&&$params['医疗目录编码']!=''){
                $where .= " and 医疗目录编码 ='".$params['医疗目录编码']."'";
            }
            $db = PhpOci::getInstance();
            $sql_total ="select count(*)  total from INF_TAHYB_医用耗材 A ".$where;
            $sql = "select t2.* from (select rownum r,t1.* from (select *from ( select rowidtochar(rowid)  id, A.*from INF_TAHYB_医用耗材 A ".$where." ) T ) t1 where rownum<=".$page*$limit.") t2 where t2.r>".($page-1)*$limit;
            //$sql = "select *from inf_tczsyb_二级代码目录 where 代码类别='剂型'";
            $data = $db->findAll($sql);
            $count = $db->findOne($sql_total);
            //var_dump($sql);exit;
            $rest = [
                'code'=> 0,
                'msg'=> '获取数据成功',
                'count'=> $count['TOTAL'],
                'data'=> $data
            ];
            return $rest;
        }
        return $this->fetch();
    }



    public function ybadd(){
        if($this->request->isPost()){
           // $this->error("shiai");
           $data =  $this->request->post();
           if(strlen($data['医疗目录编码'])!=27){return $this->error('医疗目录编码必须为27位');}

           try{
               $db = PhpOci::getInstance();
               $db->autoInsert($data,'inf_tahyb_医用耗材');
               $this->success("添加成功！");
           }catch (Exception $exception){
               $this->error($exception->getMessage());
           }
        }
        return $this->fetch();
    }

    public function ybedit(){
        $params = $this->request->param();
        if($this->request->isPost()){
            // $this->error("shiai");
            $data =  $this->request->post();
           // if(strlen($data['项目编码'])!=27){return $this->error('中心项目编码必须为27位');}
            // var_dump($data);exit;
            $data['隶属机构I']=1;
            $dm_data=[];
            $dm_data['医疗目录编码']=$data['医疗目录编码'];
            $dm_data['医保通用名']=$data['医保通用名'];
            try{
                $db = PhpOci::getInstance();
                //更新修改的信息
                $db->autoUpdate('inf_tczsyb_中心药诊材目录',$data,'rowid');
                //更新对照信息  //如果中心项目编码不等于空则更新项目对码关系
                if($dm_data['中心项目编码']!=''){
                    $db->autoUpdate('INF_DCZSYB_项目对码目录',$dm_data,'医疗目录编码');
                }
                $this->success("修改成功！");
            }catch (\think\Exception $exception){
                $this->error($exception->getMessage());
            }
        }
        $rowid = $params['rowid'];
        if($rowid == ''){
            $this->error('请求错误！请求参数不能为空');
        }
        $db = PhpOci::getInstance();
        $row = $db->findOne("select rowidtochar(rowid) as id,  A.* from INF_TAHYB_医用耗材 A where rowid='".$rowid."'");
       // var_dump($row);exit;
        $this->assign('row',$row);
        return $this->fetch();
    }


    /**
     * 获取医保二级目录字典
     */
    public function getDic(){
        $params = $this->request->param();
        $type = $params['type'] ? $params['type'] : '收费类别';
        $page   = $params['page'];
        $limit  = $params['limit'];
        $where = "where 类别名称='".$type."'" ;
        if(isset($params['keywords']) && $params['keywords']!= ''){
            $where .=" and 代码名称 like '%".$params['keywords']."%'";
        }
        $sql = "select t2.* from (select rownum r,t1.* from (select *from ( select 代码值,代码名称 from inf_tczsyb_二级代码目录 ".$where." ) T ) t1 where rownum<=".$page*$limit.") t2 where t2.r>".($page-1)*$limit;
        $sql_count = "select count(*)  as TOTAL from inf_tczsyb_二级代码目录  ".$where;
        $db=PhpOci::getInstance();
        $data = $db->findAll($sql);
        $count = $db->findOne($sql_count);
        $rest = [
            'code'=> 0,
            'msg'=> '获取数据成功',
            'count'=> $count['TOTAL'],
            'data'=> $data
        ];
        return $rest;
    }

    public function oracleTest(){
            $data  = Db::connect('oracle')
            ->table('INF_DCZSYB_项目对码目录')->limit(10)->select()->toArray();
            var_dump($data);
    }


    public function sqlsrvTest(){
        $data  = Db::connect('sqlsrv')
            ->table('his_zy..zybrjbxxb')->limit(10)->select()->toArray();
        var_dump($data);
    }

    public function getrs(){
        $sql = "select *from doc_vt员工档案 where 系统序号=201";
        //$sql_count = "select count(*)  as TOTAL from inf_tczsyb_二级代码目录  ".$where;
        $db=PhpOci::getInstance();
        $data = $db->findAll($sql);
        //$count = $db->findOne($sql_count);
        return json($data);
    }

    /**
     * php调用webservices 测试用例
     */
    public function testSoap(){
        //WebService接口数据调用
        $soap=new \SoapClient('http://10.87.230.208:88/OpenLisService.asmx?wsdl');    //这里填写你要调用的URL
        $soap->soap_defencoding = 'utf-8';
        $soap->decode_utf8 = false;
        $soap->xml_encoding = 'utf-8';
       // $app_key = 'e1f431ad87f241cea554e6ef23e9023b';
        //app_secret = '5f3b82433ce31441c8e65f5375dc59534';

       // $ParamData = array('app_key'=>$app_key,'app_secret'=>$app_secret,'app_token'=>$token);  //调用接口用到的参数
        //调用hello测试方法 ================================
        //$rst = $soap->hello();

        //获取检验报告用例===================================
        $param = ['vPatientId'=>'1458518'];
        $rst =$soap->GetInspectJPGReportJPG($param);
        //$rst = $soap->GetInspect
        echo '<img  src="data:image/jpeg;base64,'.$rst->GetInspectJPGReportJPGResult.'"/>';exit;


       var_dump($rst);
    }

    /**
     * php调用存储过程并处理返回值
     */
    public function testProcedure(){
        //建立数据库连接
        $conn = oci_connect('ambase','ambase','10.87.230.223/orcl','UTF8');
        if(!$conn){
            echo  oci_error();exit;
        }
        $id = 47;                        //准备用以绑定的php变量 id
        $name = "";                     //准备用以绑定的php变量 name/** 调用存储过程的sql语句(sql_sp : SQL_StoreProcedure)
        $sql_sp = "BEGIN PROC_TEST(:id, :name); END;";//Parse
        $stmt = OCIParse($conn, $sql_sp);//执行绑定
        OCIBindByName($stmt, ":id", $id ,10);           //参数说明：绑定php变量$id到位置:id，并设定绑定长度16位
        OCIBindByName($stmt, ":name", $name ,200);//Execute
        OCIExecute($stmt);//结果
        echo "name is : $name<br>";
       // oci_close($conn);
        exit;
    }
    public function testZzj(){
        //WebService接口数据调用
        $soap=new \SoapClient('http://10.87.230.208:8001/cczzjWebService.asmx?wsdl');    //这里填写你要调用的URL
        $soap->soap_defencoding = 'utf-8';
        $soap->decode_utf8 = false;
        $soap->xml_encoding = 'utf-8';
       // $app_key = 'e1f431ad87f241cea554e6ef23e9023b';
        //app_secret = '5f3b82433ce31441c8e65f5375dc59534';

       // $ParamData = array('app_key'=>$app_key,'app_secret'=>$app_secret,'app_token'=>$token);  //调用接口用到的参数
        //调用hello测试方法 ================================
        //$rst = $soap->hello();

        //获取检验报告用例===================================
        //var_dump($soap->__getFunctions());//打印暴露的方法
        //var_dump($soap->__getTypes());//打印对应方法的参数和参数类型
	$requestStr = '<initials>JZGCS</initials><deviceId>9001</deviceId>';
        $requestStr ='<request>'.
'<initials>JZGCS</initials>'.
'<deviceId>9001</deviceId>'.
'</request>';
        $param = ['Request'=>$requestStr];
        //$param = xml($param)->getContent();
        //var_dump($param);
        $rst =$soap->A1005($param);
        //echo '<img  src="data:image/jpeg;base64,'.$rst->GetInspectJPGReportJPGResult.'"/>';exit;
	//var_dump($param);

       //var_dump($rst);
       $requestStr2 = '<request><initials>JZGCS</initials><deviceId>9001</deviceId></request>';
       $params2 = ['Request'=>$requestStr2];
       $rst2 = $soap->A1005($params2);
       var_dump($rst2);
     }


    /**
     *
     */
     public function card_jkkcz(){
         //建立数据库连接
         $conn = oci_connect('ambase','ambase','10.87.230.223/orcl','UTF8');
         if(!$conn){
             echo  oci_error();exit;
         }
         $a = 'code';
         $$a='';//准备用以绑定的php变量 id
         $b = "message";
         $$b='';//准备用以绑定的php变量 name/** 调用存储过程的sql语句(sql_sp : SQL_StoreProcedure)
         //给58831 用户充值22元
         $sql_sp = "BEGIN FIN_PD会员充值(1,16568,1,'充值','现金',22,0,0,-1,'',58831,'','','','','',0,'',0,:code, :message); END;";//Parse
         $stmt = OCIParse($conn, $sql_sp);//执行绑定
         OCIBindByName($stmt, ":code", $$a ,10);           //参数说明：绑定php变量$id到位置:id，并设定绑定长度16位
         OCIBindByName($stmt, ":message", $$b ,200);//Execute
         OCIExecute($stmt);//结果
         echo "message is : $message<br>";
         oci_close($conn);
         exit;
     }
    // 测试动态调用数据库存储过程
    // 指定传入存储过程名称
     public function test_auto_pro()
     {
         $config=[
             'username'=>'ambase',
             'password'=>'ambase',
             'connstr'=>'10.87.230.223/orcl',
             'charset'=>'UTF8'
         ];
         if ($this->request->isPost())
         {
             $params = $this->request->post();
//             if($params['cainfo']=='1')
//             {
//                 $params['cainfo']=10;
//             }
//             var_dump($params);exit;
//             $params =json_decode($params);
             $rule = [
                 'Vi终端序号|Vi终端序号'       => 'require',
                 'Vi操作员序号|Vi操作员序号' => 'require',
                 'Vs充值方式|Vs充值方式' => 'require',
                 'Vi充值金额|Vi充值金额' => 'require',
                 'Vi健康序号i|Vi健康序号i' => 'require'
             ];
             // 验证函数如有异常则输出 =================
             $this->validate($params, $rule);

             $db = JzylbInterfaceTest::getInstance($config);
             $params = [
                 'Vi机构序号'=>'1',
                 'Vi终端序号'=>'16568',
                 'Vi操作员序号'=>'1',
                 'vs业务类型'=>'充值',
                 'Vs充值方式'=>'现金',
                 'Vi充值金额'=>'33',
                 'Vi赠送金额'=>'0',
                 'vi赠送积分'=>'0',
                 'Vi会员类型'=>'-1',
                 'Vs充值金额校验 '=>'',
                 'Vi健康序号i'=>'58831',
                 'Vi业务序号I'=>'',
                 'vi支付序号'=>'',
                 'vi原卡号'=>'',
                 'vi新卡号'=>'',
                 'vi套餐序号'=>'',
                 'vi套餐支付'=>'0',
                 'vs备注'=>'',
                 'vi挂账限额'=>'0'
             ];
             $bindParams = [
                 'Pb输出状态'=>[
                     'key'=>'status',
                     'value'=>'Pb输出状态',
                     'length'=>'30'
                 ],
                 'PS输出描述'=>[
                     'key'=>'desc',
                     'value'=>'PS输出描述',
                     'length'=>'300'
                 ],
             ];
             //$rest = ['code'=>'1','output'=>['name'=>"王小宝",'age'=>'55']];
             $rest = $db->callProcedure('FIN_PD会员充值',$params,$bindParams);
             // var_dump($rest);exit;
             if($rest['code']==1){
                 $this->success("充值成功！",$rest['output']);
             }else{
                 $this->error("充值失败了",$rest['message']);
             }

         }

     }
    // 数据库测试单例模式支持动态配置参数
     public function test_change_db()
     {

         $config=[
             'username'=>'ambase',
             'password'=>'ambase',
             'connstr'=>'10.87.230.223/orcl',
             'charset'=>'UTF8'
         ];
         $this->success("成功!",$config);
         $db = JzylbInterfaceTest::getInstance($config);
         $sql = "select ddd.名称 as username,ddd.登录口令 as authstr from doc_vt员工档案 ddd where ddd.名称 like '%张思锐%' ";
         $rest = $db->findAll($sql);
         var_dump($rest);exit;
     }


     public function jz_jkkcz()
    {
        $config=[
            'username'=>'ambase',
            'password'=>'ambase',
            'connstr'=>'10.87.230.223/orcl',
            'charset'=>'UTF8'
        ];
        if ($this->request->isPost())
        {
            $params = $this->request->post();
//             if($params['cainfo']=='1')
//             {
//                 $params['cainfo']=10;
//             }
//             var_dump($params);exit;
//             $params =json_decode($params);
            $rule = [
                'Vi终端序号|Vi终端序号'       => 'require',
                'Vi操作员序号|Vi操作员序号' => 'require',
                'Vs充值方式|Vs充值方式' => 'require',
                'Vi充值金额|Vi充值金额' => 'require',
                'Vi健康序号i|Vi健康序号i' => 'require'
            ];
            // 验证函数如有异常则输出 =================
            $this->validate($params, $rule);

            //测试环境
            //$db = JzylbInterfaceTest::getInstance();
            //正式环境
            $db = JzylbInterfaceTest::getInstance($config);
//             $params = [
//                 'Vi机构序号'=>'1',
//                 'Vi终端序号'=>'16568',
//                 'Vi操作员序号'=>'1',
//                 'vs业务类型'=>'充值',
//                 'Vs充值方式'=>'现金',
//                 'Vi充值金额'=>'33',
//                 'Vi赠送金额'=>'0',
//                 'vi赠送积分'=>'0',
//                 'Vi会员类型'=>'-1',
//                 'Vs充值金额校验 '=>'',
//                 'Vi健康序号i'=>'58831',
//                 'Vi业务序号I'=>'',
//                 'vi支付序号'=>'',
//                 'vi原卡号'=>'',
//                 'vi新卡号'=>'',
//                 'vi套餐序号'=>'',
//                 'vi套餐支付'=>'0',
//                 'vs备注'=>'',
//                 'vi挂账限额'=>'0'
//             ];
            $bindParams = [
                'Pb输出状态'=>[
                    'key'=>'status',
                    'value'=>'Pb输出状态',
                    'length'=>'30'
                ],
                'PS输出描述'=>[
                    'key'=>'desc',
                    'value'=>'PS输出描述',
                    'length'=>'300'
                ],
            ];
            //$rest = ['code'=>'1','output'=>['name'=>"王小宝",'age'=>'55']];
            $rest = $db->callProcedure('FIN_PD会员充值',$params,$bindParams);
            // var_dump($rest);exit;
            if($rest['code']==1){
                $this->success("充值成功！",$rest['output']);
            }else{
                $this->error("充值失败了",$rest['message']);
            }

        }

    }
}

