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
use app\common\tool\JzylbInterface;
use app\common\tool\JzylbInterfaceTest;
use app\common\tool\PhpOci;
use Matrix\Exception;
use think\captcha\facade\Captcha;
use think\facade\Db;
use think\facade\Env;
/**
 * Class Login
 * @package app\admin\controller
 */
class Jzylb extends AdminController
{

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
     * 健康卡充值功能
     * 调用九阵存储过程实现
     */

    public function jz_jkkcz()
    {
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
            $db = JzylbInterface::getInstance();
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

