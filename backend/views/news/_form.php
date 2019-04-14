<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use faravaghi\jalaliDatePicker\jalaliDatePicker;
use dosamigos\tinymce\TinyMce;

/* @var $this yii\web\View */
/* @var $model common\models\News */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="news-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?=
    $form->field($model, 'content')->widget(TinyMce::className(), [
        'options' => ['rows' => 6],
        'language' => 'fa',
        'clientOptions' => [
            'plugins' => [
                "advlist autolink lists link charmap print preview anchor",
                "searchreplace visualblocks code fullscreen",
                "insertdatetime media table contextmenu paste"
            ],
            'toolbar' => "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
        ]
    ]);
    ?>


    <?=
    $form->field($model, 'desc')->widget(TinyMce::className(), [
        'options' => ['rows' => 6],
        'language' => 'fa',
        'clientOptions' => [
            'plugins' => [
                "advlist autolink lists link charmap print preview anchor",
                "searchreplace visualblocks code fullscreen",
                "insertdatetime media table contextmenu paste"
            ],
            'toolbar' => "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
        ]
    ]);
    ?>

    <?php
    $action = Yii::$app->controller->action->id;


    if ($action == 'update' and ! is_null($model->photo))
    {
        ?>

        <?= Html::img(['/file', 'id' => $model->photo]) ?>
        <?php
    }
    ?>
    <?= $form->field($model, 'photo')->fileInput(); ?>



    <?php
    echo $form->field(
                    $model, 'publish_date_'
            )
            ->widget(
                    jalaliDatePicker::className(), [
                'options' => array(
                    'format' => 'yyyy/mm/dd',
                    'viewformat' => 'yyyy/mm/dd',
                    'placement' => 'left',
                    'todayBtn' => 'linked',
                ),
                'htmlOptions' => [
                    'id' => 'publish_date_',
                    'class' => 'form-control'
                ]
    ]);
    ?>
    <?php
    $item = array('0' => 'deactive', '1' => 'active');
    ?>
    <?= $form->field($model, 'active')->dropDownList($item) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
