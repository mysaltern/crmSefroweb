<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\SleOrders;

/**
 * SleOrdersSearch represents the model behind the search form about `common\models\SleOrders`.
 */
class SleOrdersSearch extends SleOrders
{

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'user_id', 'contactID', 'contactAddressID', 'paymenttypeID', 'paymentDetailID', 'active', 'deleted', 'createdBy', 'modifiedBy'], 'integer'],
            [['trackCode', 'createdTime', 'modifiedTime'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query commonlied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = SleOrders::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate())
        {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'user_id' => $this->user_id,
            'contactID' => $this->contactID,
            'contactAddressID' => $this->contactAddressID,
            'paymenttypeID' => $this->paymenttypeID,
            'paymentDetailID' => $this->paymentDetailID,
            'active' => $this->active,
            'deleted' => $this->deleted,
            'createdTime' => $this->createdTime,
            'modifiedTime' => $this->modifiedTime,
            'createdBy' => $this->createdBy,
            'modifiedBy' => $this->modifiedBy,
        ]);

        $query->andFilterWhere(['like', 'trackCode', $this->trackCode]);

        return $dataProvider;
    }

}
