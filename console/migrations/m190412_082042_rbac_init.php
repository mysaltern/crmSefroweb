<?php

use yii\db\Migration;

/**
 * Class m190412_082042_rbac_init
 */
class m190412_082042_rbac_init extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m190412_082042_rbac_init cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m190412_082042_rbac_init cannot be reverted.\n";

        return false;
    }
    */
}
