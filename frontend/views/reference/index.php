<?php

use yii\helpers\Url;

/* @var $this yii\web\View */





foreach ($model as $m)
{
    $url = $m['url'];
    echo $link = Url::to("@common/upload/images/$url");

    echo " ";

    echo $subject = $m['subject'];
    echo " ";

    echo $major = $m['major']['name'];
    echo " ";

    echo $lesson = $m['lesson']['name'];

    echo "<hr/>";
}
?>


