<?php
// 应用公共文件

use app\common\service\AuthService;
use think\facade\Cache;
use thinkt\facade\Db;


/**
 * 自动生成表单函数方便处理大表单  无需一个一个拼凑数据
 */
if(!function_exists(create_form)){
    function create_form($data,$cols=1){
        //默认是一行格式
        $html = '';
        $len = count($data);
        for($i = 0;$i<$len;$i++){
            $tmpHtml = '';
            $require = '';
            $data_search_op = isset($data[$i]['data_search_op']) ?  $data[$i]['data_search_op']:'%*%';
            $verify = isset($data[$i]['lay-verify']) ?  $data[$i]['lay-verify']:'';
            $readonly = isset($data[$i]['readonly']) ?  $data[$i]['readonly']:'';
            if($verify != '') $require = 'required';
            if($cols == '1') {
                switch ($data[$i]['type']) {
                    case 'input':
                        $tmpHtml = '<div class="layui-form-item">' .
                            '<label class="layui-form-label ' . $require . '">' . $data[$i]['title'] . '</label>' .
                            '<div class="layui-input-block">' .
                            '<input id="c-' . $data[$i]['field'] . '" type="text" name="' . $data[$i]['field'] . '" class="layui-input" lay-verify="' . $verify . '" lay-reqtext="请输入' . $data[$i]['title'] . '" placeholder="请输入' . $data[$i]['title'] . '" value="'.$data[$i]['value'].'"> ' .
                            '</div></div>';
                        break;
                    case 'time':
                        $tmpHtml = '<div class="layui-form-item">' .
                            '<label class="layui-form-label ' . $require . '">' . $data[$i]['title'] . '</label>' .
                            '<div class="layui-input-block">' .
                            '<input id="c-' . $data[$i]['field'] . '" data-date="" data-date-type="time" lay-verify="' . $verify . '"  name="' . $data[$i]['field'] . '"   placeholder="' . $data[$i]['title'] . '" class="layui-input" value="' . $data[$i]['value'] . '">' .
                            '</div>' .
                            '</div>';
                        break;

                    case 'date':
                        $tmpHtml = '<div class="layui-form-item">' .
                            '<label class="layui-form-label ' . $require . '">' . $data[$i]['title'] . '</label>' .
                            '<div class="layui-input-block">' .
                            '<input id="c-' . $data[$i]['field'] . '" data-date="" data-date-type="date" lay-verify="' . $verify . '"  name="' . $data[$i]['field'] . '"   placeholder="' . $data[$i]['title'] . '" value="' . $data[$i]['value'] . '" class="layui-input">' .
                            '</div>' .
                            '</div>';
                        break;
                    case 'datetime':
                        $data_search_op = 'range';
                        $tmpHtml = '<div class="layui-inline">'.
                            '<label class="layui-form-label ' . $require . '">' . $data[$i]['title'] . '</label>'.
                            '<div class="layui-input-inline">'.
                            '<input id="c-' . $data[$i]['field'] . '" data-search-op="'.$data_search_op.'" data-date="" data-date-type="datetime" lay-verify="'.$verify.'"  name="' .$data[$i]['field']          . '"   placeholder="' .$data[$i]['title'] . '"  '.$readonly.' value="'.$data[$i]['value'] .'" class="layui-input">' .
                            '</div>' .
                            '</div>';
                        break;
                    case 'select':
                        $tmpHtml = '<div class="layui-form-item">' .
                            '<label class="layui-form-label ' . $require . '">' . $data[$i]['title'] . '</label>' .
                            '<div class="layui-input-block">' .
                            '<select name="' . $data[$i]['field'] . '" readonly id="c-' . $data[$i]['field'] . '" lay-search lay-verify="' . $verify . '" >' .
                            '<option value="">-- 请选择' . $data[$i]['title'] . ' --</option>';
                        if (!empty($data[$i]['data'])) {
                            foreach ($data[$i]['data'] as $row) {
                                if (isset($data[$i]['value']) && $data[$i]['value'] == $row['id']) {
                                    $tmpHtml .= '<option selected="selected"  value="' . $row['id'] . '">' . $row['name'] . '</option>';
                                } else {
                                    $tmpHtml .= '<option  value="' . $row['id'] . '">' . $row['name'] . '</option>';
                                }

                            }
                        }

                        $tmpHtml .= '</select></div></div>';
                        break;
                    case 'radio':
                        $tmpHtml = '<div class="layui-form-item">' .
                            '<label class="layui-form-label ' . $require . '">' . $data[$i]['title'] . '</label>' .
                            '<div class="layui-input-block">';
                        foreach ($data[$i]['data'] as $row) {
                            if (isset($data[$i]['value']) && $data[$i]['value'] == $row['id']) {
                                $tmpHtml .= '<input type="radio" name="' . $data[$i]['field'] . '"  value="' . $row['id'] . '" title="' . $row['name'] . '" checked> ';
                            } else {
                                $tmpHtml .= '<input type="radio" name="' . $data[$i]['field'] . '" value="' . $row['id'] . '" title="' . $row['name'] . '" > ';
                            }

                        }
                        $tmpHtml .= '</div></div>';
                        break;
                    case 'checkbox':
                        $tmpHtml = '<div class="layui-form-item">' .
                            '<label class="layui-form-label ' . $require . '">' . $data[$i]['title'] . '</label>' .
                            '<div class="layui-input-block">';
                        foreach ($data[$i]['data'] as $row) {
                            if (isset($data[$i]['value']) && $data[$i]['value'] == $row['id']) {
                                $tmpHtml .= '<input type="checkbox" name="' . $data[$i]['field'] . '[]" value="' . $row['id'] . '" title="' . $row['name'] . '" checked="checked"> ';
                            } else {
                                $tmpHtml .= '<input type="checkbox" name="' . $data[$i]['field'] . '[]" value="' . $row['id'] . '" title="' . $row['name'] . '" > ';
                            }

                        }
                        $tmpHtml .= '</div></div>';
                        break;
                    case 'textarea':
                        $tmpHtml = '<div class="layui-form-item">' .
                            '<label class="layui-form-label ' . $require . '">' . $data[$i]['title'] . '</label>' .
                            '<div class="layui-input-block">' .
                            '<textarea name="' . $data[$i]['field'] . '"   lay-verify="' . $verify . '" placeholder="请输入' . $data[$i]['title'] . ' " class="layui-textarea">' . $data[$i]['value'] . '</textarea>';
                        $tmpHtml .= '</div></div>';
                        break;

                }
                $html .= $tmpHtml;
            }else{
                switch($data[$i]['type']){
                    case 'input':
                        $tmpHtml = '<div class="layui-inline">'.
                            '<label class="layui-form-label '.$require.'">'.$data[$i]['title'].'</label>'.
                            '<div class="layui-input-inline">'.
                            '<input id="c-' . $data[$i]['field'] . '" data-search-op="'.$data_search_op.'" type="text" name="'.$data[$i]['field'].'" class="layui-input" lay-verify="'.$verify.'" lay-reqtext="请输入'.$data[$i]['title'].'" '.$readonly.' placeholder="请输入'.$data[$i]['title'].'" value="'.$data[$i]['value'] .'">'.
                            '</div></div>';
                        break;
                    case 'time':
                        $data_search_op='=';
                        $tmpHtml = '<div class="layui-inline">'.
                            '<label class="layui-form-label ' . $require . '">' . $data[$i]['title'] . '</label>'.
                            '<div class="layui-input-inline">'.
                            '<input id="c-' . $data[$i]['field'] . '" data-search-op="'.$data_search_op.'" data-date="" data-date-type="time" lay-verify="'.$verify.'"  name="' .$data[$i]['field']. '"   placeholder="' .$data[$i]['title'] . '"  '.$readonly.' class="layui-input" value="'.$data[$i]['value'] .'">' .
                            '</div>' .
                            '</div>';
                        break;

                    case 'date':
                        $data_search_op = '=';
                        $tmpHtml = '<div class="layui-inline ">'.
                            '<label class="layui-form-label ' . $require . '">' . $data[$i]['title'] . '</label>'.
                            '<div class="layui-input-inline">'.
                            '<input id="c-' . $data[$i]['field'] . '" data-search-op="'.$data_search_op.'" data-date="" data-date-type="date" lay-verify="'.$verify.'"  name="' .$data[$i]['field']          . '"   placeholder="' .$data[$i]['title'] . '"  '.$readonly.' value="'.$data[$i]['value'] .'" class="layui-input">' .
                            '</div>' .
                            '</div>';
                        break;

                    case 'datetime':
                        $data_search_op = 'range';
                        $tmpHtml = '<div class="layui-inline">'.
                            '<label class="layui-form-label ' . $require . '">' . $data[$i]['title'] . '</label>'.
                            '<div class="layui-input-inline">'.
                            '<input id="c-' . $data[$i]['field'] . '" data-search-op="'.$data_search_op.'" data-date="" data-date-type="datetime" lay-verify="'.$verify.'"  name="' .$data[$i]['field']          . '"   placeholder="' .$data[$i]['title'] . '"  '.$readonly.' value="'.$data[$i]['value'] .'" class="layui-input">' .
                            '</div>' .
                            '</div>';
                        break;
                    case 'select':
                        $data_search_op='=';
                        if($readonly != '') $readonly = 'disabled';
                        $tmpHtml = '<div class="layui-inline">'.
                            '<label class="layui-form-label layui-hide-xs' . $require . '">' . $data[$i]['title'] . '</label>'.
                            '<div class="layui-input-inline">'.
                            '<select name="' .$data[$i]['field']. '" data-search-op="'.$data_search_op.'"  '.$readonly.' id="c-' . $data[$i]['field'] . '" lay-search lay-verify="'.$verify.'" lay-reqtext="请选择'.$data[$i]['title'].'" >'.
                            '<option value="">- 请选择' . $data[$i]['title'] . ' -</option>';
                        if(!empty($data[$i]['data'])){
                            foreach ($data[$i]['data'] as $row ){
                                //dump($data[$i]);exit;
                                if(isset($data[$i]['value'])&& ($data[$i]['value'] == $row['id'])){
                                    $tmpHtml .= '<option dd="" selected="" value="'.$row['id'].'">'.$row['name'].'</option>';
                                }else{
                                    $tmpHtml .= '<option  value="'.$row['id'].'">'.$row['name'].'</option>';
                                }
                            }
                        }
                        $tmpHtml .= '</select></div></div>';
                        break;
                    case 'radio':

                        $tmpHtml = '<div class="layui-inline">'.
                            '<label class="layui-form-label' . $require . '">' . $data[$i]['title'] . '</label>'.
                            '<div class="layui-input-inline">';
                        foreach ($data[$i]['data'] as $row ){
                            if(isset($data[$i]['value'])&& $data[$i]['value'] == $row['id']){
                                $tmpHtml .= '<input type="radio" data-search-op="'.$data_search_op.'" '.$readonly.' name="' . $data[$i]['field'] . '" value="' . $row['id'] . '" title="' . $row['name'] . '" checked="checked"> ';
                            }else{
                                $tmpHtml .= '<input type="radio" name="' . $data[$i]['field'] . '" value="' . $row['id'] . '"  '.$readonly.' title="' . $row['name'] . '" > ';
                            }
                        }
                        $tmpHtml .= '</div></div>';
                        break;
                    case 'checkbox':
                        $tmpHtml = '<div class="layui-inline">'.
                            '<label class="layui-form-label ' . $require . '">' . $data[$i]['title'] . '</label>'.
                            '<div class="layui-input-inline">';
                        foreach ($data[$i]['data'] as $row ){
                            if(isset($data[$i]['value'])&& $data[$i]['value'] == $row['id']){
                                $tmpHtml .= '<input type="checkbox" name="' . $data[$i]['field'] . '[]" value="' . $row['id'] . '" '.$readonly.' title="' . $row['name'] . '" checked> ';
                            }else{
                                $tmpHtml .= '<input type="checkbox" name="' .$data[$i]['field']. '"[]" value="' . $row['id'] . '" '.$readonly.' title="' . $row['name'] . '" > ';
                            }

                        }
                        $tmpHtml .= '</div></div>';
                        break;
                    case 'textarea':
                        $tmpHtml = '</div><div class="layui-form-item layui-form-text">'.
                            '<label class="layui-form-label ' . $require . '">' . $data[$i]['title'] . '</label>'.
                            '<div class="layui-input-block">'.
                            '<textarea id="c-' . $data[$i]['field'] . '" name="' .$data[$i]['field']. '" lay-verify="'.$verify.'"  '.$readonly.' placeholder="请输入'.$data[$i]['title'].' " class="layui-textarea">'.$data[$i]['value'] .'</textarea>';
                        $tmpHtml .= '</div></div><div class="layui-form-item">';
                        break;
                }
                $html .=$tmpHtml;
            }

        }
        return '<div class="layui-form-item">'.$html.'</div>';;
    }
}

