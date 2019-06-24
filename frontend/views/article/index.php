<?php

use yii\widgets\LinkPager;
?>

<div class="margin">

    <?php
    foreach ($models as $model)
    {

        $photo = Yii::$app->urlManager->createAbsoluteUrl(['/file', 'id' => $model['photo']]);
        $summary = $model['content'];
        $summary = strip_tags("$summary");
        $summary = \Yii::$app->frontend->truncateStringWords($summary, 50);
        ?>


        <div class='col-lg-6 p-4'>
            <img src="<?= $photo; ?>" />
            <p><?php echo $model['title']; ?> </p>
            <p><?php echo $summary; ?> </p>

        </div>

        <?php
        // display $model here
    }
    ?>


    <?php
// display pagination
    echo LinkPager::widget([
        'pagination' => $pages,
    ]);
    ?>

</div>