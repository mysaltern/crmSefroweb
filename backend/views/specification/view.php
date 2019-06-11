<?php


use yii\widgets\DetailView;


/* @var $this yii\web\View */
/* @var $model app\models\InvProductSpecificationTypes */

?>
<div class="inv-product-specification-types-view">

    <?=

    DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'productSpecificationName',
            'productUnitID',
            'isInt',
            'isDecimal',
            'isSelection',
            'isBit',
            'active',
//            'deleted',
//            'createdTime',
//            'modifiedTime',
//            'createdBy',
//            'modifiedBy',
        ],
    ])

    ?>

</div>
