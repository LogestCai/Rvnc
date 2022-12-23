<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021-04-13
 * Time: 15:49
 */
namespace app\admin\exception;
use think\exception\Handle;
use think\Response;
use Throwable;
class Http extends Handle{
    public $httpStatus =500;
    /**
     * Render an exception into an HTTP response.
     *
     * @access public
     * @param \think\Request   $request
     * @param Throwable $e
     * @return Response
     */
    public function render($request, Throwable $e): Response
    {
        // 添加自定义异常处理机制
        if(method_exists($e,'getStatusCode')){
            $httpStatus = $e->getStatusCode();
        }else{
            $httpStatus = $this->httpStatus;
        }
        return show('0',$e->getMessage(),[],$httpStatus);
        // return json($e->getMessage());
        // 其他错误交给系统处理
        // return parent::render($request, $e);
    }
}