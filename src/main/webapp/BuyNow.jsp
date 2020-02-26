<%-- 
    Document   : BuyNow
    Created on : Oct 20, 2019, 5:38:18 PM
    Author     : saif
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Rubik:400,700|Crimson+Text:400,400i" rel="stylesheet">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/style.css">
        <title>Personal Details</title>
        <style>
            body{
                overflow-x: hidden;
                overflow-y: hidden;
            }
        </style>
    </head>
    <body>
        <div class="site-wrap">
            <div class="site-navbar py-2">
                <div class="search-wrap">
                    <div class="container">
                        <a href="#" class="search-close js-search-close"><span class="icon-close2"></span></a>
                        <form action="#" method="post">
                            <input type="text" class="form-control" placeholder="Search keyword and hit enter...">
                        </form>
                    </div>
                </div>
                <div class="container">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="logo">
                            <div class="site-logo">
                                <a href="index.jsp" class="js-logo-clone">Pharma</a>
                            </div>
                        </div>
                        <div class="main-nav d-none d-lg-block">
                            <nav class="site-navigation text-right text-md-center" role="navigation">
                                <ul class="site-menu js-clone-nav d-none d-lg-block">
                                    <li class="active"><a href="index.html">Home</a></li>
                                    <li><a href="shop.html">Store</a></li>
                                    <li><a href="adminhome.jsp">ADD</a></li>
                                    <li><a href="signin.jsp">Sign In</a></li>
                                    <li><a href="about.html">About</a></li>
                                    <li><a href="contact.html">Contact</a></li>
                                    <li><b>${username}</b></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="icons">
                            <a href="#" class="icons-btn d-inline-block js-search-open"><span class="icon-search"></span></a>
                            <a href="cart.html" class="icons-btn d-inline-block bag">
                                <span class="icon-shopping-bag"></span>
                                <span class="number">2</span>
                            </a>

                            <a href="#" class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span
                                    class="icon-menu"></span></a>
                        </div>

                    </div>
                </div>
            </div>
            <form action="BuyNow" method="post">
                <div class='row'>
                    <div class="col-12" style="height: 25px;width: 100%;"></div>
                </div>
                <div class='row'>
                    <div class='col-4'></div>
                    <div class='col-4'><h4>You Haven't Signed In !</h4></div>
                    <div class='col-4'></div>
                </div>
                <div class='row'>
                    <div class="col-12" style="height: 25px;width: 100%;"></div>
                </div>
                <div class="row">
                    <div class='col-2 col-sm-2'></div>
                    <div class="input-group col-4 col-sm-4">
                        <div class="input-group-lg">
                            <input type="text" name="firstname" class="form-control" id="inputGroupFile01" placeholder="First Name">
                        </div>
                        <div class="form-group">
                        </div>
                    </div>
                    <div class="input-group col-4 col-sm-4">
                        <div class="input-group-lg">
                            <input type="text" name="lastname" class="form-control" id="inputGroupFile01" placeholder="Last Name">
                        </div>
                        <div class="form-group">
                        </div>
                    </div>
                    <div class='col-2 col-sm-2'></div>
                </div>
                <div class='row'>
                    <div class="col-12" style="height: 45px;width: 100%;"></div>
                </div>
                <div class="row">
                    <div class='col-2 col-sm-2'></div>
                    <div class="input-group col-4 col-sm-4">
                        <div class="input-group-lg">
                            <input type="text" name="contactnumber" class="form-control" id="inputGroupFile01" placeholder="Contact Number">
                        </div>
                        <div class="form-group">
                        </div>
                    </div>
                    <div class="input-group col-4 col-sm-4">
                        <div class="input-group-lg">
                            <input type="text" name="dob" class="form-control" id="inputGroupFile01" placeholder="Date Of Birth">
                        </div>
                        <div class="form-group">
                        </div>
                    </div>
                    <div class='col-2 col-sm-2'></div>
                </div>
                <div class='row'>
                    <div class="col-12" style="height: 45px;width: 100%;"></div>
                </div>
                <div class="row">
                    <div class='col-2 col-sm-2'></div>
                    <div class="input-group col-4 col-sm-4">
                        <div class="input-group-lg">
                            <input type="text" name="addressline1" class="form-control" id="inputGroupFile01" placeholder="Address Line 1">
                        </div>
                        <div class="form-group">
                        </div>
                    </div>
                    <div class="input-group col-4 col-sm-4">
                        <div class="input-group-lg">
                            <input type="text" name="addressline2" class="form-control" id="inputGroupFile01" placeholder="Address Line 2">
                        </div>
                        <div class="form-group">
                        </div>
                    </div>
                    <div class='col-2 col-sm-2'></div>
                </div>
                <div class='row'>
                    <div class="col-12" style="height: 45px;width: 100%;"></div>
                </div>
                <div class="row">
                    <div class='col-2 col-sm-2'></div>
                    <div class="input-group col-4 col-sm-4">
                        <div class="input-group-lg">
                            <input type="text" name="city" class="form-control" id="inputGroupFile01" placeholder="City">
                        </div>
                        <div class="form-group">
                        </div>
                    </div>
                    <div class="input-group col-4 col-sm-4">
                        <div class="input-group-lg">
                            <input type="text" name="state" class="form-control" id="inputGroupFile01" placeholder="State">
                        </div>
                        <div class="form-group">
                        </div>
                    </div>
                    <div class='col-2 col-sm-2'></div>
                </div>
                <div class='row'>
                    <div class="col-12" style="height: 45px;width: 100%;"></div>
                </div>
                <div class='row'>
                    <div class='col-3 col-sm-3'></div>
                    <div class='col-6 col  col-sm-6 text-center' >
                        <button class='btn  btn-block btn-danger 'name="addcompanyproduct">Submit</button>
                    </div>
                    <div class='col-3 col-sm-3'></div>
                </div>
            </form>
        </div>
    </body>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/aos.js"></script>

    <script src="js/main.js"></script>
</html>
