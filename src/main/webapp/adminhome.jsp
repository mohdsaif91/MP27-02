<%-- 
    Document   : adminhome
    Created on : Oct 10, 2019, 10:44:09 PM
    Author     : saif
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <title>Matrix Pharmacy Admin Home</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Rubik:400,700|Crimson+Text:400,400i" rel="stylesheet">
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel = "icon" href =  
              "CompanyLog/icons8-medical-bag-96.png" 
              type = "image/x-icon"> 
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <div class="site-wrap">
            <div class="container">


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
                                    <a href="homeController" class="js-logo-clone">
                                        <img src="CompanyLog/logo .png"/>
                                        <!--                                    Matrix Pharma-->
                                    </a>
                                </div>
                            </div>
                            <div class="main-nav d-none d-lg-block">
                                <nav class="site-navigation text-right text-md-center" role="navigation">
                                    <ul class="site-menu js-clone-nav d-none d-lg-block">
                                        <li class="active"><a href="getorders">Home</a></li>
                                        <li><a href="getMessage">User Message</a></li>
                                        <li><a href="Addcompany">ADD</a></li>
                                        <li><a href="UpdateandDelete">Update and Delete</a></li>
                                        <li><a href="generateOrder.jsp">Generate Discount</a></li>
                                    </ul>
                                </nav>
                            </div>
                            <div class="icons">
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
                <div class="container">
                    <div class="row mt-3">
                        <div class="col-lg-3 col-sm-12 col-md-3 text-md-center">
                            <div class="card text-center" >
                                <a href="#" class="btn btn-default text-danger" id="prepaymentblock">Pre Payment Order 
                                    <div class="card-body ">
                                        <img class="card-img-bottom" src="medicineimage/images/nopayment.jpg" alt="Card image" style="width:100%">
                                    </div>
                                </a>
                                <p class="card-text text-black border-top-0 border-top">Order Count-<b>${preorder}</b></p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-12  col-md-3 text-md-center">
                            <div class="card text-center" >
                                <a href="#" id="postpaymentblock" class="btn btn-default text-primary">Post Payment Order 
                                    <div class="card-body img-responsive">
                                        <img class="card-img-bottom" src="medicineimage/images/aid1297801-v4-728px-Pay-for-a-Money-Order-Step-1-Version-2.jpg" alt="Card image" style="width:100%; height: 200px;">
                                    </div>
                                </a>
                                <p class="card-text text-black border-top-0 border-top">Order Count-<b>${postorder}</b></p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-12 col-md-3 text-md-center">
                            <div class="card text-center" >
                                <a href="#" id="oderpackaging" class="btn btn-default text-black">Order For Packaging 
                                    <div class="card-body img-responsive">
                                        <img class="card-img-bottom" src="medicineimage/images/packaging.jpg" alt="Card image" style="width:100%; height: 200px;">
                                    </div>
                                </a>
                                <p class="card-text text-black border-top-0 border-top">Order Count-<b>${packageorder}</b></p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-12 col-md-3 text-md-center">
                            <div class="card text-center" >
                                <a href="#" id="Additionalsetting" class="btn btn-default text-black">Additional Settings
                                    <div class="card-body img-responsive">
                                        <img class="card-img-bottom" src="medicineimage/images/setting.png" alt="Card image" style="width:100%; height: 200px;">
                                    </div>
                                    <p class="card-text text-black">Additional Setting</p>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
            $('#postpaymentblock').click(function () {
                var post = 'post';
                document.location.href = "AdminOrder?pay=" + post;
            });
            $('#prepaymentblock').click(function () {
                var per = 'per';
                document.location.href = 'AdminOrder?pay=' + per;
            });
            $('#oderpackaging').click(function () {
                var pack = 'pack';
                document.location.href = 'AdminOrder?pay=' + pack;
            });
            $('#Additionalsetting').click(function () {
                document.location.href = "addsetting.jsp";
            });
        </script>

    </body>

</html>