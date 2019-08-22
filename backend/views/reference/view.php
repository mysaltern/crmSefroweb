<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\UniReference */
?>
<div class="uni-reference-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'subject',
            'lesson_id',
            'major_id',
            'url:url',
            'active',
        ],
    ]) ?>

</div>
