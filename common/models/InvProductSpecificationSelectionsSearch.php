<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\InvProductSpecificationSelections;

/**
 * InvProductSpecificationSelectionsSearch represents the model behind the search form about `app\models\InvProductSpecificationSelections`.
 */
class InvProductSpecificationSelectionsSearch extends InvProductSpecificationSelections
{

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'productSpecificationTypeID', 'active', 'deleted', 'createdBy', 'modifiedBy'], 'integer'],
            [['selectionName', 'createdTime', 'modifiedTime'], 'safe'],
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
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = InvProductSpecificationSelections::find();

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
            'productSpecificationTypeID' => $this->productSpecificationTypeID,
            'active' => $this->active,
            'deleted' => $this->deleted,
            'createdTime' => $this->createdTime,
            'modifiedTime' => $this->modifiedTime,
            'createdBy' => $this->createdBy,
            'modifiedBy' => $this->modifiedBy,
        ]);

        $query->andFilterWhere(['like', 'selectionName', $this->selectionName]);

        return $dataProvider;
    }

}
