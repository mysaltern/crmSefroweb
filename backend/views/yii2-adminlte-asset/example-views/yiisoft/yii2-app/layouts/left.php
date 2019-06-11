<aside class="main-sidebar">

    <section class="sidebar">

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?= $directoryAsset ?>/img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
                <p>Faraz Andishan</p>

                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search..."/>
                <span class="input-group-btn">
                    <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i>
                    </button>
                </span>
            </div>
        </form>
        <!-- /.search form -->

        <?=
        dmstr\widgets\Menu::widget(
                [
                    'options' => ['class' => 'sidebar-menu tree', 'data-widget' => 'tree'],
                    'items' => [
                        ['label' => 'Menu Yii2', 'options' => ['class' => 'header']],
//                        ['label' => 'Gii', 'icon' => 'file-code-o', 'url' => ['/gii']],
//                        ['label' => 'Debug', 'icon' => 'dashboard', 'url' => ['/debug']],
                        [
                            'label' => 'مدیریت محتوا',
                            'icon' => 'circle-o',
                            'url' => '#',
                            'items' => [
                                ['label' => 'اخبار', 'icon' => 'circle-o', 'url' => ['/news/index'],],
                                ['label' => 'مقالات', 'icon' => 'circle-o', 'url' => ['/article/index'],],
                                ['label' => 'صفحات', 'icon' => 'circle-o', 'url' => ['/page/index'],],
                                ['label' => 'درباره ما', 'icon' => 'circle-o', 'url' => ['/about/update'],],
                                ['label' => 'منو', 'icon' => 'fas fa-cart-arrow-down', 'url' => ['/menu'],],
//                                ['label' => 'اسلایدر', 'icon' => 'fas fa-cart-arrow-down', 'url' => ['/menu'],],
                                ['label' => 'آپلود سنتر', 'icon' => 'fas fa-cart-arrow-down', 'url' => ['/filemanager'],],
//                                ['label' => 'گالری', 'icon' => 'fas fa-cart-arrow-down', 'url' => ['/menu'],],
                            ],
                        ],
                        [
                            'label' => 'محصولات',
                            'icon' => 'circle-o',
                            'url' => '#',
                            'items' => [
                                ['label' => 'محصولات', 'icon' => 'circle-o', 'url' => ['./products/index'],],
                                ['label' => ' دسته بندی', 'icon' => 'circle-o', 'url' => ['./category/index'],],
                                ['label' => 'ویژگی ', 'icon' => 'circle-o', 'url' => ['./specification/index'],],
                                ['label' => 'شکل محصول ', 'icon' => 'circle-o', 'url' => ['./productshapes/index'],],
                                ['label' => 'تامین  کننده', 'icon' => 'circle-o', 'url' => ['./productsuppliers/index'],],
                                ['label' => 'وارد کننده', 'icon' => 'circle-o', 'url' => ['./productmanufacturers/index'],],
                                [
                                    'label' => 'قیمت گذاری و تخفیفات',
                                    'icon' => 'circle-o',
                                    'url' => '#',
                                    'items' => [
                                        ['label' => 'بخش نامه تخفیف', 'icon' => 'circle-o', 'url' => ['/productdiscounts/index'],],
                                        ['label' => 'اجناس تخفیف', 'icon' => 'circle-o', 'url' => ['/productdiscountdetails/index'],],
                                    ],
                                ],
                            ],
                        ],
                        [
                            'label' => 'سفارشات',
                            'icon' => 'fas fa-cart-arrow-down',
                            'url' => '#',
                            'items' => [
                                ['label' => 'لیست سفارشات', 'icon' => 'circle-o', 'url' => ['orders/index'],],
                                ['label' => '', 'icon' => 'circle-o', 'url' => ['products/index'],],
                            ],
                        ],
                        [
                            'label' => 'مدیریت',
                            'icon' => 'fas fa-cart-arrow-down',
                            'url' => '#',
                            'items' => [
                                ['label' => 'بازدید ها', 'icon' => 'fas fa-cart-arrow-down', 'url' => ['/logvisitor'],],
                                ['label' => 'کاربران', 'icon' => 'fas fa-cart-arrow-down', 'url' => ['/user/admin'],],
                                ['label' => 'تنظیمات', 'icon' => 'fas fa-cart-arrow-down', 'url' => ['/article/index'],],
                            ],
                        ],
                        ['label' => 'Login', 'url' => ['site/login'], 'visible' => Yii::$app->user->isGuest],
//                        [
//                            'label' => 'Some tools',
//                            'icon' => 'share',
//                            'url' => '#',
//                            'items' => [
//                                ['label' => 'Gii', 'icon' => 'file-code-o', 'url' => ['/gii'],],
//                                ['label' => 'Debug', 'icon' => 'dashboard', 'url' => ['/debug'],],
//                            ],
//                        ],
                    ],
                ]
        )
        ?>

    </section>

</aside>