if(!function_exists(get_username_by_id)){
    function get_username_by_id($id){
        return Db::table('hrp_system_amdin')->where('id',$id)->value('name');
    }
}
/***
 * 获取面包屑导航
 */
if(!function_exists(get_document_bread)){
    function get_document_bread($list,$url,$type=1,$delimiter='>>'){
        $html = '';
       if(!empty($list)){
           $len = count($list);
           for($i=0;$i<$len;$i++){
               if($i==$len-1){
                   $html .='<a><cite>'.$list[$i]['title'].'</cite></a>';
               }else{
                   $html .='<a href="'.$url.'?type='.$type.'&pid='.$list[$i]['id'].'">'.$list[$i]['title'].'</a> '.$delimiter;
               }
           }
       }
       return '<div class="nav-bread"><span id="navcate"><a href="'.$url.'?type='.$type.'">全部文件</a>'.$delimiter.$html.'</span></div>';
    }
}

if(!function_exists('format_size')){
    //转换单位
    /**
     * @desc 格式化磁盘空间大小函数
     * 自动显示为kb MB GB等
     * @return string
     */
    function format_size($fileSize) {
        $size = sprintf("%u", $fileSize);
        if($size == 0) {
            return("0 Bytes");
        }
        $sizename = array(" Bytes", " KB", " MB", " GB", " TB", " PB", " EB", " ZB", " YB");
        return round($size/pow(1024, ($i = floor(log($size, 1024)))), 2) . $sizename[$i];
    }
}


