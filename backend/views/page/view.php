<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Page */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Pages', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="page-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?=
        Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ])
        ?>
    </p>

    <?=
    DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'title',
            'summary',
            'desc:html',
            [
                'attribute' => 'active',
                'value' => function($model)
                {
                    if ($model->active == 1)
                    {
                        return 'active';
                    }
                    else
                    {
                        return 'deactive';
                    }
                },
            ],
            [
                'attribute' => 'photo',
                'format' => 'html',
                'value' => function ($data)
                {
                    if (!empty($data->photo))
                    {
                        $url = Yii::$app->urlManager->createAbsoluteUrl(['/file']);

                        return Html::img($url . '?id=' . $data['photo'], ['width' => '70px']);
                    }
                },
            ],
            [
                'attribute' => 'time',
                'value' => function($model)
                {
                    if ($model->time != null)
                    {
                        return \Yii::$app->jdf->jdate($format = 'Y/F/j', $timestamp = $model->time, $none = '', $time_zone = 'Asia/Tehran', $tr_num = 'fa');
                    }
                },
            ],
        ],
    ])
    ?>

</div>
