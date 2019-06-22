<?php
/* @var $this yii\web\View */

$this->title = 'My Yii Application';
?>



<!-- ***** Wellcome Area Start ***** -->
<section class="wellcome_area clearfix" id="home">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="img/1.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="img/2.jpg" alt="Second slide">
            </div>
        </div>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</section>
<!-- ***** Wellcome Area End ***** -->


<!-- ***** Our Team Area Start ***** -->
<section class="our-Team-area bg-white section_padding_100_50 clearfix" id="team">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <!-- Heading Text  -->
                <div class="section-heading">
                    <h2>مقالات</h2>
                    <div class="line-shape"></div>
                </div>
            </div>
        </div>
        <div class="row">

            <?php
            foreach ($article as $ar)
            {
                $photo = Yii::$app->urlManager->createAbsoluteUrl(['/file', 'id' => $ar['photo']]);
                ?>
                <div class="col-12 col-md-6 col-lg-3">
                    <div class="single-team-member">
                        <div class="member-image">
                            <img src="<?= $photo; ?>" alt="">
                            <div class="team-hover-effects">
                                <div class="team-social-icon">
                                    <a href="#"><i class="fa fa-link " aria-hidden="true"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="member-text">
                            <h4><?= $ar['title']; ?></h4>
                            <p><?= $ar['content']; ?></p>
                        </div>
                    </div>
                </div>
                <?php
            }
            ?>


        </div>
    </div>
</section>
<!-- ***** Our Team Area End ***** -->



<!-- ***** Contact Us Area Start ***** -->
<section class="footer-contact-area section_padding_100 rtl clearfix" id="contact">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <!-- Heading Text  -->
                <div class="section-heading">
                    <h2>مشاوره رایگان</h2>
                    <div class="line-shape"></div>
                </div>
                <div class="footer-text">
                    <p>شما میتوانید با تماس یا ارسال سوال خود از مشاوره رایگان ما بهرمند شوید</p>
                </div>
            </div>
            <div class="col-md-6">
                <!-- Form Start-->
                <div class="contact_from">
                    <form action="#" method="post">
                        <!-- Message Input Area Start -->
                        <div class="contact_input_area">
                            <div class="row">
                                <!-- Single Input Area Start -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="name" id="name" placeholder="نام و نام خانوادگی"
                                               required>
                                    </div>
                                </div>
                                <!-- Single Input Area Start -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="email" class="form-control" name="email" id="email"
                                               placeholder="ایمیل شما" required>
                                    </div>
                                </div>
                                <!-- Single Input Area Start -->
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea name="message" class="form-control" id="message" cols="30" rows="4"
                                                  placeholder="سوال خود را در این محل بنویسید" required></textarea>
                                    </div>
                                </div>
                                <!-- Single Input Area Start -->
                                <div class="col-12">
                                    <button type="submit" class="btn submit-btn">ارسال</button>
                                </div>
                            </div>
                        </div>
                        <!-- Message Input Area End -->
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ***** Contact Us Area End ***** -->


<!-- ***** Special Area Start ***** -->
<section class="special-area bg-white section_padding_100 rtl" id="about">
    <div class="container">

        <div class="row list">
            <!-- Single Special Area -->
            <div class="col-12 col-md-4 list__item w-100">
                <div class="single-special text-center wow fadeInUp w-100" data-wow-delay="0.6s">
                    <div class="single-icon">
                        <i class="ti-location-pin" aria-hidden="true"></i>
                    </div>
                    <h4>تماس با ما</h4>
                    <div class="address-text">
                        <p><span>آدرس: </span>تهران - خیابان آزادی - در سبز رنگ اول دست چپ</p>
                    </div>
                    <div class="phone-text">
                        <p><span>تلفن تماس: </span>0212345678</p>
                    </div>
                    <div class="email-text">
                        <p><span>ایمیل:</span> info@gmail.com</p>
                    </div>
                </div>
            </div>
            <!-- Single Special Area -->
            <div class="col-12 col-md-4 list__item w-100">
                <div class="single-special text-center wow fadeInUp w-100" data-wow-delay="0.4s">
                    <div class="single-icon">
                        <i class="ti-view-list-alt" aria-hidden="true"></i>
                    </div>
                    <h4>خدمات</h4>
                    <div class="d-flex flex-column">
                        <a class="dropdown-item" href="umiho.php">یو می هو تراپی</a>
                        <a class="dropdown-item" href="niddle.php">طب سوزنی</a>
                        <a class="dropdown-item" href="consultation.php">مشاوره و روانشناسی</a>
                        <a class="dropdown-item" href="workshop.php">كارگاه هاي شناخت طرحواره</a>
                    </div>

                </div>
            </div>
            <!-- Single Special Area -->
            <div class="col-12 col-md-4 list__item w-100">
                <div class="single-special text-center wow fadeInUp w-100" data-wow-delay="0.2s">
                    <div class="single-icon">
                        <i class="ti-time" aria-hidden="true"></i>
                    </div>
                    <h4>ساعت‌های کاری</h4>
                    <p>همه روزه از ساعت 9 تا 19</p>
                    <p>روزهای تعطیل از ساعت 12 تا 18</p>
                </div>
            </div>
        </div>
    </div>


</section>
<!-- ***** Special Area End ***** -->




<!-- ***** Footer Area Start ***** -->
<footer class="footer-social-icon text-center clearfix">
    <div class="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d809.2938973299771!2d71.35321942920047!3d50.77106289876085!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3f8e070340c325e3%3A0x358aede3859e2d30!2z2YXYsdqp2LIg2KrZhtiv2LHYs9iq24wg2YfZhdin24w!5e0!3m2!1sen!2s!4v1555148616643!5m2!1sen!2s" width="100%" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>
    </div>




