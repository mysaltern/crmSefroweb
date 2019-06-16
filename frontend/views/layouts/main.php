<?php
/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use frontend\assets\AppAsset;
use yii\helpers\Url;
use pceuropa\menu\Menu;
use yii\bootstrap\NavBar;
use yii\bootstrap\Nav;

AppAsset::register($this);
$css = Url::base(true) . '/css';
$js = Url::base(true) . '/js';
$img = Url::base(true) . '/img';
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
    <head>
        <meta charset="<?= Yii::$app->charset ?>">



        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title -->
        <title>مرکز تندرستی همای</title>

        <!-- Favicon -->
        <link rel="icon" href="<?= $img; ?>/core-img/favicon.ico">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

        <!-- Core Stylesheet -->
        <link href="<?= $css; ?>/style.css" rel="stylesheet">





        <!-- Responsive CSS -->
        <link href="<?= $css; ?>/responsive.css" rel="stylesheet">





        <?php $this->registerCsrfMetaTags() ?>
        <title><?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>
    </head>
    <body>


        <ul id="w0" class="navbar-nav navbar-right nav"><li><a href="#">اخبار</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" href="#" data-toggle="dropdown">صفحات <span class="caret"></span></a>
                <ul id="w1" class="dropdown-menu"><li class="dropdown-header">بازدید ها</li>
                </ul>

            </li>
        </ul>




        <header class="header_area animated">
            <div class="container-fluid">
                <div class="row align-items-center">


                    <!-- ***** Header Area End ***** -->
                    <?php
                    echo Nav::widget(['options' => ['class' => 'navbar-nav navbar-right'],
                        'items' => Menu::NavbarRight(5)  // argument is id of menu
                    ]);
                    ?>
                </div>
            </div>
        </header>
        <?= $content ?>





        <div class="h-100">
            <!-- footer logo -->
            <div class="footer-text">
                <h2>HOMAAY</h2>
            </div>
            <!-- social icon-->
            <div class="footer-social-icon rtl">
                <a href="#"><i class="fa fa-telegram" aria-hidden="true"></i></a>
                <a href="#"> <i class="fa fa-instagram" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
            </div>
            <div class="footer-menu rtl">
                <nav>
                    <ul>
                        <li><a href="#">درباره ما</a></li>
                        <li><a href="#">قوانین و مقررات</a></li>
                        <li><a href="#">حریم خصوصی</a></li>
                        <li><a href="#">تماس با ما</a></li>
                    </ul>
                </nav>
            </div>
            <!-- Foooter Text-->
            <div class="copyright-text clearfix">
                <!-- ***** Removing this text is now allowed! This template is licensed under CC BY 3.0 ***** -->
                <p>تمامی حقوق این وب سایت برای مركز تندرستی همای محفوظ است </p>
                <p>  طراحی و پیاده سازی توسط <a href="#" target="_blank">صباسامانه</a></p>
                </br>
            </div>
        </div>

    </footer>
    <!-- ***** Footer Area Start ***** -->

    <!-- Jquery-2.2.4 JS -->
    <script src="<?= $js; ?>/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="<?= $js; ?>/popper.min.js"></script>
    <!-- Bootstrap-4 Beta JS -->
    <script src="<?= $js; ?>/bootstrap.min.js"></script>
    <!-- All Plugins JS -->
    <script src="<?= $js; ?>/plugins.js"></script>
    <!-- Slick Slider Js-->
    <script src="<?= $js; ?>/slick.min.js"></script>
    <!-- Footer Reveal JS -->
    <script src="<?= $js; ?>/footer-reveal.min.js"></script>
    <!-- Active JS -->
    <script src="<?= $js; ?>/active.js"></script>
</body>

</html>



<?php $this->endPage() ?>
