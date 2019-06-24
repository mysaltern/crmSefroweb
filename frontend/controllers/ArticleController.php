<?php

namespace frontend\controllers;

use yii\data\Pagination;

class ArticleController extends \yii\web\Controller
{

    public function actionIndex()
    {

        $query = \common\models\News::find()->where(['active' => 1, 'article' => 1])->andWhere(['<', 'publish_date', time()]);
        $countQuery = clone $query;
        $pages = new Pagination(['totalCount' => $countQuery->count()]);
        $models = $query->offset($pages->offset)
                ->limit($pages->limit)
                ->all();

        return $this->render('index', [
                    'models' => $models,
                    'pages' => $pages,
        ]);
    }

}
