<?php

use dosamigos\chartjs\ChartJs;

/* @var $this yii\web\View */

$this->title = 'My Yii Application';
?>
<div class="height-control">

    <div class="row">



        <?php
        foreach ($comments as $comment)
        {

            echo $content = $comment['content'];
            $time = $comment['createdAt'];
            echo Yii::$app->mycomponent->getStatus($comment['status']);

            echo \Yii::$app->jdf->jdate($format = 'Y/F/j', $timestamp = $time, $none = '', $time_zone = 'Asia/Tehran', $tr_num = 'fa');

            echo "<br/>";
        }
        ?>



        <div class="col-lg-6">
            <?=
            ChartJs::widget([
                'type' => 'line',
                'options' => [
                    'height' => 200,
                    'width' => 200
                ],
                'data' => [
                    'labels' => ["January", "February", "March", "April", "May", "June", "July"],
                    'datasets' => [
                        [
                            'label' => "My First dataset",
                            'backgroundColor' => "rgba(179,181,198,0.2)",
                            'borderColor' => "rgba(179,181,198,1)",
                            'pointBackgroundColor' => "rgba(179,181,198,1)",
                            'pointBorderColor' => "#fff",
                            'pointHoverBackgroundColor' => "#fff",
                            'pointHoverBorderColor' => "rgba(179,181,198,1)",
                            'data' => [65, 59, 90, 81, 56, 55, 40]
                        ],
                        [
                            'label' => "My Second dataset",
                            'backgroundColor' => "rgba(255,99,132,0.2)",
                            'borderColor' => "rgba(255,99,132,1)",
                            'pointBackgroundColor' => "rgba(255,99,132,1)",
                            'pointBorderColor' => "#fff",
                            'pointHoverBackgroundColor' => "#fff",
                            'pointHoverBorderColor' => "rgba(255,99,132,1)",
                            'data' => [28, 48, 40, 19, 96, 27, 100]
                        ]
                    ]
                ]
            ]);
            ?>
        </div>
    </div>
</div>

<div class="col-lg-3 col-xs-6">

    <div class="small-box bg-green">
        <div class="inner">
            <h3>۵۳<sup style="font-size: 20px">%</sup></h3>
            <p>نظرات</p>
        </div>
        <div class="icon">
            <i class="ion ion-stats-bars"></i>
        </div>
        <a href="#" class="small-box-footer">اطلاعات بیشتر <i class="fa fa-arrow-circle-left"></i></a>
    </div>
</div>
<div class="col-lg-3 col-xs-6">

    <div class="small-box bg-yellow">
        <div class="inner">
            <h3>۴۴</h3>
            <p>کاربر ثبت نام کرده</p>
        </div>
        <div class="icon">
            <i class="ion ion-person-add"></i>
        </div>
        <a href="#" class="small-box-footer">اطلاعات بیشتر <i class="fa fa-arrow-circle-left"></i></a>
    </div>
</div>
<div class="col-lg-3 col-xs-6">

    <div class="small-box bg-yellow">
        <div class="inner">
            <h3>۴۴</h3>
            <p>فروش جذیذ</p>
        </div>
        <div class="icon">
            <i class="ion ion-person-add"></i>
        </div>
        <a href="#" class="small-box-footer">اطلاعات بیشتر <i class="fa fa-arrow-circle-left"></i></a>
    </div>
</div>
<div class="col-lg-3 col-xs-6">

    <div class="small-box bg-red">
        <div class="inner">
            <h3>۶۵</h3>
            <p>بازدید کننده یکتا</p>
        </div>
        <div class="icon">
            <i class="ion ion-pie-graph"></i>
        </div>
        <a href="#" class="small-box-footer">اطلاعات بیشتر <i class="fa fa-arrow-circle-left"></i></a>
    </div>
</div>
