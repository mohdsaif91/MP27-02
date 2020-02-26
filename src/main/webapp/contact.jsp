<%-- 
    Document   : contact
    Created on : Jan 28, 2020, 11:16:50 PM
    Author     : saif
--%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Matrix Pharmacy Contact</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Rubik:400,700|Crimson+Text:400,400i" rel="stylesheet">
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel = "icon" href="CompanyLog/icons8-medical-bag-96.png"type = "image/x-icon"> 
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">


        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/style.css">

    </head>

    <body>

        <div class="site-wrap">
            <div class="site-navbar py-2">
                <div class="container">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="logo">
                            <div class="site-logo">
                                <a href="homeController" class="js-logo-clone">
                                    <img src="CompanyLog/logo .png"/>

                            </div>
                        </div>
                        <div class="main-nav d-none d-lg-block">
                            <nav class="site-navigation text-right text-md-center" role="navigation">
                                <ul class="site-menu js-clone-nav d-none d-lg-block">
                                    <li><a href="homeController">Home</a></li>
                                    <li><a href="product">Products</a></li>
                                    <li><a href="myOrders">My Orders</a></li>
                                    <li><a href="about.jsp">About</a></li>
                                    <li class="active"><a href="contact.jsp">Contact</a></li>
                                    <li><b>${username}</b></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="icons">
                            <a href="CartShow" class="icons-btn d-inline-block bag">
                                <span class="icon-shopping-bag"></span>
                            </a>
                            <a href="#" class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span
                                    class="icon-menu"></span></a>

                            <a class="btn btn-primary dropdown-toggle" href="#" role="icon" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            </a>
                            <div class="dropdown-menu " aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="signin.jsp">Sign In</a>
                                <a class="dropdown-item" href="signin.jsp">Log Out</a>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-light py-3">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 mb-0">
                            <a href="index.html">Home</a> <span class="mx-2 mb-0">/</span>
                            <strong class="text-black">Contact</strong>
                        </div>
                    </div>
                </div>
            </div>

            <div class="site-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h2 class="h3 mb-5 text-black">Get In Touch</h2>
                        </div>
                        <div class="col-md-12">

                            <form action="Contact" method="post">
                                <div class="p-3 p-lg-5 border">
                                    <div class="form-group row">
                                        <div class="col-md-6">
                                            <label for="c_username" class="text-black">User Name<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control"  id="c_username" required name="c_username" placeholder="">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="c_fname" class="text-black">First Name <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="c_fname" required name="c_fname">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-6">
                                            <label for="c_lname" class="text-black">Last Name <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="c_lname" required name="c_lname">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="c_email" class="text-black">Email <span class="text-danger">*</span></label>
                                            <input type="email" class="form-control" id="c_email" required name="c_email" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-12">
                                            <label for="c_subject" class="text-black">Subject </label>
                                            <input type="text" class="form-control" id="c_subject" required name="c_subject">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-md-12">
                                            <label for="c_message" class="text-black">Message </label>
                                            <textarea name="c_message" id="c_message" required cols="30" rows="7" class="form-control"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-12">
                                            <input type="submit" class="btn btn-primary btn-lg btn-block" id="sendmsg" value="Send Message">
                                            <p class="text-danger" id="showmsg"></p>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>



            <div class="site-section bg-primary">

            </div>
            <footer class="site-footer">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">

                            <div class="block-7">
                                <h3 class="footer-heading mb-4">About Us</h3>
                                <p>A medicine cat has no time for doubt. Put your energy into today and stop worrying about the past.</p>
                            </div>

                        </div>
                        <div class="col-lg-3 mx-auto mb-5 mb-lg-0">
                            <h3 class="footer-heading mb-4">Quick Links</h3>
                            <ul class="list-unstyled">
                                <li class="active"><a href="index.jsp">Home</a></li>
                                <li><a href="myOrders">My Orders</a></li>
                                <li><a href="signin.jsp">Sign In</a></li>
                                <li><a href="about.jsp">About</a></li>
                                <li><a href="contact.jsp">Contact</a></li>
                            </ul>
                        </div>

                        <div class="col-md-6 col-lg-3">
                            <div class="block-5 mb-5">
                                <h3 class="footer-heading mb-4">Contact Info</h3>
                                <ul class="list-unstyled">
                                    <li class="phone"><a href="tel://+918886821109">+91 8886821109</a></li>
                                </ul>
                            </div>


                        </div>
                    </div>
                    <div class="row pt-5 mt-5 text-center">
                        <div class="col-md-12">
                            <p>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;
                                <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made
                                with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank"
                                                                                         class="text-primary">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </p>
                        </div>

                    </div>
                </div>
            </footer>
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>

        <script src="js/main.js"></script>
        <script>
                                    $(document).ready(function () {
                                        $('#sendmsg').hide();
                                        $('#c_username').change(function (event) {
                                            var uname = $('#c_username').val();
                                            $('#sendmsg').hide();
                                            $.ajax({
                                                url: 'Contact',
                                                data: {
                                                    uname: uname
                                                }, success: function (text) {
                                                    if (text === "yes") {
                                                        $('#sendmsg').show();
                                                        $('#showmsg').text('');

                                                    } else {
                                                        $('#sendmsg').hide();
                                                        $('#showmsg').text('Please Sign Up');
                                                    }
                                                }
                                            });
                                        });
                                    });

        </script>
    </body>

</html>
