<?php


namespace app\controllers;


use Yii;
use app\models\InvProductPrizes;
use app\models\InvProductPrizessSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use \yii\web\Response;
use yii\helpers\Html;


/**
 * ProductprizessController implements the CRUD actions for InvProductPrizes model.
 */
class ProductprizessController extends Controller
    {


    /**
     * @inheritdoc
     */
    public function behaviors()
        {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                    'bulk-delete' => ['post'],
                ],
            ],
            'access' => [
                'class' => \yii\filters\AccessControl::className(),
                'only' => ['create', 'update', 'index', 'delete'],
                'rules' => [
                    // deny all POST requests
                        [
                        'allow' => TRUE,
                        'verbs' => ['POST']
                    ],
                    // allow authenticated users
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                // everything else is denied
                ],
            ],
        ];

        }


    /**
     * Lists all InvProductPrizes models.
     * @return mixed
     */
    public function actionIndex()
        {
        $searchModel = new InvProductPrizessSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
        ]);

        }


    /**
     * Displays a single InvProductPrizes model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
        {
        $request = Yii::$app->request;
        if ($request->isAjax)
            {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return [
                'title' => "جوایز محصولات #" . $id,
                'content' => $this->renderAjax('view', [
                    'model' => $this->findModel($id),
                ]),
                'footer' => Html::button('بستن', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                Html::a('ویرایش', ['update', 'id' => $id], ['class' => 'btn btn-primary', 'role' => 'modal-remote'])
            ];
            }
        else
            {
            return $this->render('view', [
                        'model' => $this->findModel($id),
            ]);
            }

        }


    /**
     * Creates a new InvProductPrizes model.
     * For ajax request will return json object
     * and for non-ajax request if creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
        {
        $request = Yii::$app->request;
        $model = new InvProductPrizes();

        if ($request->isAjax)
            {
            /*
             *   Process for ajax request
             */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if ($request->isGet)
                {
                return [
                    'title' => "اضافه کردن بخشنامه جایزه جدید",
                    'content' => $this->renderAjax('create', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('بستن', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                    Html::button('ذخیره', ['class' => 'btn btn-primary', 'type' => "submit"])
                ];
                }
            else if ($model->load($request->post()) && $model->save())
                {
                $model->deleted = 0;
                $model->active = 1;
                $model->createdTime = date('Y-m-d H:i:s.u');
                $model->createdBy = Yii::$app->user->getId();
                $model->save();

                return [
                    'forceReload' => '#crud-datatable-pjax',
                    'title' => "اضافه کردن بخشنامه جایزه جدید",
                    'content' => '<span class="text-success">Create InvProductPrizes success</span>',
                    'footer' => Html::button('بستن', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                    Html::a('اضافه کردن آیتم جدید', ['create'], ['class' => 'btn btn-primary', 'role' => 'modal-remote'])
                ];
                }
            else
                {
                return [
                    'title' => "ایجاد بخشنامه جوایز محصولات",
                    'content' => $this->renderAjax('create', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('بستن', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                    Html::button('ذخیره', ['class' => 'btn btn-primary', 'type' => "submit"])
                ];
                }
            }
        else
            {
            /*
             *   Process for non-ajax request
             */
            if ($model->load($request->post()) && $model->save())
                {
                $model->deleted = 0;
                $model->active = 1;
                $model->createdTime = date('Y-m-d H:i:s.u');
                $model->createdBy = Yii::$app->user->getId();
                $model->save();
                return $this->redirect(['view', 'id' => $model->id]);
                }
            else
                {
                return $this->render('create', [
                            'model' => $model,
                ]);
                }
            }

        }


    /**
     * Updates an existing InvProductPrizes model.
     * For ajax request will return json object
     * and for non-ajax request if update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
        {
        $request = Yii::$app->request;
        $model = $this->findModel($id);

        if ($request->isAjax)
            {
            /*
             *   Process for ajax request
             */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if ($request->isGet)
                {
                return [
                    'title' => "ویرایش محصولات #" . $id,
                    'content' => $this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('بستن', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                    Html::button('ذخیره', ['class' => 'btn btn-primary', 'type' => "submit"])
                ];
                }
            else if ($model->load($request->post()) && $model->save())
                {
                $model->deleted = 0;
                $model->active = 1;
                $model->modifiedTime = date('Y-m-d H:i:s.u');
                $model->modifiedBy = Yii::$app->user->getId();
                $model->save();
                return [
                    'forceReload' => '#crud-datatable-pjax',
                    'title' => "جوایز محصولات #" . $id,
                    'content' => $this->renderAjax('view', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('بستن', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                    Html::a('ویرایش', ['update', 'id' => $id], ['class' => 'btn btn-primary', 'role' => 'modal-remote'])
                ];
                }
            else
                {
                return [
                    'title' => "ویرایش محصولات #" . $id,
                    'content' => $this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('بستن', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                    Html::button('ذخیره', ['class' => 'btn btn-primary', 'type' => "submit"])
                ];
                }
            }
        else
            {
            /*
             *   Process for non-ajax request
             */
            if ($model->load($request->post()) && $model->save())
                {
                $model->deleted = 0;
                $model->active = 1;
                $model->modifiedTime = date('Y-m-d H:i:s.u');
                $model->modifiedBy = Yii::$app->user->getId();
                $model->save();
                return $this->redirect(['view', 'id' => $model->id]);
                }
            else
                {
                return $this->render('update', [
                            'model' => $model,
                ]);
                }
            }

        }


    /**
     * Delete an existing InvProductPrizes model.
     * For ajax request will return json object
     * and for non-ajax request if deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
        {
        $request = Yii::$app->request;
        $this->findModel($id)->delete();

        if ($request->isAjax)
            {
            /*
             *   Process for ajax request
             */
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['forceClose' => true, 'forceReload' => '#crud-datatable-pjax'];
            }
        else
            {
            /*
             *   Process for non-ajax request
             */
            return $this->redirect(['index']);
            }

        }


    /**
     * Delete multiple existing InvProductPrizes model.
     * For ajax request will return json object
     * and for non-ajax request if deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionBulkDelete()
        {
        $request = Yii::$app->request;
        $pks = explode(',', $request->post('pks')); // Array or selected records primary keys
        foreach ($pks as $pk)
        {
            $model = $this->findModel($pk);
            $model->delete();
        }

        if ($request->isAjax)
            {
            /*
             *   Process for ajax request
             */
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['forceClose' => true, 'forceReload' => '#crud-datatable-pjax'];
            }
        else
            {
            /*
             *   Process for non-ajax request
             */
            return $this->redirect(['index']);
            }

        }


    /**
     * Finds the InvProductPrizes model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return InvProductPrizes the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
        {
        if (($model = InvProductPrizes::findOne($id)) !== null)
            {
            return $model;
            }
        else
            {
            throw new NotFoundHttpException('The requested page does not exist.');
            }

        }


    }