/**
 * 定义全局处理返回结构  api用
 */
if(!function_exists('show')){
    function show($code,$msg='error',$data=[],$is_json=true,$httpStatus=200,$url='',$wait=3){
        $result = [
            'code' => $code,
            'msg'  => $msg,
            'data' => $data,
            'url'  => $url,
            'wait' => $wait,
        ];
        return $is_json===true ? json($result,$httpStatus) : $result;
//        return $result;
    }
}
if (!function_exists('__url')) {

    /**
     * 构建URL地址
     * @param string $url
     * @param array $vars
     * @param bool $suffix
     * @param bool $domain
     * @return string
     */
    function __url(string $url = '', array $vars = [], $suffix = true, $domain = false)
    {
        return url($url, $vars, $suffix, $domain)->build();
    }
}

if (!function_exists('password')) {

    /**
     * 密码加密算法
     * @param $value 需要加密的值
     * @param $type  加密类型，默认为md5 （md5, hash）
     * @return mixed
     */
    function password($value)
    {
        $value = sha1('blog_') . md5($value) . md5('_encrypt') . sha1($value);
        return sha1($value);
        //测试时候使用
       // return strtoupper(md5($value));
    }

}

if (!function_exists('xdebug')) {

    /**
     * debug调试
     * @param string|array $data 打印信息
     * @param string $type 类型
     * @param string $suffix 文件后缀名
     * @param bool $force
     * @param null $file
     */
    function xdebug($data, $type = 'xdebug', $suffix = null, $force = false, $file = null)
    {
        !is_dir(runtime_path() . 'xdebug/') && mkdir(runtime_path() . 'xdebug/');
        if (is_null($file)) {
            $file = is_null($suffix) ? runtime_path() . 'xdebug/' . date('Ymd') . '.txt' : runtime_path() . 'xdebug/' . date('Ymd') . "_{$suffix}" . '.txt';
        }
        file_put_contents($file, "[" . date('Y-m-d H:i:s') . "] " . "========================= {$type} ===========================" . PHP_EOL, FILE_APPEND);
        $str = (is_string($data) ? $data : (is_array($data) || is_object($data)) ? print_r($data, true) : var_export($data, true)) . PHP_EOL;
        $force ? file_put_contents($file, $str) : file_put_contents($file, $str, FILE_APPEND);
    }
}

