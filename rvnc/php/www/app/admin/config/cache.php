<?php
/**
 * Created by PhpStorm.
 * User: CMM
 * Date: 2022-11-02
 * Time: 7:59
 */
use think\facade\Env;

// +----------------------------------------------------------------------
// | 缓存设置
// +----------------------------------------------------------------------

return [
    // 默认缓存驱动
    'default' => Env::get('cache.driver', 'file'),

    // 缓存连接方式配置
    'stores'  => [
        'file'  => [
            // 驱动方式
            'type'       => 'File',
            // 缓存保存目录
            'path'       => '',
            // 缓存前缀
            'prefix'     => '',
            // 缓存有效期 0表示永久缓存
            'expire'     => 0,
            // 缓存标签前缀
            'tag_prefix' => 'tag:',
            // 序列化机制 例如 ['serialize', 'unserialize']
            'serialize'  => [],
        ],
        //新增redis
        'redis' => [
            // 驱动方式
            'type'     => 'redis',
            // 服务器地址
            'host'     => '10.87.230.199',
            'serialize' => ['trim', 'trim'],
            'password' => '',//如果没有设置密码为空
        ],
        // 更多的缓存连接
    ],
];