<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "page".
 *
 * @property int $id
 * @property string $title
 * @property string $summary
 * @property string $desc
 * @property int $active
 * @property string $photo
 * @property int $time
 */
class Page extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'page';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['desc'], 'string'],
            [['active', 'time'], 'integer'],
            [['title', 'photo'], 'string', 'max' => 255],
            [['summary'], 'string', 'max' => 512],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'summary' => 'Summary',
            'desc' => 'Desc',
            'active' => 'Active',
            'photo' => 'Photo',
            'time' => 'Time',
        ];
    }

    /**
     * {@inheritdoc}
     * @return PageQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new PageQuery(get_called_class());
    }
}