if (!function_exists('sysconfig')) {

    /**
     * 获取系统配置信息
     * @param $group
     * @param null $name
     * @return array|mixed
     */
    function sysconfig($group, $name = null)
    {
        $where = ['group' => $group];
        $value = empty($name) ? Cache::get("sysconfig_{$group}") : Cache::get("sysconfig_{$group}_{$name}");
        if (empty($value)) {
            if (!empty($name)) {
                $where['name'] = $name;
                $value = \app\admin\model\SystemConfig::where($where)->value('value');
                Cache::tag('sysconfig')->set("sysconfig_{$group}_{$name}", $value, 3600);
            } else {
                $value = \app\admin\model\SystemConfig::where($where)->column('value', 'name');
                Cache::tag('sysconfig')->set("sysconfig_{$group}", $value, 3600);
            }
        }
        return $value;
    }
}

if (!function_exists('array_format_key')) {

    /**
     * 二位数组重新组合数据
     * @param $array
     * @param $key
     * @return array
     */
    function array_format_key($array, $key)
    {
        $newArray = [];
        foreach ($array as $vo) {
            $newArray[$vo[$key]] = $vo;
        }
        return $newArray;
    }

}

if (!function_exists('auth')) {

    /**
     * auth权限验证
     * @param $node
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    function auth($node = null)
    {
        $authService = new AuthService(session('admin.id'));
        $check = $authService->checkNode($node);
        return $check;
    }

}

function isMobile()
{
    if (isset ($_SERVER['HTTP_X_WAP_PROFILE']))
    {
        return true;
    }
    if (isset ($_SERVER['HTTP_VIA']))
    {
        return stristr($_SERVER['HTTP_VIA'], "wap") ? true : false;
    }
    if (isset ($_SERVER['HTTP_USER_AGENT']))
    {
        $clientkeywords = array ('nokia',
            'sony',
            'ericsson',
            'mot',
            'samsung',
            'htc',
            'sgh',
            'lg',
            'sharp',
            'sie-',
            'philips',
            'panasonic',
            'alcatel',
            'lenovo',
            'iphone',
            'ipod',
            'blackberry',
            'meizu',
            'android',
            'netfront',
            'symbian',
            'ucweb',
            'windowsce',
            'palm',
            'operamini',
            'operamobi',
            'openwave',
            'nexusone',
            'cldc',
            'midp',
            'wap',
            'mobile'
        );
        if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT'])))
        {
            return true;
        }
    }
    if (isset ($_SERVER['HTTP_ACCEPT']))
    {
        if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html'))))
        {
            return true;
        }
    }
    return false;
}

/***
 * 获取oracle存储过程返回结果
 * 对返回结果进行格式化处理
 */
if (!function_exists('getOracleRetStatus')) {
    function getOracleRetStatus($returnParams){
        if($returnParams['code']==1&&$returnParams['output']['status']==1){
            return show('1','成功',$returnParams['output'],false);
            }else{
            return show('0',"流程调用".$returnParams['message'].",业务错误信息为：".$returnParams['output']['desc'],[],false);
        }
    }
}

