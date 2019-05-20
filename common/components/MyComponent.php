<?php

namespace common\components;

use Yii;
use yii\base\Component;
use yii\base\InvalidConfigException;
use yii\db\Query;
use SoapClient;

class MyComponent extends Component
{

    public function welcome()
    {
        echo "Hello..Welcome to MyComponent";
    }

    public static function gregorian_to_jalali_date($dateTime)
    {
        $time = explode(' ', $dateTime);
        $date = explode('-', $time[0]);
        $g_y = $date[0];
        $g_m = $date[1];
        $g_d = $date[2];
        $mod = '/';
        $d_4 = $g_y % 4;
        $g_a = array(0, 0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334);
        $doy_g = $g_a[(int) $g_m] + $g_d;
        if ($d_4 == 0 and $g_m > 2)
            $doy_g++;
        $d_33 = (int) ((($g_y - 16) % 132) * .0305);
        $a = ($d_33 == 3 or $d_33 < ($d_4 - 1) or $d_4 == 0) ? 286 : 287;
        $b = (($d_33 == 1 or $d_33 == 2) and ( $d_33 == $d_4 or $d_4 == 1)) ? 78 : (($d_33 == 3 and $d_4 == 0) ? 80 : 79);
        if ((int) (($g_y - 10) / 63) == 30)
        {
            $a--;
            $b++;
        }
        if ($doy_g > $b)
        {
            $jy = $g_y - 621;
            $doy_j = $doy_g - $b;
        }
        else
        {
            $jy = $g_y - 622;
            $doy_j = $doy_g + $a;
        }
        if ($doy_j < 187)
        {
            $jm = (int) (($doy_j - 1) / 31);
            $jd = $doy_j - (31 * $jm++);
        }
        else
        {
            $jm = (int) (($doy_j - 187) / 30);
            $jd = $doy_j - 186 - ($jm * 30);
            $jm += 7;
        }
        return($mod == '') ? array($jy, $jm, $jd) : $jy . $mod . $jm . $mod . $jd . ' ' . $time[1];
    }

    public function getImageSize($path, $size)
    {


        return str_replace('large', $size, $path);
    }

    public function menuORG()
    {
        $rows = (new \yii\db\Query())
                ->select(['*'])
                ->from('navigation')
//                ->where(['last_name' => 'Smith'])
//                ->limit(10)
                ->all();
        return $rows;
    }

    public function menu_product()
    {

        $rows = (new \yii\db\Query())
                ->select(['*'])
                ->from('inv_ProductCategories')
//                ->where(['last_name' => 'Smith'])
//                ->limit(10)
                ->all();
        return $rows;
    }

    public function imgURL()
    {


        $database = (new \yii\db\Query())
                ->select(['*'])
                ->from('config')
                ->all();

        return($database[0]['images']);
    }

    public function txt($product, $count, $return = '')
    {
        $return = $product . '=' . $count . '-';
        return $return;
    }

    public function full($txt, $nationalCode, $name, $lName, $tel, $mobile, $provinceCode, $cityCode, $address, $codeCenter)
    {

        $query = "
SET NOCOUNT ON
        DECLARE @return_value int EXEC @return_value = [dbo].[pooradSP_SaleDocument_Insert]
        @smsText = N'*1200069!$txt',
        @nationalCode = N'$nationalCode',
        @name = N'$name',
        @lastName = N'$lName',
        @tel = N'$tel',
        @mobile = N'$mobile',
        @postalCode = $provinceCode,
        @cityCode = $cityCode,
        @address = N'$address',
        @codeCenter = $codeCenter
        SELECT @return_value as Result
";




        try
        {
            $connection = \Yii::$app->db2;

            $users = $connection->createCommand($query)->queryAll();
        }
        catch (Exception $ex)
        {
            echo 'Query failed', $ex->getMessage();
            return false;
        }




        if (isset($users[0]['Result']))
        {
            if (!empty($users[0]['Result']))
            {

                return $users[0]['Result'];
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }

    public function sendMessage($sms, $mobile)
    {
        $client = new \SoapClient('http://www.payamsms.com/wsdl?t=' . time(), array(
            'location' => 'http://www.payamsms.com/soap',
            'uri' => 'http://www.payamsms.com/soap',
            'use' => SOAP_LITERAL,
            'style' => SOAP_DOCUMENT,
            'trace' => 1
        ));

        $str = substr($mobile, 1);
        $mobile = '98' . $str;

        echo 'Sending message...' . PHP_EOL;
        $response = $client->send(array(
            'userName' => 'aJl7qk-1gut7iZnQD2uidg',
            'password' => 'darou 61983',
            'sourceNo' => 200061983,
            'destNo' => array($mobile),
            'sourcePort' => 0,
            'destPort' => 0,
            'clientId' => null,
            'messageType' => null,
            'encoding' => null,
            'longSupported' => false,
            'dueTime' => null,
            'content' => $sms
        ));
        if ($response->sendReturn->status == 0)
        {
//            echo "Here are your message id(s): " . implode(', ', $response->sendReturn->id->id) . PHP_EOL;
        }
        else
        {
            echo "Error while sending message(s). Errno {$response->sendReturn->status} \n";
        }
    }

    public function getContactID($userID)
    {

        $rows = (new \yii\db\Query())
                ->select(['id'])
                ->from('crm_Contacts')
                ->where(['userID' => "$userID"])
//                ->limit(10)
                ->one();
        if (isset($rows['id']))
        {
            return $rows['id'];
        }
        else
        {
            return false;
        }
    }

    public function getStatus($id)
    {

        $model = \app\models\SleOrderStatusHistory::find()->asArray()->all();

        foreach ($model as $m)
        {

        }
    }

}

?>