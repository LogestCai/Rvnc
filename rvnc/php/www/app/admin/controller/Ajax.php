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

use app\admin\model\SystemUploadfile;
use app\common\controller\AdminController;
use app\common\service\MenuService;
use app\common\tool\PhpOci;
use EasyAdmin\upload\Uploadfile;
use think\db\Query;
use think\facade\Cache;

class Ajax extends AdminController
{

    /**
     * 初始化后台接口地址
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function initAdmin()
    {
        $cacheData = Cache::get('initAdmin_' . session('admin.id'));
        if (!empty($cacheData)) {
           return json($cacheData);
        }
        $menuService = new MenuService(session('admin.id'));
        $data = [
            'logoInfo' => [
                'title' => sysconfig('site', 'logo_title'),
                'image' => sysconfig('site', 'logo_image'),
                'href'  => __url('index/index'),
            ],
            'homeInfo' => $menuService->getHomeInfo(),
            'menuInfo' => $menuService->getMenuTree(),
        ];
        Cache::tag('initAdmin')->set('initAdmin_' . session('admin.id'), $data);
        //var_dump($data);exit;
        return json($data);
    }

    /**
     * 清理缓存接口
     */
    public function clearCache()
    {
        Cache::clear();
        $this->success('清理缓存成功');
    }

    /**
     * 上传文件
     */
    public function upload()
    {
        $data = [
            'upload_type' => $this->request->post('upload_type'),
            'file'        => $this->request->file('file'),
        ];
        $uploadConfig = sysconfig('upload');
        empty($data['upload_type']) && $data['upload_type'] = $uploadConfig['upload_type'];
        $rule = [
            'upload_type|指定上传类型有误' => "in:{$uploadConfig['upload_allow_type']}",
            'file|文件'              => "require|file|fileExt:{$uploadConfig['upload_allow_ext']}|fileSize:{$uploadConfig['upload_allow_size']}",
        ];
        $this->validate($data, $rule);
        try {
            $upload = Uploadfile::instance()
                ->setUploadType($data['upload_type'])
                ->setUploadConfig($uploadConfig)
                ->setFile($data['file'])
                ->save();
        } catch (\Exception $e) {
            $this->error($e->getMessage());
        }
        if ($upload['save'] == true) {
            //var_dump($upload);exit;
            $this->success($upload['msg'], ['url' => $upload['url']]);
        } else {
            $this->error($upload['msg']);
        }
    }

    /**
     * 上传图片至编辑器
     * @return \think\response\Json
     */
    public function uploadEditor()
    {
        $data = [
            'upload_type' => $this->request->post('upload_type'),
            'file'        => $this->request->file('upload'),
        ];
        $uploadConfig = sysconfig('upload');
        empty($data['upload_type']) && $data['upload_type'] = $uploadConfig['upload_type'];
        $rule = [
            'upload_type|指定上传类型有误' => "in:{$uploadConfig['upload_allow_type']}",
            'file|文件'              => "require|file|fileExt:{$uploadConfig['upload_allow_ext']}|fileSize:{$uploadConfig['upload_allow_size']}",
        ];
        $this->validate($data, $rule);
        try {
            $upload = Uploadfile::instance()
                ->setUploadType($data['upload_type'])
                ->setUploadConfig($uploadConfig)
                ->setFile($data['file'])
                ->save();
        } catch (\Exception $e) {
            $this->error($e->getMessage());
        }
        if ($upload['save'] == true) {
            return json([
                'error'    => [
                    'message' => '上传成功',
                    'number'  => 201,
                ],
                'fileName' => '',
                'uploaded' => 1,
                'url'      => $upload['url'],
            ]);
        } else {
            $this->error($upload['msg']);
        }
    }

