<?php


use yii\helpers\Url;
use yii\helpers\Html;
use yii\bootstrap\Modal;
use kartik\grid\GridView;
use johnitvn\ajaxcrud\CrudAsset;
use johnitvn\ajaxcrud\BulkButtonWidget;


/* @var $this yii\web\View */
/* @var $searchModel app\models\SleOrdersSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Sle Orders';
$this->params['breadcrumbs'][] = $this->title;

CrudAsset::register($this);
if (isset($_GET['error']))
    {
    if ($_GET['error'] == 1)
        {
        echo "<script>alert('سیستم با خطا موجه گردید ')</script>";
        }
    if ($_GET['error'] == 0)
        {
        echo "<script>alert('درخواست شما با موفقیت ثبت شد')</script>";
        }
    }

?>
<div class="sle-orders-index">
    <div id="ajaxCrudDatatable">
        <?=

        GridView::widget([
            'id' => 'crud-datatable',
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'pjax' => true,
            'columns' => require(__DIR__ . '/_columns.php'),
            'toolbar' => [
                    ['content' =>
                    Html::a('<i class="glyphicon glyphicon-plus"></i>', ['create'], ['role' => 'modal-remote', 'title' => 'Create new Sle Orders', 'class' => 'btn btn-default']) .
                    Html::a('<i class="glyphicon glyphicon-repeat"></i>', [''], ['data-pjax' => 1, 'class' => 'btn btn-default', 'title' => 'Reset Grid']) .
                    '{toggleData}' .
                    '{export}'
                ],
            ],
            'striped' => true,
            'condensed' => true,
            'responsive' => true,
            'panel' => [
                'type' => 'primary',
                'heading' => '<i class="glyphicon glyphicon-list"></i> Sle Orders listing',
                'before' => '',
                'after' => BulkButtonWidget::widget([
                    'buttons' => Html::a('<i class="glyphicon glyphicon-trash"></i>&nbsp; Delete All', ["bulk-delete"], [
                        "class" => "btn btn-danger btn-xs",
                        'role' => 'modal-remote-bulk',
                        'data-confirm' => false, 'data-method' => false, // for overide yii data api
                        'data-request-method' => 'post',
                        'data-confirm-title' => 'Are you sure?',
                        'data-confirm-message' => 'Are you sure want to delete this item'
                    ]),
                ]) .
                '<div class="clearfix"></div>',
            ]
        ])

        ?>
    </div>
</div>
<?php

Modal::begin([
    "id" => "ajaxCrudModal",
    "footer" => "", // always need it for jquery plugin
])

?>
<?php Modal::end(); ?>
