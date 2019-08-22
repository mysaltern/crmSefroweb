<?php

namespace frontend\controllers;

class ReferenceController extends \yii\web\Controller
{

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => \yii\filters\AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
//                'denyCallback' => function ($rule, $action)
//                {
//                    if (\Yii::$app->user->can('@'))
//                    {
//
//                    }
//                    else
//                    {
//                        return $action->controller->redirect(Url::to(['user/login']));
//                    }
//                    if (\Yii::$app->user->can('user3'))
//                    {
//
//                    }
//                    else
//                    {
//                        return $action->controller->redirect(Url::to(['file/document']));
//                    }
//                },
            ],
        ];
    }

    public function actionIndex()
    {


        $model = \common\models\UniReference::find()->with('major')->with('lesson')->asArray()->all();



        return $this->render('index', [
                    'model' => $model,
        ]);
    }

}
