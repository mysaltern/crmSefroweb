<?php

$params = array_merge(
        require __DIR__ . '/../../common/config/params.php', require __DIR__ . '/../../common/config/params-local.php', require __DIR__ . '/params.php', require __DIR__ . '/params-local.php'
);

return [
    'id' => 'app-backend',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'bootstrap' => ['log', 'logvisitor'],
    'modules' => [
        'gridview' => [
            'class' => '\kartik\grid\Module'
        ],
        'filemanager' => [
            'class' => 'pendalf89\filemanager\Module',
            // Upload routes
            'routes' => [
                // Base absolute path to web directory
                'baseUrl' => '',
                // Base web directory url
                'basePath' => '@frontend/web',
                // Path for uploaded files in web directory
                'uploadPath' => 'uploads',
            ],
            // Thumbnails info
            'thumbs' => [
                'small' => [
                    'name' => 'xs',
                    'size' => [100, 100],
                ],
                'medium' => [
                    'name' => 's',
                    'size' => [300, 200],
                ],
                'large' => [
                    'name' => 'm',
                    'size' => [500, 400],
                ],
            ],
        ],
        'menu' => [
            'class' => '\pceuropa\menu\Menu',
        ],
        'comment' => [
            'class' => 'yii2mod\comments\Module',
        ],
        'logvisitor' => [
            'class' => 'slavkovrn\logvisitor\LogVisitorModule',
        ],
        'user' => [
            // following line will restrict access to profile, recovery, registration and settings controllers from backend
            'as backend' => 'dektrium\user\filters\BackendFilter',
        ],
    ],
    'components' => [
        'logvisitor' => [
            'class' => 'slavkovrn\logvisitor\LogVisitorComponent',
            'filterIp' => '127.0.0.1,213.87.', /* comma separated substrings of IP  to be filtered of log in table , begining from first position  */
            'filterUri' => '/,debug', /* comma separated substrings of URI to be filtered of log in table */
        ],
        'urlManager' => [
            'class' => 'yii\web\UrlManager',
            // Disable index.php
            'showScriptName' => true,
            // Disable r= routes
            'enablePrettyUrl' => true,
            'rules' => array(
                '<controller:\w+>/<id:\d+>' => '<controller>/view',
                '<controller:\w+>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
                '<controller:\w+>/<action:\w+>' => '<controller>/<action>',
            ),
        ],
        'request' => [
            'csrfParam' => '_csrf-backend',
        ],
        'user' => [
            'identityCookie' => [
                'name' => '_backendIdentity',
//                'path' => '/admin',
                'httpOnly' => FALSE,
            ],
        ],
        'session' => [
            'name' => 'BACKENDSESSID',
            'cookieParams' => [
                'httpOnly' => true,
//                'path' => '/admin',
            ],
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
    /*
      'urlManager' => [
      'enablePrettyUrl' => true,
      'showScriptName' => false,
      'rules' => [
      ],
      ],
     */
    ],
    'params' => $params,
];
