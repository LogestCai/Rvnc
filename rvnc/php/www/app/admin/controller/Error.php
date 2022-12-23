<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021-04-13
 * Time: 13:45
 */
namespace app\admin\controller;

use app\BaseController;

class Error {
    public function __call($name, $arguments)
    {
        // TODO: Implement __call() method.
        $result = [
            'status'=>0,
            'message'=>"找不到该控制器",
            'result'=>null
        ];
        return json($result,400);
    }
}