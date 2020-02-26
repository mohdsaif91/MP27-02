<%-- 
    Document   : addsetting
    Created on : Feb 5, 2020, 10:23:16 PM
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
                                    <a href="homeController" class="js-logo-clone">Pharma</a>
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
                <div class="row mt-3">
                    <div class="col-lg-6 col-sm-12 col-md-6 text-md-center">
                        <div class="card text-center" >
                            <a class="btn btn-default text-black mt-3" id="prepaymentblock">Receive Order Email On

                                <div class="card-body ">
                                    <div class="input-group input-group-lg">
                                        <input type="text" id="setemailid" placeholder="Email ID" class="form-control" />
                                    </div><!-- /input-group -->
                                    <div class="input-group input-group-lg mt-3">
                                        <input type="password" id="setpassword" placeholder="Password" class="form-control" />
                                    </div><!-- /input-group -->
                                </div>
                            </a>
                            <button class="btn btn-black" id="setemailidpassword">Set Email & Password</button>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-12 col-md-6 text-md-center">
                        <div class="card text-center" >
                            <a class="btn btn-default text-primary mt-3" id="prepaymentblock">No of Days Data to be maintained for orders
                                <div class="card-body ">
                                    <div class="input-group input-group-lg">
                                        <input type="text" id="nodaystext" class="form-control" />
                                    </div><!-- /input-group -->
                                    <p id="showmsday"></p>
                                </div>
                            </a>
                            <button class="btn btn-primary" id="nodays">Set Days</button>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-12 col-md-6 text-md-center mt-3">
                        <div class="card text-center" id="hideusernamepassword" >
                            <a class="btn btn-default text-danger mt-1" id="prepaymentblock">New Username & password
                                <div class="card-body ">
                                    <div class="input-group input-group-lg">
                                        <input type="text" placeholder="Username" id="username" class="form-control" />
                                    </div><!-- /input-group -->
                                    <div class="input-group input-group-lg mt-2">
                                        <input type="text" placeholder="Password" id="password" class="form-control" />
                                    </div><!-- /input-group -->
                                </div>
                            </a>
                            <button class="btn btn-danger" id="updateemailpass">Update Username & Password</button>
                            <p id="updateidpass"></p>
                        </div>
                        <div class="card text-center" id="hidepassword">
                            <a class="btn btn-default text-danger mt-3" id="prepaymentblock">Provide Admin Password to change name & password
                                <div class="card-body ">
                                    <div class="input-group input-group-lg">
                                        <input type="password" id="firstpassword" class="form-control" />
                                    </div><!-- /input-group -->
                                </div>
                            </a>
                            <button class="btn btn-danger" id="chkpassword">Check Password</button>
                            <p id="showupdatepass"></p>
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
            $(document).ready(function () {
                $('#hideusernamepassword').hide();
            });
            $('#chkpassword').click(function () {
                var password = $('#firstpassword').val();
                $.ajax({
                    url: 'AddSetting',
                    data: {
                        four: 'setpassword',
                        password: password
                    }, success: function (response) {
                        if (response === 'yes') {
                            $('#hideusernamepassword').show();
                            $('#hidepassword').hide();
                        } else {
                            $('#showupdatepass').text('No Password Found');
                        }
                    }
                });

            });
            $('#setemailidpassword').click(function () {
                var email = $('#setemailid').val();
                var password = $('#setpassword').val();
                $.ajax({
                    url: 'AddSetting',
                    data: {
                        four: 'setemail',
                        email: email,
                        password: password
                    }, success: function () {
                        alert('Email & password Updated!');
                    }
                });
            });
            $('#nodays').click(function () {
                var days = $('#nodaystext').val();
                $.ajax({
                    url: 'AddSetting',
                    data: {
                        four: 'setdays',
                        days: days
                    }, success: function (respo) {
                        $('#showmsday').text(respo);
                    }
                });
            });
            $('#updateemailpass').click(function () {
                var u = $('#username').val();
                var p = $('#password').val();
                $.ajax({
                    url: 'AddSetting',
                    data: {
                        four: 'setPassword',
                        user: u,
                        pass: p
                    }, success: function (respo) {
                        if (respo === 'yes') {
                            $('#updateidpass').text("updated");
                        }
                    }
                });
            });

        </script>

    </body>

</html>