    /**
     * 获取上传文件列表
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getUploadFiles()
    {
        $get = $this->request->get();
        $page = isset($get['page']) && !empty($get['page']) ? $get['page'] : 1;
        $limit = isset($get['limit']) && !empty($get['limit']) ? $get['limit'] : 10;
        $title = isset($get['title']) && !empty($get['title']) ? $get['title'] : null;
        $this->model = new SystemUploadfile();
        $count = $this->model
            ->where(function (Query $query) use ($title) {
                !empty($title) && $query->where('original_name', 'like', "%{$title}%");
            })
            ->count();
        $list = $this->model
            ->where(function (Query $query) use ($title) {
                !empty($title) && $query->where('original_name', 'like', "%{$title}%");
            })
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

    /**
     * 上传图片至markdown编辑器
     * @return \think\response\Json
     */
    public function uploadMarkdown()
    {
        $data = [
            'upload_type' => $this->request->post('upload_type'),
            'file'        => $this->request->file('editormd-image-file'),
        ];
        //var_dump($_FILES);eixt;
        $uploadConfig = sysconfig('upload');
        empty($data['upload_type']) && $data['upload_type'] = $uploadConfig['upload_type'];
        $rule = [
            'upload_type|指定上传类型有误' => "in:{$uploadConfig['upload_allow_type']}",
            'file|文件'              => "require|file|fileExt:{$uploadConfig['upload_allow_ext']}|fileSize:{$uploadConfig['upload_allow_size']}",
        ];
        $validate = $this->markdownValidate($data, $rule);
        if(isset($validate['success']) && $validate['success']==0){
            return json([
                'success' =>0,
                'message' =>  $validate['message'],
            ]);
        }
        try {
            $upload = Uploadfile::instance()
                ->setUploadType($data['upload_type'])
                ->setUploadConfig($uploadConfig)
                ->setFile($data['file'])
                ->save();
        } catch (\Exception $e) {
            return json([
                'success' =>0,
                'message' =>  $e->getMessage(),
                'url'     =>'',
            ]);

        }
        if ($upload['save'] == true) {
            return json([
                'success'=>1,
                'message' => '上传成功',
                'url'      => $upload['url'],
            ]);
        } else {
            return json([
                'success' =>0,
                'message' =>  $upload['msg'],
                'url'     => $upload['url'],
            ]);
        }
    }


    /**
     *根据姓名获取核酸检测结果
     */
    public function getHsjcjg(){
        $params = $this->request->param();
        //$type = $params['type'] ? $params['type'] : '收费类别';
        $page   = $params['page'] ?? 1;
        $limit  = $params['limit'] ?? 15;
        $where = "Where  A.中文名称 like '新型冠状%' and B.送检时间>=Sysdate-15  " ;
        if(isset($params['keywords']) && $params['keywords']!= ''){
            $where .=" and B.姓名 like '%".$params['keywords']."%'";
        }
        $sql = "select t2.* from (select rownum r,t1.* from (select *from ( Select B.姓名,B.性别,B.年龄||B.年龄单位 as 年龄,B.处方医生,B.处方科室,B.病人类型, A.检验项目组合,中文名称,英文名称,结果,to_char(B.审核时间,'yyyy-mm-dd hh24:mi') as 审核时间,A.系统序号
from Lis_vd报告内容 A left join LIS_VD病人信息_报告 B on  A.病人序号i=B.系统序号  ".$where." order by B.审核时间 desc   ) T ) t1 where rownum<=".$page*$limit.") t2 where t2.r>".($page-1)*$limit;
        $sql_count = "select count(*)  as TOTAL from Lis_vd报告内容 A left join LIS_VD病人信息_报告 B on  A.病人序号i=B.系统序号  ".$where;
        $db=PhpOci::getInstance();
        $data = $db->findAll($sql);
        $count = $db->findOne($sql_count);
        $rest = [
            'code'=> 0,
            'msg'=> '获取数据成功',
            'count'=> $count['TOTAL'],
            'data'=> $data
        ];
        //var_dump($rest);exit;
        return $rest;
    }


    /**
     *根据姓名获住院信息
     */
    public function getZyhzInfo(){
        $params = $this->request->param();
        $page   = $params['page'] ?? 1;
        $limit  = $params['limit'] ?? 15;
        $where = "where 入院时间>=sysdate-15 " ;
        if(isset($params['keywords']) && $params['keywords']!= ''){
            $where .=" and 姓名 like '%".$params['keywords']."%'";
        }
        $sql = "select t2.* from (select rownum r,t1.* from (select *from ( select 姓名,性别,年龄,住院编号 as 住院号 ,联系电话,入院科室，主管医师,to_char(入院时间,'yyyy-mm-dd hh24:mi')  入院时间 from inq_vd住院档案    ".$where." order by 入院时间 desc   ) T ) t1 where rownum<=".$page*$limit.") t2 where t2.r>".($page-1)*$limit;
        $sql_count = "select count(*)  as TOTAL from inq_vd住院档案   ".$where;
        $db=PhpOci::getInstance();
        $data = $db->findAll($sql);
        $count = $db->findOne($sql_count);
        $rest = [
            'code'=> 0,
            'msg'=> '获取数据成功',
            'count'=> $count['TOTAL'],
            'data'=> $data
        ];
        //var_dump($rest);exit;
        return $rest;
    }


}