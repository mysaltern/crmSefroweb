<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Slider */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="slider-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

<?= $form->field($model, 'desc')->textInput(['maxlength' => true]) ?>


    <?= $form->field($model, 'order')->textInput(['maxlength' => true]) ?>

<?= $form->field($model, 'url')->textInput(['maxlength' => true]) ?>





    <?php
    echo $form->field($model, 'active')->dropDownList(['0' => 'غیر فعال', '1' => ' فعال'], ['options' =>
        [
            $active => ['selected ' => true]
        ]]
            , ['prompt' => 'انتخاب']);
    ?>

        <?php if (!Yii::$app->request->isAjax)
        { ?>
        <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>
    <?php } ?>

<?php ActiveForm::end(); ?>

</div>
