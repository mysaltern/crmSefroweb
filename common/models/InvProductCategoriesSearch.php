<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\InvProductCategories;

/**
 * InvProductCategoriesSearch represents the model behind the search form about `common\models\InvProductCategories`.
 */
class InvProductCategoriesSearch extends InvProductCategories
{

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'parentID', 'levelno', 'position', 'imageID', 'active', 'deleted', 'createdBy', 'modifiedBy'], 'integer'],
            [['code', 'name', 'createdTime', 'modifiedTime'], 'safe'],
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
        $query = InvProductCategories::find();

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
            'parentID' => $this->parentID,
            'levelno' => $this->levelno,
            'position' => $this->position,
            'imageID' => $this->imageID,
            'active' => $this->active,
            'deleted' => $this->deleted,
            'createdTime' => $this->createdTime,
            'modifiedTime' => $this->modifiedTime,
            'createdBy' => $this->createdBy,
            'modifiedBy' => $this->modifiedBy,
        ]);

        $query->andFilterWhere(['like', 'code', $this->code])
                ->andFilterWhere(['like', 'name', $this->name]);

        return $dataProvider;
    }

}
