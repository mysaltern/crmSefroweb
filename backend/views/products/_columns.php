<?php


use yii\helpers\Url;


return [
        [
        'class' => 'kartik\grid\CheckboxColumn',
        'width' => '20px',
    ],
        [
        'class' => 'kartik\grid\SerialColumn',
        'width' => '30px',
    ],
    // [
// 'class'=>'\kartik\grid\DataColumn',
// 'attribute'=>'id',
// ],
    [
        'class' => '\kartik\grid\DataColumn',
        'attribute' => 'code',
    ],
        [
        'class' => '\kartik\grid\DataColumn',
        'attribute' => 'name',
    ],
        [
        'class' => '\kartik\grid\DataColumn',
        'attribute' => 'نام تولید کننده',
        'value' => 'invProductManufacturer.name',
    ],
        [
        'class' => '\kartik\grid\DataColumn',
        'attribute' => 'نام تامین کننده',
        'value' => 'invProductSupplier.name',
    ],
        [
        'class' => '\kartik\grid\DataColumn',
        'attribute' => 'invProductSharedCodeID',
    ],
    // [
// 'class'=>'\kartik\grid\DataColumn',
// 'attribute'=>'invProductTypeID',
// ],
// [
// 'class'=>'\kartik\grid\DataColumn',
// 'attribute'=>'invProductShapeID',
// ],
// [
// 'class'=>'\kartik\grid\DataColumn',
// 'attribute'=>'invProductCategoryID',
// ],
// [
// 'class'=>'\kartik\grid\DataColumn',
// 'attribute'=>'summary',
// ],
// [
// 'class'=>'\kartik\grid\DataColumn',
// 'attribute'=>'description',
// ],
    [
        'class' => '\kartik\grid\DataColumn',
        'attribute' => 'active',
    ],
    // [
// 'class'=>'\kartik\grid\DataColumn',
// 'attribute'=>'deleted',
// ],
// [
// 'class'=>'\kartik\grid\DataColumn',
// 'attribute'=>'createdTime',
// ],
// [
// 'class'=>'\kartik\grid\DataColumn',
// 'attribute'=>'modifiedTime',
// ],
// [
// 'class'=>'\kartik\grid\DataColumn',
// 'attribute'=>'createdBy',
// ],
// [
// 'class'=>'\kartik\grid\DataColumn',
// 'attribute'=>'modifiedBy',
// ],
    [
        'class' => 'kartik\grid\ActionColumn',
        'dropdown' => false,
        'vAlign' => 'middle',
        'urlCreator' => function($action, $model, $key, $index)
            {
            return Url::to([$action, 'id' => $key]);
            },
        'viewOptions' => ['role' => 'modal-remote', 'title' => 'View', 'data-toggle' => 'tooltip'],
        'updateOptions' => ['role' => 'modal-remote', 'title' => 'Update', 'data-toggle' => 'tooltip'],
        'deleteOptions' => ['role' => 'modal-remote', 'title' => 'Delete',
            'data-confirm' => false, 'data-method' => false, // for overide yii data api
            'data-request-method' => 'post',
            'data-toggle' => 'tooltip',
            'data-confirm-title' => 'مطمئن  هستید؟',
            'data-confirm-message' => 'آیا از حذف کردن این آیتم اطمینان دارید؟'],
    ],
];
