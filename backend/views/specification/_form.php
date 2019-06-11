<?php


use yii\helpers\Html;
use yii\widgets\ActiveForm;


/* @var $this yii\web\View */
/* @var $model app\models\InvProductSpecificationTypes */
/* @var $form yii\widgets\ActiveForm */

?>

<div class="inv-product-specification-types-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'productSpecificationName')->textInput() ?>

    <?= $form->field($model, 'productUnitID')->textInput() ?>

    <?= $form->field($model, 'isInt')->textInput() ?>

    <?= $form->field($model, 'isDecimal')->textInput() ?>

    <?= $form->field($model, 'isSelection')->textInput() ?>

    <?= $form->field($model, 'isBit')->textInput() ?>




    <?php

    if (!Yii::$app->request->isAjax)
        {

        ?>
        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>
    <?php } ?>

    <?php ActiveForm::end(); ?>

</div>
